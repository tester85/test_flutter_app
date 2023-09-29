import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomerListItem extends StatelessWidget {
  final String name;
  final double rating;

  const CustomerListItem({super.key, required this.name, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(name,style: const TextStyle(
            fontSize: 16
        ),),
        subtitle: RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => const Icon(
            Icons.health_and_safety,
            color: Colors.green,
          ),
          onRatingUpdate: (rating) {
            // Handle rating updates if needed.

          },
        ),
      ),
    );
  }
}

