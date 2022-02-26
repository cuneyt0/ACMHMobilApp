import 'package:login_work/login/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> saveToken(String token) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<dynamic> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveExpiration(int exp) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(
        CacheManagerKey.EXPIRATION.toString(), exp.toString());
    return true;
  }

  Future<dynamic> getExpiration() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(CacheManagerKey.EXPIRATION.toString());
  }

  Future<bool> saveUser(User user) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(
        CacheManagerKey.USER.toString(), user.toJson().toString());
    return true;
  }

  Future<dynamic> getUser() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(CacheManagerKey.USER.toString());
  }

  Future<bool> removeAllData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(CacheManagerKey.TOKEN.toString());
    prefs.remove(CacheManagerKey.EXPIRATION.toString());
    prefs.remove(CacheManagerKey.USER.toString());
    return true;
  }
}

enum CacheManagerKey { TOKEN, EXPIRATION, USER }
