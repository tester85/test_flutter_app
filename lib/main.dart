
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:test_app/database/sql_helper.dart';
import 'package:test_app/model/customer.dart';
import 'package:test_app/model/service_provider.dart';
import 'package:test_app/screen/customer_sc.dart';
import 'package:test_app/screen/home_page.dart';
import 'package:test_app/screen/selector_screen.dart';
import 'package:test_app/screen/service_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = await SQLHelper.db();

  for(Customer c in customers){
    final data = {
      'id': c.id,
      'name': c.name,
      'rating_value': c.rating,
      'is_customer':c.isCustomer,
      'createdAt': DateTime.now().toString()};
    await database.insert('rating', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
  for(ServiceP sp in servProviders){
    final data = {
      'id': sp.id,
      'name': sp.name,
      'rating_value': sp.rating,
      'is_customer':sp.isCustomer,
      'createdAt': DateTime.now().toString()};
    await database.insert('rating', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  print(SQLHelper.countItem(database).toString());
  runApp(MyApp(database));

}

class MyApp extends StatelessWidget {
  const MyApp(Database database, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        // global styles
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        appBarTheme:  AppBarTheme(
          color:Colors.deepOrange[600],
          titleTextStyle: const TextStyle(
            color: Colors.white, // Text color of the app bar title
            fontSize: 20.0, // Font size of the app bar title
            fontWeight: FontWeight.bold, // Font weight of the app bar title
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, // Icon color in the app bar
          ),
        ),
        useMaterial3: true,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          textTheme: ButtonTextTheme.accent,)
      ),
      // home: const Rate(title: 'Flutter Test'),
      // home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(), // Define the initial route
        '/select': (context) => const SelectRol(), // Define the second screen route
        '/serviceP': (context) => const ServiceProvider(), // Define the second screen route
        '/customer': (context) => const CustomerSc(), // Define the second screen route
      },

    );
  }
}



