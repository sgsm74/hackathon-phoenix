import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/more/previous-activities.dart';
import 'package:synergy/presentation/screens/more/widgets/more-item.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/presentation/widgets/dialog.dart';
import 'package:synergy/utils/constants.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Synergy"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          painter: MyPainter(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            //margin:EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: CircleAvatar(
                    //backgroundImage: AssetImage("assets/users/kevin.png"),
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      child: Image.asset(
                        "assets/users/kevin.png",
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "John Doe",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "john@gmail.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  //width: 100,
                  height: 30,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.35,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Constants.primaryColor,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MoreItem(
                  title: "Upcoming Activities",
                  function: () {},
                  icon: Icons.upcoming_outlined,
                ),
                MoreItem(
                  title: "Previous Activities",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreviousActivities(),
                      ),
                    );
                  },
                  icon: Icons.history_rounded,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 0.5,
                  ),
                ),
                MoreItem(
                  title: "Settings",
                  function: () {},
                  icon: Icons.settings_rounded,
                ),
                MoreItem(
                  title: "FAQs",
                  function: () {},
                  icon: Icons.pending_sharp,
                ),
                MoreItem(
                  title: "Support",
                  function: () {},
                  icon: Icons.support_agent_rounded,
                ),
                MoreItem(
                  title: "Log Out",
                  function: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return MyDialogBox(
                            descriptions: "Are you sure you want to log out?",
                            confirmText: "Yes, log out",
                            cancelText: "Cancel",
                          );
                        });
                  },
                  icon: Icons.logout_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(currentIndex: 4),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = Paint()
      ..color = Constants.primaryColor
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.30);
    path_0.quadraticBezierTo(
        size.width * 0.5, size.height * 0.45, size.width, size.height * 0.30);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
