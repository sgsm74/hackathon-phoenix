import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class MyDialogBox extends StatefulWidget {
  final descriptions, confirmText, cancelText;

  const MyDialogBox({
    Key? key,
    required this.descriptions,
    required this.confirmText,
    required this.cancelText,
  }) : super(key: key);

  @override
  _MyDialogBoxState createState() => _MyDialogBoxState();
}

class _MyDialogBoxState extends State<MyDialogBox>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          elevation:
                              MaterialStateProperty.resolveWith((states) => 0),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Constants.primaryColor,
                          )),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        widget.confirmText,
                        style: TextStyle(fontSize: 14),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          elevation:
                              MaterialStateProperty.resolveWith((states) => 0),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.transparent,
                          )),
                      child: Text(
                        widget.cancelText,
                        style: TextStyle(
                          fontSize: 14,
                          color: Constants.primaryColor,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Icon(
                Icons.info_sharp,
                size: 80,
                color: Constants.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
