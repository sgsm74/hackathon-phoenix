import 'dart:convert';

import 'package:synergy/data/dataproviders/user-auth.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/data/services/session.dart';

class UserRepository {
  final UserAuthenticaionAPI userAuthAPI = UserAuthenticaionAPI();

  Future userRegister(List data) async {
    final rawUser = await userAuthAPI.register(data);
    if (rawUser.statusCode == 200) {
      Map<String, dynamic> map = json.decode(rawUser.body);

      writeToSession(map);
      return rawUser;
    } else {
      return rawUser;
    }
  }

  Future userLogin(List data) async {
    final rawUser = await userAuthAPI.login(data);
    if (rawUser.statusCode == 200) {
      Map<String, dynamic> map = json.decode(rawUser.body);
      writeToSession(map);
      return rawUser;
    } else {
      return rawUser;
    }
  }

  Future userResetPassword(List data) async {
    final rawData = await userAuthAPI.resetPassword(data);
    if (rawData.statusCode == 200) {
      return rawData;
    } else {
      return rawData;
    }
  }

  writeToSession(Map<String, dynamic> map) async {
    Session.cleanBox();
    Session.write(
      User(
        avatar: map['user']['avatar'],
        biography: map['user']['biography'],
        email: map['user']['email'],
        id: map['user']['id'],
        name: map['user']['name'],
        rating: double.parse(map['user']['rating'].toString()),
        score: map['user']['score'],
        isTrainer: map['user']['isTrainer'],
      ),
      map['access_token'],
    );
  }
}
