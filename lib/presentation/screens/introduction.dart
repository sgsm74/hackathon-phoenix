import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/auth/auth_bloc.dart';
import 'package:synergy/data/bloc/auth/auth_state.dart';
import 'package:synergy/data/bloc/internet/internet_bloc.dart';
import 'package:synergy/data/bloc/internet/internet_state.dart';
import 'package:synergy/presentation/widgets/snackbar.dart';
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
                      ScaffoldMessenger.of(context)
                          .showSnackBar(mySnackBar("No Internet connection"));
                    } else if (state is ConnectionSuccess) {
                      print("success");
                    }
                  },
                  child: Container(),
                ),
                BlocListener<AuthBloc, AuthUserState>(
                  listener: (context, state) {
                    if (state is SuccessAuthUser) {
                      Timer(Duration(seconds: 3), () {
                        Navigator.of(context).popAndPushNamed('/home');
                      });
                    } else {
                      Timer(Duration(seconds: 3), () {
                        Navigator.of(context).popAndPushNamed('/login');
                      });
                    }
                  },
                  child: Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
