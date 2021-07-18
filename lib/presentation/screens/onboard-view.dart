import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'auth/signup.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnBoardScreen();
  }
}

class _OnBoardScreen extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    //this is a page decoration for intro screen
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
        color: Color(0xff1A4CA7),
      ), //tile font size, weight and color
      bodyTextStyle: TextStyle(
        fontSize: 18.0,
        color: Color(0xff7392C9),
      ),
      //body text size and color
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //decription padding
      imagePadding: EdgeInsets.all(0), //image padding
      boxDecoration: BoxDecoration(
        color: Colors.white,
      ), //show linear gradient background of page
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      //main background of screen
      pages: [
        //set your page view here
        PageViewModel(
          title: "Connect with people",
          body: "Find people interested in similar outdoor activities",
          image: Container(
            width: 150,
            child: Image.asset("assets/images/first.png"),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Earn & Redeem Rewards",
          body:
              "You earn rewards every time you meet someone, and redeem them with surprises⭐",
          image: Container(
            //width: 150,
            child: Image.asset("assets/images/second.png"),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Enjoy the ride of life",
          body: "Stay physically active and mentally happy",
          image: Container(
            width: 250,
            child: Image.asset("assets/images/third.png"),
          ),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],

      onDone: () => goHomepage(context), //go to home page on done
      onSkip: () => goHomepage(context), // You can override on skip
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text(
        'Skip',
        style: TextStyle(color: Color(0xff000000), fontSize: 18),
      ),
      next: Text(
        'Next',
        style: TextStyle(color: Color(0xff000000), fontSize: 18),
      ),
      done: Text(
        'Continue',
        style: TextStyle(color: Color(0xff000000), fontSize: 18),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Color(0xff7392C9), //color of dots
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xff1A4CA7), //color of active dot
        activeShape: RoundedRectangleBorder(
          //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return SignUp();
      //return Home();
    }), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  /* Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      child: Image.asset('$assetName', width: 430, height: 430),
      alignment: Alignment.bottomCenter,
    );
  } */
}
