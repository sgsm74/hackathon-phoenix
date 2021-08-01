import 'package:flutter/material.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/presentation/screens/user/user.dart';
import 'package:synergy/utils/constants.dart';

Widget peopleNearbyForSpecificActivity(String title, List<User> list) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          bottom: 8.0,
          left: 25,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 320,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                /*  Navigator.of(context).pushNamed(
                    '/user/' + list['nearbyPeoples'][index]['id'],
                  ); */
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.asset(
                          list[index].avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    /* Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            list[index].interest[0] +
                                "/" +
                                list[index].interest[1],
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ), */
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          list[index].rating.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )
    ],
  );
}
