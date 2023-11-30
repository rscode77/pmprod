import 'package:shared_preferences/shared_preferences.dart';

class CommonStorage {
  Future<SharedPreferences> get _sharedPreferences => SharedPreferences.getInstance();

  const CommonStorage();

  Future<String?> getString(String key, {
    String? defaultValue,
  }) async =>
      (await _sharedPreferences).getString(key) ?? defaultValue;

  Future<bool> putString(String key, String value) async => (await _sharedPreferences).setString(key, value);

  void removeKey(String key) async => (await _sharedPreferences).remove(key);
}