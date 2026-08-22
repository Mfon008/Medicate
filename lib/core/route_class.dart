// ignore_for_file: strict_top_level_inference

import 'core_folder/app/app.router.dart';

class AppRoutes {
  AppRoutes();

  String returnAppRoutes(type) {
    if (type == null) {
      return Routes.splashScreen;
    }
    // every day user flow
    if (type.authType == 'everyday_user' &&
        type.isSignUp == true &&
        type.isLogin == true) {
      return Routes.welcomeScreen;
    } else if (type.authType == 'everyday_user' &&
        type.isSignUp == true &&
        type.isLogin == false) {
      return Routes.loginScreen;
    } else if (type.authType == 'everyday_user' &&
        type.isSignUp == false &&
        type.isLogin == true) {
      return Routes.welcomeScreen;
    }
    // pharmacy flow
    if (type.authType == 'pharmacy' &&
        type.isSignUp == true &&
        type.isLogin == true) {
      return Routes.pharmacyWelcomeScreen;
    } else if (type.authType == 'pharmacy' &&
        type.isSignUp == true &&
        type.isLogin == false) {
      return Routes.pharmacyLoginScreen;
    } else if (type.authType == 'pharmacy' &&
        type.isSignUp == false &&
        type.isLogin == true) {
      return Routes.pharmacyWelcomeScreen;
    }
    // healthcare flow
    if (type.authType == 'healthcare' &&
        type.isSignUp == true &&
        type.isLogin == true) {
      return Routes.healthCareWelcomeScreen;
    } else if (type.authType == 'healthcare' &&
        type.isSignUp == true &&
        type.isLogin == false) {
      return Routes.healthCareLoginScreen;
    } else if (type.authType == 'healthcare' &&
        type.isSignUp == false &&
        type.isLogin == true) {
      return Routes.healthCareWelcomeScreen;
    }
    // hmo flow
    if (type.authType == 'hmo' &&
        type.isSignUp == true &&
        type.isLogin == true) {
      return Routes.hMOWelcomeScreen;
    } else if (type.authType == 'hmo' &&
        type.isSignUp == true &&
        type.isLogin == false) {
      return Routes.hMOLoginScreen;
    } else if (type.authType == 'hmo' &&
        type.isSignUp == false &&
        type.isLogin == true) {
      return Routes.hMOWelcomeScreen;
    }
    // distributor flow
    if (type.authType == 'manufacturer' &&
        type.isSignUp == true &&
        type.isLogin == true) {
      return Routes.manufacturerWelcomeScreen;
    } else if (type.authType == 'manufacturer' &&
        type.isSignUp == true &&
        type.isLogin == false) {
      return Routes.manufacturerLoginScreen;
    } else if (type.authType == 'manufacturer' &&
        type.isSignUp == false &&
        type.isLogin == true) {
      return Routes.manufacturerWelcomeScreen;
    }
    return Routes.splashScreen;
  }
}
