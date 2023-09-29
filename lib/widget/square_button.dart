import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed;

   SquareButton({super.key, required this.text, required this.onPressed, required this.icon});

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
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.0,
              color: Colors.black87,
            ),
            const SizedBox(width: 10.0), // Add spacing between icon and text
             Text(
                text, style: const TextStyle( fontWeight: FontWeight.bold),
            ),
          ],
        )
      ),
    );
  }

}