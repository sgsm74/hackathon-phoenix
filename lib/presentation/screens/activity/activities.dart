import 'package:flutter/material.dart';
import 'package:synergy/data/repositories/activity-repository.dart';
import 'package:synergy/presentation/screens/activity/widgets/all-activities.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';

class Activities extends StatefulWidget {
  Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  ActivityRepository activityRepo = ActivityRepository();
  Map<String, dynamic> activitiesInitialData = {'activities': ''};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Synergy"),
      body: FutureBuilder(
        future: activityRepo.parseActivitiesData(),
        initialData: activitiesInitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return AllActivities(
            list: snapshot.data,
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavbar(currentIndex: 1),
    );
  }
}
