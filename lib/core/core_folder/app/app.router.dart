// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:medicate_app/ui/authentication/user/change_phone_number.dart'
    as _i5;
import 'package:medicate_app/ui/authentication/user/forgot_pin_screen.dart'
    as _i9;
import 'package:medicate_app/ui/authentication/user/login_screen.dart' as _i7;
import 'package:medicate_app/ui/authentication/user/reset_pin_screen.dart'
    as _i10;
import 'package:medicate_app/ui/authentication/user/setup_pin_screen.dart'
    as _i6;
import 'package:medicate_app/ui/authentication/user/sign_up_screen.dart' as _i4;
import 'package:medicate_app/ui/authentication/user/success_screen.dart'
    as _i11;
import 'package:medicate_app/ui/authentication/user/welcome_screen.dart' as _i8;
import 'package:medicate_app/ui/onboarding/get_started_onboarding.dart' as _i3;
import 'package:medicate_app/ui/onboarding/role_onboarding.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
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

  static const all = <String>{
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
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.roleOnboarding, page: _i2.RoleOnboarding),
    _i1.RouteDef(Routes.getStartedOnboarding, page: _i3.GetStartedOnboarding),
    _i1.RouteDef(Routes.signUpScreen, page: _i4.SignUpScreen),
    _i1.RouteDef(Routes.changePhoneNumber, page: _i5.ChangePhoneNumber),
    _i1.RouteDef(Routes.setupPinScreen, page: _i6.SetupPinScreen),
    _i1.RouteDef(Routes.loginScreen, page: _i7.LoginScreen),
    _i1.RouteDef(Routes.welcomeScreen, page: _i8.WelcomeScreen),
    _i1.RouteDef(Routes.forgotPinScreen, page: _i9.ForgotPinScreen),
    _i1.RouteDef(Routes.resetPinScreen, page: _i10.ResetPinScreen),
    _i1.RouteDef(Routes.successScreen, page: _i11.SuccessScreen),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.RoleOnboarding: (data) {
      final args = data.getArgs<RoleOnboardingArguments>(
        orElse: () => const RoleOnboardingArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.RoleOnboarding(key: args.key),
        settings: data,
      );
    },
    _i3.GetStartedOnboarding: (data) {
      final args = data.getArgs<GetStartedOnboardingArguments>(
        orElse: () => const GetStartedOnboardingArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.GetStartedOnboarding(key: args.key),
        settings: data,
      );
    },
    _i4.SignUpScreen: (data) {
      final args = data.getArgs<SignUpScreenArguments>(
        orElse: () => const SignUpScreenArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SignUpScreen(key: args.key),
        settings: data,
      );
    },
    _i5.ChangePhoneNumber: (data) {
      final args = data.getArgs<ChangePhoneNumberArguments>(
        orElse: () => const ChangePhoneNumberArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.ChangePhoneNumber(key: args.key),
        settings: data,
      );
    },
    _i6.SetupPinScreen: (data) {
      final args = data.getArgs<SetupPinScreenArguments>(
        orElse: () => const SetupPinScreenArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.SetupPinScreen(key: args.key),
        settings: data,
      );
    },
    _i7.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(
        orElse: () => const LoginScreenArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.LoginScreen(key: args.key),
        settings: data,
      );
    },
    _i8.WelcomeScreen: (data) {
      final args = data.getArgs<WelcomeScreenArguments>(
        orElse: () => const WelcomeScreenArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.WelcomeScreen(key: args.key),
        settings: data,
      );
    },
    _i9.ForgotPinScreen: (data) {
      final args = data.getArgs<ForgotPinScreenArguments>(
        orElse: () => const ForgotPinScreenArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.ForgotPinScreen(key: args.key),
        settings: data,
      );
    },
    _i10.ResetPinScreen: (data) {
      final args = data.getArgs<ResetPinScreenArguments>(
        orElse: () => const ResetPinScreenArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ResetPinScreen(key: args.key),
        settings: data,
      );
    },
    _i11.SuccessScreen: (data) {
      final args = data.getArgs<SuccessScreenArguments>(
        orElse: () => const SuccessScreenArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.SuccessScreen(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class RoleOnboardingArguments {
  const RoleOnboardingArguments({this.key});

  final _i12.Key? key;

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

  final _i12.Key? key;

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

  final _i12.Key? key;

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

  final _i12.Key? key;

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

  final _i12.Key? key;

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

  final _i12.Key? key;

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

  final _i12.Key? key;

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

  final _i12.Key? key;

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

  final _i12.Key? key;

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

  final _i12.Key? key;

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

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToRoleOnboarding({
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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

  Future<dynamic> replaceWithRoleOnboarding({
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
    _i12.Key? key,
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
}
