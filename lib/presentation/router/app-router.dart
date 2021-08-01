import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/activity/activities.dart';
import 'package:synergy/presentation/screens/activity/activity.dart';
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
import 'package:synergy/presentation/screens/user/user.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    var uri = Uri.parse(routeSettings.name!);
    /* if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'user') {
      var id = int.parse(uri.pathSegments[1]);
      return MaterialPageRoute(builder: (context) => UserView(userId: id));
    } */

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => Introduction(),
        );
      case '/intro':
        return MaterialPageRoute(
          builder: (_) => OnBoardScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => SignUp(),
        );
      case '/reset-password':
        return MaterialPageRoute(
          builder: (_) => ResetPassword(),
        );
      case '/activity':
        return MaterialPageRoute(
          builder: (_) => Activity(),
        );
      case '/champion':
        return MaterialPageRoute(
          builder: (_) => Champion(),
        );
      case '/inbox':
        return MaterialPageRoute(
          builder: (_) => Inbox(),
        );
      case '/rewards':
        return MaterialPageRoute(
          builder: (_) => Rewards(),
        );
      case '/more':
        return MaterialPageRoute(
          builder: (_) => More(),
        );
      case '/activities':
        return MaterialPageRoute(
          builder: (_) => Activities(),
        );
      case '/map':
        return MaterialPageRoute(
          builder: (_) => NearbyPeopleOnMap(),
        );
      case '/user':
        return MaterialPageRoute(
          builder: (_) => UserView(),
        );

      default:
        return null;
    }
  }
}
