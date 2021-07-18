import 'package:flutter/material.dart';

class MoreItem extends StatelessWidget {
  final String title;
  final Function() function;
  const MoreItem({Key? key, required this.title, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffB8C8E4),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
