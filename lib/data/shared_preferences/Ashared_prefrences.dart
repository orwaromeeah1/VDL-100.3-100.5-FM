import 'package:shared_preferences/shared_preferences.dart';

abstract class ASharedPrefs {
  Future<SharedPreferences> getPrefs();
  Future<void> setToken(String token);
  Future<bool> islogedIn();
  Future<void> logout();
  Future<String?> getToken();
}
