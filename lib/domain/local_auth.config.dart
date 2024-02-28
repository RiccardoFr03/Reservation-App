import 'package:shared_preferences/shared_preferences.dart';

class LoacalAuthConfig {
  static const localAuthKey = "local_auth_key";

  static Future<bool> getAuth() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(localAuthKey) ?? false;
  }

  static void seveAuth() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(localAuthKey, true);
  }

  static void deleteAuth() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(localAuthKey);
  }
}
