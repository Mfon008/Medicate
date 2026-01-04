// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../../api_folder/auth_api.dart';
import '../../api_folder/healthcare_api.dart';
import '../../api_folder/hmo_api.dart';
import '../../api_folder/pharm_auth_api.dart';
import '../../connect_end/contrast/contract_impl.dart';
import '../../connect_end/contrast/healthcare_contract_impl.dart';
import '../../connect_end/contrast/hmo_contract_impl.dart';
import '../../connect_end/contrast/pharm_contract_impl.dart';
import '../../connect_end/repo/healthcare_repo_impl.dart';
import '../../connect_end/repo/hmo_repo_impl.dart';
import '../../connect_end/repo/pharm_repo_impl.dart';
import '../../connect_end/repo/repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../../connect_end/view_model/health_care_view_model.dart';
import '../../connect_end/view_model/hmo_view_model.dart';
import '../../connect_end/view_model/pharm_auth_view_model.dart';
import '../manager/shared_preference.dart';
import '../network/network_service.dart';
import '../network/support_network_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  // Register environments
  locator.registerEnvironment(
    environment: environment,
    environmentFilter: environmentFilter,
  );

  // Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => SharedPreferencesService());
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => SupportNetworkService());
  locator.registerLazySingleton(() => AuthApi());
  locator.registerLazySingleton(() => PharmApi());
  locator.registerLazySingleton(() => HealthcareApi());
  locator.registerLazySingleton(() => HMOApi());
  locator.registerLazySingleton(() => AuthContractsImpl());
  locator.registerLazySingleton(() => PharmContractsImpl());
  locator.registerLazySingleton(() => HealthcareContractsImpl());
  locator.registerLazySingleton(() => HMOContractsImpl());
  locator.registerLazySingleton(() => AuthRepoImpl());
  locator.registerLazySingleton(() => PharmRepoImpl());
  locator.registerLazySingleton(() => HealthcareRepoImpl());
  locator.registerLazySingleton(() => HMORepoImpl());
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerFactory(() => PharmViewModel());
  locator.registerFactory(() => HealthCareViewModel());
  locator.registerFactory(() => HMOViewModel());
}
