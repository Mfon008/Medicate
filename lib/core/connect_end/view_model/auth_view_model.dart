// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, strict_top_level_inference
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../repo/repo_impl.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;

  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  bool get isTogglePasswordConfirm => _isTogglePasswordConfirm;
  bool _isTogglePasswordConfirm = false;
  bool onToggleMic = false;

  AuthViewModel({this.context});

  // void signIn(context, {SignInEntityModel? signInEntity}) async {
  //   try {
  //     _isLoading = true;
      // _signInResponseModel = await runBusyFuture(
      //   repositoryImply.signIn(signInEntity!),
      //   throwException: true,
      // );
      // _isLoading = false;

      // await AppUtils.snackbar(context, message: 'Your login is successful.!');

      // navigate.navigateTo(Routes.dashboard);
    // } catch (e) {
    //   _isLoading = false;
    //   logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
  //   }
  //   notifyListeners();
  // }

}
