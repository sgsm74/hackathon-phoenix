import 'package:flutter/material.dart';

class Constants {
  static const Color primaryColor = Color(0xff006BFF);
  static const Color secondryColor = Color(0xff0059D4);
  //6979FF
  //1A4CA7
  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
