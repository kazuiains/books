import 'package:books/app/utils/helper/query_helper.dart';
import 'package:books/data/models/base/base_response_model.dart';
import 'package:books/data/models/request/book_request_model.dart';
import 'package:books/data/models/response/book_model.dart';
import 'package:books/data/providers/database/database_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class BookLocalDataSource {
  Future<bool> backupBook(
    List<BookModel> data,
    int page,
  );

  Future<bool> updateBook(
    BookModel data,
  );

  Future<BaseResponseModel> listBook(
    BookRequestModel data,
  );

  Future<List<BookModel>> listFavorite();
}

class BookLocalDataSourceImpl with QueryHelper implements BookLocalDataSource {
  final provider = DatabaseProvider.instance;
  final tableName = bookModelTableName;

  @override
  Future<bool> backupBook(data, page) async {
    final database = await provider.localDb;

    try {
      var args = <String>[];

      for (var i in data) {
        if (i.id != null) {
          args.add("${i.id}");
        }
      }

      final response = await database.query(
        tableName,
        where: whereStrIn(args.length, bookModelColumn1),
        whereArgs: args,
      );

      List<String> dataLocal = response.isNotEmpty
          ? response
              .map<String>(
                (i) => "${BookModel.fromTable(i).id}",
              )
              .toList()
          : [];

      Batch batch = database.batch();

      for (var i in data) {
        if (!dataLocal.contains(i.id.toString())) {
          batch.insert(tableName, i.toTable());
        } else {
          var entity = i.copyWith(
            page: page,
          );

          batch.update(
            tableName,
            BookModel.fromEntity(entity).toTable(),
            where: '$bookModelColumn1 = ?',
            whereArgs: [i.id],
          );
        }
      }

      await batch.commit(continueOnError: true, noResult: true);

      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> updateBook(data) async {
    final database = await provider.localDb;

    try {
      final response = await database.query(
        tableName,
        where: '$bookModelColumn1 = ?',
        whereArgs: [data.id],
      );

      int result = 0;

      if (response.isNotEmpty) {
        result = await database.update(
          tableName,
          data.toTable(),
          where: '$bookModelColumn1 = ?',
          whereArgs: [data.id],
        );
      } else {
        result = await database.insert(
          tableName,
          data.toTable(),
        );
      }

      return result != 0 ? true : false;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponseModel> listBook(
    data,
  ) async {
    int page = int.parse(data.page ?? "0");
    final database = await provider.localDb;

    try {
      String? where = data.toJson().keys.map((key) {
        String value = "";
        if (key == "search") {
          value = "$bookModelColumn2 = ?";
        } else {
          value = "$key = ?";
        }
        return value;
      }).join(' AND ');

      final response = await database.query(
        tableName,
        where: where,
        whereArgs: argsValue(data.toJson()),
      );

      var results = response.isNotEmpty
          ? response
              .map<BookModel>(
                (i) => BookModel.fromTable(i),
              )
              .toList()
          : [];

      return BaseResponseModel(
        next: (page + 1).toString(),
        previous: page > 1 ? (page - 1).toString() : null,
        results: results,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<BookModel>> listFavorite() async {
    final database = await provider.localDb;

    try {
      final response = await database.query(
        tableName,
        where: '$bookModelColumn15 = ?',
        whereArgs: ["1"],
      );

      return response.isNotEmpty
          ? response
              .map<BookModel>(
                (i) => BookModel.fromTable(i),
              )
              .toList()
          : [];
    } catch (_) {
      rethrow;
    }
  }
}