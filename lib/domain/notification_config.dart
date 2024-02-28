import 'package:shared_preferences/shared_preferences.dart';

class NotificationConfig {
  static const localNotification = "notification_key";

  static Future<bool> getNotification() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(localNotification) ?? false;
  }

  static void saveNotification() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(localNotification, true);
  }

  static void deleteNotification() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(localNotification);
  }
}
