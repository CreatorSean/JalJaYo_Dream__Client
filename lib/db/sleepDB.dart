import 'package:jaljayo/db/model/sleep_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String sleepTable = "sleepTable";
const String createTableSql =
    "CREATE TABLE $sleepTable(id INTEGER PRIMARY KEY, sleepDate TEXT, sleepTime INTEGER, hrAvg INTEGER, waso INTEGER)";

class SleepDB {
  initDB() async {
    String path = join(await getDatabasesPath(), 'sleeps.db');
    final Future<Database> database = openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(createTableSql);
      },
      version: 1,
    );
    return database;
  }

  Future<List<SleepModel>> getBooksByReadingState(int readDone) async {
    final db = await initDB();

    final List<Map<String, dynamic>> maps = await db.query(
      sleepTable,
      where: 'readDone=?',
      whereArgs: [readDone],
    );

    return List.generate(
      maps.length,
      (i) {
        return SleepModel(
          id: maps[i]['id'],
          sleepDate: maps[i]['sleepDate'],
          sleepTime: maps[i]['sleepTime'],
          hrAvg: maps[i]['hrAvg'],
          waso: maps[i]['waso'],
        );
      },
    );
  }
}
