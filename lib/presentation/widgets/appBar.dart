import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context)!.settings.name;
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Sansita',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Constants.primaryColor,
      elevation: 0,
      leading: route == '/home'
          ? IconButton(
              icon: Icon(
                Icons.map_rounded,
                color: Constants.primaryColor,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/map');
              },
            )
          : IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  '24',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.emoji_events_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
