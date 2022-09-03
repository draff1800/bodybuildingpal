import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE workouts(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT
      )
    """);
    await database.execute("""
      CREATE TABLE exercises(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT
      )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'bodybuildingpal.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> deleteDB() async {
    await sql.deleteDatabase('bodybuildingpal.db');
  }

  static Future<List<Map<String, dynamic>>> getAll(String tableName) async {
    final db = await SQLHelper.db();
    return db.query(tableName, orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getOneByID(String tableName, int id) async {
    final db = await SQLHelper.db();
    return db.query(tableName, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> createWithName(String tableName, String name) async {
    final db = await SQLHelper.db();

    final data = {'name': name};
    final id = await db.insert(tableName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<void> deleteOneByID(String tableName, int id) async {
    final db = await SQLHelper.db();
    await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}