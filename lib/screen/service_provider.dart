import 'package:flutter/material.dart';

import '../listview/service_prov_list.dart';
import '../model/service_provider.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: const Text('Service Providers' ),),
      body: ServicePList( serviceP: servProviders),
    );
  }
}



