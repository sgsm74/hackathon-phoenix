import 'package:flutter/material.dart';
import 'package:synergy/data/models/activity.dart';
import 'package:synergy/utils/constants.dart';

class AllActivities extends StatefulWidget {
  final List<Activity> list;
  AllActivities({Key? key, required this.list}) : super(key: key);

  @override
  _AllActivitiesState createState() => _AllActivitiesState();
}

class _AllActivitiesState extends State<AllActivities> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          height: height,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: width / (width + 100.0),
            ),
            //physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 10),
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
                              child: Image.asset(
                                widget.list[index].avatar,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  widget.list[index].rating.toString(),
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
                        widget.list[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
