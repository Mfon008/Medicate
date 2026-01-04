// ignore_for_file: deprecated_member_use, strict_top_level_inference, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';
import '../../core/app_assets/app_utils.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../../core/connect_end/view_model/hmo_view_model.dart';

class HMODeactivateUserModalWidget extends StatelessWidget {
  const HMODeactivateUserModalWidget({
    super.key,
    this.userId,
    this.userName,
    required this.onSuccess,
    required this.onFailed,
    required this.parentContext,
  });

  final String? userId;
  final String? userName;
  final VoidCallback onSuccess;
  final VoidCallback onFailed;
  final BuildContext parentContext;

  void deactivateUser(modelPharm) async {
    await modelPharm.deactivateUser(parentContext, id: userId);
    if (modelPharm.vdeactivate != null &&
        modelPharm.vdeactivate['statusCode'] == 200) {
      onSuccess();
    } else {
      await AppUtils.snackbar(
        parentContext,
        message: modelPharm.vdeactivateErrorMessage,
        error: true,
      );
      onFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => HMOViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      builder: (_, HMOViewModel model, _) {
        return Container(
          color: AppColors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.white, size: 18),
                  label: Text("Close", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.w,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6.10.h),
              Dialog(
                insetPadding: EdgeInsets.all(16.20.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.4.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(34.w),
                            decoration: BoxDecoration(
                              color: AppColors.yellow.withOpacity(.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(24.w),
                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SvgPicture.asset(AppImage.exclam),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      TextView(
                        text: 'Remove User',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          color: AppColors.black,
                          fontSize: 18.20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextView(
                        text:
                            'Are you sure you want to make remove this sub-user ($userName)?',
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          color: AppColors.success,
                          fontSize: 14.20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 32.w,
                                vertical: 12.w,
                              ),
                            ),
                            child: TextView(
                              text: "Cancel",
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 15.6.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          // Continue Button
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => deactivateUser(model),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 12.w,
                                ),
                                elevation: 0,
                              ),
                              child: TextView(
                                text: "Yes, Continue",
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 15.6.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
