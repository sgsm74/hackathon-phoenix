import 'package:flutter/material.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/presentation/screens/activity/widgets/people.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';

class Activity extends StatefulWidget {
  Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List<User> users = User.users();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Synergy"),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width / 1.5,
              child: Image.asset(
                "assets/activity/tennis-large.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          peopleNearbyForSpecificActivity("Interested People Nearby", users),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 1,
      ),
    );
  }
}
