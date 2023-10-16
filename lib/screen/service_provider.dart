import 'package:flutter/material.dart';
import 'package:test_app/database/firestore_service.dart';
import 'package:test_app/mapper/Mapper.dart';

import '../listview/service_prov_list.dart';

class ServiceProvider extends StatefulWidget {
  const ServiceProvider({super.key});

  @override
  _ServiceScState createState()=> _ServiceScState();
}

class _ServiceScState extends State<ServiceProvider>{
  List<Map<String,dynamic>> rating = [];

  Future<void> _refreshRating() async {
    final List<Map<String, dynamic>>? data = await FireStoreService().getItems(0);
    print("Numero de elementos Servicio -> ${data?.length}");
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
        title: const Text('Service Providers' ),),
      body: ServicePList(serviceP:
      Mapper().convertToServicePList(rating)),
    );
  }

  @override
  void initState(){
    super.initState();
    _refreshRating();
  }

}



