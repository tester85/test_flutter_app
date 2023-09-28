
import 'package:flutter/material.dart';
import 'package:test_app/screen/detail_notification.dart';
import 'package:test_app/widget/square_button.dart';

class CustomerDetailsPage extends StatelessWidget {
   final String customerName;

  const CustomerDetailsPage({super.key, required this.customerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechanic Details'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/user_default.png'),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  ' $customerName',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 60.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SquareButton(
                          icon: Icons.details_rounded,
                          text: 'See the details',
                          onPressed: () {
                            const NotificationDetail notification =
                              NotificationDetail(title: 'Details', description: 'description example');
                            notification.showDescriptionDialog(context);
                            // Handle the back button press here.
                              // Example: Navigate back
                          },
                        ), // Add spacing between buttons
                        SquareButton(
                          icon: Icons.rate_review,
                          text: 'Rate your exp',
                          // icon: Icons.notifications,
                          onPressed: () {
                            // Handle the notification button press here.
                            // You can display a notification window or perform any action.
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ])),
    );
  }
}
