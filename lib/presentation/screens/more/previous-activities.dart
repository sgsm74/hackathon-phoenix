import 'package:flutter/material.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';

class PreviousActivities extends StatefulWidget {
  PreviousActivities({Key? key}) : super(key: key);

  @override
  _PreviousActivitiesState createState() => _PreviousActivitiesState();
}

class _PreviousActivitiesState extends State<PreviousActivities> {
  List activities = [
    ["assets/uploads/1.png", "Tennis with Matt", "18 July 2021", 2],
    ["assets/uploads/2.png", "Badminton with Leandra", "15 July 2021", 2],
    ["assets/uploads/3.png", "Stress Reduction workshop", "10 July 2021", 5],
    ["assets/uploads/4.png", "Skateboard with Lucy", "5 July 2021", 2],
    ["assets/uploads/5.png", "Yoga Session", "29 June 2021", 5],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Synergy"),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Color(0xffB8C8E4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        activities[index][1],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Date: " + activities[index][2]),
                      Text(
                        "Reward points earned: " +
                            activities[index][3].toString(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      activities[index][0],
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: MyBottomNavbar(currentIndex: 4),
    );
  }
}
