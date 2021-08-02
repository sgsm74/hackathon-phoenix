import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class MyDotsIndicator extends StatefulWidget {
  MyDotsIndicator({Key? key}) : super(key: key);

  @override
  _MyDotsIndicatorState createState() => _MyDotsIndicatorState();
}

class _MyDotsIndicatorState extends State<MyDotsIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(reverse: true);
  late final AnimationController _controller1 = AnimationController(
    duration: const Duration(milliseconds: 500),
    lowerBound: 0.0,
    upperBound: 1.0,
    vsync: this,
  )
    ..forward(from: 250)
    ..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linearToEaseOut,
  );
  late final Animation<double> _animation1 = CurvedAnimation(
    parent: _controller1,
    curve: Curves.linearToEaseOut,
  );
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: _animation,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        ScaleTransition(
          scale: _animation1,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        ScaleTransition(
          scale: _animation,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
      ],
    );
  }
}
