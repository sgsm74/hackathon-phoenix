import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:synergy/presentation/screens/activity/activities.dart';
import 'package:synergy/presentation/screens/activity/activity.dart';
import 'package:synergy/presentation/screens/auth/login.dart';
import 'package:synergy/presentation/screens/auth/reset-password.dart';
import 'package:synergy/presentation/screens/auth/signup.dart';
import 'package:synergy/presentation/screens/champion/champion.dart';
import 'package:synergy/presentation/screens/home/home.dart';
import 'package:synergy/presentation/screens/introduction.dart';
import 'package:synergy/presentation/screens/map/map.dart';
import 'package:synergy/presentation/screens/messages/inbox.dart';
import 'package:synergy/presentation/screens/more/more.dart';
import 'package:synergy/presentation/screens/onboard-view.dart';
import 'package:synergy/presentation/screens/rewards/rewards.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
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
          '/reset-password': (context) => ResetPassword(),
          '/activity': (context) => Activity(),
          //'/user' : (context) => UserView(user: user)
          '/champion': (context) => Champion(),
          '/inbox': (context) => Inbox(),
          '/rewards': (context) => Rewards(),
          '/more': (context) => More(),
          '/activities': (context) => Activities(),
          '/map': (context) => NearbyPeopleOnMap(),
        },
      ),
    );
  }
}
