import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/rewards/widgets/reward-level.dart';
import 'package:synergy/utils/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyRewards extends StatefulWidget {
  MyRewards({Key? key}) : super(key: key);

  @override
  _MyRewardsState createState() => _MyRewardsState();
}

class _MyRewardsState extends State<MyRewards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Rewards balance: ",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "338 Reward Points",
                style: TextStyle(
                  fontSize: 19,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            height: 300,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 1000,
                  showLabels: true,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Color.fromARGB(30, 0, 169, 181),
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: 338,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                    )
                  ],
                  annotations: [
                    GaugeAnnotation(
                        positionFactor: 0.03,
                        angle: 90,
                        widget: Container(
                          width: 190,
                          child: Text(
                            "⭐  \n Go Champion!\n Earn your Rewards",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
          Text(
            "Redeem Your Rewards",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          RewardLevel(
            level: 50,
            description:
                "1 accessory related to any activity of your choice under \$",
          ),
          RewardLevel(
            level: 100,
            description: "1 Free training session of any activity under \$",
          ),
          RewardLevel(
            level: 200,
            description: "Surprise gift related to your favorite activity",
          ),
          RewardLevel(
            level: 500,
            description:
                "3 free training sessions of any activity of your choice under \$",
          ),
          RewardLevel(
            level: 700,
            description: "1 Free workshop of your choice under \$",
          ),
          RewardLevel(
            level: 1000,
            description: "2 Free workshop of your choice under \$",
          ),
        ],
      ),
    );
  }
}
