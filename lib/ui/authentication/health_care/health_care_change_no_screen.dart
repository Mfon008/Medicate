// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/health_care_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class HealthCareChangePhoneNumber extends StatefulWidget {
  HealthCareChangePhoneNumber({super.key, required this.id});

  String? id;
  String? name;

  @override
  State<HealthCareChangePhoneNumber> createState() =>
      _HealthCareChangePhoneNumberState();
}

class _HealthCareChangePhoneNumberState
    extends State<HealthCareChangePhoneNumber> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  bool isPhoneValid = false;
  bool isPhone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ViewModelBuilder<HealthCareViewModel>.reactive(
        viewModelBuilder: () => HealthCareViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, HealthCareViewModel model, _) {
          return SingleChildScrollView(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 60.w,
              horizontal: 16.w,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlobalNavigator(),
                      SvgPicture.asset(
                        AppImage.applogoSvg,
                        width: 116.w,
                        height: 28.h,
                      ),
                      SizedBox(height: 30.h, width: 30.w),
                    ],
                  ),
                  SizedBox(height: 26.0.h),
                  TextView(
                    text: 'Change Phone Number',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text:
                        'Please enter a valid phone number to complete verification',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 24.0.h),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      TextView(
                        text: 'Phone Number',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),

                      Positioned(
                        right: -12.10,
                        child: TextView(
                          text: '*',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(13.8.w),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(0.r),
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(0.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImage.nigeria,
                              width: 22.w,
                              height: 22.h,
                            ),
                            SizedBox(width: 4.w),
                            TextView(
                              text: '+234',
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontSize: 14.2.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: Container(
                          margin: isPhoneValid
                              ? EdgeInsets.only(top: 20.w)
                              : EdgeInsets.zero, // Add margin if invalid

                          child: TextFormWidget(
                            hint: null,
                            borderColor: AppColors.transparent,
                            borderTopLeft: 0,
                            borderTopRight: 10,
                            borderBottomLeft: 0,
                            borderBottomRight: 10,
                            label: 'Best number to reach you?',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: phoneController,
                            onChange: (p0) {
                              if (p0.isEmpty) {
                                isPhone = false;
                              } else {
                                isPhone = true;
                              }
                              setState(() {});
                            },
                            validator: (value) {
                              final result = AppValidator.validatePhoneNew()(
                                value,
                              );
                              if (result != null) {
                                isPhoneValid = true;
                              } else {
                                isPhoneValid = false;
                              }
                              setState(() {});
                              return result;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 370.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: !isPassed(isPhone: isPhone)
                        ? AppColors.buttonGrey1
                        : AppColors.primary,
                    buttonText: 'Continue',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    isLoading: model.isLoading,
                    onPressed: !isPassed(isPhone: isPhone)
                        ? () {}
                        : () {
                            if (formKey.currentState!.validate()) {
                              model.changeNumberHealthCare(
                                context,
                                phone: '+234${phoneController.text.trim()}',
                                id: widget.id,
                              );
                            }
                          },
                  ),
                  SizedBox(height: 16.30.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isPassed({required bool isPhone}) {
    if (isPhone == true) {
      return true;
    }
    return false;
  }
}
