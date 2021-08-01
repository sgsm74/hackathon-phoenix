import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/more/previous-activities.dart';
import 'package:synergy/presentation/screens/more/widgets/more-item.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Synergy"),
      body: Container(
        child: ListView(
          children: [
            Text(
              "Welcome!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            MoreItem(title: "My Profile", function: () {}),
            MoreItem(
                title: "Previous Activities",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviousActivities(),
                    ),
                  );
                }),
            MoreItem(title: "Upcoming Activities", function: () {}),
            MoreItem(title: "Settings", function: () {})
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(currentIndex: 4),
    );
  }
}
