import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../ui/authentication/user/change_phone_number.dart';
import '../../../ui/authentication/user/forgot_pin_screen.dart';
import '../../../ui/authentication/user/login_screen.dart';
import '../../../ui/authentication/user/reset_pin_screen.dart';
import '../../../ui/authentication/user/setup_pin_screen.dart';
import '../../../ui/authentication/user/sign_up_screen.dart';
import '../../../ui/authentication/user/success_screen.dart';
import '../../../ui/authentication/user/welcome_screen.dart';
import '../../../ui/dashboard/ask_me_screen.dart';
import '../../../ui/dashboard/dashboard_screen.dart';
import '../../../ui/dashboard/more_screen.dart';
import '../../../ui/dashboard/notification/empty_notification.dart';
import '../../../ui/dashboard/profile/faq_screen.dart';
import '../../../ui/dashboard/profile/reset_pin_pad_screen.dart';
import '../../../ui/dashboard/profile/user_profile/profile_info_screen.dart';
import '../../../ui/dashboard/profile/user_profile/profile_screen.dart';
import '../../../ui/dashboard/profile/wallet/fund_screen.dart';
import '../../../ui/dashboard/profile/wallet/fund_wallet_pay_screen.dart';
import '../../../ui/dashboard/profile/wallet/transaction_screen.dart';
import '../../../ui/dashboard/profile/wallet/wallet_screen.dart';
import '../../../ui/dashboard/reminder/payment_status_screen.dart';
import '../../../ui/dashboard/support/support_screen.dart';
import '../../../ui/onboarding/get_started_onboarding.dart';
import '../../../ui/onboarding/role_onboarding.dart';
import '../../../ui/onboarding/splash_screen.dart';
import '../../api_folder/auth_api.dart';
import '../../connect_end/contrast/contract_impl.dart';
import '../../connect_end/repo/repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../manager/shared_preference.dart';
import '../network/network_service.dart';
import '../network/support_network_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Dashboard, initial: true),
    MaterialRoute(page: RoleOnboarding),
    MaterialRoute(page: GetStartedOnboarding),
    MaterialRoute(page: SignUpScreen),
    MaterialRoute(page: ChangePhoneNumber),
    MaterialRoute(page: SetupPinScreen),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: WelcomeScreen),
    MaterialRoute(page: ForgotPinScreen),
    MaterialRoute(page: ResetPinScreen),
    MaterialRoute(page: SuccessScreen),
    MaterialRoute(page: ProfileScreen),
    MaterialRoute(page: ProfileInfoScreen),
    MaterialRoute(page: SupportScreen),
    MaterialRoute(page: ResetPinPadScreen),
    MaterialRoute(page: AskMeScreen),
    MaterialRoute(page: EmptyNotification),
    MaterialRoute(page: FaqScreen),
    MaterialRoute(page: SplashScreen),
    MaterialRoute(page: WalletScreen),
    MaterialRoute(page: TransactionScreen),
    MaterialRoute(page: FundScreen),
    MaterialRoute(page: FundWalletPayScreen),
    MaterialRoute(page: PaymentStatusScreen),
    CustomRoute(
      page: MoreScreen,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 300,
    ),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SharedPreferencesService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: SupportNetworkService),
    LazySingleton(classType: AuthApi),
    LazySingleton(classType: AuthContractsImpl),
    LazySingleton(classType: AuthRepoImpl),
    LazySingleton(classType: AuthViewModel),
  ],
  logger: StackedLogger(),
)
class App {}
