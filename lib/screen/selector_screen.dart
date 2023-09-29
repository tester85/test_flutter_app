
import 'package:flutter/material.dart'; 
import 'package:test_app/widget/square_button.dart';

class SelectRol extends StatelessWidget {

  const SelectRol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please select your rol'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                          icon: Icons.car_repair,
                          text: 'Car Repair',
                          onPressed: () {
                            Navigator.pushNamed(context, '/serviceP');
                          },
                        ), // Add spacing between buttons
                        SquareButton(
                          icon: Icons.verified_user,
                          text: 'Customers',
                          // icon: Icons.notifications,
                          onPressed: () {
                            Navigator.pushNamed(context, '/customer');
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
