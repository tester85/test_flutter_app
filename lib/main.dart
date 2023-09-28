import 'package:flutter/material.dart';
import 'package:test_app/model/customer.dart';
import 'package:test_app/listview/customer_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        // appBarTheme: TextStyle,
        useMaterial3: true,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          textTheme: ButtonTextTheme.accent,)
      ),
      // home: const Rate(title: 'Flutter Test'),
      home: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: const Text('Car Mechanics',
            style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold,
              letterSpacing: 2.0
          ),),
            backgroundColor: Colors.deepOrange[600]
        ),
        body: CustomerList(customers: customers),
      ),

    );
  }
}



