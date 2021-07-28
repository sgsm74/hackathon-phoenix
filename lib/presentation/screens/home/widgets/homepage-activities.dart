import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:synergy/data/models/activity.dart';
import 'package:synergy/presentation/widgets/heading.dart';
import 'package:synergy/utils/constants.dart';

class HomePageActivities extends StatelessWidget {
  final String title;
  final Map<String, dynamic> list;
  const HomePageActivities({Key? key, required this.title, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingTitle(title, () {
          Navigator.of(context).pushNamed('/activities');
        }),
        Container(
          height: Constants.getWidth(context) / 3.5 + 50,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: list['favoriteActivities'].length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              EdgeInsets margin;
              if (index == list['favoriteActivities'].length - 1) {
                margin = EdgeInsets.only(left: 13, top: 10, right: 13);
              } else {
                margin = EdgeInsets.only(left: 13, top: 10);
              }
              return Container(
                margin: margin,
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
                                  blurRadius: 10,
                                  offset: Offset(0.0, 0.5),
                                  spreadRadius: .01,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child:
                                  /* Image.network(
                                list['favoriteActivities'][index]['avatar'],
                                fit: BoxFit.cover,
                              ), */
                                  CachedNetworkImage(
                                imageUrl: list['favoriteActivities'][index]
                                    ['avatar'],
                                placeholder: (context, url) => Container(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                    color: Colors.grey[300],
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  list['favoriteActivities'][index]['rating']
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        list['favoriteActivities'][index]['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
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
}
