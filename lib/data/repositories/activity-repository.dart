import 'dart:convert';

import 'package:synergy/data/dataproviders/activity.dart';

class ActivityRepository {
  final ActivityAPI dataAPI = ActivityAPI();

  Future parseActivitiesData() async {
    final rawData = await dataAPI.fetchActivities();
    //await Future.delayed(Duration(seconds: 10));
    //print(rawData.body.toString());
    Map<String, dynamic> map = json.decode(rawData.body);
    //print(map['favoriteActivities']);
    return map;
  }

  Future parseActivityData(int id) async {
    final rawData = await dataAPI.fetchActivityData(id);
    Map<String, dynamic> map = json.decode(rawData.body);
    return map;
  }
}
