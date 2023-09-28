import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

   SquareButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 150, // Adjust the size of the button as needed
        height: 50,
        decoration: BoxDecoration(
          color: Colors.orange, // Button background color
          borderRadius: BorderRadius.circular(10), // Button border radius
        ),
        child: Center(
            child: Text(
            text, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
          ),
          )
        ),

      ),
    );
  }

}