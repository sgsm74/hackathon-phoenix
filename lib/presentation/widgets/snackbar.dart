import 'package:flutter/material.dart';

SnackBar mySnackBar(String message, {Color color = Colors.red}) {
  return SnackBar(
    content: Text(message),
    duration: Duration(seconds: 3),
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
  );
}
