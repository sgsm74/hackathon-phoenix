import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Sansita',
          fontWeight: FontWeight.bold,
          color: Constants.primaryColor,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.map_rounded,
          color: Constants.primaryColor,
          size: 25,
        ),
        onPressed: () {
          //Navigator.pop(context);
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
                    color: Constants.primaryColor,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.emoji_events_outlined,
                  color: Constants.primaryColor,
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
