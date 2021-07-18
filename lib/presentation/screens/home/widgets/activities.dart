import 'package:flutter/material.dart';
import 'package:synergy/data/models/activity.dart';

Widget rowActivities(String title, List<Activity> list) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      Container(
        height: 150,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/activity');
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          //color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Image.asset(
                          list[index].avatar,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
            );
          },
        ),
      )
    ],
  );
}
