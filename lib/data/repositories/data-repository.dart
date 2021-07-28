import 'dart:convert';

import 'package:synergy/data/dataproviders/home.dart';

class DataRepository {
  final HomeDataAPI dataAPI = HomeDataAPI();

  Future parseHomeData() async {
    final rawData = await dataAPI.fetchData();
    //await Future.delayed(Duration(seconds: 10));
    //print(rawData.body.toString());
    Map<String, dynamic> map = json.decode(rawData.body);
    //print(map['favoriteActivities']);
    return map;
  }
}
