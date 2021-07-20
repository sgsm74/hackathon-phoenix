import 'package:flutter/material.dart';
import 'package:synergy/data/models/activity.dart';
import 'package:synergy/presentation/widgets/heading.dart';
import 'package:synergy/utils/constants.dart';

Widget rowActivities(String title, List<Activity> list) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      headingTitle(title),
      Container(
        height: 150,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/activity');
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: Constants.getWidth(context) / 3.5,
                          height: Constants.getWidth(context) / 3.5,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                                offset: Offset(1, 1),
                                spreadRadius: 2,
                                color: Colors.grey.shade100,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Image.asset(
                            list[index].avatar,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                list[index].rating.toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      list[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      )
    ],
  );
}
