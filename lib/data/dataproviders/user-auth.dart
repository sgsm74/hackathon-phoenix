import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:synergy/data/api/api.dart';

class UserAuthenticaionAPI {
  String registerUrl = Api.register;
  String loginUrl = Api.login;
  String resetPasswordUrl = Api.resetPassword;

  Future<http.Response> register(List data) async {
    try {
      final Response response = await http.post(
        Uri.parse(registerUrl),
        body: jsonEncode(<String, dynamic>{
          'name': data[0],
          'email': data[1],
          'password': data[2],
          'latitude': data[3],
          'longitude': data[4],
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } on Exception catch (e) {
      print(e);
      return http.Response(e.toString(), 400);
    }
  }

  Future<http.Response> login(List data) async {
    try {
      final Response response = await http.post(
        Uri.parse(loginUrl),
        body: jsonEncode(<String, dynamic>{
          'email': data[0],
          'password': data[1],
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        //print(response.body);
        return response;
      } else {
        //print(response.body);
        return response;
      }
    } on Exception catch (e) {
      print(e);
      return http.Response(e.toString(), 400);
    }
  }

  Future<http.Response> resetPassword(List data) async {
    try {
      final Response response = await http.post(
        Uri.parse(resetPasswordUrl),
        body: jsonEncode(<String, dynamic>{
          'email': data[0],
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        //print(response.body);
        return response;
      } else {
        //print(response.body);
        return response;
      }
    } on Exception catch (e) {
      print(e);
      return http.Response(e.toString(), 400);
    }
  }
}
