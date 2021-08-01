import 'package:flutter/material.dart';

class MoreItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() function;
  const MoreItem(
      {Key? key,
      required this.title,
      required this.function,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xffB8C8E4),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      //margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.045),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                icon,
                color: Color(0xff31394c),
                size: 20,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 15,
              semanticLabel: "hi",
            ),
          ),
        ),
      ),
    );
  }
}
