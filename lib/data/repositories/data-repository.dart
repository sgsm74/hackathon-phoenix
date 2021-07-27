import 'dart:convert';

import 'package:synergy/data/dataproviders/home.dart';

class DataRepository {
  final HomeDataAPI dataAPI = HomeDataAPI();

  Future parseHomeData() async {
    final rawData = await dataAPI.fetchData();
    print(rawData.body.toString());
    //Map<String, dynamic> map = json.decode(rawData.body);
    //return map;
  }
}
