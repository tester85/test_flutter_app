import 'package:flutter/material.dart';
import 'package:test_app/widget/navigate_button.dart';

class ThreeButtonRow extends StatelessWidget {
  final List<String> buttonLabels;

  const ThreeButtonRow({super.key, required this.buttonLabels});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 15.0,
        ),

        // Header
        const Text('Rate your experience', style: TextStyle(fontSize: 20)),
        const Divider(
          color: Colors.grey,
          height: 30.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        // Button Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttonLabels
              .map(
                (text) => CustomButton(text),
              )
              .toList(),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;

  const CustomButton(this.buttonText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Set your desired width
      height: 30, // Set your desired height
      child: SquareButton(
        icon: Icons.handshake_outlined,
        text: buttonText,
        onPressed: () {
          print('Clicked: $buttonText');
        },
      ),
    );
  }
}
