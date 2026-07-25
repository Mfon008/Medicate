// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../app/app.router.dart';

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
  static const String verified = 'verify';
  static const String kycVerified = 'kyc_verify';
  static const String is_login = 'is_login';
  static const String is_new_login = 'is_login_new';
  static const String is_sign_up = 'is_sign_up';
  static const String userData = 'user';
  static const String userData1 = 'user1';
  static const String userType = 'user_type';
  static const String pin_set = 'pin';

  static const String application_global_id = 'application_global_id';

  String get authToken => sharedPreferences?.getString(keyAuthToken) ?? '';

  String get authType => sharedPreferences?.getString(userType) ?? '';
  String get pinSet => sharedPreferences?.getString(pin_set) ?? '';
  String get authRefreshToken =>
      sharedPreferences?.getString(keyAuthRefreshToken) ?? '';
  bool get isLogin => sharedPreferences?.getBool(is_login) ?? false;
  bool get isNewLogin => sharedPreferences?.getBool(is_new_login) ?? false;
  bool get isSignUp => sharedPreferences?.getBool(is_sign_up) ?? false;
  bool get isVerified => sharedPreferences?.getBool(verified) ?? false;
  bool get isKycVerified => sharedPreferences?.getBool(kycVerified) ?? false;

  Map<String, dynamic> get applicationGlobalId {
    final applicationGlobalString = sharedPreferences?.getString(
      application_global_id,
    );
    if (applicationGlobalString != null && applicationGlobalString.isNotEmpty) {
      return json.decode(applicationGlobalString);
    }
    return {};
  }

  Map<String, dynamic> get usersData {
    final userDataString = sharedPreferences?.getString(userData);
    if (userDataString != null && userDataString.isNotEmpty) {
      return json.decode(userDataString);
    }
    return {};
  }

  Map<String, dynamic> get usersData1 {
    final userDataString = sharedPreferences?.getString(userData1);
    if (userDataString != null && userDataString.isNotEmpty) {
      return json.decode(userDataString);
    }
    return {};
  }

  set isLogin(bool isLogin) => sharedPreferences?.setBool(is_login, isLogin);
  set isNewLogin(bool isNewLogin) =>
      sharedPreferences?.setBool(is_new_login, isNewLogin);
  set isSignUp(bool isSignUp) =>
      sharedPreferences?.setBool(is_sign_up, isSignUp);
  set isVerified(bool verify) => sharedPreferences?.setBool(verified, verify);
  set isKycVerified(bool verifyKyc) =>
      sharedPreferences?.setBool(kycVerified, verifyKyc);
  set authToken(String authToken) =>
      sharedPreferences?.setString(keyAuthToken, authToken);
  set authType(String authType) =>
      sharedPreferences?.setString(userType, authType);
  set pinSet(String pin) => sharedPreferences?.setString(pin_set, pin);
  set authRefreshToken(String authRefreshToken) =>
      sharedPreferences?.setString(keyAuthRefreshToken, authRefreshToken);

  set applicationGlobalId(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(application_global_id, json.encode(map));

  set usersData(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userData, json.encode(map));
  set usersData1(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userData1, json.encode(map));

  Future<bool> logOut() async {
    try {
      await sharedPreferences!.clear();
      navigate.clearStackAndShow(Routes.loginScreen);
      return true;
    } catch (e) {
      return false;
    }
  }
}
