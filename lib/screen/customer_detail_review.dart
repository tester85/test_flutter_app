import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_app/model/customer.dart';

class CustomerDetailReviewPage extends StatefulWidget {
  final Customer customer;

  CustomerDetailReviewPage({super.key, required this.customer});

  @override
  _CustomerDetailReviewPageState createState() =>
      _CustomerDetailReviewPageState();
}

class _CustomerDetailReviewPageState
    extends State<CustomerDetailReviewPage> {
  double newRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Review'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Customer Name: ${widget.customer.name}'),
            Text('Current Rating: ${widget.customer.rating}'),
            RatingBar.builder(
              initialRating: newRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                 Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  newRating = rating;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Update the rating for the customer
                widget.customer.rating = newRating;
                Navigator.pop(context); // Return to the previous page
              },
              child: const Text('Save Rating'),
            ),
          ],
        ),
      ),
    );
  }
}
