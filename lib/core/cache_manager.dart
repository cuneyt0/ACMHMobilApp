import 'package:login_work/login/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  Future<bool> saveToken(String token) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<dynamic> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveExpiration(int exp) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        CacheManagerKey.EXPIRATION.toString(), exp.toString());
    return true;
  }

  Future<dynamic> getExpiration() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheManagerKey.EXPIRATION.toString());
  }

  Future<bool> saveUser(User user) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(CacheManagerKey.USER.toString(), user.toString());
    return true;
  }

  Future<dynamic> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheManagerKey.USER.toString());
  }
}

enum CacheManagerKey { TOKEN, EXPIRATION, USER }
