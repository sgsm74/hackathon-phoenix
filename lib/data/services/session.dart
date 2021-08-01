import 'package:hive/hive.dart';
import 'package:synergy/data/models/user.dart';

class Session {
  static write(User user, String token) async {
    var box = await Hive.openBox('user');
    box.put('id', user.id.toString());
    box.put('name', user.id.toString());
    box.put('email', user.email.toString());
    box.put('avatar', user.avatar.toString());
    box.put('rating', user.rating);
    box.put('score', user.score);
    box.put('biography', user.biography.toString());
    box.put('token', token.toString());
    box.close();
  }

  static Future<String> getUserToken() async {
    var box = await Hive.openBox('user');
    var token = box.get('token');
    //box.close();
    return token;
  }

  static cleanBox() async {
    var box = await Hive.openBox('user');
    box.clear();
    //box.close();
  }

  static getByKey(String key) async {
    var box = await Hive.openBox('user');
    var data = box.get(key);
    return data;
    //box.close();
  }
}
