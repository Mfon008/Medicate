import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_pharmacy_entity_model.dart';
import 'package:medicate_app/ui/widget/button.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/app_assets/state_lga_format.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class PharmacySignUpScreen extends StatefulWidget {
  const PharmacySignUpScreen({super.key});

  @override
  State<PharmacySignUpScreen> createState() => _PharmacySignUpScreenState();
}

class _PharmacySignUpScreenState extends State<PharmacySignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController licenseNoController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();

  bool isChecked = false;
  bool isPhone = false;
  bool isPhoneValid = false;
  bool isName = false;

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ViewModelBuilder<PharmViewModel>.reactive(
        viewModelBuilder: () => PharmViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, PharmViewModel model, _) {
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
                  SizedBox(height: 28.0.h),
                  TextView(
                    text: 'Welcome to Medicate',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 4.10.h),
                  TextView(
                    text:
                        'Manage prescriptions and support patient care as a pharmacist.',
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
                          fontSize: 16.60.sp,
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
                            fontSize: 16.sp,
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
                              fontSize: 14.sp,
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
                  SizedBox(height: 16.h),
                  TextFormWidget(
                    hint: 'Pharmacy Name',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: 'Enter pharmacy name',
                    hintSize: isTablet(context)
                        ? 6.82.sp
                        : Platform.isAndroid
                        ? 16.98.sp
                        : 14.68.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validateString(),
                    onChange: (p0) {
                      if (p0.isEmpty) {
                        isName = false;
                      } else {
                        isName = true;
                      }
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 16.h),
                  TextFormWidget(
                    hint: 'Pharmacy Lincense Number',
                    isShowHint: true,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: 'Enter license number',
                    hintSize: isTablet(context)
                        ? 6.82.sp
                        : Platform.isAndroid
                        ? 16.98.sp
                        : 14.68.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: licenseNoController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),
                  TextFormWidget(
                    hint: 'Business Address',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: 'Enter business address',
                    hintSize: isTablet(context)
                        ? 6.82.sp
                        : Platform.isAndroid
                        ? 16.98.sp
                        : 14.68.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: businessAddressController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),

                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormWidget(
                          hint: 'State',
                          label: 'Select State',
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 16.sp : 15.46.sp,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          readOnly: true,
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: stateController,
                          suffixWidget: Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () async {
                                  final RenderBox button =
                                      context.findRenderObject() as RenderBox;

                                  final RenderBox overlay =
                                      Overlay.of(
                                            context,
                                          ).context.findRenderObject()
                                          as RenderBox;

                                  final Offset buttonPosition = button
                                      .localToGlobal(
                                        Offset.zero,
                                        ancestor: overlay,
                                      );

                                  final Size buttonSize = button.size;

                                  final selectedState = await showMenu<String>(
                                    context: context,

                                    position: RelativeRect.fromLTRB(
                                      buttonPosition.dx,
                                      buttonPosition.dy +
                                          buttonSize.height +
                                          5.h,
                                      overlay.size.width -
                                          buttonPosition.dx -
                                          buttonSize.width,
                                      0,
                                    ),

                                    constraints: BoxConstraints(
                                      minWidth: 200.w,
                                      maxWidth: 250.w,
                                      minHeight: 150.h,
                                      maxHeight: 450.h,
                                    ),

                                    color: AppColors.white,

                                    elevation: 4,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),

                                    items: stateLgaFormat
                                        .map<PopupMenuEntry<String>>((s) {
                                          final String state =
                                              s['state']?.toString() ?? '';

                                          return PopupMenuItem<String>(
                                            value: state,
                                            height: 38.h,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 14.w,
                                            ),
                                            child: TextView(
                                              text: state,
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 13.70.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          );
                                        })
                                        .toList(),
                                  );

                                  if (selectedState != null) {
                                    stateController.text = selectedState;

                                    // Reset LGA whenever state changes
                                    lgaController.clear();
                                    setState(() {});

                                    model.notifyListeners();
                                  }
                                },

                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.grey1,
                                  ),
                                ),
                              );
                            },
                          ),

                          validator: AppValidator.validateString(),

                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),

                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                      ),
                      SizedBox(width: 14.20.w),
                      Expanded(
                        child: TextFormWidget(
                          hint: 'LGA',
                          label: '-Select-',
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 16.sp : 15.46.sp,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: true,
                          controller: lgaController,
                          suffixWidget: Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () async {
                                  final RenderBox button =
                                      context.findRenderObject() as RenderBox;

                                  final RenderBox overlay =
                                      Overlay.of(
                                            context,
                                          ).context.findRenderObject()
                                          as RenderBox;

                                  final Offset buttonPosition = button
                                      .localToGlobal(
                                        Offset.zero,
                                        ancestor: overlay,
                                      );

                                  final Size buttonSize = button.size;

                                  final selectedState = stateLgaFormat
                                      .firstWhere(
                                        (state) =>
                                            state['state']
                                                .toString()
                                                .trim()
                                                .toLowerCase() ==
                                            stateController.text
                                                .trim()
                                                .toLowerCase(),
                                        orElse: () => <String, dynamic>{
                                          'state': '',
                                          'lgas': <String>[],
                                        },
                                      );

                                  final List<dynamic> lgas =
                                      selectedState['lgas'] ?? [];

                                  if (lgas.isEmpty) {
                                    return;
                                  }

                                  final selectedLga = await showMenu<String>(
                                    context: context,

                                    position: RelativeRect.fromLTRB(
                                      buttonPosition.dx,
                                      buttonPosition.dy +
                                          buttonSize.height +
                                          5.h,
                                      overlay.size.width -
                                          buttonPosition.dx -
                                          buttonSize.width,
                                      0,
                                    ),

                                    constraints: BoxConstraints(
                                      minWidth: 200.w,
                                      maxWidth: 250.w,
                                      minHeight: 110.h,
                                      maxHeight: 420.h,
                                    ),

                                    color: AppColors.white,

                                    elevation: 4,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),

                                    items: lgas.map<PopupMenuEntry<String>>((
                                      lga,
                                    ) {
                                      return PopupMenuItem<String>(
                                        value: lga.toString(),
                                        height: 38.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14.w,
                                        ),
                                        child: TextView(
                                          text: lga.toString(),
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 13.70.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );

                                  if (selectedLga != null) {
                                    lgaController.text = selectedLga;
                                    setState(() {});
                                    model.notifyListeners();
                                  }
                                },

                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.grey1,
                                  ),
                                ),
                              );
                            },
                          ),
                          validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),

                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  TextFormWidget(
                    hint: 'Email Address',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: 'Enter email address',
                    hintSize: isTablet(context)
                        ? 6.82.sp
                        : Platform.isAndroid
                        ? 16.98.sp
                        : 14.68.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: emailAddressController,
                    validator: AppValidator.validateEmail(),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: isTablet(context) ? 1.5 : 1.1,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          activeColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          visualDensity: VisualDensity
                              .compact, // 👈 reduces internal padding
                        ),
                      ), // 👈 small spacing you control
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              const TextSpan(text: "I agree to the "),
                              TextSpan(
                                text: "Terms of Use",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              const TextSpan(text: " and "),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor:
                        !isPassed(
                          isPhone: isPhone,
                          isName: isName,
                          isChecked: isChecked,
                        )
                        ? AppColors.buttonGrey1
                        : AppColors.primary,
                    buttonText: 'Sign Up',
                    color: AppColors.white,
                    isLoading: model.isLoading,
                    buttonBorderColor: AppColors.transparent,
                    onPressed:
                        !isPassed(
                          isPhone: isPhone,
                          isName: isName,
                          isChecked: isChecked,
                        )
                        ? () {}
                        : () {
                            if (formKey.currentState!.validate()) {
                              model.signUpPharmacy(
                                context,
                                signUpEntity: SignUpPharmacyEntityModel(
                                  name: nameController.text.trim(),
                                  phone: model
                                      .returnReminderPhoneStructureWith234(
                                        phoneController.text.trim(),
                                      ),
                                  licenseNumber: licenseNoController.text
                                      .trim(),
                                  businessAddress: businessAddressController
                                      .text
                                      .trim(),
                                  email: emailAddressController.text.trim(),
                                  state: stateController.text.trim(),
                                  lga: lgaController.text.trim(),
                                ),
                              );
                            }
                          },
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.buttonGrey1,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      TextView(
                        text: 'Or continue with',
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          color: AppColors.fineGrey,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Divider(
                          color: AppColors.buttonGrey1,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.symmetric(vertical: 15.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            border: Border.all(color: AppColors.buttonGrey1),
                          ),
                          child: SvgPicture.asset(
                            AppImage.google,
                            width: 22.w,
                            height: 22.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.symmetric(vertical: 15.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            border: Border.all(color: AppColors.buttonGrey1),
                          ),
                          child: SvgPicture.asset(
                            AppImage.facebook,
                            width: 22.w,
                            height: 22.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.30.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          const TextSpan(text: "Have a Medicate account? "),
                          TextSpan(
                            text: " Sign in",
                            style: TextStyle(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => navigate.navigateTo(
                                Routes.pharmacyLoginScreen,
                              ),
                          ),
                        ],
                      ),
                    ),
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

  bool isPassed({
    required bool isPhone,
    required bool isName,
    required bool isChecked,
  }) {
    if (isPhone == true && isName == true && isChecked == true) {
      return true;
    }
    return false;
  }
}
