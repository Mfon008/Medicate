import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool isPhone = false;
  bool isPhoneValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        surfaceTintColor: Colors.transparent, // removes Material3 tint
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(14.w),
          child: GlobalNavigator(),
        ),
        title: TextView(
          text: 'Profile Information',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Bio Data',
                    textStyle: TextStyle(
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Divider(color: const Color.fromARGB(255, 227, 227, 228)),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'Phone number',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
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

                      TextView(
                        text: 'Change Photo',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
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
                            label: '',

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
                              final result = AppValidator.validatePhone()(
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
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Full name',
                    hintSize: 14,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '',

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validateString(),
                    onChange: (p0) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Date of Birth',
                    hintSize: 14,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: 'YYYY/MM/DD',

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validateString(),
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(14.10.w),
                      child: SvgPicture.asset(AppImage.calendar),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Age',
                    hintSize: 14,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '0 - 100',

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Gender',
                    hintSize: 14,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '--Select--',

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validateString(),
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(14.20.w),
                      child: SvgPicture.asset(AppImage.arrow_down),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Country',
                    hintSize: 14,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '--Select--',

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validateString(),
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(14.20.w),
                      child: SvgPicture.asset(AppImage.arrow_down),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  TextView(
                    text: 'Physical Measurement',
                    textStyle: TextStyle(
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Divider(color: const Color.fromARGB(255, 227, 227, 228)),
                  SizedBox(height: 6.h),

                  TextFormWidget(
                    hint: 'Height (ft/in)',
                    hintSize: 14,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '--Select--',

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validateString(),
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(14.20.w),
                      child: SvgPicture.asset(AppImage.arrow_down),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Weight (Kg)',
                    hintSize: 14,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '--Select--',

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validateString(),
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(14.20.w),
                      child: SvgPicture.asset(AppImage.arrow_down),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.h),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.white,
                    buttonText: 'Discard',
                    color: AppColors.primary,
                    buttonBorderColor: AppColors.primary,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // _modalBottomSheetMenu(phoneNo: phoneController.text);
                      }
                    },
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.primary,
                    buttonText: 'Save Changes',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // _modalBottomSheetMenu(phoneNo: phoneController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
