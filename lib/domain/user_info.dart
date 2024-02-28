import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  static const userMailKey = "user_mail_key";
  static const userNameKey = "user_name_key";

  static Future<String> getUserEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userMailKey) ?? "";
  }

  static Future<String> getUserName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userNameKey) ?? "";
  }

  static void saveUserEmail(String token) async {
    Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
    String mail = decodedToken['upn'] ?? '';
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(userMailKey, mail);
  }

  static void saveUserName(String token) async {
    Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
    String mail = decodedToken['name'] ?? '';
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(userNameKey, mail);
  }

  static void removeUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(userMailKey);
    pref.remove(userNameKey);
  }
}
