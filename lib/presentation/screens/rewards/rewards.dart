import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/rewards/widgets/earning.dart';
import 'package:synergy/presentation/screens/rewards/widgets/my-rewards.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/utils/constants.dart';

class Rewards extends StatelessWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Synergy"),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: Constants.primaryColor,
              labelColor: Constants.primaryColor,
              labelStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  text: "My Rewards",
                ),
                Tab(
                  text: "Earning Rewards",
                ),
              ],
            ),
            elevation: 0,
            toolbarHeight: 50,
          ),
          body: TabBarView(
            children: [
              MyRewards(),
              EarningRewards(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 3,
      ),
    );
  }
}
