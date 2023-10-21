import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {

  const CameraScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the camera controller
    // final firstCamera = cameras.first;
    controller = CameraController(widget.camera, ResolutionPreset.high);
    // _initializeControllerFuture = controller.initialize();
    _initializeControllerFuture = controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    if (!controller.value.isInitialized) {
      return;
    }

    final image = await controller.takePicture();
    if (image != null) {
      // Handle the captured image, e.g., save it and associate it with a chat message
      print(image.path);
    }
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the picked image, e.g., save it and associate it with a chat message
      print(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return Stack(
      children: [
        CameraPreview(controller), // Display the camera preview
        Positioned(
          right: 16,
          bottom: 16,
          child: GestureDetector(
            onTap: _pickImage,
            child: const Icon(
              Icons.image,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
