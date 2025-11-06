import 'core_folder/app/app.router.dart';

class AppRoutes {
  AppRoutes();

  String returnAppRoutes(type) {
    print('${type.isSignUp} and ${type.isSignUp}');
    if (type == null) {
      return Routes.splashScreen;
    }
    // every day user flow 
    if (type.authType == 'everyday_user' && type.isSignUp == true && type.isLogin == true) {
      return Routes.welcomeScreen;
    } else if (type.authType == 'everyday_user' && type.isSignUp == true && type.isLogin == false) {
      return Routes.loginScreen;
    } else if (type.authType == 'everyday_user' && type.isSignUp == false && type.isLogin == true) {
      return Routes.welcomeScreen;
    }
    // pharmacy flow
     if (type.authType == 'pharmacy' && type.isSignUp == true && type.isLogin == true) {
      return Routes.pharmacyWelcomeScreen;
    } else if (type.authType == 'pharmacy' && type.isSignUp == true && type.isLogin == false) {
      return Routes.pharmacyLoginScreen;
    } else if (type.authType == 'pharmacy' && type.isSignUp == false && type.isLogin == true) {
      return Routes.pharmacyWelcomeScreen;
    }
    return Routes.splashScreen;
  }
}
