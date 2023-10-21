import 'package:flutter/material.dart';
import 'package:test_app/utilities/colors.dart' as utils;

class MyTextFieldWidget extends StatefulWidget {
  @override
  _MyTextFieldWidgetState createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  bool isFocused = false;
  FocusNode focusNode = FocusNode();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
      if (!isFocused) {
        textController.clear(); // Clear the TextField when it loses focus
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // When you tap outside of the TextField, lose focus.
        FocusScope.of(context).unfocus();
        setState(() {
          isFocused = false;
          textController.clear();
        });
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isFocused ? utils.Colors.green : utils.Colors.green,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    controller: textController,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type here...',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Icon(
                isFocused ? Icons.send : Icons.camera_alt,
                color: isFocused ? utils.Colors.green : utils.Colors.green,
                size: 30,
              ),
            ],
          ),
          // Add more widgets to the Column as needed
        ],
      ),
    );
  }
}
