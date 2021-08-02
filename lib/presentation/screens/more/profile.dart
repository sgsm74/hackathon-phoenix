import 'package:flutter/material.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/utils/constants.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late int _value = 0;
  bool currentPasswordObscureText = true;
  bool newPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    void switchRadioButton(int value) {
      setState(() {
        _value = value;
      });
    }

    return Scaffold(
      appBar: MyAppBar(
        title: "Synergy",
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: CircleAvatar(
              //backgroundImage: AssetImage("assets/users/kevin.png"),
              radius: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                child: Image.asset(
                  "assets/users/kevin.png",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Change profile picture",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Full Name",
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 15,
                      color: Color(0xff31394C).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: TextFormField(
                    cursorHeight: 20,
                    keyboardType: TextInputType.name,
                    cursorColor: Constants.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Color(0xffE3E6F0),
                      focusColor: Color(0xffE3E6F0),
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 15,
                      color: Color(0xff31394C).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: TextFormField(
                    cursorHeight: 20,
                    keyboardType: TextInputType.name,
                    cursorColor: Constants.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Color(0xffE3E6F0),
                      focusColor: Color(0xffE3E6F0),
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Are you trainer?",
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 15,
                      color: Color(0xff31394C).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("Yes"),
                    Radio(
                      value: 0,
                      groupValue: _value,
                      onChanged: (value) {
                        switchRadioButton(int.parse(value.toString()));
                      },
                      activeColor: Constants.primaryColor,
                    ),
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("No"),
                    Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        switchRadioButton(int.parse(value.toString()));
                      },
                      activeColor: Constants.primaryColor,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Biography",
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 15,
                      color: Color(0xff31394C).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: TextFormField(
                    cursorHeight: 20,
                    maxLines: 10,
                    keyboardType: TextInputType.name,
                    cursorColor: Constants.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Color(0xffE3E6F0),
                      focusColor: Color(0xffE3E6F0),
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.5,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "if you dont want to change password leave it here",
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 14,
                      color: Color(0xff31394C).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    cursorHeight: 20,
                    obscureText: currentPasswordObscureText,
                    keyboardType: TextInputType.name,
                    cursorColor: Constants.primaryColor,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: Color(0xffE3E6F0),
                        focusColor: Color(0xffE3E6F0),
                        filled: true,
                        hintText: "Current password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentPasswordObscureText =
                                  !currentPasswordObscureText;
                            });
                          },
                          child: Icon(
                            currentPasswordObscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color: Constants.primaryColor,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: TextFormField(
                    cursorHeight: 20,
                    obscureText: newPasswordObscureText,
                    keyboardType: TextInputType.name,
                    cursorColor: Constants.primaryColor,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            newPasswordObscureText = !newPasswordObscureText;
                          });
                        },
                        child: Icon(
                          newPasswordObscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                          color: Constants.primaryColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Color(0xffE3E6F0),
                      focusColor: Color(0xffE3E6F0),
                      filled: true,
                      hintText: "New password",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.resolveWith((states) => 0),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Constants.primaryColor,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Save changes",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                )),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavbar(
        currentIndex: 4,
      ),
    );
  }
}
