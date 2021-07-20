import 'package:flutter/material.dart';
import 'package:synergy/data/models/activity.dart';
import 'package:synergy/presentation/screens/home/widgets/all-activities.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';

class Activities extends StatefulWidget {
  Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  List<Activity> activities = Activity.activities();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Synergy"),
      body: AllActivities(list: activities),
      bottomNavigationBar: CustomBottomNavbar(currentIndex: 1),
    );
  }
}
