import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/activity/activity.dart';
import 'package:synergy/presentation/screens/auth/login.dart';
import 'package:synergy/presentation/screens/auth/signup.dart';
import 'package:synergy/presentation/screens/champion/champion.dart';
import 'package:synergy/presentation/screens/home/home.dart';
import 'package:synergy/presentation/screens/introduction.dart';
import 'package:synergy/presentation/screens/onboard-view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Synergy',
      theme: ThemeData(
        accentColor: Colors.white10,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontFamily: 'Poppins'),
        ),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Introduction(),
        '/intro': (context) => OnBoardScreen(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/activity': (context) => Activity(),
        //'/user' : (context) => UserView(user: user)
        '/champion': (context) => Champion(),
      },
    );
  }
}
