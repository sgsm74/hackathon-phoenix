import 'package:flutter/material.dart';

class SinglePermission extends StatelessWidget {
  final String title;
  final bool visible;
  const SinglePermission({Key? key, required this.title, required this.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 400),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/images/permissions/" + title + ".png"),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Text(
              "Allow your " + title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
                color: Colors.purple[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Text(
              "We will need your " + title + " to give you better experience",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
