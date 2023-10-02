import 'package:flutter/material.dart';
import 'package:test_app/model/customer.dart';
import 'package:test_app/screen/customer_details.dart';
import '../widget/customer_list_item.dart';

class CustomerList extends StatelessWidget {
  final List<Customer> customerP;

  const CustomerList({super.key, required this.customerP});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customerP.length,
      itemBuilder: (context, index) {
        final customer = customerP[index];
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
            rating: customer.rating.toDouble(),
          ),
        );
      },
    );
  }
}
