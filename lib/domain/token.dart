import 'package:cloud_craft_solution/domain/id_token.dart';
import 'package:cloud_craft_solution/domain/local_auth.config.dart';
import 'package:cloud_craft_solution/domain/notification_config.dart';
import 'package:cloud_craft_solution/domain/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static const tokenKey = "token_key";
  static const userKey = "user_key";

  static Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(tokenKey) ?? "";
  }

  static void saveToken(String token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    UserInfo.saveUserEmail(token);
    UserInfo.saveUserName(token);
    pref.setString(tokenKey, token);
  }

  static void removeToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(tokenKey);
    UserInfo.removeUser();
    IdToken.removeToken();
    LoacalAuthConfig.deleteAuth();
    NotificationConfig.deleteNotification();
  }
}
