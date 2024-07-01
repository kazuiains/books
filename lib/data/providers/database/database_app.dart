import 'package:books/app/config/app_config.dart';
import 'package:books/data/models/response/book_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseApp {
  static String databaseName = "${AppConfig.instance!.appName.toLowerCase()}_local.db";

  static init({
    required Database database,
    required int version,
  }) async {
    var batch = database.batch();
    featureTable(batch);
    await batch.commit(continueOnError: true, noResult: true);
  }

  static featureTable(Batch batch) {
    batch.execute("CREATE TABLE $bookModelTableName "
        "("
        "$bookModelColumn13 INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "
        "$bookModelColumn1 INTEGER, "
        "$bookModelColumn2 TEXT, "
        "$bookModelColumn3 TEXT, "
        "$bookModelColumn4 TEXT, "
        "$bookModelColumn5 TEXT, "
        "$bookModelColumn6 TEXT, "
        "$bookModelColumn7 TEXT, "
        "$bookModelColumn8 INTEGER, "
        "$bookModelColumn9 TEXT, "
        "$bookModelColumn10 TEXT, "
        "$bookModelColumn11 INTEGER, "
        "$bookModelColumn12 INTEGER, "
        "$bookModelColumn14 TEXT, "
        "$bookModelColumn15 INTEGER"
        ")");
  }

  static upgrade({
    required Database database,
    required int version,
  }) async {
    var batch = database.batch();
    if (version < 2) {
      // update from ver 1
    }
    if (version < 3) {}
    if (version < 4) {}
    if (version < 5) {}
    if (version < 6) {}
    await batch.commit(continueOnError: true, noResult: true);
  }

// static _fromVer1({
//   required Batch batch,
// }) {}
}
