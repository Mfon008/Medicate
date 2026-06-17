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
  static const String is_sign_up = 'is_sign_up';
  static const String userData = 'user';
  static const String userData1 = 'user1';
  static const String userType = 'user_type';
  static const String pin_set = 'pin';

  static const String application_global_id =
      'application_global_id';


  // static const String application_id_individual_ruby =
  //     'application_id_individual_ruby';
  // static const String application_id_individual_pearl =
  //     'application_id_individual_pearl';
  // static const String application_id_individual_diamond =
  //     'application_id_individual_diamond';
  // static const String application_id_family_ruby = 'application_id_family_ruby';
  // static const String application_id_family_pearl =
  //     'application_id_family_pearl';
  // static const String application_id_family_diamond =
  //     'application_id_family_diamond';
  // static const String application_id_corporate_ruby =
  //     'application_id_corporate_ruby';
  // static const String application_id_corporate_pearl =
  //     'application_id_corporate_pearl';
  // static const String application_id_corporate_diamond =
  //     'application_id_corporate_diamond';
  // static const String current_state_individual_ruby =
  //     'current_state_individual_ruby';
  // static const String current_state_individual_pearl =
  //     'current_state_individual_pearl';
  // static const String current_state_individual_diamond =
  //     'current_state_individual_diamond';
  // static const String current_state_family_ruby = 'current_state_family_ruby';
  // static const String current_state_family_pearl = 'current_state_family_pearl';
  // static const String current_state_family_diamond =
  //     'current_state_family_diamond';
  // static const String current_state_corporate_ruby =
  //     'current_state_corporate_ruby';
  // static const String current_state_corporate_pearl =
  //     'current_state_corporate_pearl';
  // static const String current_state_corporate_diamond =
  //     'current_state_corporate_diamond';

  String get authToken => sharedPreferences?.getString(keyAuthToken) ?? '';

  // String get applicationIdIndividualRuby =>
  //     sharedPreferences?.getString(application_id_individual_ruby) ?? '';
  // String get applicationIdIndividualPearl =>
  //     sharedPreferences?.getString(application_id_individual_pearl) ?? '';
  // String get applicationIdIndividualDiamond =>
  //     sharedPreferences?.getString(application_id_individual_diamond) ?? '';
  // String get applicationIdFamilyRuby =>
  //     sharedPreferences?.getString(application_id_family_ruby) ?? '';
  // String get applicationIdFamilyPearl =>
  //     sharedPreferences?.getString(application_id_family_pearl) ?? '';
  // String get applicationIdFamilyDiamond =>
  //     sharedPreferences?.getString(application_id_family_diamond) ?? '';
  // String get applicationIdCorporateRuby =>
  //     sharedPreferences?.getString(application_id_corporate_ruby) ?? '';
  // String get applicationIdCorporatePearl =>
  //     sharedPreferences?.getString(application_id_corporate_pearl) ?? '';
  // String get applicationIdCorporateDiamond =>
  //     sharedPreferences?.getString(application_id_corporate_diamond) ?? '';

  // String get currentStateIndividualRuby =>
  //     sharedPreferences?.getString(current_state_individual_ruby) ?? '';
  // String get currentStateIndividualPearl =>
  //     sharedPreferences?.getString(current_state_individual_pearl) ?? '';
  // String get currentStateIndividualDiamond =>
  //     sharedPreferences?.getString(current_state_individual_diamond) ?? '';
  // String get currentStateFamilyRuby =>
  //     sharedPreferences?.getString(current_state_family_ruby) ?? '';
  // String get currentStateFamilyPearl =>
  //     sharedPreferences?.getString(current_state_family_pearl) ?? '';
  // String get currentStateFamilyDiamond =>
  //     sharedPreferences?.getString(current_state_family_diamond) ?? '';
  // String get currentStateCorporateRuby =>
  //     sharedPreferences?.getString(current_state_corporate_ruby) ?? '';
  // String get currentStateCorporatePearl =>
  //     sharedPreferences?.getString(current_state_corporate_pearl) ?? '';
  // String get currentStateCorporateDiamond =>
  //     sharedPreferences?.getString(current_state_corporate_diamond) ?? '';


  String get authType => sharedPreferences?.getString(userType) ?? '';
  String get pinSet => sharedPreferences?.getString(pin_set) ?? '';
  String get authRefreshToken =>
      sharedPreferences?.getString(keyAuthRefreshToken) ?? '';
  bool get isLogin => sharedPreferences?.getBool(is_login) ?? false;
  bool get isSignUp => sharedPreferences?.getBool(is_sign_up) ?? false;
  bool get isVerified => sharedPreferences?.getBool(verified) ?? false;
  bool get isKycVerified => sharedPreferences?.getBool(kycVerified) ?? false;

  Map<String, dynamic> get applicationGlobalId {
    final applicationGlobalString = sharedPreferences?.getString(application_global_id);
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

  // set applicationIdIndividualRuby(String appIndividualRuby) => sharedPreferences
  //     ?.setString(application_id_individual_ruby, appIndividualRuby);

  // set applicationIdIndividualPearl(String appIndividualPearl) =>
  //     sharedPreferences?.setString(
  //       application_id_individual_pearl,
  //       appIndividualPearl,
  //     );

  // set applicationIdIndividualDiamond(String appIndividualDiamond) =>
  //     sharedPreferences?.setString(
  //       application_id_individual_diamond,
  //       appIndividualDiamond,
  //     );

  // set applicationIdFamilyRuby(String appFamilyRuby) =>
  //     sharedPreferences?.setString(application_id_family_ruby, appFamilyRuby);

  // set applicationIdFamilyPearl(String appFamilyPearl) =>
  //     sharedPreferences?.setString(application_id_family_pearl, appFamilyPearl);
  // set applicationIdFamilyDiamond(String appFamilyDiamond) => sharedPreferences
  //     ?.setString(application_id_family_diamond, appFamilyDiamond);

  // set applicationIdCorporateRuby(String appCorporateRuby) => sharedPreferences
  //     ?.setString(application_id_corporate_ruby, appCorporateRuby);
  // set applicationIdCorporatePearl(String appCorporatePearl) => sharedPreferences
  //     ?.setString(application_id_corporate_pearl, appCorporatePearl);
  // set applicationIdCorporateDiamond(String appCorporateDiamond) =>
  //     sharedPreferences?.setString(
  //       application_id_corporate_diamond,
  //       appCorporateDiamond,
  //     );

  // set currentStateIndividualRuby(String currentIndividualRuby) =>
  //     sharedPreferences?.setString(
  //       current_state_individual_ruby,
  //       currentIndividualRuby,
  //     );

  // set currentStateIndividualPearl(String currentIndividualPearl) =>
  //     sharedPreferences?.setString(
  //       current_state_individual_pearl,
  //       currentIndividualPearl,
  //     );
  // set currentStateIndividualDiamond(String currentIndividualDiamond) =>
  //     sharedPreferences?.setString(
  //       current_state_individual_diamond,
  //       currentIndividualDiamond,
  //     );

  // set currentStateFamilyRuby(String currentFamilyRuby) => sharedPreferences
  //     ?.setString(current_state_family_ruby, currentFamilyRuby);
  // set currentStateFamilyPearl(String currentFamilyPearl) => sharedPreferences
  //     ?.setString(current_state_family_pearl, currentFamilyPearl);
  // set currentStateFamilyDiamond(String currentFamilyDiamond) =>
  //     sharedPreferences?.setString(
  //       current_state_family_diamond,
  //       currentFamilyDiamond,
  //     );

  // set currentStateCorporateRuby(String currentCorporateRuby) =>
  //     sharedPreferences?.setString(
  //       current_state_corporate_ruby,
  //       currentCorporateRuby,
  //     );
  // set currentStateCorporatePearl(String currentCorporatePearl) =>
  //     sharedPreferences?.setString(
  //       current_state_corporate_pearl,
  //       currentCorporatePearl,
  //     );
  // set currentStateCorporateDiamond(String currentCorporateDiamond) =>
  //     sharedPreferences?.setString(
  //       current_state_corporate_diamond,
  //       currentCorporateDiamond,
  //     );

  Future<bool> logOut() async {
    try {
      await sharedPreferences!.clear();
      navigate.clearStackAndShow(Routes.loginScreen);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Future<void> clearAllDrafts() async {
  //   await sharedPreferences?.remove(application_id);
  // }
}
