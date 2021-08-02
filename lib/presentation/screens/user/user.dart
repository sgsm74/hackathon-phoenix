import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/user/user_bloc.dart';
import 'package:synergy/data/bloc/user/user_state.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/presentation/widgets/dotsIndicator.dart';
import 'package:synergy/utils/constants.dart';
import 'package:synergy/utils/units.dart';

class UserView extends StatelessWidget {
  UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Synergy"),
      body: BlocBuilder<UserDataBloc, UserDataStateAbstract>(
        builder: (context, state) {
          if (state is SuccessUserDataFetch) {
            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 2,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    //fit: StackFit.loose,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Image.network(
                            state.data["user"]["avatar"].toString(),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      state.data["user"]["name"].toString().capitalize(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.only(right: 40),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            state.data["user"]["rating"].toString(),
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
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Activities Interested in:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      /* Container(
                        height: 50,
                        child: ListView.builder(
                          itemCount: user.interest.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(user.interest[index]);
                          },
                        ),
                      ), */
                      Text(
                        "Biography:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        state.data["user"]["biography"],
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
                  child: ElevatedButton(
                    onPressed: () {
                      /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageView(
                          user: user,
                        ),
                      ),
                    ); */
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
            );
          } else if (state is InitialUserDataFetch) {
            return Center(
              child: MyDotsIndicator(),
            );
          } else if (state is FailureUserDataFetch) {
            return Text("Failed");
          } else {
            return Center(child: MyDotsIndicator());
          }
        },
      ),
      bottomNavigationBar: MyBottomNavbar(
        currentIndex: 1,
      ),
    );
  }
}
