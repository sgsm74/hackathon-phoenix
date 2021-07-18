import 'dart:async';

import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/intro');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(),
          width: 300,
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/intro-background.png"),
                    Text(
                      "SYNERGY",
                      style: TextStyle(
                        fontSize: 50,
                        //fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                        fontFamily: 'Sansita',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "A connection towards wellness",
                  style: TextStyle(
                    fontSize: 30,
                    color: Constants.primaryColor,
                    fontFamily: 'Sansita',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
