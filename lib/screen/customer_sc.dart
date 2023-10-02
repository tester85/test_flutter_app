import 'package:flutter/material.dart';
import 'package:test_app/dao/customer_dao.dart';
import 'package:test_app/database/sql_helper.dart';
import 'package:test_app/listview/customer_list.dart';
import 'package:test_app/mapper/CustomerMapper.dart';


class CustomerSc extends StatefulWidget {
  const CustomerSc({super.key});

   @override
    _CustomerScState createState()=> _CustomerScState();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.grey[500],
  //     appBar: AppBar(
  //       title: const Text('Car Mechanics' ),),
  //     body: CustomerList(customerP: customers),
  //   );
  // }

  }


class _CustomerScState extends State<CustomerSc>{
  final List<Map<String,dynamic>> _rating = CustomerDao().getCustomerList();
  // bool _isloading = true;
  // // List<Map<String, dynamic>> mapListFromDatabase = ''
  //
  // void _refreshRating() async {
  //   final data = await SQLHelper.getItems(true);
  //   setState(() {
  //     _rating = data;
  //     _isloading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.grey[500],
            appBar: AppBar(
              title: const Text('Customers' ),),
            body: CustomerList(customerP:
                  CustomerMapper().convertToCustomerList(_rating)),
          );
  }

}



