// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:medicate_app/ui/authentication/user/change_phone_number.dart'
    as _i5;
import 'package:medicate_app/ui/authentication/user/sign_up_screen.dart' as _i4;
import 'package:medicate_app/ui/onboarding/get_started_onboarding.dart' as _i3;
import 'package:medicate_app/ui/onboarding/role_onboarding.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const roleOnboarding = '/role-onboarding';

  static const getStartedOnboarding = '/get-started-onboarding';

  static const signUpScreen = '/sign-up-screen';

  static const changePhoneNumber = '/change-phone-number';

  static const all = <String>{
    roleOnboarding,
    getStartedOnboarding,
    signUpScreen,
    changePhoneNumber,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.roleOnboarding, page: _i2.RoleOnboarding),
    _i1.RouteDef(Routes.getStartedOnboarding, page: _i3.GetStartedOnboarding),
    _i1.RouteDef(Routes.signUpScreen, page: _i4.SignUpScreen),
    _i1.RouteDef(Routes.changePhoneNumber, page: _i5.ChangePhoneNumber),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.RoleOnboarding: (data) {
      final args = data.getArgs<RoleOnboardingArguments>(
        orElse: () => const RoleOnboardingArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.RoleOnboarding(key: args.key),
        settings: data,
      );
    },
    _i3.GetStartedOnboarding: (data) {
      final args = data.getArgs<GetStartedOnboardingArguments>(
        orElse: () => const GetStartedOnboardingArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.GetStartedOnboarding(key: args.key),
        settings: data,
      );
    },
    _i4.SignUpScreen: (data) {
      final args = data.getArgs<SignUpScreenArguments>(
        orElse: () => const SignUpScreenArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SignUpScreen(key: args.key),
        settings: data,
      );
    },
    _i5.ChangePhoneNumber: (data) {
      final args = data.getArgs<ChangePhoneNumberArguments>(
        orElse: () => const ChangePhoneNumberArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.ChangePhoneNumber(key: args.key),
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

  final _i6.Key? key;

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

  final _i6.Key? key;

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

  final _i6.Key? key;

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

  final _i6.Key? key;

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

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToRoleOnboarding({
    _i6.Key? key,
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
    _i6.Key? key,
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
    _i6.Key? key,
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
    _i6.Key? key,
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

  Future<dynamic> replaceWithRoleOnboarding({
    _i6.Key? key,
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
    _i6.Key? key,
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
    _i6.Key? key,
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
    _i6.Key? key,
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
}
