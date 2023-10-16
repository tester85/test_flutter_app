import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>?> getItems(int isCustomer) async {
    QuerySnapshot querySnapshot = await _firestore.collection('rating')
        .where('is_customer',isEqualTo: isCustomer)
        .get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<Map<String, dynamic>?> findItemByName(String name) async {
    QuerySnapshot querySnapshot = await _firestore.collection('rating')
        .where('name', isEqualTo: name)
        .limit(1) // Limit to one result (assuming there is only one with the same name).
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data() as Map<String, dynamic>;
    }

    return null; // Return null if no matching document is found.
  }

  Future<void> createItem(Map<String, dynamic> data) async {
    await _firestore.collection('rating').add(data);
  }

  Future<void> updateItem(String name, Map<String, dynamic> data) async {
    await _firestore.collection('rating').doc(name).update(data);
  }

  Future<void> deleteItem(String id) async {
    await _firestore.collection('rating').doc(id).delete();
  }

  // static Future<int> createItem(String name, int rating, int isCustomer) async {
  //   final db = await FireStoreService.db();
  //
  //   final data = {
  //     'name': name,
  //     'rating_value': rating,
  //     'is_customer':isCustomer,
  //     'createdAt': DateTime.now().toString()};
  //
  //   final id = await db.insert('rating', data,
  //       conflictAlgorithm: sql.ConflictAlgorithm.ignore);
  //   return id;
  // }

  // static Future<int> update(String name, int rating) async {
  //   final db = await FireStoreService.db();
  //   final data = {'name': name, 'rating_value': rating, 'createdAt': DateTime.now().toString()};
  //   final result = await db.update('rating', data, where:"name =?", whereArgs:[name]);
  //   return result;
  // }
  //
  // static Future<void> deleteItem(int id) async {
  //   final db = await FireStoreService.db();
  //   try{
  //       await db.delete('rating',where: "id = ?", whereArgs: [id]);
  //   } catch (err){
  //     debugPrint("Something wrong has happened: $err");
  //   }
  // }
  //
  // static Future<List<Map<String,dynamic>>> getItems(int isCustomer) async {
  //   final db = await FireStoreService.db();
  //   return db.query('rating',where:"is_customer =?", whereArgs:[isCustomer], orderBy: "id");
  // }

  // static Future<List<Map<String,dynamic>>> getItem(int id) async {
  //   final db = await FireStoreService.db();
  //   return db.query('rating', where:"id =?", whereArgs:[id]);
  // }

}
// database add table query
// is_customer values:  is Customer = 1 not Customer = 0
