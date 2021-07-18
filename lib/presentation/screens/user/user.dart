import 'package:flutter/material.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/presentation/screens/messages/messages.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';

class UserView extends StatelessWidget {
  final User user;
  UserView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Synergy"),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            height: 200,
            child: Stack(
              alignment: Alignment.topRight,
              fit: StackFit.loose,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Image.asset(user.avatar),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 40),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        user.rating.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            user.firstName + user.lastName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Activities Interested in:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    itemCount: user.interest.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(user.interest[index]);
                    },
                  ),
                ),
                Text(
                  "Biography:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(user.biography)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageView(
                      user: user,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 50.0),
                child: Text(
                  'Message',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 1,
      ),
    );
  }
}
