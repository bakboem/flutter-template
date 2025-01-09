import 'dart:convert';
import 'package:template/common/function/common_function.dart';
import 'package:template/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  CacheService._privateConstructor();

  static final CacheService _instance = CacheService._privateConstructor();

  factory CacheService() {
    return _instance;
  }

  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> _ensureInitialized() async {
    if (_sharedPreferences == null) {
      await init();
    }
  }

  static Future<void> reload() async {
    await _ensureInitialized();
    await _sharedPreferences?.reload();
  }

  static saveData(String key, dynamic data) {
    switch (data.runtimeType) {
      case const (int):
        _sharedPreferences!.setInt(key, data);
        break;
      case const (String):
        _sharedPreferences!.setString(key, data);
        break;
      case const (bool):
        _sharedPreferences!.setBool(key, data);
        break;
      case const (double):
        _sharedPreferences!.setDouble(key, data);
        break;
      case const (List):
        _sharedPreferences!.setStringList(key, data);
        break;
    }
  }

  static bool? getIsDisableUpdate() {
    return getData('isDisable') ?? false;
  }

  static void setIsDisableUpdate(bool? isDisable) {
    saveData('isDisable', isDisable ?? false);
  }

  static void saveUser(User user) {
    var userData = jsonEncode(user.toJson());
    saveData('user', userData);
  }

  static User? getGuestUser() {
    var user = getData('guest_user');
    if (user != null) {
      try {
        var userData = jsonDecode(user);
        if (userData is Map<String, dynamic>) {
          return User.fromJson(userData);
        }
      } catch (e) {
        pr('Error parsing user data: $e');
      }
    }
    return null;
  }

  static void deleteUser() {
    deleteData('user');
  }

  static getData(String key) {
    return _sharedPreferences?.get(key);
  }

  static bool checkExits(String key) {
    return _sharedPreferences!.containsKey(key);
  }

  static void deleteData(String key, {bool? withConstans}) {
    if (withConstans != null) {
      var keys = _sharedPreferences?.getKeys();
      for (var realKey in keys!) {
        if (realKey.contains(key)) {
          _sharedPreferences?.remove(realKey);
        }
      }
    } else {
      final exists = checkExits(key);
      if (exists) {
        _sharedPreferences?.remove(key);
      }
    }
    pr('deleteData $key');
  }

  static String? getAppVersion() {
    return getData('appVersion');
  }

  static Future<void> deleteUserInfoWhenSignOut() async {}
}
