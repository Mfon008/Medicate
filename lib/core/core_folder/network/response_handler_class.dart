import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../config/colors.dart';
import '../../connect_end/view_model/auth_view_model.dart';

mixin ResponseHandler {
  void handleExpiredToken() => _showLogoutDialog();

  void _showLogoutDialog() {
    final content = Text(
      "Invalid token",
      style: TextStyle(color: AppColors.grey1),
    );

    showDialog(
      context: PageRouter.globalContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final isIOS =
            Platform.isIOS || Theme.of(context).platform == TargetPlatform.iOS;

        return ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          onDispose: (viewModel) {},
          builder: (_, AuthViewModel model, _) {
            // ---------------------------
            // iOS dialog (Cupertino style)
            // ---------------------------
            if (isIOS) {
              return CupertinoAlertDialog(
                content: content,
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {},
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 13.2.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                  ),
                ],
              );
            }

            // ---------------------------
            // Android dialog (Material)
            // ---------------------------
            return AlertDialog(
              backgroundColor: Colors.white,
              content: content,
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class PageRouter {
  static late BuildContext globalContext;

  static void pushNamed(String routeName) {
    Navigator.of(globalContext).pushNamed(routeName);
  }

  static void pop() {
    if (Navigator.of(globalContext).canPop()) {
      Navigator.of(globalContext).pop();
    }
  }

  static void batchNavigate(List<Function()> navigationActions) {
    for (var action in navigationActions) {
      action();
    }
  }
}
