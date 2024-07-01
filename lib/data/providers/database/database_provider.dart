import 'package:books/data/providers/database/database_app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final _singleton = DatabaseProvider();

  static DatabaseProvider get instance => _singleton;

  Database? _localDb;

  Future<Database> get localDb async {
    return _localDb ?? await _createDatabase();
  }

  _createDatabase() async {
    var path = await getDatabasesPath();
    String dbPath = join(path, DatabaseApp.databaseName);

    return await openDatabase(
      dbPath,
      version: 4,
      onCreate: (db, version) => DatabaseApp.init(
        database: db,
        version: version,
      ),
      onUpgrade: _upgrade,
    );
  }

  _upgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {
      DatabaseApp.upgrade(
        database: database,
        version: oldVersion,
      );
    }
  }
}
