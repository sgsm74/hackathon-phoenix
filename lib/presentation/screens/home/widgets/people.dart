import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/user/user_bloc.dart';
import 'package:synergy/data/bloc/user/user_event.dart';
import 'package:synergy/presentation/widgets/heading.dart';
import 'package:synergy/utils/constants.dart';
import 'package:synergy/utils/units.dart';

class NearByPeoples extends StatelessWidget {
  final String title;
  final Map<String, dynamic> list;
  const NearByPeoples({Key? key, required this.title, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingTitle(title, () {}),
        Container(
          height: 250,
          margin: EdgeInsets.only(top: 10.0, left: 12),
          //padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 20,
              childAspectRatio: 1 / 2,
            ),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: list['nearbyPeoples'].length,
            itemBuilder: (BuildContext newcontext, int index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<UserDataBloc>(context).add(
                      FetchUserDataEvent(list['nearbyPeoples'][index]['id']));
                  Navigator.pushNamed(
                    context,
                    '/user',
                  );
                  //print(list['nearbyPeoples'][index]['id']);
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
                            color: Colors.grey.shade300,
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
                              child: Image.network(
                                list['nearbyPeoples'][index]['avatar'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list['nearbyPeoples'][index]['name']
                                            .toString()
                                            .capitalize(),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      /* Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                          child: ListView.builder(
                                                            itemCount:
                                                                list[index].interest.length,
                                                            scrollDirection: Axis.horizontal,
                                                            itemBuilder:
                                                                (BuildContext context,
                                                                    int index1) {
                                                              var interest =
                                                                  list[index].interest;
                                                              if (index1 !=
                                                                  interest.length - 1) {
                                                                return Text(list[index]
                                                                        .interest[index1] +
                                                                    " / ");
                                                              } else {
                                                                return Text(list[index]
                                                                    .interest[index1]);
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ), */
                                    ],
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 2,
                                    children: [
                                      Icon(
                                        Icons.my_location,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      Text(
                                        Unit.convertToKm(list['nearbyPeoples']
                                            [index]['distance']),
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
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
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
                            list['nearbyPeoples'][index]['rating'].toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
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
}
