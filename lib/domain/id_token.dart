import 'package:cloud_craft_solution/domain/local_auth.config.dart';
import 'package:cloud_craft_solution/domain/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdToken {
  static const tokenKey = "id_token_key";

  static Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(tokenKey) ?? "";
  }

  static void saveToken(String token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(tokenKey, token);
  }

  static void removeToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(tokenKey);
    UserInfo.removeUser();
    LoacalAuthConfig.deleteAuth();
  }
}
