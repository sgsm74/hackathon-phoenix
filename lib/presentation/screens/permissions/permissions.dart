import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:synergy/presentation/screens/permissions/single-permission.dart';
import 'package:synergy/utils/constants.dart';

class PermissionView extends StatefulWidget {
  PermissionView({Key? key}) : super(key: key);

  @override
  _PermissionViewState createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> {
  bool _visible = true;
  bool granted = false;
  Future<bool> _grantAccess(String type) async {
    try {
      switch (type) {
        case 'storage':
          if (await Permission.storage.request().isGranted) {
            Navigator.of(context).pushNamed('/intro');
            return true;
          }
          break;
        case 'location':
          if (await Permission.location.request().isGranted) {
            setState(() {
              _visible = !_visible;
            });
            return true;
          }
          break;
        default:
          return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SinglePermission(
                  title: "location",
                  visible: _visible,
                ),
                SinglePermission(
                  title: "storage",
                  visible: !_visible,
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _visible
                        ? _grantAccess("location").then((value) => print(value))
                        : _grantAccess("storage").then((value) =>
                            value ? print("hi") : _visible = _visible);
                    print(granted);
                    //granted ? _visible = !_visible : _visible = _visible;
                  });
                },
                child: Text(
                  "Sure, I'd Like that",
                  style: TextStyle(
                    color: Colors.white,
                    //backgroundColor: Constants.primaryColor,
                    fontSize: 15,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Constants.primaryColor,
                    ),
                    shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Not now",
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
