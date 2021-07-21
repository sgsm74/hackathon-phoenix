import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNavbar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  _CustomBottomNavbarState createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = widget.currentIndex;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
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
          icon: Icon(Icons.home_rounded),
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
