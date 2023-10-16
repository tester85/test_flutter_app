import 'package:flutter/material.dart';
import 'package:test_app/database/firestore_service.dart';
import 'package:test_app/listview/customer_list.dart';
import 'package:test_app/mapper/Mapper.dart';


class CustomerSc extends StatefulWidget {
  const CustomerSc({super.key});

   @override
    _CustomerScState createState()=> _CustomerScState();
  }

class _CustomerScState extends State<CustomerSc>{
  List<Map<String,dynamic>> rating = [];

  Future<void> _refreshRating() async {
    final List<Map<String, dynamic>>? data = await FireStoreService().getItems(1);
    print("Numero de elementos -> ${data?.length}");
    // return data;
    setState(() {
      rating = data!;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
            backgroundColor: Colors.grey[500],
            appBar: AppBar(
              title: const Text('Customers' ),),
            body: CustomerList(customerP:
                  Mapper().convertToCustomerList(rating)),
          );
  }

  @override
  void initState(){
    super.initState();
    _refreshRating();
  }

}



