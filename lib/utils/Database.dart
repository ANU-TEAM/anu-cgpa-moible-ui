import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'anucgpa.db'),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE courses (
          CourseId	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          Title	NVARCHAR(160) NOT NULL,
          Code	NVARCHAR(80) NOT NULL,
          Credits	INTEGER NOT NULL,
          Grade	INTEGER NOT NULL
        )
        ''');
      },
      version: 1,
    );
  }
}
