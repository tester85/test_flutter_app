import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;

  SquareButton({required this.icon, required this.onPressed});

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
        child: Icon(
          icon,
          size: 25, // Icon size
          color: Colors.white, // Icon color
        ),
      ),
    );
  }

}