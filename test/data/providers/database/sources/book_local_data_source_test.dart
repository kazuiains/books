import 'dart:convert';

import 'package:books/data/models/request/book_request_model.dart';
import 'package:books/data/models/response/book_model.dart';
import 'package:books/data/providers/database/sources/book_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'book_local_data_source_test.mocks.dart';

@GenerateMocks([Database, Batch])
void main() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;

  late MockDatabase mockDatabase;
  late BookLocalDataSourceImpl dataSource;

  setUp(() async {
    mockDatabase = MockDatabase();
    dataSource = BookLocalDataSourceImpl(
      database: mockDatabase,
    );
  });

  group(
    'backupBook',
    () {
      List<BookModel> data = [];
      List<BookModel> backupData = [];
      List<BookModel> newData = [];

      List<Map<String, dynamic>> localData = [];

      var jsonData = json.decode(fixture('local/book_list.json'));
      var backupJsonData = json.decode(fixture('local/book_backup_list.json'));

      jsonData["results"].forEach(
        (v) {
          data.add(BookModel.fromJson(v));
        },
      );
      backupJsonData["results"].forEach(
        (v) {
          backupData.add(BookModel.fromJson(v));
        },
      );

      for (var i in backupData) {
        localData.add(i.toTable());
      }
      for (var i in data) {
        var items = backupData.where((model) => model.id == i.id);
        if (items.isEmpty) {
          newData.add(i);
        }
      }

      test(
        'should call SqfLite to save the data: has no data at all',
        () async {
          // arrange
          when(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).thenAnswer(
            (_) async => [],
          );

          final mockBatch = MockBatch();
          when(
            mockDatabase.batch(),
          ).thenReturn(
            mockBatch,
          );
          when(
            mockBatch.commit(
              noResult: anyNamed('noResult'),
              continueOnError: anyNamed('continueOnError'),
            ),
          ).thenAnswer(
            (_) async => [],
          );

          /// act
          final actual = await dataSource.backupBook(data, 1);

          /// assert
          expect(actual, true);

          verify(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).called(1);

          for (var i in data) {
            verify(
              mockBatch.insert(
                dataSource.tableName,
                BookModel.fromEntity(
                  i.copyWith(
                    page: 1,
                  ),
                ).toTable(),
              ),
            ).called(1);
          }

          verify(
            mockBatch.commit(
              noResult: anyNamed('noResult'),
              continueOnError: anyNamed('continueOnError'),
            ),
          ).called(1);
        },
      );

      test(
        'should call SqfLite to save the data: have previous data',
        () async {
          // arrange
          when(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).thenAnswer(
            (_) async => localData,
          );

          final mockBatch = MockBatch();
          when(
            mockDatabase.batch(),
          ).thenReturn(
            mockBatch,
          );
          when(
            mockBatch.commit(
              noResult: anyNamed('noResult'),
              continueOnError: anyNamed('continueOnError'),
            ),
          ).thenAnswer(
            (_) async => [],
          );

          /// act
          final actual = await dataSource.backupBook(data, 1);

          /// assert
          expect(actual, true);

          verify(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).called(1);

          for (var i in backupData) {
            verify(
              mockBatch.update(
                dataSource.tableName,
                BookModel.fromEntity(
                  i.copyWith(
                    page: 1,
                  ),
                ).toTable(),
                where: '$bookModelColumn1 = ?',
                whereArgs: [i.id],
              ),
            ).called(1);
          }
          for (var i in newData) {
            verify(
              mockBatch.insert(
                dataSource.tableName,
                BookModel.fromEntity(
                  i.copyWith(
                    page: 1,
                  ),
                ).toTable(),
              ),
            ).called(1);
          }

          verify(
            mockBatch.commit(
              noResult: anyNamed('noResult'),
              continueOnError: anyNamed('continueOnError'),
            ),
          ).called(1);
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
          var expectData = expectJson(data: listBook, page: 2);

          // arrange
          when(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).thenAnswer(
            (_) async => expectData,
          );

          /// act
          var request = BookRequestModel(page: "2");
          final actual = await dataSource.listBook(request);
          final List list = actual.results;
          List<BookModel> result =
              list.isNotEmpty ? list as List<BookModel> : [];

          /// assert
          expect(actual.next, "3");
          expect(actual.previous, "1");
          expect(actualJson(result), expectData);

          verify(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).called(1);
        },
      );

      test(
        'retrieval of list data based on search',
        () async {
          var expectData = expectJson(data: searchBook, page: 1);

          // arrange
          when(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).thenAnswer(
            (_) async => expectData,
          );

          /// act
          var request = BookRequestModel(
            search: "Romeo and Juliet",
          );
          final actual = await dataSource.listBook(request);
          final List list = actual.results;
          List<BookModel> result =
              list.isNotEmpty ? list as List<BookModel> : [];

          /// assert
          expect(actual.next, "2");
          expect(actual.previous, null);
          expect(actualJson(result), expectData);

          verify(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).called(1);
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
        'do not have data book',
        () async {
          // arrange
          when(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).thenAnswer(
            (_) async => [],
          );

          when(
            mockDatabase.insert(
              dataSource.tableName,
              any,
            ),
          ).thenAnswer(
            (_) async => 1,
          );

          /// act
          final actual = await dataSource.updateBook(
            BookModel.fromEntity(
              book.copyWith(
                favorite: true,
              ),
            ),
          );

          /// assert
          expect(actual, true);
          verify(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).called(1);
          verify(
            mockDatabase.insert(
              dataSource.tableName,
              any,
            ),
          ).called(1);
        },
      );

      test(
        'have data book',
        () async {
          // arrange
          when(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).thenAnswer(
            (_) async => [
              book.toTable(),
            ],
          );

          when(
            mockDatabase.update(
              dataSource.tableName,
              any,
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).thenAnswer(
            (_) async => 1,
          );

          /// act
          final actual = await dataSource.updateBook(
            BookModel.fromEntity(
              book.copyWith(
                favorite: false,
              ),
            ),
          );

          /// assert
          expect(actual, true);
          verify(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).called(1);
          verify(
            mockDatabase.update(
              dataSource.tableName,
              any,
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).called(1);
        },
      );
    },
  );

  group(
    'listFavorite',
    () {
      List<BookModel> data = [];
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

      test(
        'list of all your favorite books',
        () async {
          var expectData = expectJson(
            data: data,
            favorite: true,
            page: 2,
          );

          // arrange
          when(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).thenAnswer(
                (_) async => expectData,
          );

          /// act
          final actual = await dataSource.listFavorite();

          /// assert
          expect(actualJson(actual), expectData);
          verify(
            mockDatabase.query(
              dataSource.tableName,
              columns: anyNamed('columns'),
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
            ),
          ).called(1);
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
