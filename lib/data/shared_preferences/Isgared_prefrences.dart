import 'package:shared_preferences/shared_preferences.dart';

import 'Ashared_prefrences.dart';

class ISharedPrefs implements ASharedPrefs {
  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<void> setToken(String token) async {
    (await getPrefs()).setBool('loggedIn', true);
    (await getPrefs()).setString('token', token);
  }

  @override
  Future<bool> islogedIn() async {
    return (await getPrefs()).getBool('loggedIn') ?? false;
  }

  @override
  Future<void> logout() async {
    (await getPrefs()).setBool('loggedIn', false);
    (await getPrefs()).setString('token', '');
  }

  @override
  Future<String> getToken() async {
    return (await getPrefs()).getString('token');
  }
}
