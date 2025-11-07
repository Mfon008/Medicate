// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i43;
import 'package:flutter/material.dart';
import 'package:medicate_app/ui/authentication/pharmacy/pharm_change_no_screen.dart'
    as _i33;
import 'package:medicate_app/ui/authentication/pharmacy/pharm_forgot_pin_screen.dart'
    as _i34;
import 'package:medicate_app/ui/authentication/pharmacy/pharm_login_screen.dart'
    as _i32;
import 'package:medicate_app/ui/authentication/pharmacy/pharm_reset_pin_screen.dart'
    as _i35;
import 'package:medicate_app/ui/authentication/pharmacy/pharm_reset_success_screen.dart'
    as _i39;
import 'package:medicate_app/ui/authentication/pharmacy/pharm_setup_pin_screen.dart'
    as _i31;
import 'package:medicate_app/ui/authentication/pharmacy/pharm_sign_up_screen.dart'
    as _i30;
import 'package:medicate_app/ui/authentication/pharmacy/welcome_screen.dart'
    as _i36;
import 'package:medicate_app/ui/authentication/user/change_phone_number.dart'
    as _i7;
import 'package:medicate_app/ui/authentication/user/forgot_pin_screen.dart'
    as _i11;
import 'package:medicate_app/ui/authentication/user/login_screen.dart' as _i9;
import 'package:medicate_app/ui/authentication/user/reset_pin_screen.dart'
    as _i12;
import 'package:medicate_app/ui/authentication/user/setup_pin_screen.dart'
    as _i8;
import 'package:medicate_app/ui/authentication/user/sign_up_screen.dart' as _i6;
import 'package:medicate_app/ui/authentication/user/success_screen.dart'
    as _i13;
import 'package:medicate_app/ui/authentication/user/welcome_screen.dart'
    as _i10;
import 'package:medicate_app/ui/dashboard/ask_me_screen.dart' as _i20;
import 'package:medicate_app/ui/dashboard/dashboard_screen.dart' as _i2;
import 'package:medicate_app/ui/dashboard/more_screen.dart' as _i41;
import 'package:medicate_app/ui/dashboard/notification/empty_notification.dart'
    as _i21;
import 'package:medicate_app/ui/dashboard/pharm_dashboard/pharm_dashboard.dart'
    as _i3;
import 'package:medicate_app/ui/dashboard/pharm_dashboard/pharm_more_screen.dart'
    as _i42;
import 'package:medicate_app/ui/dashboard/profile/faq_screen.dart' as _i22;
import 'package:medicate_app/ui/dashboard/profile/pharmacy_profile/kyc/kyc_screen.dart'
    as _i37;
import 'package:medicate_app/ui/dashboard/profile/pharmacy_profile/pharmacy_profile_info_screen.dart'
    as _i17;
import 'package:medicate_app/ui/dashboard/profile/pharmacy_profile/pharmacy_profile_screen.dart'
    as _i15;
import 'package:medicate_app/ui/dashboard/profile/pharmacy_profile/pharmacy_setting_screen.dart'
    as _i38;
import 'package:medicate_app/ui/dashboard/profile/pharmacy_profile/users_screen.dart'
    as _i40;
import 'package:medicate_app/ui/dashboard/profile/reset_pin_pad_screen.dart'
    as _i19;
import 'package:medicate_app/ui/dashboard/profile/user_profile/profile_info_screen.dart'
    as _i16;
import 'package:medicate_app/ui/dashboard/profile/user_profile/profile_screen.dart'
    as _i14;
import 'package:medicate_app/ui/dashboard/profile/wallet/fund_screen.dart'
    as _i26;
import 'package:medicate_app/ui/dashboard/profile/wallet/fund_wallet_pay_screen.dart'
    as _i27;
import 'package:medicate_app/ui/dashboard/profile/wallet/transaction_screen.dart'
    as _i25;
import 'package:medicate_app/ui/dashboard/profile/wallet/wallet_screen.dart'
    as _i24;
import 'package:medicate_app/ui/dashboard/reminder/payment_status_screen.dart'
    as _i28;
import 'package:medicate_app/ui/dashboard/reminder/view_medication_screen.dart'
    as _i29;
import 'package:medicate_app/ui/dashboard/support/support_screen.dart' as _i18;
import 'package:medicate_app/ui/onboarding/get_started_onboarding.dart' as _i5;
import 'package:medicate_app/ui/onboarding/role_onboarding.dart' as _i4;
import 'package:medicate_app/ui/onboarding/splash_screen.dart' as _i23;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i44;

class Routes {
  static const dashboard = '/';

  static const pharmacyDashboard = '/pharmacy-dashboard';

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

  static const pharmacyProfileScreen = '/pharmacy-profile-screen';

  static const profileInfoScreen = '/profile-info-screen';

  static const pharmacyProfileInfoScreen = '/pharmacy-profile-info-screen';

  static const supportScreen = '/support-screen';

  static const resetPinPadScreen = '/reset-pin-pad-screen';

  static const askMeScreen = '/ask-me-screen';

  static const emptyNotification = '/empty-notification';

  static const faqScreen = '/faq-screen';

  static const splashScreen = '/splash-screen';

  static const walletScreen = '/wallet-screen';

  static const transactionScreen = '/transaction-screen';

  static const fundScreen = '/fund-screen';

  static const fundWalletPayScreen = '/fund-wallet-pay-screen';

  static const paymentStatusScreen = '/payment-status-screen';

  static const viewMedicationScreen = '/view-medication-screen';

  static const pharmacySignUpScreen = '/pharmacy-sign-up-screen';

  static const pharmacySetupPinScreen = '/pharmacy-setup-pin-screen';

  static const pharmacyLoginScreen = '/pharmacy-login-screen';

  static const pharmacyChangePhoneNumber = '/pharmacy-change-phone-number';

  static const pharmacyForgotPinScreen = '/pharmacy-forgot-pin-screen';

  static const pharmacyResetPinScreen = '/pharmacy-reset-pin-screen';

  static const pharmacyWelcomeScreen = '/pharmacy-welcome-screen';

  static const kycScreen = '/kyc-screen';

  static const pharmacySettingScreen = '/pharmacy-setting-screen';

  static const pharmResetSuccessScreen = '/pharm-reset-success-screen';

  static const usersScreen = '/users-screen';

  static const moreScreen = '/more-screen';

  static const pharmMoreScreen = '/pharm-more-screen';

  static const all = <String>{
    dashboard,
    pharmacyDashboard,
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
    pharmacyProfileScreen,
    profileInfoScreen,
    pharmacyProfileInfoScreen,
    supportScreen,
    resetPinPadScreen,
    askMeScreen,
    emptyNotification,
    faqScreen,
    splashScreen,
    walletScreen,
    transactionScreen,
    fundScreen,
    fundWalletPayScreen,
    paymentStatusScreen,
    viewMedicationScreen,
    pharmacySignUpScreen,
    pharmacySetupPinScreen,
    pharmacyLoginScreen,
    pharmacyChangePhoneNumber,
    pharmacyForgotPinScreen,
    pharmacyResetPinScreen,
    pharmacyWelcomeScreen,
    kycScreen,
    pharmacySettingScreen,
    pharmResetSuccessScreen,
    usersScreen,
    moreScreen,
    pharmMoreScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.dashboard, page: _i2.Dashboard),
    _i1.RouteDef(Routes.pharmacyDashboard, page: _i3.PharmacyDashboard),
    _i1.RouteDef(Routes.roleOnboarding, page: _i4.RoleOnboarding),
    _i1.RouteDef(Routes.getStartedOnboarding, page: _i5.GetStartedOnboarding),
    _i1.RouteDef(Routes.signUpScreen, page: _i6.SignUpScreen),
    _i1.RouteDef(Routes.changePhoneNumber, page: _i7.ChangePhoneNumber),
    _i1.RouteDef(Routes.setupPinScreen, page: _i8.SetupPinScreen),
    _i1.RouteDef(Routes.loginScreen, page: _i9.LoginScreen),
    _i1.RouteDef(Routes.welcomeScreen, page: _i10.WelcomeScreen),
    _i1.RouteDef(Routes.forgotPinScreen, page: _i11.ForgotPinScreen),
    _i1.RouteDef(Routes.resetPinScreen, page: _i12.ResetPinScreen),
    _i1.RouteDef(Routes.successScreen, page: _i13.SuccessScreen),
    _i1.RouteDef(Routes.profileScreen, page: _i14.ProfileScreen),
    _i1.RouteDef(
      Routes.pharmacyProfileScreen,
      page: _i15.PharmacyProfileScreen,
    ),
    _i1.RouteDef(Routes.profileInfoScreen, page: _i16.ProfileInfoScreen),
    _i1.RouteDef(
      Routes.pharmacyProfileInfoScreen,
      page: _i17.PharmacyProfileInfoScreen,
    ),
    _i1.RouteDef(Routes.supportScreen, page: _i18.SupportScreen),
    _i1.RouteDef(Routes.resetPinPadScreen, page: _i19.ResetPinPadScreen),
    _i1.RouteDef(Routes.askMeScreen, page: _i20.AskMeScreen),
    _i1.RouteDef(Routes.emptyNotification, page: _i21.EmptyNotification),
    _i1.RouteDef(Routes.faqScreen, page: _i22.FaqScreen),
    _i1.RouteDef(Routes.splashScreen, page: _i23.SplashScreen),
    _i1.RouteDef(Routes.walletScreen, page: _i24.WalletScreen),
    _i1.RouteDef(Routes.transactionScreen, page: _i25.TransactionScreen),
    _i1.RouteDef(Routes.fundScreen, page: _i26.FundScreen),
    _i1.RouteDef(Routes.fundWalletPayScreen, page: _i27.FundWalletPayScreen),
    _i1.RouteDef(Routes.paymentStatusScreen, page: _i28.PaymentStatusScreen),
    _i1.RouteDef(Routes.viewMedicationScreen, page: _i29.ViewMedicationScreen),
    _i1.RouteDef(Routes.pharmacySignUpScreen, page: _i30.PharmacySignUpScreen),
    _i1.RouteDef(
      Routes.pharmacySetupPinScreen,
      page: _i31.PharmacySetupPinScreen,
    ),
    _i1.RouteDef(Routes.pharmacyLoginScreen, page: _i32.PharmacyLoginScreen),
    _i1.RouteDef(
      Routes.pharmacyChangePhoneNumber,
      page: _i33.PharmacyChangePhoneNumber,
    ),
    _i1.RouteDef(
      Routes.pharmacyForgotPinScreen,
      page: _i34.PharmacyForgotPinScreen,
    ),
    _i1.RouteDef(
      Routes.pharmacyResetPinScreen,
      page: _i35.PharmacyResetPinScreen,
    ),
    _i1.RouteDef(
      Routes.pharmacyWelcomeScreen,
      page: _i36.PharmacyWelcomeScreen,
    ),
    _i1.RouteDef(Routes.kycScreen, page: _i37.KycScreen),
    _i1.RouteDef(
      Routes.pharmacySettingScreen,
      page: _i38.PharmacySettingScreen,
    ),
    _i1.RouteDef(
      Routes.pharmResetSuccessScreen,
      page: _i39.PharmResetSuccessScreen,
    ),
    _i1.RouteDef(Routes.usersScreen, page: _i40.UsersScreen),
    _i1.RouteDef(Routes.moreScreen, page: _i41.MoreScreen),
    _i1.RouteDef(Routes.pharmMoreScreen, page: _i42.PharmMoreScreen),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Dashboard: (data) {
      final args = data.getArgs<DashboardArguments>(
        orElse: () => const DashboardArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.Dashboard(key: args.key, index: args.index),
        settings: data,
      );
    },
    _i3.PharmacyDashboard: (data) {
      final args = data.getArgs<PharmacyDashboardArguments>(
        orElse: () => const PharmacyDashboardArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.PharmacyDashboard(key: args.key, index: args.index),
        settings: data,
      );
    },
    _i4.RoleOnboarding: (data) {
      final args = data.getArgs<RoleOnboardingArguments>(
        orElse: () => const RoleOnboardingArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.RoleOnboarding(key: args.key),
        settings: data,
      );
    },
    _i5.GetStartedOnboarding: (data) {
      final args = data.getArgs<GetStartedOnboardingArguments>(
        orElse: () => const GetStartedOnboardingArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.GetStartedOnboarding(key: args.key),
        settings: data,
      );
    },
    _i6.SignUpScreen: (data) {
      final args = data.getArgs<SignUpScreenArguments>(
        orElse: () => const SignUpScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.SignUpScreen(key: args.key),
        settings: data,
      );
    },
    _i7.ChangePhoneNumber: (data) {
      final args = data.getArgs<ChangePhoneNumberArguments>(nullOk: false);
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.ChangePhoneNumber(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i8.SetupPinScreen: (data) {
      final args = data.getArgs<SetupPinScreenArguments>(
        orElse: () => const SetupPinScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.SetupPinScreen(key: args.key),
        settings: data,
      );
    },
    _i9.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(
        orElse: () => const LoginScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.LoginScreen(key: args.key),
        settings: data,
      );
    },
    _i10.WelcomeScreen: (data) {
      final args = data.getArgs<WelcomeScreenArguments>(
        orElse: () => const WelcomeScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.WelcomeScreen(key: args.key, phone: args.phone),
        settings: data,
      );
    },
    _i11.ForgotPinScreen: (data) {
      final args = data.getArgs<ForgotPinScreenArguments>(
        orElse: () => const ForgotPinScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.ForgotPinScreen(key: args.key),
        settings: data,
      );
    },
    _i12.ResetPinScreen: (data) {
      final args = data.getArgs<ResetPinScreenArguments>(
        orElse: () => const ResetPinScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.ResetPinScreen(key: args.key, phone: args.phone),
        settings: data,
      );
    },
    _i13.SuccessScreen: (data) {
      final args = data.getArgs<SuccessScreenArguments>(
        orElse: () => const SuccessScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.SuccessScreen(key: args.key),
        settings: data,
      );
    },
    _i14.ProfileScreen: (data) {
      final args = data.getArgs<ProfileScreenArguments>(
        orElse: () => const ProfileScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.ProfileScreen(key: args.key),
        settings: data,
      );
    },
    _i15.PharmacyProfileScreen: (data) {
      final args = data.getArgs<PharmacyProfileScreenArguments>(
        orElse: () => const PharmacyProfileScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.PharmacyProfileScreen(key: args.key),
        settings: data,
      );
    },
    _i16.ProfileInfoScreen: (data) {
      final args = data.getArgs<ProfileInfoScreenArguments>(
        orElse: () => const ProfileInfoScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.ProfileInfoScreen(key: args.key),
        settings: data,
      );
    },
    _i17.PharmacyProfileInfoScreen: (data) {
      final args = data.getArgs<PharmacyProfileInfoScreenArguments>(
        orElse: () => const PharmacyProfileInfoScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.PharmacyProfileInfoScreen(key: args.key),
        settings: data,
      );
    },
    _i18.SupportScreen: (data) {
      final args = data.getArgs<SupportScreenArguments>(
        orElse: () => const SupportScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.SupportScreen(key: args.key),
        settings: data,
      );
    },
    _i19.ResetPinPadScreen: (data) {
      final args = data.getArgs<ResetPinPadScreenArguments>(
        orElse: () => const ResetPinPadScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i19.ResetPinPadScreen(key: args.key),
        settings: data,
      );
    },
    _i20.AskMeScreen: (data) {
      final args = data.getArgs<AskMeScreenArguments>(
        orElse: () => const AskMeScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.AskMeScreen(
          key: args.key,
          inText: args.inText,
          isDashboard: args.isDashboard,
        ),
        settings: data,
      );
    },
    _i21.EmptyNotification: (data) {
      final args = data.getArgs<EmptyNotificationArguments>(
        orElse: () => const EmptyNotificationArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.EmptyNotification(key: args.key),
        settings: data,
      );
    },
    _i22.FaqScreen: (data) {
      final args = data.getArgs<FaqScreenArguments>(
        orElse: () => const FaqScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i22.FaqScreen(key: args.key),
        settings: data,
      );
    },
    _i23.SplashScreen: (data) {
      final args = data.getArgs<SplashScreenArguments>(
        orElse: () => const SplashScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.SplashScreen(key: args.key),
        settings: data,
      );
    },
    _i24.WalletScreen: (data) {
      final args = data.getArgs<WalletScreenArguments>(
        orElse: () => const WalletScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i24.WalletScreen(key: args.key),
        settings: data,
      );
    },
    _i25.TransactionScreen: (data) {
      final args = data.getArgs<TransactionScreenArguments>(
        orElse: () => const TransactionScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i25.TransactionScreen(key: args.key),
        settings: data,
      );
    },
    _i26.FundScreen: (data) {
      final args = data.getArgs<FundScreenArguments>(
        orElse: () => const FundScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i26.FundScreen(key: args.key),
        settings: data,
      );
    },
    _i27.FundWalletPayScreen: (data) {
      final args = data.getArgs<FundWalletPayScreenArguments>(
        orElse: () => const FundWalletPayScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i27.FundWalletPayScreen(
          key: args.key,
          screenName: args.screenName,
          amount: args.amount,
        ),
        settings: data,
      );
    },
    _i28.PaymentStatusScreen: (data) {
      final args = data.getArgs<PaymentStatusScreenArguments>(nullOk: false);
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i28.PaymentStatusScreen(
          key: args.key,
          isSuccessful: args.isSuccessful,
        ),
        settings: data,
      );
    },
    _i29.ViewMedicationScreen: (data) {
      final args = data.getArgs<ViewMedicationScreenArguments>(nullOk: false);
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i29.ViewMedicationScreen(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i30.PharmacySignUpScreen: (data) {
      final args = data.getArgs<PharmacySignUpScreenArguments>(
        orElse: () => const PharmacySignUpScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i30.PharmacySignUpScreen(key: args.key),
        settings: data,
      );
    },
    _i31.PharmacySetupPinScreen: (data) {
      final args = data.getArgs<PharmacySetupPinScreenArguments>(
        orElse: () => const PharmacySetupPinScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i31.PharmacySetupPinScreen(key: args.key),
        settings: data,
      );
    },
    _i32.PharmacyLoginScreen: (data) {
      final args = data.getArgs<PharmacyLoginScreenArguments>(
        orElse: () => const PharmacyLoginScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i32.PharmacyLoginScreen(key: args.key),
        settings: data,
      );
    },
    _i33.PharmacyChangePhoneNumber: (data) {
      final args = data.getArgs<PharmacyChangePhoneNumberArguments>(
        nullOk: false,
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i33.PharmacyChangePhoneNumber(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i34.PharmacyForgotPinScreen: (data) {
      final args = data.getArgs<PharmacyForgotPinScreenArguments>(
        orElse: () => const PharmacyForgotPinScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i34.PharmacyForgotPinScreen(key: args.key),
        settings: data,
      );
    },
    _i35.PharmacyResetPinScreen: (data) {
      final args = data.getArgs<PharmacyResetPinScreenArguments>(
        orElse: () => const PharmacyResetPinScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i35.PharmacyResetPinScreen(
          key: args.key,
          phone: args.phone,
          resetToken: args.resetToken,
        ),
        settings: data,
      );
    },
    _i36.PharmacyWelcomeScreen: (data) {
      final args = data.getArgs<PharmacyWelcomeScreenArguments>(
        orElse: () => const PharmacyWelcomeScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i36.PharmacyWelcomeScreen(key: args.key, phone: args.phone),
        settings: data,
      );
    },
    _i37.KycScreen: (data) {
      final args = data.getArgs<KycScreenArguments>(
        orElse: () => const KycScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i37.KycScreen(key: args.key),
        settings: data,
      );
    },
    _i38.PharmacySettingScreen: (data) {
      final args = data.getArgs<PharmacySettingScreenArguments>(
        orElse: () => const PharmacySettingScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i38.PharmacySettingScreen(key: args.key),
        settings: data,
      );
    },
    _i39.PharmResetSuccessScreen: (data) {
      final args = data.getArgs<PharmResetSuccessScreenArguments>(
        orElse: () => const PharmResetSuccessScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i39.PharmResetSuccessScreen(key: args.key),
        settings: data,
      );
    },
    _i40.UsersScreen: (data) {
      final args = data.getArgs<UsersScreenArguments>(
        orElse: () => const UsersScreenArguments(),
      );
      return _i43.MaterialPageRoute<dynamic>(
        builder: (context) => _i40.UsersScreen(key: args.key),
        settings: data,
      );
    },
    _i41.MoreScreen: (data) {
      final args = data.getArgs<MoreScreenArguments>(
        orElse: () => const MoreScreenArguments(),
      );
      return _i43.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i41.MoreScreen(key: args.key),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideRight,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    _i42.PharmMoreScreen: (data) {
      final args = data.getArgs<PharmMoreScreenArguments>(
        orElse: () => const PharmMoreScreenArguments(),
      );
      return _i43.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i42.PharmMoreScreen(key: args.key),
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

  final _i43.Key? key;

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

class PharmacyDashboardArguments {
  const PharmacyDashboardArguments({this.key, this.index});

  final _i43.Key? key;

  final int? index;

  @override
  String toString() {
    return '{"key": "$key", "index": "$index"}';
  }

  @override
  bool operator ==(covariant PharmacyDashboardArguments other) {
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

  final _i43.Key? key;

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

  final _i43.Key? key;

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

  final _i43.Key? key;

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
  const ChangePhoneNumberArguments({this.key, required this.id});

  final _i43.Key? key;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant ChangePhoneNumberArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class SetupPinScreenArguments {
  const SetupPinScreenArguments({this.key});

  final _i43.Key? key;

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

  final _i43.Key? key;

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
  const WelcomeScreenArguments({this.key, this.phone});

  final _i43.Key? key;

  final String? phone;

  @override
  String toString() {
    return '{"key": "$key", "phone": "$phone"}';
  }

  @override
  bool operator ==(covariant WelcomeScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.phone == phone;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phone.hashCode;
  }
}

class ForgotPinScreenArguments {
  const ForgotPinScreenArguments({this.key});

  final _i43.Key? key;

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
  const ResetPinScreenArguments({this.key, this.phone});

  final _i43.Key? key;

  final String? phone;

  @override
  String toString() {
    return '{"key": "$key", "phone": "$phone"}';
  }

  @override
  bool operator ==(covariant ResetPinScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.phone == phone;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phone.hashCode;
  }
}

class SuccessScreenArguments {
  const SuccessScreenArguments({this.key});

  final _i43.Key? key;

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

  final _i43.Key? key;

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

class PharmacyProfileScreenArguments {
  const PharmacyProfileScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmacyProfileScreenArguments other) {
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

  final _i43.Key? key;

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

class PharmacyProfileInfoScreenArguments {
  const PharmacyProfileInfoScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmacyProfileInfoScreenArguments other) {
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

  final _i43.Key? key;

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

class ResetPinPadScreenArguments {
  const ResetPinPadScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ResetPinPadScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AskMeScreenArguments {
  const AskMeScreenArguments({this.key, this.inText, this.isDashboard = false});

  final _i43.Key? key;

  final String? inText;

  final bool? isDashboard;

  @override
  String toString() {
    return '{"key": "$key", "inText": "$inText", "isDashboard": "$isDashboard"}';
  }

  @override
  bool operator ==(covariant AskMeScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.inText == inText &&
        other.isDashboard == isDashboard;
  }

  @override
  int get hashCode {
    return key.hashCode ^ inText.hashCode ^ isDashboard.hashCode;
  }
}

class EmptyNotificationArguments {
  const EmptyNotificationArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant EmptyNotificationArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class FaqScreenArguments {
  const FaqScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant FaqScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SplashScreenArguments {
  const SplashScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SplashScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class WalletScreenArguments {
  const WalletScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant WalletScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class TransactionScreenArguments {
  const TransactionScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant TransactionScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class FundScreenArguments {
  const FundScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant FundScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class FundWalletPayScreenArguments {
  const FundWalletPayScreenArguments({this.key, this.screenName, this.amount});

  final _i43.Key? key;

  final String? screenName;

  final String? amount;

  @override
  String toString() {
    return '{"key": "$key", "screenName": "$screenName", "amount": "$amount"}';
  }

  @override
  bool operator ==(covariant FundWalletPayScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.screenName == screenName &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return key.hashCode ^ screenName.hashCode ^ amount.hashCode;
  }
}

class PaymentStatusScreenArguments {
  const PaymentStatusScreenArguments({this.key, required this.isSuccessful});

  final _i43.Key? key;

  final bool isSuccessful;

  @override
  String toString() {
    return '{"key": "$key", "isSuccessful": "$isSuccessful"}';
  }

  @override
  bool operator ==(covariant PaymentStatusScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isSuccessful == isSuccessful;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isSuccessful.hashCode;
  }
}

class ViewMedicationScreenArguments {
  const ViewMedicationScreenArguments({this.key, required this.id});

  final _i43.Key? key;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant ViewMedicationScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class PharmacySignUpScreenArguments {
  const PharmacySignUpScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmacySignUpScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PharmacySetupPinScreenArguments {
  const PharmacySetupPinScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmacySetupPinScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PharmacyLoginScreenArguments {
  const PharmacyLoginScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmacyLoginScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PharmacyChangePhoneNumberArguments {
  const PharmacyChangePhoneNumberArguments({this.key, required this.id});

  final _i43.Key? key;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant PharmacyChangePhoneNumberArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class PharmacyForgotPinScreenArguments {
  const PharmacyForgotPinScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmacyForgotPinScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PharmacyResetPinScreenArguments {
  const PharmacyResetPinScreenArguments({
    this.key,
    this.phone,
    this.resetToken,
  });

  final _i43.Key? key;

  final String? phone;

  final String? resetToken;

  @override
  String toString() {
    return '{"key": "$key", "phone": "$phone", "resetToken": "$resetToken"}';
  }

  @override
  bool operator ==(covariant PharmacyResetPinScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.phone == phone &&
        other.resetToken == resetToken;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phone.hashCode ^ resetToken.hashCode;
  }
}

class PharmacyWelcomeScreenArguments {
  const PharmacyWelcomeScreenArguments({this.key, this.phone});

  final _i43.Key? key;

  final String? phone;

  @override
  String toString() {
    return '{"key": "$key", "phone": "$phone"}';
  }

  @override
  bool operator ==(covariant PharmacyWelcomeScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.phone == phone;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phone.hashCode;
  }
}

class KycScreenArguments {
  const KycScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant KycScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PharmacySettingScreenArguments {
  const PharmacySettingScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmacySettingScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PharmResetSuccessScreenArguments {
  const PharmResetSuccessScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmResetSuccessScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class UsersScreenArguments {
  const UsersScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant UsersScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class MoreScreenArguments {
  const MoreScreenArguments({this.key});

  final _i43.Key? key;

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

class PharmMoreScreenArguments {
  const PharmMoreScreenArguments({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PharmMoreScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i44.NavigationService {
  Future<dynamic> navigateToDashboard({
    _i43.Key? key,
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

  Future<dynamic> navigateToPharmacyDashboard({
    _i43.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacyDashboard,
      arguments: PharmacyDashboardArguments(key: key, index: index),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRoleOnboarding({
    _i43.Key? key,
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
    _i43.Key? key,
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
    _i43.Key? key,
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
    _i43.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.changePhoneNumber,
      arguments: ChangePhoneNumberArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSetupPinScreen({
    _i43.Key? key,
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
    _i43.Key? key,
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
    _i43.Key? key,
    String? phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.welcomeScreen,
      arguments: WelcomeScreenArguments(key: key, phone: phone),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToForgotPinScreen({
    _i43.Key? key,
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
    _i43.Key? key,
    String? phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.resetPinScreen,
      arguments: ResetPinScreenArguments(key: key, phone: phone),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSuccessScreen({
    _i43.Key? key,
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
    _i43.Key? key,
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

  Future<dynamic> navigateToPharmacyProfileScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacyProfileScreen,
      arguments: PharmacyProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProfileInfoScreen({
    _i43.Key? key,
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

  Future<dynamic> navigateToPharmacyProfileInfoScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacyProfileInfoScreen,
      arguments: PharmacyProfileInfoScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSupportScreen({
    _i43.Key? key,
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

  Future<dynamic> navigateToResetPinPadScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.resetPinPadScreen,
      arguments: ResetPinPadScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAskMeScreen({
    _i43.Key? key,
    String? inText,
    bool? isDashboard = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.askMeScreen,
      arguments: AskMeScreenArguments(
        key: key,
        inText: inText,
        isDashboard: isDashboard,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEmptyNotification({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.emptyNotification,
      arguments: EmptyNotificationArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToFaqScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.faqScreen,
      arguments: FaqScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSplashScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.splashScreen,
      arguments: SplashScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWalletScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.walletScreen,
      arguments: WalletScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToTransactionScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.transactionScreen,
      arguments: TransactionScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToFundScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.fundScreen,
      arguments: FundScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToFundWalletPayScreen({
    _i43.Key? key,
    String? screenName,
    String? amount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.fundWalletPayScreen,
      arguments: FundWalletPayScreenArguments(
        key: key,
        screenName: screenName,
        amount: amount,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPaymentStatusScreen({
    _i43.Key? key,
    required bool isSuccessful,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.paymentStatusScreen,
      arguments: PaymentStatusScreenArguments(
        key: key,
        isSuccessful: isSuccessful,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToViewMedicationScreen({
    _i43.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.viewMedicationScreen,
      arguments: ViewMedicationScreenArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmacySignUpScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacySignUpScreen,
      arguments: PharmacySignUpScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmacySetupPinScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacySetupPinScreen,
      arguments: PharmacySetupPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmacyLoginScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacyLoginScreen,
      arguments: PharmacyLoginScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmacyChangePhoneNumber({
    _i43.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacyChangePhoneNumber,
      arguments: PharmacyChangePhoneNumberArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmacyForgotPinScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacyForgotPinScreen,
      arguments: PharmacyForgotPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmacyResetPinScreen({
    _i43.Key? key,
    String? phone,
    String? resetToken,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacyResetPinScreen,
      arguments: PharmacyResetPinScreenArguments(
        key: key,
        phone: phone,
        resetToken: resetToken,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmacyWelcomeScreen({
    _i43.Key? key,
    String? phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacyWelcomeScreen,
      arguments: PharmacyWelcomeScreenArguments(key: key, phone: phone),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToKycScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.kycScreen,
      arguments: KycScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmacySettingScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmacySettingScreen,
      arguments: PharmacySettingScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPharmResetSuccessScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmResetSuccessScreen,
      arguments: PharmResetSuccessScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUsersScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.usersScreen,
      arguments: UsersScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMoreScreen({
    _i43.Key? key,
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

  Future<dynamic> navigateToPharmMoreScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.pharmMoreScreen,
      arguments: PharmMoreScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithDashboard({
    _i43.Key? key,
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

  Future<dynamic> replaceWithPharmacyDashboard({
    _i43.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacyDashboard,
      arguments: PharmacyDashboardArguments(key: key, index: index),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithRoleOnboarding({
    _i43.Key? key,
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
    _i43.Key? key,
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
    _i43.Key? key,
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
    _i43.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.changePhoneNumber,
      arguments: ChangePhoneNumberArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSetupPinScreen({
    _i43.Key? key,
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
    _i43.Key? key,
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
    _i43.Key? key,
    String? phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.welcomeScreen,
      arguments: WelcomeScreenArguments(key: key, phone: phone),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithForgotPinScreen({
    _i43.Key? key,
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
    _i43.Key? key,
    String? phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.resetPinScreen,
      arguments: ResetPinScreenArguments(key: key, phone: phone),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSuccessScreen({
    _i43.Key? key,
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
    _i43.Key? key,
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

  Future<dynamic> replaceWithPharmacyProfileScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacyProfileScreen,
      arguments: PharmacyProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithProfileInfoScreen({
    _i43.Key? key,
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

  Future<dynamic> replaceWithPharmacyProfileInfoScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacyProfileInfoScreen,
      arguments: PharmacyProfileInfoScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSupportScreen({
    _i43.Key? key,
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

  Future<dynamic> replaceWithResetPinPadScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.resetPinPadScreen,
      arguments: ResetPinPadScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithAskMeScreen({
    _i43.Key? key,
    String? inText,
    bool? isDashboard = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.askMeScreen,
      arguments: AskMeScreenArguments(
        key: key,
        inText: inText,
        isDashboard: isDashboard,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithEmptyNotification({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.emptyNotification,
      arguments: EmptyNotificationArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithFaqScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.faqScreen,
      arguments: FaqScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSplashScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.splashScreen,
      arguments: SplashScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWalletScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.walletScreen,
      arguments: WalletScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithTransactionScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.transactionScreen,
      arguments: TransactionScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithFundScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.fundScreen,
      arguments: FundScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithFundWalletPayScreen({
    _i43.Key? key,
    String? screenName,
    String? amount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.fundWalletPayScreen,
      arguments: FundWalletPayScreenArguments(
        key: key,
        screenName: screenName,
        amount: amount,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPaymentStatusScreen({
    _i43.Key? key,
    required bool isSuccessful,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.paymentStatusScreen,
      arguments: PaymentStatusScreenArguments(
        key: key,
        isSuccessful: isSuccessful,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithViewMedicationScreen({
    _i43.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.viewMedicationScreen,
      arguments: ViewMedicationScreenArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmacySignUpScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacySignUpScreen,
      arguments: PharmacySignUpScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmacySetupPinScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacySetupPinScreen,
      arguments: PharmacySetupPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmacyLoginScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacyLoginScreen,
      arguments: PharmacyLoginScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmacyChangePhoneNumber({
    _i43.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacyChangePhoneNumber,
      arguments: PharmacyChangePhoneNumberArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmacyForgotPinScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacyForgotPinScreen,
      arguments: PharmacyForgotPinScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmacyResetPinScreen({
    _i43.Key? key,
    String? phone,
    String? resetToken,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacyResetPinScreen,
      arguments: PharmacyResetPinScreenArguments(
        key: key,
        phone: phone,
        resetToken: resetToken,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmacyWelcomeScreen({
    _i43.Key? key,
    String? phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacyWelcomeScreen,
      arguments: PharmacyWelcomeScreenArguments(key: key, phone: phone),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithKycScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.kycScreen,
      arguments: KycScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmacySettingScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmacySettingScreen,
      arguments: PharmacySettingScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPharmResetSuccessScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmResetSuccessScreen,
      arguments: PharmResetSuccessScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithUsersScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.usersScreen,
      arguments: UsersScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithMoreScreen({
    _i43.Key? key,
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

  Future<dynamic> replaceWithPharmMoreScreen({
    _i43.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.pharmMoreScreen,
      arguments: PharmMoreScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
