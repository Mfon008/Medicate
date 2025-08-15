import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../ui/authentication/sign_up_screen.dart';
import '../../../ui/onboarding/get_started_onboarding.dart';
import '../../../ui/onboarding/role_onboarding.dart';
import '../../api_folder/auth_api.dart';
import '../../connect_end/contrast/contract_impl.dart';
import '../../connect_end/repo/repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../manager/shared_preference.dart';
import '../network/network_service.dart';

@StackedApp(
  routes: [
    // MaterialRoute(page: Dashboard, initial: true),
    MaterialRoute(page: RoleOnboarding),
    MaterialRoute(page: GetStartedOnboarding),
    MaterialRoute(page: SignUpScreen),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SharedPreferencesService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: AuthApi),
    LazySingleton(classType: AuthContractsImpl),
    LazySingleton(classType: AuthRepoImpl),
    LazySingleton(classType: AuthViewModel),
  ],
  logger: StackedLogger(),
)
class App {}
