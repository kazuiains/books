import 'dart:convert';

import 'package:books/app/config/app_config.dart';
import 'package:books/data/models/request/book_request_model.dart';
import 'package:books/data/models/response/book_model.dart';
import 'package:books/data/providers/database/database_provider.dart';
import 'package:books/data/providers/database/sources/book_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;

  late Database database;
  late BookLocalDataSourceImpl dataSource;

  setUp(() async {
    AppConfig(flavor: Flavor.development);
    database = await DatabaseProvider.instance.localDb;
    dataSource = BookLocalDataSourceImpl(
      database: database,
    );
  });

  group(
    'backupBook',
    () {
      List<BookModel> data = [];
      var args = <String>[];

      var jsonData = json.decode(fixture('local/book_list.json'));

      jsonData["results"].forEach(
        (v) {
          data.add(BookModel.fromJson(v));
        },
      );

      for (var i in data) {
        if (i.id != null) {
          args.add("${i.id}");
        }
      }

      test(
        'should call SqfLite to save the data: has no data at all',
        () async {
          var expectData = expectJson(data: data);

          /// act
          // delete all data
          await database.delete(dataSource.tableName);
          await database.update('sqlite_sequence', {'seq': 0}, where: 'name = ?', whereArgs: [dataSource.tableName]);
          // backup data
          final actual = await dataSource.backupBook(data, 1);
          // get data from db
          final response = await database.query(dataSource.tableName);
          List<BookModel> results = response.isNotEmpty
              ? response
                  .map<BookModel>(
                    (i) => BookModel.fromTable(i),
                  )
                  .toList()
              : [];

          /// assert
          expect(actual, true);
          expect(actualJson(results), expectData);
        },
      );

      test(
        'should call SqfLite to save the data: have previous data',
        () async {
          var expectData = expectJson(data: data, page: 2);

          /// act
          // backup data
          final actual = await dataSource.backupBook(data, 2);
          // get data from db
          final response = await database.query(dataSource.tableName);
          List<BookModel> results = response.isNotEmpty
              ? response
                  .map<BookModel>(
                    (i) => BookModel.fromTable(i),
                  )
                  .toList()
              : [];

          /// assert
          expect(actual, true);
          expect(actualJson(results), expectData);
        },
      );
    },
  );

  group(
    'listBook',
    () {
      List<BookModel> listBook = [];
      var listBookJsonData = json.decode(fixture('local/book_list.json'));
      listBookJsonData["results"].forEach(
        (v) {
          listBook.add(BookModel.fromJson(v));
        },
      );

      List<BookModel> searchBook = [];
      var searchBookJsonData = json.decode(fixture('local/book_search.json'));
      searchBookJsonData["results"].forEach(
        (v) {
          searchBook.add(BookModel.fromJson(v));
        },
      );

      test(
        'fetch data list by default',
        () async {
          var request = BookRequestModel(page: "2");
          var expectData = expectJson(data: listBook, page: 2);

          /// act
          final actual = await dataSource.listBook(request);
          final List list = actual.results;
          List<BookModel> result = list.isNotEmpty ? list as List<BookModel> : [];

          /// assert
          expect(actual.next, "3");
          expect(actual.previous, "1");
          expect(actualJson(result), expectData);
        },
      );

      test(
        'retrieval of list data based on search',
        () async {
          var request = BookRequestModel(
            search: "Romeo and Juliet",
          );
          var expectData = expectJson(data: searchBook, page: 2);

          /// act
          final actual = await dataSource.listBook(request);
          final List list = actual.results;
          List<BookModel> result = list.isNotEmpty ? list as List<BookModel> : [];

          /// assert
          expect(actual.next, "2");
          expect(actual.previous, null);
          expect(actualJson(result), expectData);
        },
      );
    },
  );

  group(
    'updateBook',
    () {
      BookModel book = BookModel.fromJson(
        json.decode(
          fixture('local/book.json'),
        ),
      );

      test(
        'like book',
        () async {
          /// act
          final actual = await dataSource.updateBook(
            BookModel.fromEntity(
              book.copyWith(
                favorite: true,
              ),
            ),
          );
          final response = await database.query(
            dataSource.tableName,
            where: '$bookModelColumn1 = ?',
            whereArgs: [book.id],
          );
          BookModel results = response.isNotEmpty ? BookModel.fromTable(response.first) : BookModel();

          /// assert
          expect(actual, true);
          expect(results.favorite, true);
        },
      );

      test(
        'dislike book',
        () async {
          /// act
          final actual = await dataSource.updateBook(
            BookModel.fromEntity(
              book.copyWith(
                favorite: false,
              ),
            ),
          );
          final response = await database.query(
            dataSource.tableName,
            where: '$bookModelColumn1 = ?',
            whereArgs: [book.id],
          );
          BookModel results = response.isNotEmpty ? BookModel.fromTable(response.first) : BookModel();

          /// assert
          expect(actual, true);
          expect(results.favorite, false);
        },
      );
    },
  );

  group(
    'listFavorite',
    () {
      List<BookModel> data = [];
      var args = <String>[];

      var jsonData = json.decode(fixture('local/book_favorite.json'));

      jsonData["results"].forEach(
        (v) {
          data.add(
            BookModel.fromEntity(
              BookModel.fromJson(v).copyWith(
                favorite: true,
              ),
            ),
          );
        },
      );

      for (var i in data) {
        if (i.id != null) {
          args.add("${i.id}");
        }
      }

      test(
        'list of all your favorite books',
        () async {
          var expectData = expectJson(
            data: data,
            favorite: true,
            page: 2,
          );

          /// act
          // backup data
          await dataSource.backupBook(data, 2);
          // get data from db
          final actual = await dataSource.listFavorite();

          /// assert
          expect(actualJson(actual), expectData);
        },
      );
    },
  );
}

List<Map<String, Object?>> expectJson({
  required List<BookModel> data,
  int page = 1,
  bool favorite = false,
}) {
  int index = 0;
  List<Map<String, Object?>> result = [];
  for (var i in data) {
    index++;
    result.add(
      BookModel.fromEntity(
        i.copyWith(
          page: page,
          tableId: index,
          favorite: favorite,
        ),
      ).toTable(),
    );
  }
  return result;
}

List<Map<String, Object?>> actualJson(List<BookModel> data) {
  List<Map<String, Object?>> result = [];
  for (var i in data) {
    result.add(
      BookModel.fromEntity(
        i,
      ).toTable(),
    );
  }
  return result;
}
