import 'package:flutter/material.dart';
import 'package:synergy/presentation/screens/champion/reward-form.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/utils/constants.dart';

class Inbox extends StatefulWidget {
  Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List messages = [
    [
      "assets/users/matt.png",
      "Sound great 123-5679-7896",
      "Matt Bulemar",
    ],
    [
      "assets/users/sarah.png",
      "Hi Andy I'm pretty this week so I'm sorry",
      "Sarah Johnson"
    ],
    [
      "assets/users/dom.png",
      "Ok let me know a daya and I'll call you",
      "Nick Balmer"
    ],
    [
      "assets/users/lisa.png",
      "Hi Kimberley, are uou avaiable for tomorrow?",
      "Kimberley Bare"
    ],
    [
      "assets/users/connie.png",
      "yeah sure, see you tomorrow",
      "Anna Cook",
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Synergy"),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: messages.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: Offset(1, 1),
                            spreadRadius: 2,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              maxRadius: 30,
                              backgroundImage: AssetImage(messages[index][0]),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                messages[index][2],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Text(
                                  messages[index][1],
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              /* border: Border.all(
                                color: Constants.primaryColor,
                              ), */
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  offset: Offset(1, 1),
                                  spreadRadius: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RewardForm(
                                      user: messages[index][2],
                                    ),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  "Add Score",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 2,
      ),
    );
  }
}
