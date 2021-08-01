import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/user/user_bloc.dart';

import 'package:synergy/data/repositories/data-repository.dart';
import 'package:synergy/presentation/screens/home/widgets/homepage-activities.dart';
import 'package:synergy/presentation/screens/home/widgets/people.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/utils/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataRepository dataRepo = DataRepository();
  Map<String, dynamic> favoriteActivitiesInitialData = {
    'favoriteActivities': ''
  };
  Map<String, dynamic> nearbyPeoplesInitialDate = {'nearbyPeoples': []};
  static const List<String> _kOptions = <String>[
    'tennis',
    'basketball',
    'football',
    'yoga',
    'badminton',
    'volleyball'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Synergy"),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _kOptions.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                print('You just selected ' + selection);
              },
              optionsViewBuilder: (_, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 50,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: ListView(
                        children: options
                            .map(
                              (String option) => GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                },
                                child: ListTile(
                                  title: Text(
                                    option,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                );
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) =>
                  TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Constants.primaryColor,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Constants.primaryColor,
                      width: 1.0,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Constants.primaryColor,
                  ),
                  //border: InputBorder.a,
                  hintText: "What activity are you looking for?",
                  hintStyle: TextStyle(
                    color: Constants.primaryColor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
                controller:
                    textEditingController, //uses fieldViewBuilder TextEditingController
                focusNode: focusNode,
              ),
            ),
          ),
          Container(
            height: Constants.getHeight(context) / 4,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/home-background.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: dataRepo.parseHomeData(),
            initialData: favoriteActivitiesInitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return HomePageActivities(
                title: "Favorite Activities",
                list: snapshot.data,
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: dataRepo.parseHomeData(),
            initialData: nearbyPeoplesInitialDate,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return NearByPeoples(
                list: snapshot.data,
                title: "People Nearby",
              );
            },
          ),
          /* NearByPeoples(
                  list: users,
                  title: "People Nearby",
                ), */
          SizedBox(
            height: 10,
          ),
          /* NearByPeoples(
                  list: users,
                  title: "Trainers Nearby",
                ), */
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 0,
      ),
    );
  }
}
