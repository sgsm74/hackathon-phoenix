import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class RewardLevel extends StatelessWidget {
  final int level;
  final String description;
  const RewardLevel({
    Key? key,
    required this.level,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Constants.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xffB8C8E4),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                level.toString(),
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
              child: Text(
                description,
                style: TextStyle(
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
