import 'dart:convert';

import 'package:synergy/data/dataproviders/user-auth.dart';
import 'package:synergy/data/dataproviders/user-dataprovider.dart';
import 'package:synergy/data/models/user.dart';
import 'package:synergy/data/services/session.dart';

class UserRepository {
  final UserAuthenticaionAPI userAuthAPI = UserAuthenticaionAPI();
  final UserDataProvider userDataProvider = UserDataProvider();
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

  Future fetchUserData(int id) async {
    final rawData = await userDataProvider.fetchUserData(id);
    Map<String, dynamic> map = json.decode(rawData.body);
    return map;
  }

  Future userLogout() async {
    await Session.cleanBox();
  }

  writeToSession(Map<String, dynamic> map) async {
    await Session.cleanBox();
    await Session.write(
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
