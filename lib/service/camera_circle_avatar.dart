import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraCircleAvatar extends StatelessWidget {
   late final List<CameraDescription> cameras;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showImageSourceSelectionDialog(context);
      },
      child: const Stack(
        children: [
          CircleAvatar(
            radius: 50, // Adjust the radius to your preference
            // backgroundColor: Colors.blue, // Customize the avatar appearance
            backgroundImage: AssetImage('assets/user_default.png'),
            child: Icon(
              Icons.camera_alt,
              size: 40, // Adjust the icon size to your preference
              color: Colors.white, // Customize the icon color
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Icon(
              Icons.image_rounded,
              size: 24, // Adjust the icon size to your preference
              color: Colors.white, // Customize the icon color
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showImageSourceSelectionDialog(BuildContext context) async {
    // Display a dialog to allow the user to select between camera and gallery
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: const Text("Choose the source for your image"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _captureImage(context);
              },
              child: const Text("Camera"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(context);
              },
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _captureImage(BuildContext context) async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the captured image, e.g., save it and associate it with a chat message
    }
  }

  Future<void> _pickImage(BuildContext context) async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the picked image, e.g., save it and associate it with a chat message
    }
  }
}
