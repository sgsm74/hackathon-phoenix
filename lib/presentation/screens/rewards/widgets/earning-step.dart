import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class EarningStep extends StatelessWidget {
  final int step;
  final String title;
  final String content;
  const EarningStep({
    Key? key,
    required this.step,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
      decoration: BoxDecoration(
        //border: Border.all(color: Constants.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              //color: Color(0xffB8C8E4),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                step.toString(),
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
