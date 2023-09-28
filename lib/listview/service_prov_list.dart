import 'package:flutter/material.dart';
import 'package:test_app/model/service_provider.dart';
import 'package:test_app/screen/customer_details.dart';

import '../widget/customer_list_item.dart';

class ServicePList extends StatelessWidget {
  final List<ServiceP> serviceP;

  const ServicePList({super.key, required this.serviceP});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: serviceP.length,
      itemBuilder: (context, index) {
        final customer = serviceP[index];
        return GestureDetector(
          onTap: () {
            // Navigate to the customer details page when tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerDetailsPage(
                  customerName: customer.name,
                ),
              ),
            );
          },
          child: CustomerListItem(
            name: customer.name,
            rating: customer.rating,
          ),
        );
      },
    );


  }
}


//return CustomerListItem(
//   name: customer.name,
//   rating: customer.rating,
// );