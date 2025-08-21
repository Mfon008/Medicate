// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i18;
import 'package:flutter/material.dart';
import 'package:medicate_app/ui/authentication/user/change_phone_number.dart'
    as _i6;
import 'package:medicate_app/ui/authentication/user/forgot_pin_screen.dart'
    as _i10;
import 'package:medicate_app/ui/authentication/user/login_screen.dart' as _i8;
import 'package:medicate_app/ui/authentication/user/reset_pin_screen.dart'
    as _i11;
import 'package:medicate_app/ui/authentication/user/setup_pin_screen.dart'
    as _i7;
import 'package:medicate_app/ui/authentication/user/sign_up_screen.dart' as _i5;
import 'package:medicate_app/ui/authentication/user/success_screen.dart'
    as _i12;
import 'package:medicate_app/ui/authentication/user/welcome_screen.dart' as _i9;
import 'package:medicate_app/ui/dashboard/ask_me_screen.dart' as _i16;
import 'package:medicate_app/ui/dashboard/dashboard_screen.dart' as _i2;
import 'package:medicate_app/ui/dashboard/more_screen.dart' as _i17;
import 'package:medicate_app/ui/dashboard/profile/user_profile/profile_info_screen.dart'
    as _i14;
import 'package:medicate_app/ui/dashboard/profile/user_profile/profile_screen.dart'
    as _i13;
import 'package:medicate_app/ui/dashboard/support/support_screen.dart' as _i15;
import 'package:medicate_app/ui/onboarding/get_started_onboarding.dart' as _i4;
import 'package:medicate_app/ui/onboarding/role_onboarding.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i19;

class Routes {
  static const dashboard = '/';

  static const roleOnboarding = '/role-onboarding';

  static const getStartedOnboarding = '/get-started-onboarding';

  static const signUpScreen = '/sign-up-screen';

  static const changePhoneNumber = '/change-phone-number';

  static const setupPinScreen = '/setup-pin-screen';

  static const loginScreen = '/login-screen';

  static const welcomeScreen = '/welcome-screen';

  static const forgotPinScreen = '/forgot-pin-screen';

  static const resetPinScreen = '/reset-pin-screen';

  static const successScreen = '/success-screen';

  static const profileScreen = '/profile-screen';

  static const profileInfoScreen = '/profile-info-screen';

  static const supportScreen = '/support-screen';

  static const askMeScreen = '/ask-me-screen';

  static const moreScreen = '/more-screen';

  static const all = <String>{
    dashboard,
    roleOnboarding,
    getStartedOnboarding,
    signUpScreen,
    changePhoneNumber,
    setupPinScreen,
    loginScreen,
    welcomeScreen,
    forgotPinScreen,
    resetPinScreen,
    successScreen,
    profileScreen,
    profileInfoScreen,
    supportScreen,
    askMeScreen,
    moreScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.dashboard, page: _i2.Dashboard),
    _i1.RouteDef(Routes.roleOnboarding, page: _i3.RoleOnboarding),
    _i1.RouteDef(Routes.getStartedOnboarding, page: _i4.GetStartedOnboarding),
    _i1.RouteDef(Routes.signUpScreen, page: _i5.SignUpScreen),
    _i1.RouteDef(Routes.changePhoneNumber, page: _i6.ChangePhoneNumber),
    _i1.RouteDef(Routes.setupPinScreen, page: _i7.SetupPinScreen),
    _i1.RouteDef(Routes.loginScreen, page: _i8.LoginScreen),
    _i1.RouteDef(Routes.welcomeScreen, page: _i9.WelcomeScreen),
    _i1.RouteDef(Routes.forgotPinScreen, page: _i10.ForgotPinScreen),
    _i1.RouteDef(Routes.resetPinScreen, page: _i11.ResetPinScreen),
    _i1.RouteDef(Routes.successScreen, page: _i12.SuccessScreen),
    _i1.RouteDef(Routes.profileScreen, page: _i13.ProfileScreen),
    _i1.RouteDef(Routes.profileInfoScreen, page: _i14.ProfileInfoScreen),
    _i1.RouteDef(Routes.supportScreen, page: _i15.SupportScreen),
    _i1.RouteDef(Routes.askMeScreen, page: _i16.AskMeScreen),
    _i1.RouteDef(Routes.moreScreen, page: _i17.MoreScreen),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Dashboard: (data) {
      final args = data.getArgs<DashboardArguments>(
        orElse: () => const DashboardArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.Dashboard(key: args.key, index: args.index),
        settings: data,
      );
    },
    _i3.RoleOnboarding: (data) {
      final args = data.getArgs<RoleOnboardingArguments>(
        orElse: () => const RoleOnboardingArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.RoleOnboarding(key: args.key),
        settings: data,
      );
    },
    _i4.GetStartedOnboarding: (data) {
      final args = data.getArgs<GetStartedOnboardingArguments>(
        orElse: () => const GetStartedOnboardingArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.GetStartedOnboarding(key: args.key),
        settings: data,
      );
    },
    _i5.SignUpScreen: (data) {
      final args = data.getArgs<SignUpScreenArguments>(
        orElse: () => const SignUpScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.SignUpScreen(key: args.key),
        settings: data,
      );
    },
    _i6.ChangePhoneNumber: (data) {
      final args = data.getArgs<ChangePhoneNumberArguments>(
        orElse: () => const ChangePhoneNumberArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ChangePhoneNumber(key: args.key),
        settings: data,
      );
    },
    _i7.SetupPinScreen: (data) {
      final args = data.getArgs<SetupPinScreenArguments>(
        orElse: () => const SetupPinScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.SetupPinScreen(key: args.key),
        settings: data,
      );
    },
    _i8.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(
        orElse: () => const LoginScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.LoginScreen(key: args.key),
        settings: data,
      );
    },
    _i9.WelcomeScreen: (data) {
      final args = data.getArgs<WelcomeScreenArguments>(
        orElse: () => const WelcomeScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.WelcomeScreen(key: args.key),
        settings: data,
      );
    },
    _i10.ForgotPinScreen: (data) {
      final args = data.getArgs<ForgotPinScreenArguments>(
        orElse: () => const ForgotPinScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ForgotPinScreen(key: args.key),
        settings: data,
      );
    },
    _i11.ResetPinScreen: (data) {
      final args = data.getArgs<ResetPinScreenArguments>(
        orElse: () => const ResetPinScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.ResetPinScreen(key: args.key),
        settings: data,
      );
    },
    _i12.SuccessScreen: (data) {
      final args = data.getArgs<SuccessScreenArguments>(
        orElse: () => const SuccessScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.SuccessScreen(key: args.key),
        settings: data,
      );
    },
    _i13.ProfileScreen: (data) {
      final args = data.getArgs<ProfileScreenArguments>(
        orElse: () => const ProfileScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.ProfileScreen(key: args.key),
        settings: data,
      );
    },
    _i14.ProfileInfoScreen: (data) {
      final args = data.getArgs<ProfileInfoScreenArguments>(
        orElse: () => const ProfileInfoScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.ProfileInfoScreen(key: args.key),
        settings: data,
      );
    },
    _i15.SupportScreen: (data) {
      final args = data.getArgs<SupportScreenArguments>(
        orElse: () => const SupportScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.SupportScreen(key: args.key),
        settings: data,
      );
    },
    _i16.AskMeScreen: (data) {
      final args = data.getArgs<AskMeScreenArguments>(
        orElse: () => const AskMeScreenArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i16.AskMeScreen(key: args.key, inText: args.inText),
        settings: data,
      );
    },
    _i17.MoreScreen: (data) {
      final args = data.getArgs<MoreScreenArguments>(
        orElse: () => const MoreScreenArguments(),
      );
      return _i18.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i17.MoreScreen(key: args.key),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideRight,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DashboardArguments {
  const DashboardArguments({this.key, this.index});

  final _i18.Key? key;

  final int? index;

  @override
  String toString() {
    return '{"key": "$key", "index": "$index"}';
  }

  @override
  bool operator ==(covariant DashboardArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.index == index;
  }

  @override
  int get hashCode {
    return key.hashCode ^ index.hashCode;
  }
}

class RoleOnboardingArguments {
  const RoleOnboardingArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant RoleOnboardingArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class GetStartedOnboardingArguments {
  const GetStartedOnboardingArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant GetStartedOnboardingArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SignUpScreenArguments {
  const SignUpScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SignUpScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ChangePhoneNumberArguments {
  const ChangePhoneNumberArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ChangePhoneNumberArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SetupPinScreenArguments {
  const SetupPinScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SetupPinScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class LoginScreenArguments {
  const LoginScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class WelcomeScreenArguments {
  const WelcomeScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant WelcomeScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ForgotPinScreenArguments {
  const ForgotPinScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ForgotPinScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ResetPinScreenArguments {
  const ResetPinScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ResetPinScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SuccessScreenArguments {
  const SuccessScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SuccessScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ProfileScreenArguments {
  const ProfileScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ProfileScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ProfileInfoScreenArguments {
  const ProfileInfoScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ProfileInfoScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SupportScreenArguments {
  const SupportScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SupportScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AskMeScreenArguments {
  const AskMeScreenArguments({this.key, this.inText});

  final _i18.Key? key;

  final String? inText;

  @override
  String toString() {
    return '{"key": "$key", "inText": "$inText"}';
  }

  @override
  bool operator ==(covariant AskMeScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.inText == inText;
  }

  @override
  int get hashCode {
    return key.hashCode ^ inText.hashCode;
  }
}

class MoreScreenArguments {
  const MoreScreenArguments({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MoreScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i19.NavigationService {
  Future<dynamic> navigateToDashboard({
    _i18.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.dashboard,
      arguments: DashboardArguments(key: key, index: index),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRoleOnboarding({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.roleOnboarding,
      arguments: RoleOnboardingArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToGetStartedOnboarding({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.getStartedOnboarding,
      arguments: GetStartedOnboardingArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSignUpScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.signUpScreen,
      arguments: SignUpScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChangePhoneNumber({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.changePhoneNumber,
      arguments: ChangePhoneNumberArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSetupPinScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.setupPinScreen,
      arguments: SetupPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.loginScreen,
      arguments: LoginScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWelcomeScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.welcomeScreen,
      arguments: WelcomeScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToForgotPinScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.forgotPinScreen,
      arguments: ForgotPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToResetPinScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.resetPinScreen,
      arguments: ResetPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSuccessScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.successScreen,
      arguments: SuccessScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProfileScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.profileScreen,
      arguments: ProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProfileInfoScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.profileInfoScreen,
      arguments: ProfileInfoScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSupportScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.supportScreen,
      arguments: SupportScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAskMeScreen({
    _i18.Key? key,
    String? inText,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.askMeScreen,
      arguments: AskMeScreenArguments(key: key, inText: inText),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMoreScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.moreScreen,
      arguments: MoreScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithDashboard({
    _i18.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.dashboard,
      arguments: DashboardArguments(key: key, index: index),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithRoleOnboarding({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.roleOnboarding,
      arguments: RoleOnboardingArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithGetStartedOnboarding({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.getStartedOnboarding,
      arguments: GetStartedOnboardingArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSignUpScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.signUpScreen,
      arguments: SignUpScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithChangePhoneNumber({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.changePhoneNumber,
      arguments: ChangePhoneNumberArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSetupPinScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.setupPinScreen,
      arguments: SetupPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithLoginScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.loginScreen,
      arguments: LoginScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWelcomeScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.welcomeScreen,
      arguments: WelcomeScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithForgotPinScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.forgotPinScreen,
      arguments: ForgotPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithResetPinScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.resetPinScreen,
      arguments: ResetPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSuccessScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.successScreen,
      arguments: SuccessScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithProfileScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.profileScreen,
      arguments: ProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithProfileInfoScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.profileInfoScreen,
      arguments: ProfileInfoScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSupportScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.supportScreen,
      arguments: SupportScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithAskMeScreen({
    _i18.Key? key,
    String? inText,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.askMeScreen,
      arguments: AskMeScreenArguments(key: key, inText: inText),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithMoreScreen({
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.moreScreen,
      arguments: MoreScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
