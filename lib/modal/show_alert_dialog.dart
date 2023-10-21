import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:test_app/utilities/colors.dart' as utils;

Future<dynamic> showAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  String defaultActionText = 'OK',
  String? cancelActionText,
}) {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                cancelActionText,
                style: const TextStyle(
                  color: utils.Colors.darkBlue,
                ),
              ),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              defaultActionText,
              style: const TextStyle(
                color: utils.Colors.darkBlue,
              ),
            ),
          )
        ],
      ),
    );
  } else {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelActionText),
            ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(defaultActionText),
          )
        ],
      ),
    );
  }
}
