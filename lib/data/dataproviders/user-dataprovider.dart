import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:synergy/data/api/api.dart';
import 'package:synergy/data/services/session.dart';

class UserDataProvider {
  String fetchUserDataUrl = Api.user;

  Future<http.Response> fetchUserData(int id) async {
    try {
      String userToken = await Session.getUserToken();
      final Response response = await http.post(
        Uri.parse(fetchUserDataUrl),
        body: jsonEncode(<String, dynamic>{
          'id': id,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + userToken,
          'Connection': 'keep-alive',
        },
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } on HttpException catch (e) {
      print(e);
      return http.Response(e.toString(), 400);
    }
  }
}
