import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/home/home.dart';
import 'package:synergy/presentation/screens/messages/inbox.dart';
import 'package:synergy/presentation/screens/more/more.dart';
import 'package:synergy/presentation/screens/rewards/rewards.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inbox()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Rewards()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => More()),
              );
              break;
            default:
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
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
