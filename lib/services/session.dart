import 'package:shared_preferences/shared_preferences.dart';

class SessionPref {
  static late SharedPreferences pref;
  static const keyName = "tokeni";
  static const jadu = "jadu";
  static const mengi = "mengi";
  static const img = 'user';

  static Future init() async => pref = await SharedPreferences.getInstance();

  static Future setData(data) async => await pref.setString(keyName, data);

  static Future setName(name) async => await pref.setString(jadu, name);

  static Future setDataString(fname, email) async =>
      await pref.setStringList(mengi, <String>[fname, email]);
  

  static List<String>? getDataArray() {
    var data = pref.getStringList(mengi);
    return data;
  }

  static String? getData() {
    var data = pref.getString(keyName);
    return data;
  }

  static Future deleteToken() async => pref.remove(keyName);

  static String? getDataList() {
    var data = pref.getString(jadu);
    return data;
  }
}
