import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/rewards/widgets/earning-step.dart';
import 'package:synergy/utils/constants.dart';

class EarningRewards extends StatelessWidget {
  const EarningRewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/images/cup.png"),
          ),
          Text(
            "Here How it works",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Sign up is free",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            "Earning Rewards is as easy as 1, 2, 3.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          EarningStep(
            step: 1,
            title: "Connect with Someone ",
            content: "Schedule an activity with like minded people",
          ),
          EarningStep(
            step: 2,
            title: "Earn Rewards",
            content:
                "You’ll earn 2 points for activity you schedule with a person",
          ),
          EarningStep(
            step: 3,
            title: "Attend Workshops & Trainings",
            content: "You’ll earn 5 points every time you attend a workshop",
          ),
        ],
      ),
    );
  }
}
