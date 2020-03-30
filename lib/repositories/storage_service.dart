import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<dynamic> read(String key) async {
    return _read(key);
  }

  Future<void> write(String key, String value) async {
    return _write(key, value);
  }

  Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      prefs.remove(key);
    }
  }

  Future<void> clear() async {
    await (await SharedPreferences.getInstance()).clear();
  }

  Future<dynamic> _read(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic value = prefs.get(key);
    return value;
  }

  Future<void> _write(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
