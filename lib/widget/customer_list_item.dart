import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_app/database/sql_helper.dart';
import 'package:test_app/widget/three_btn_row.dart';

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
            print("$name got a $rating stars");
            SQLHelper.update(name, rating.toInt());
            showModalBottomSheet(context: context, builder: (BuildContext context){
              if(rating > 3){
                return const ThreeButtonRow(buttonLabels: ['First Label','Second Label','Third label'],);
              }
              else {
                return const ThreeButtonRow(buttonLabels: ['Fourth Label','Fifth Label','Sixth label'],);
              }
            });
          },
        ),
      ),
    );
  }
}

