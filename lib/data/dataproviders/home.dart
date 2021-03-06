import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:synergy/data/api/api.dart';
import 'package:synergy/data/services/cache.dart';
import 'package:synergy/data/services/session.dart';

class HomeDataAPI {
  String homeUrl = Api.home;

  Future<http.Response> fetchData() async {
    try {
      String userToken = await Session.getUserToken();
      final Response response = await http.post(
        Uri.parse(homeUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + userToken,
          'Connection': 'keep-alive',
        },
      );

      if (response.statusCode == 200) {
        //print(response.body);
        //Cache.put('HomeData', 'home', response.body);
        return response;
      } else {
        return http.Response(response.body, 400);
      }
    } catch (e) {
      print(e);
      return http.Response(e.toString(), 400);
    }
  }
}
