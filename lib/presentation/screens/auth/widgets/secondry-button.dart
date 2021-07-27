import 'package:flutter/material.dart';

class SecondryButton extends StatelessWidget {
  final String title;
  final Function() function;
  const SecondryButton({Key? key, required this.title, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => Colors.transparent,
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 0),
        ),
      ),
    );
  }
}
