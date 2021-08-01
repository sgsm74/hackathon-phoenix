import 'package:hive/hive.dart';

class Cache {
  static put(String boxName, String key, String value) async {
    var box = await Hive.openBox(boxName);
    box.put(key, value);
  }

  static Future get(String boxName, String key) async {
    var box = await Hive.openBox(boxName);
    var data = box.get(key);
    return data;
  }
}
