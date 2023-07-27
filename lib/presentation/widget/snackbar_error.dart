import 'package:flutter/material.dart';

void snackbarError(
  BuildContext context, {
  int duration = 3,
  String message = 'Error',
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
    ),
  );
}

void snackbarSuccess(
  BuildContext context, {
  int duration = 3,
  String message = 'Error',
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
      backgroundColor: const Color(0xff2A6265),
    ),
  );
}
