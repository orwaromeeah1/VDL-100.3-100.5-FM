
import 'package:flutter/cupertino.dart';
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


}