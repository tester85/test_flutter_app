// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:test_app/widget/square_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // to do implement build
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
      ),
      body: Padding(
        // padding: const EdgeInset,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/icon.webp'),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Center(
              child: Text(
                'WELCOME',
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    letterSpacing: 2.0),
              ),
            ),

            const SizedBox(
              height: 60.0,
            ),
            SquareButton(
              icon: Icons.login,
              text: 'LOGIN',
              onPressed: () {
                Navigator.pushNamed(context, '/select');
              },
            ),
          ],
        ),
      ),
    );
  }
}
