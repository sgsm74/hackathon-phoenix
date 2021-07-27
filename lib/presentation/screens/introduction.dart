import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/internet/internet_bloc.dart';
import 'package:synergy/data/bloc/internet/internet_event.dart';
import 'package:synergy/data/bloc/internet/internet_state.dart';
import 'package:synergy/presentation/screens/permissions/permissions.dart';
import 'package:synergy/utils/constants.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
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
                BlocListener<InternetBloc, NetworkState>(
                  listener: (context, state) {
                    if (state is ConnectionFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("No Internet connection"),
                        duration: Duration(seconds: 5),
                      ));
                    } else if (state is ConnectionSuccess) {
                      Timer(Duration(seconds: 3), () {
                        Navigator.of(context).popAndPushNamed('/signup');
                        /* Navigator.push(
          context, MaterialPageRoute(builder: (context) => PermissionView())); */
                      });
                    } else {
                      print(state);
                    }
                  },
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
