
import 'package:flutter/material.dart';

class NotificationDetail extends StatelessWidget {
   final String title;
   final Function()? onPressed;
   final String description;

  const NotificationDetail({super.key, required this.title, this.onPressed, required this.description});

   @override
   Widget build(BuildContext context) {
     return InkWell(
       onTap: () {
         onPressed?.call(); // Execute the provided onPressed function
       },
       child: Container(
         width: 100,
         height: 100,
         decoration: BoxDecoration(
           color: Colors.blue,
           borderRadius: BorderRadius.circular(10),
         ),
         child: Center(
           child: Text(
             title,
             style: const TextStyle(
               color: Colors.white,
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
       ),
     );
   }

   void showDescriptionDialog(BuildContext context) {
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text(title),
           content: Text(description),
           actions: <Widget>[
             TextButton(
               child: const Text('Close'),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             ),
           ],
         );
       },
     );
   }
}
