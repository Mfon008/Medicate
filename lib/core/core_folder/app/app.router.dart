// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:medicate_app/ui/onboarding/get_started_onboarding.dart' as _i3;
import 'package:medicate_app/ui/onboarding/role_onboarding.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const roleOnboarding = '/role-onboarding';

  static const getStartedOnboarding = '/get-started-onboarding';

  static const all = <String>{roleOnboarding, getStartedOnboarding};
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.roleOnboarding, page: _i2.RoleOnboarding),
    _i1.RouteDef(Routes.getStartedOnboarding, page: _i3.GetStartedOnboarding),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.RoleOnboarding: (data) {
      final args = data.getArgs<RoleOnboardingArguments>(
        orElse: () => const RoleOnboardingArguments(),
      );
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.RoleOnboarding(key: args.key),
        settings: data,
      );
    },
    _i3.GetStartedOnboarding: (data) {
      final args = data.getArgs<GetStartedOnboardingArguments>(
        orElse: () => const GetStartedOnboardingArguments(),
      );
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.GetStartedOnboarding(key: args.key),
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

  final _i4.Key? key;

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

  final _i4.Key? key;

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

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToRoleOnboarding({
    _i4.Key? key,
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
    _i4.Key? key,
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

  Future<dynamic> replaceWithRoleOnboarding({
    _i4.Key? key,
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
    _i4.Key? key,
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
}
