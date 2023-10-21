import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraProvider extends ChangeNotifier {
  late List<CameraDescription> _cameras;

  CameraProvider() {
    // Initialize the cameras list
    _initializeCameras();
  }

  List<CameraDescription> get cameras => _cameras;

  void _initializeCameras() async {
    try {
      _cameras = await availableCameras();
    } catch (e) {
      _cameras = [];
      print("Error initializing cameras: $e");
    }
    notifyListeners(); // Notify listeners after updating the list
  }
}
