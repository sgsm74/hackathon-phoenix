import 'package:flutter/material.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/utils/constants.dart';

class Champion extends StatelessWidget {
  const Champion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Synergy"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Well done, Champion! You’ve earned 2 Reward Points!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          Image.asset("assets/images/congrats.png"),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(currentIndex: 3),
    );
  }
}
