import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/activity/activity_bloc.dart';
import 'package:synergy/data/bloc/activity/activity_state.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/utils/constants.dart';

class Activity extends StatefulWidget {
  Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List<User> users = User.users();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Synergy"),
      body: BlocBuilder<ActivityBloc, ActivityDataState>(
        builder: (context, state) {
          if (state is SuccessActivityDataFetchState) {
            return ListView(
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.width / 1.5,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Image.network(
                      state.data["activity"]["avatar"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    state.data["activity"]["title"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                //rowPeople("Interested People Nearby", users),
              ],
            );
          } else if (state is LoadingActivityDataFetchState ||
              state is InitialActivityDataFetchState) {
            return Center(
              child: CircularProgressIndicator(
                color: Constants.primaryColor,
              ),
            );
          } else {
            return Text("faild");
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 1,
      ),
    );
  }
}
