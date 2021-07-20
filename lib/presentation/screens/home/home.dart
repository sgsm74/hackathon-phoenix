import 'package:flutter/material.dart';
import 'package:synergy/data/models/activity.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/data/models/workshop.dart';
import 'package:synergy/presentation/screens/home/widgets/activities.dart';
import 'package:synergy/presentation/screens/home/widgets/people.dart';
import 'package:synergy/presentation/screens/home/widgets/workshop.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/utils/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Activity> activities = Activity.activities();

  List<Workshop> workshops = Workshop.workshops();
  List<User> users = User.users();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Synergy"),
      body: ListView(
        //physics: BouncingScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.primaryColor,
                    width: 1.0,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Constants.primaryColor,
                ),
                //border: InputBorder.a,
                hintText: "What activity are you looking for?",
                hintStyle: TextStyle(
                  color: Constants.primaryColor,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/home-background.png",
                fit: BoxFit.cover),
          ),
          SizedBox(
            height: 10,
          ),
          rowActivities("Explore Activities", activities),
          SizedBox(
            height: 10,
          ),
          /* rowWorkshops("Workshops Nearby", workshops),
          SizedBox(
            height: 10,
          ), */
          rowPeople("People Nearby", users),
          SizedBox(
            height: 10,
          ),
          rowPeople("Trainers Nearby", users)
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 0,
      ),
    );
  }
}
