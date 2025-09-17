import 'core_folder/app/app.router.dart';

class AppRoutes {
  AppRoutes();

  String returnAppRoutes(type) {
    print('${type.isSignUp} and ${type.isSignUp}');
    if (type == null) {
      return Routes.splashScreen;
    }
    if (type.isSignUp == true && type.isLogin == true) {
      return Routes.welcomeScreen;
    } else if (type.isSignUp == true && type.isLogin == false) {
      return Routes.loginScreen;
    } else if (type.isSignUp == false && type.isLogin == true) {
      return Routes.welcomeScreen;
    }
    return Routes.splashScreen;
  }
}
