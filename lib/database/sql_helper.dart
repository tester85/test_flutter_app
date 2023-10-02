import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:test_app/model/customer.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(query);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('dbRating.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
      await createTestCustomerItems();
    });
  }

  static Future<int> createItem(String name, int rating, int isCustomer) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'rating': rating,
      'is_customer':isCustomer,
      'createdAt': DateTime.now().toString()};

    final id = await db.insert('rating', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<void> createTestCustomerItems() async {
    final db = await SQLHelper.db();
    for(Customer c in customers){
      final data = {
        'id': c.id,
        'name': c.name,
        'rating': c.rating,
        'is_customer':c.isCustomer,
        'createdAt': DateTime.now().toString()};
       await db.insert('rating', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }
    print('Inserted test customers');
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

  static Future<List<Map<String,dynamic>>> getItems(bool isCustomer) async {
    final db = await SQLHelper.db();
    return db.query('rating',where:"is_customer = true", whereArgs:[isCustomer], orderBy: "id");
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
    is_customer BOOLEAN,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
    )""";

List<Customer> customers = [
  Customer(id: 1, name: "AT&T", rating: 4, isCustomer: true),
  Customer(id: 2, name: "Samnsung Co.", rating: 3, isCustomer: true),
  Customer(id: 3, name: "Apple Inc", rating: 3, isCustomer: true),
  Customer(id: 4, name: "Toon Network", rating: 0, isCustomer: true),
  Customer(id: 5, name: "Flower's Amarillis", rating: 3, isCustomer: true),
  // Add more customer data as needed.
];