// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../app/app.router.dart';

// import '../../../main.dart';
// import '../app/app.router.dart';

@lazySingleton
class SharedPreferencesService {
  SharedPreferencesService._internal();

  SharedPreferences? sharedPreferences;

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  static SharedPreferencesService get instance => _instance;

  Future<void> initilize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String keyAuthToken = 'auth_token';
  static const String keyAuthRefreshToken = 'auth_refresh_token';
  static const String is_login = 'is_login';
  static const String userData = 'user';
  static const String isDark = 'isDark';

  String get authToken => sharedPreferences?.getString(keyAuthToken) ?? '';
  bool get isOnDark => sharedPreferences?.getBool(isDark) ?? false;
  String get authRefreshToken =>
      sharedPreferences?.getString(keyAuthRefreshToken) ?? '';
  bool get isLogin => sharedPreferences?.getBool(is_login) ?? false;
  Map<String, dynamic> get usersData {
    final userDataString = sharedPreferences?.getString(userData);
    if (userDataString != null && userDataString.isNotEmpty) {
      return json.decode(userDataString);
    }
    return {};
  }

  set isLogin(bool isLogin) => sharedPreferences?.setBool(is_login, isLogin);
  set isOnDark(bool isdark) => sharedPreferences?.setBool(isDark, isdark);
  set authToken(String authToken) =>
      sharedPreferences?.setString(keyAuthToken, authToken);
  set authRefreshToken(String authRefreshToken) =>
      sharedPreferences?.setString(keyAuthRefreshToken, authRefreshToken);

  set usersData(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userData, json.encode(map));

  Future<bool> logOut() async {
    try {
      await sharedPreferences!.clear();
      navigate.clearStackAndShow(Routes.myHomePage);
      // await box.clear();

      // getLogger('logout').d(sharedPreferences.toString());
      return true;
    } catch (e) {
      // getLogger("error clearing cache").d('logout');
      return false;
    }
  }
}
