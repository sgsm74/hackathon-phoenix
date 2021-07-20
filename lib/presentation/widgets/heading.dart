import 'package:flutter/material.dart';

Widget headingTitle(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Text(
          "See all >",
          style: TextStyle(
            fontSize: 13,
            color: Colors.blue[300],
          ),
        ),
      ),
    ],
  );
}
