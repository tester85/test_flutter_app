import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:test_app/model/customer.dart';
import 'package:test_app/model/service_provider.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE rating(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          rating_value INTEGER,
          name TEXT,
          is_customer INTEGER,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
    """);
  }

  static Future<sql.Database> db(){
    return sql.openDatabase(
        'dbRating.db',
        version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTables(database);
        });
  }

  static Future<int> createItem(String name, int rating, int isCustomer) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'rating_value': rating,
      'is_customer':isCustomer,
      'createdAt': DateTime.now().toString()};

    final id = await db.insert('rating', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> update(String name, int rating) async {
    final db = await SQLHelper.db();
    final data = {'name': name, 'rating_value': rating, 'createdAt': DateTime.now().toString()};
    final result = await db.update('rating', data, where:"name =?", whereArgs:[name]);
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
  static Future<int?> countItem(Database database) async {
    final result = await database.rawQuery('SELECT COUNT(*) as count FROM rating');
    return sql.Sqflite.firstIntValue(result);
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

List<Customer> customers = [
  Customer(id: 1, name: "AT&T", rating: 4, isCustomer: 1),
  Customer(id: 2, name: "Samnsung Co.", rating: 3, isCustomer: 1),
  Customer(id: 3, name: "Apple Inc", rating: 3, isCustomer: 1),
  Customer(id: 4, name: "Toon Network", rating: 0, isCustomer: 1),
  Customer(id: 5, name: "Flower's Amarillis", rating: 3, isCustomer: 1),
  // Add more customer data as needed.
];

List<ServiceP> servProviders = [
  ServiceP(id: 6,name: "Viva auto shop", rating: 4, isCustomer:0),
  ServiceP(id: 7,name: "Car repairs 24/7", rating: 3, isCustomer:0),
  ServiceP(id: 8,name: "West Coast Customs", rating: 3, isCustomer:0),
  ServiceP(id: 9,name: "RailCoat Repairs", rating: 0, isCustomer:0),
  ServiceP(id: 10,name: "Jhonson's", rating: 3, isCustomer:0),
  // Add more customer data as needed.
];