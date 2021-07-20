import 'package:flutter/material.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/presentation/screens/user/user.dart';
import 'package:synergy/presentation/widgets/heading.dart';
import 'package:synergy/utils/constants.dart';

Widget rowPeople(String title, List<User> list) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      headingTitle(title),
      Container(
        height: 250,
        //padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
            childAspectRatio: 1 / 2,
          ),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserView(
                      user: list[index],
                    ),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0.0, 0.5),
                          spreadRadius: .01,
                          color: Colors.grey.shade100,
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Constants.getWidth(context) / 3.5,
                          height: double.infinity,
                          //color: Colors.red,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index].firstName,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      list[index].interest[0] +
                                          "/" +
                                          list[index].interest[1],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.my_location,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    Text(
                                      "100m",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
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
