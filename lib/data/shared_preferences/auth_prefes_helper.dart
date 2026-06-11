
import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefsHelper {


  Future<void> setToken(String token ,int expiresIn) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    await preferencesHelper.setString(
      'token',
      token,
    );

    var currentDate = DateTime.now();
    var expiredDate = currentDate.add(new Duration(minutes: expiresIn));

    await preferencesHelper.setString(
      'token_date',
      expiredDate.toIso8601String(),
    );
  }

  Future<void> deleteToken() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    await preferencesHelper.remove('token');
    await preferencesHelper.remove('token_date');
  }

  Future<String> getToken() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    var token = await preferencesHelper.getString('token');
    if (token == null) {
      throw Exception('Token not found');
    }
    return token;
  }


  Future<DateTime> getTokenDate() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    var dateStr = await preferencesHelper.getString('token_date');
    if (dateStr == null) {
      throw Exception('Token date not found');
    }
    return DateTime.parse(dateStr);
  }


  Future<bool> isFirstTimeInApp()async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    var result = await preferencesHelper.getBool('first_time');

    return result==null?true:result;

  }
  Future<void> setNotFirstTimeInApp()async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
     await preferencesHelper.setBool('first_time',false);

  }

  Future<void> setNotification(bool isOn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notification', isOn);
  }

  Future<bool?> getNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? res = prefs.getBool('notification');
    return res;
  }
}