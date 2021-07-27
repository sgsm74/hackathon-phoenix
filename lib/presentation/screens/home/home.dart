import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:synergy/data/models/activity.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/data/models/workshop.dart';
import 'package:synergy/data/repositories/data-repository.dart';
import 'package:synergy/data/services/session.dart';
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
  List<Activity> activities = Activity.activities();
  List<Workshop> workshops = Workshop.workshops();
  List<User> users = User.users();
  static const List<String> _kOptions = <String>[
    'Tennis',
    'Basketball',
    'Football',
    'Yoga',
    'Badminton',
    'Volleyball'
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Synergy"),
      body: ListView(
        //physics: BouncingScrollPhysics(),
        children: [
          Container(
            //width: MediaQuery.of(context).size.width - 20,
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
                print('You just selected $selection');
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 50,
                      padding: EdgeInsets.zero,
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
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          HomePageActivities(
            title: "Explore Activities",
            list: activities,
          ),
          SizedBox(
            height: 10,
          ),
          /* rowWorkshops("Workshops Nearby", workshops),
          SizedBox(
            height: 10,
          ), */
          rowPeople("People Nearby", users),
          SizedBox(
            height: 10,
          ),
          rowPeople("Trainers Nearby", users),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 0,
      ),
    );
  }
}
