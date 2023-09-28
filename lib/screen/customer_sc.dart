import 'package:flutter/material.dart';
import 'package:test_app/listview/customer_list.dart';
import 'package:test_app/model/customer.dart';


class CustomerSc extends StatelessWidget {
  const CustomerSc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: const Text('Car Mechanics' ),),
      body: CustomerList(customerP: customers,),
    );
  }
}



