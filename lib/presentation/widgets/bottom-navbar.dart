import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class MyBottomNavbar extends StatefulWidget {
  final int currentIndex;
  const MyBottomNavbar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  _MyBottomNavbarState createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = widget.currentIndex;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Constants.primaryColor,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      selectedFontSize: 13,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          switch (value) {
            case 0:
              Navigator.of(context).pushNamed('/home');
              break;
            case 1:
              Navigator.of(context).pushNamed('/activities');
              break;
            case 2:
              Navigator.of(context).pushNamed('/inbox');
              break;
            case 3:
              Navigator.of(context).pushNamed('/rewards');
              break;
            case 4:
              Navigator.of(context).pushNamed('/more');
              break;
            default:
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_tennis_rounded),
          label: "Activities",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.email_outlined),
          label: "Inbox",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events_outlined),
          label: "Rewards",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz_rounded),
          label: "More",
        ),
      ],
    );
  }
}
