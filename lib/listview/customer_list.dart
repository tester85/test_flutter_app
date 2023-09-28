import 'package:flutter/material.dart';
import 'package:test_app/screen/customer_details.dart';

import '../model/customer.dart';
import '../widget/customer_list_item.dart';

class CustomerList extends StatelessWidget {
  final List<Customer> customers;

  const CustomerList({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
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