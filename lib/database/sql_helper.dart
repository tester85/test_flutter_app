import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(query);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('dbRating.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(String name, int rating, int isCustomer) async {
    final db = await SQLHelper.db();
    final data = {'name': name, 'rating': rating,'is_customer':isCustomer,'createdAt': DateTime.now().toString()};
    final id = await db.insert('rating', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> update(int id, String name, int rating) async {
    final db = await SQLHelper.db();
    final data = {'name': name, 'rating': rating, 'createdAt': DateTime.now().toString()};
    final result = await db.update('rating', data, where:"id =?", whereArgs:[id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try{
        await db.delete('rating',where: "id = ?", whereArgs: [id]);
    } catch (err){
      debugPrint("Something wrong has happened: $err");
    }
  }

  static Future<List<Map<String,dynamic>>> getItems(int isCustomer) async {
    final db = await SQLHelper.db();
    return db.query('rating',where:"is_customer =?", whereArgs:[isCustomer], orderBy: "id");
  }

  static Future<List<Map<String,dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('rating', where:"id =?", whereArgs:[id]);
  }

}
// database add table query
// is_customer values:  is Customer = 1 not Customer = 0
String query = """CREATE TABLE rating(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    rating_value INTEGER,
    name TEXT,
    is_customer INTEGER,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
    )""";
