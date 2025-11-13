// ignore_for_file: strict_top_level_inference

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/connect_end/model/get_city_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_pharmacy_kyc_response_model/get_pharmacy_kyc_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_state_response_model.dart';
import 'package:medicate_app/core/connect_end/model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_kyc_entity_model/update_pharmacy_kyc_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/upload_image_response_model/upload_image_response_model.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../ui/widget/button.dart';
import '../../../ui/widget/text.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../app_assets/app_utils.dart';
import '../../app_assets/app_validation.dart';
import '../../app_assets/country_code_format.dart';
import '../../app_assets/image.dart';
import '../../app_assets/image_picker.dart';
import '../../config/colors.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/change_phone_no_response_model/change_phone_no_response_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/sign_up_pharmacy_entity_model.dart';
import '../model/update_pharmacy_kyc_entity_model/document.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';
import '../repo/pharm_repo_impl.dart';

class PharmViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('PharmViewModel');

  final repositoryImply = PharmRepoImpl();

  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingMeansId = false;
  bool get isLoadingMeansId => _isLoadingMeansId;
  bool _isLoadingCAC = false;
  bool get isLoadingCAC => _isLoadingCAC;
  bool _isLoadingLicense = false;
  bool get isLoadingLicense => _isLoadingLicense;
  bool _isLoadingTIN = false;
  bool get isLoadingTIN => _isLoadingTIN;
  String? pinInput;
  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateAddUser = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateVerify = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateVerifyChange = GlobalKey<FormState>();
  SignUpPhamaryResponseModel? _signUpPhamaryResponseModel;
  SignUpPhamaryResponseModel? get signUpPhamaryResponseModel =>
      _signUpPhamaryResponseModel;
  VerifyPharmacyOtpModel? _verifyPharmOtpRespnseModel;
  VerifyPharmacyOtpModel? get verifyPharmOtpRespnseModel =>
      _verifyPharmOtpRespnseModel;
  SetPinPharmResponseModel? _setPinPharmResponseModel;
  SetPinPharmResponseModel? get setPinPharmResponseModel =>
      _setPinPharmResponseModel;
  PharmacyLoginResponseModel? _loginPharmacyResponseModel;
  PharmacyLoginResponseModel? get loginPharmacyResponseModel =>
      _loginPharmacyResponseModel;
  GetTenantResponseModel? _getTetantResponseModel;
  GetTenantResponseModel? get getTetantResponseModel => _getTetantResponseModel;
  GetUserDetailsResponseModel? _getUserDetailsResponseModel;
  GetUserDetailsResponseModel? get getUserDetailsResponseModel =>
      _getUserDetailsResponseModel;
  ResendOtpResponseModel? _resendOtpResponseModel;
  ResendOtpResponseModel? get resendOtpResponseModel => _resendOtpResponseModel;
  ChangePhoneNoResponseModel? _changePhoneNoResponseModel;
  ChangePhoneNoResponseModel? get changePhoneNoResponseModel =>
      _changePhoneNoResponseModel;
  ForgotPasswordResponseModel? _forgotPasswordResponseModel;
  ForgotPasswordResponseModel? get forgotPasswordResponseModel =>
      _forgotPasswordResponseModel;
  VerifyPassOtpRespnseModel? _verifyPassOtpRespnseModel;
  VerifyPassOtpRespnseModel? get verifyPassOtpRespnseModel =>
      _verifyPassOtpRespnseModel;

  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  TextEditingController meansIdController = TextEditingController();
  GlobalKey<FormState> formKeyValidate2 = GlobalKey<FormState>();
  bool? onTapToAddUser = false;
  bool? onTapToAddRole = false;
  List<String> selectService = [];

  GetStateResponseModel? _getStateResponseModel;
  GetStateResponseModel? get getStateResponseModel => _getStateResponseModel;
  GetCityResponseModel? get getCityResponseModel => _getCityResponseModel;
  GetCityResponseModel? _getCityResponseModel;
  UploadImageResponseModel? _uploadImageResponseModel;
  UploadImageResponseModel? get uploadImageResponseModel =>
      _uploadImageResponseModel;
  UploadImageResponseModel? _uploadImageResponseModelMeansID;
  UploadImageResponseModel? get uploadImageResponseModelMeansID =>
      _uploadImageResponseModelMeansID;
  UploadImageResponseModel? _uploadImageResponseModelCAC;
  UploadImageResponseModel? get uploadImageResponseModelCAC =>
      _uploadImageResponseModelCAC;
  UploadImageResponseModel? _uploadImageResponseModelPharmLicense;
  UploadImageResponseModel? get uploadImageResponseModelPharmLicense =>
      _uploadImageResponseModelPharmLicense;
  UploadImageResponseModel? _uploadImageResponseModelTIN;
  UploadImageResponseModel? get uploadImageResponseModelTIN =>
      _uploadImageResponseModelTIN;
  GetPharmacyKycResponseModel? get getPharmacyKycResponseModel =>
      _getPharmacyKycResponseModel;
  GetPharmacyKycResponseModel? _getPharmacyKycResponseModel;

  final _pickImage = ImagePickerHandler();
  File? imageMeansId;
  String? filenameMeansId;
  File? imageCAC;
  String? filenameCAC;
  File? imageTIN;
  String? filenameTIN;
  File? imagePharmLicense;
  String? filenamePharmLicense;
  List<Document> kycDocumentsList = [];

  int _start = 60;
  String querySignUpCountry = '';
  String queryState = '';
  String queryLga = '';
  List services = [
    'Sell Medications',
    'Bulk Purchase',
    'Order Fulfilment',
    'Appointment Scheduling',
    'Setup Reminders for Customers',
  ];
  List meansId = [
    'Driver’s License',
    'International Passport ',
    'National ID',
    'Citizenship Card',
    'Biometric Residence Permit (BRP)',
    'State ID Card ',
    'Green Card/Resident Card',
    'Voter ID Card',
    'Asylum Seeker ID',
    'Alien ID Card',
  ];

  final List<int> selectedIndexes = [];

  PharmViewModel({this.context});

  final defaultPinTheme = PinTheme(
    width: 50.w,
    height: 50.h,
    margin: EdgeInsets.only(right: 10.w),
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      color: AppColors.grey, // light background
      border: Border.all(color: AppColors.transparent),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  void modalBottomSheetMenu({
    context,
    String? phoneNo,
    String? id,
    String? name,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9, // 80% of screen height
            minChildSize: 0.5, // Can be dragged to 30% of screen height
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => PharmViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, PharmViewModel model, __) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // 👈 pushes content above keyboard
                    ), //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                            horizontal: 20.w,
                          ),
                          child: Form(
                            key: formKeyValidate,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 30.w),
                                    TextView(
                                      text: 'Verify Phone Number',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        AppImage.x,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),

                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                    ),
                                    children: [
                                      const TextSpan(
                                        text:
                                            "Enter the 4-digit code we sent to your phone number ",
                                      ),
                                      TextSpan(
                                        text: "$phoneNo",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: " to complete your verification.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Center(
                                  child: Pinput(
                                    length: 4,
                                    obscureText: true,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    submittedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: AppValidator.validateOTP(),
                                    onCompleted: (pin) {
                                      print('Entered PIN: $pin');
                                      pinInput = pin;
                                      notifyListeners();
                                    },
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Didn’t receive a code? ",
                                        ),
                                        TextSpan(
                                          text: "Resend",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                model.resendOtpPharmacy(
                                                  context,
                                                  resendotp:
                                                      ResendOtpEntityModel(
                                                        phone: phoneNo,
                                                      ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Incorrect Number? ",
                                        ),
                                        TextSpan(
                                          text: "Change",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => navigate.navigateTo(
                                              Routes.pharmacyChangePhoneNumber,
                                              arguments:
                                                  PharmacyChangePhoneNumberArguments(
                                                    id: id,
                                                  ),
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: model.isLoading ? 20.h : 0.h),
                                model.isLoading
                                    ? Center(
                                        child: SpinKitFadingCircle(
                                          color: AppColors.primary,
                                          size: 28.sp,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(height: 300.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Verify',
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  isLoading: _isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    if (formKeyValidate.currentState!
                                        .validate()) {
                                      verifyOtpPharmacy(
                                        context,
                                        verifyEntity: VerifyPhoneEntityModel(
                                          phone: '$phoneNo',
                                          otp: pinInput,
                                        ),
                                      );
                                    }
                                    model.notifyListeners();
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void modalBottomSheetMenuVerifyPhone({
    context,
    String? phoneNo,
    String? id,
    String? name,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9, // 80% of screen height
            minChildSize: 0.5, // Can be dragged to 30% of screen height
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => PharmViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, PharmViewModel model, __) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // 👈 pushes content above keyboard
                    ), //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                            horizontal: 20.w,
                          ),
                          child: Form(
                            key: formKeyValidateVerify,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 30.w),
                                    TextView(
                                      text: 'Verify Phone Number',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        AppImage.x,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),

                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                    ),
                                    children: [
                                      const TextSpan(
                                        text:
                                            "Enter the 4-digit code we sent to your phone number ",
                                      ),
                                      TextSpan(
                                        text: "$phoneNo",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: " to complete your verification.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Center(
                                  child: Pinput(
                                    length: 4,
                                    obscureText: true,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    submittedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: AppValidator.validateOTP(),
                                    onCompleted: (pin) {
                                      print('Entered PIN: $pin');
                                      pinInput = pin;
                                      notifyListeners();
                                    },
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Didn’t receive a code? ",
                                        ),
                                        TextSpan(
                                          text: "Resend",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                model.resendOtpPharmacy(
                                                  context,
                                                  resendotp:
                                                      ResendOtpEntityModel(
                                                        phone: phoneNo,
                                                      ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Incorrect Number? ",
                                        ),
                                        TextSpan(
                                          text: "Change",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => navigate.navigateTo(
                                              Routes.pharmacyChangePhoneNumber,
                                              arguments:
                                                  PharmacyChangePhoneNumberArguments(
                                                    id: id,
                                                  ),
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: model.isLoading ? 20.h : 0.h),
                                model.isLoading
                                    ? Center(
                                        child: SpinKitFadingCircle(
                                          color: AppColors.primary,
                                          size: 28.sp,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(height: 300.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Verify',
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  isLoading: _isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    if (formKeyValidateVerify.currentState!
                                        .validate()) {
                                      verifyChangePhoneOtp(
                                        context: context,
                                        verifyPhoneEntity:
                                            VerifyPhoneEntityModel(
                                              phone: '$phoneNo',
                                              otp: pinInput,
                                            ),
                                      );
                                    }
                                    model.notifyListeners();
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void modalBottomSheetMenuChangeVerifyPhone({
    context,
    String? phoneNo,
    String? id,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9, // 80% of screen height
            minChildSize: 0.5, // Can be dragged to 30% of screen height
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => PharmViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, PharmViewModel model, __) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // 👈 pushes content above keyboard
                    ), //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                            horizontal: 20.w,
                          ),
                          child: Form(
                            key: formKeyValidateVerifyChange,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 30.w),
                                    TextView(
                                      text: 'Verify Phone Number',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        AppImage.x,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),

                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                    ),
                                    children: [
                                      const TextSpan(
                                        text:
                                            "Enter the 4-digit code we sent to your phone number ",
                                      ),
                                      TextSpan(
                                        text: "$phoneNo",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: " to complete your verification.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Center(
                                  child: Pinput(
                                    length: 4,
                                    obscureText: true,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    submittedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: AppValidator.validateOTP(),
                                    onCompleted: (pin) {
                                      print('Entered PIN: $pin');
                                      pinInput = pin;
                                      notifyListeners();
                                    },
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Didn’t receive a code? ",
                                        ),
                                        TextSpan(
                                          text: "Resend",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                model.resendOtpPharmacy(
                                                  context,
                                                  resendotp:
                                                      ResendOtpEntityModel(
                                                        phone: phoneNo,
                                                      ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Incorrect Number? ",
                                        ),
                                        TextSpan(
                                          text: "Change",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => navigate.navigateTo(
                                              Routes.pharmacyChangePhoneNumber,
                                              arguments:
                                                  PharmacyChangePhoneNumberArguments(
                                                    id: id,
                                                  ),
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: model.isLoading ? 20.h : 0.h),
                                model.isLoading
                                    ? Center(
                                        child: SpinKitFadingCircle(
                                          color: AppColors.primary,
                                          size: 28.sp,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(height: 300.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Verify',
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  isLoading: _isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    if (formKeyValidateVerifyChange
                                        .currentState!
                                        .validate()) {
                                      verifyChangePhoneOtpChange(
                                        context: context,
                                        verifyPhoneEntity:
                                            VerifyPhoneEntityModel(
                                              phone: '$phoneNo',
                                              otp: pinInput,
                                            ),
                                      );
                                    }
                                    model.notifyListeners();
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void signUpPharmacy(
    context, {
    SignUpPharmacyEntityModel? signUpEntity,
  }) async {
    try {
      _isLoading = true;
      _signUpPhamaryResponseModel = await runBusyFuture(
        repositoryImply.signUp(signUpEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_signUpPhamaryResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _signUpPhamaryResponseModel?.message,
        );
        modalBottomSheetMenu(
          context: context,
          phoneNo: signUpEntity.phone,
          id: _signUpPhamaryResponseModel?.data?.tenantId,
          name: signUpEntity.name,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void modalBottomSheetMenuCountry(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5, // 50% of screen height
            minChildSize: 0.3, // Can be dragged to 30% of screen height
            maxChildSize: 0.9, // Can be dragged to 90% of screen height
            builder: (context, scrollController) {
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => PharmViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, PharmViewModel model, __) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        SizedBox(height: 22.0.h),
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: TextFormWidget(
                            label: 'Search country',
                            isFilled: true,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            fillColor: AppColors.grey,
                            onChange: (p0) {
                              querySignUpCountry = p0;
                              model.notifyListeners();
                            },
                            suffixIcon: Icons.search_sharp,
                            controller: countryController,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        querySignUpCountry == ''
                            ? SizedBox(
                                width: 400.w,
                                child: Column(
                                  children: [
                                    ...countryCodeFormat.map(
                                      (e) => GestureDetector(
                                        onTap: () {
                                          countryController.text = e['country'];
                                          Navigator.pop(context);
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4.6.w,
                                            horizontal: 20.w,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(6.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.transparent,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 160.w,
                                                  child: TextView(
                                                    text: '${e['country']}',
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Arial',
                                                      fontSize: 17.2.sp,

                                                      color: AppColors.black,
                                                    ),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),

                                                buildImage(e['Flag']),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  ...countryCodeFormat
                                      .where(
                                        (o) => o['country']!
                                            .toLowerCase()
                                            .contains(
                                              querySignUpCountry.toLowerCase(),
                                            ),
                                      )
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            countryController.text =
                                                e['country']!;
                                            Navigator.pop(context);
                                            model.notifyListeners();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 4.6.w,
                                              horizontal: 20.w,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(6.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.transparent,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 180.w,
                                                    child: TextView(
                                                      text: '${e['country']}',
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Arial',
                                                        fontSize: 17.2.sp,

                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  buildImage(e['Flag']),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                        SizedBox(height: 14.0.h),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Future<void> fetchStates(String country) async {
    final uri = Uri.parse(
      'https://countriesnow.space/api/v0.1/countries/states/q',
    ).replace(queryParameters: {'country': country});

    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        _getStateResponseModel = GetStateResponseModel.fromJson(jsonData);
        print('✅ Success: ${_getStateResponseModel?.toJson()}');
      } else {
        print('❌ Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('⚠️ Exception: $e');
    }
    notifyListeners();
  }

  Future<void> fetchLga({String? country, String? state}) async {
    final uri = Uri.parse(
      'https://countriesnow.space/api/v0.1/countries/state/cities/q',
    ).replace(queryParameters: {'country': country, 'state': state});

    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        _getCityResponseModel = GetCityResponseModel.fromJson(jsonData);
        print('✅ Success: ${_getCityResponseModel?.toJson()}');
      } else {
        print('❌ Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('⚠️ Exception: $e');
    }
    notifyListeners();
  }

  void modalBottomSheetMenuState(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5, // 50% of screen height
            minChildSize: 0.3, // Can be dragged to 30% of screen height
            maxChildSize: 0.9, // Can be dragged to 90% of screen height
            builder: (context, scrollController) {
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => PharmViewModel(),
                onViewModelReady: (model) async {
                  await model.fetchStates(countryController.text);
                },
                disposeViewModel: false,
                builder: (_, PharmViewModel model, __) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 22.0.h),
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: TextFormWidget(
                            label: 'Search state',
                            isFilled: true,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            fillColor: AppColors.grey,
                            onChange: (p0) {
                              queryState = p0;
                              model.notifyListeners();
                            },
                            suffixIcon: Icons.search_sharp,
                            controller: stateController,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        queryState == ''
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (model.getStateResponseModel != null &&
                                      model
                                          .getStateResponseModel!
                                          .data!
                                          .states!
                                          .isNotEmpty)
                                    ...model
                                        .getStateResponseModel!
                                        .data!
                                        .states!
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              stateController.text = e.name!;
                                              Navigator.pop(context);
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 4.6.w,
                                                horizontal: 20.w,
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.all(6.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppColors.transparent,
                                                ),
                                                child: TextView(
                                                  text: '${e.name}',
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 17.2.sp,

                                                    color: AppColors.black,
                                                  ),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (model.getStateResponseModel != null &&
                                      model
                                          .getStateResponseModel!
                                          .data!
                                          .states!
                                          .isNotEmpty)
                                    ...model
                                        .getStateResponseModel!
                                        .data!
                                        .states!
                                        .where(
                                          (o) => o.name!.toLowerCase().contains(
                                            queryState.toLowerCase(),
                                          ),
                                        )
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              stateController.text = e.name!;
                                              Navigator.pop(context);
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 4.6.w,
                                                horizontal: 20.w,
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.all(6.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppColors.transparent,
                                                ),
                                                child: TextView(
                                                  text: '${e.name}',
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 17.2.sp,

                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                        SizedBox(height: 14.0.h),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void modalBottomSheetMenuLga(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5, // 50% of screen height
            minChildSize: 0.3, // Can be dragged to 30% of screen height
            maxChildSize: 0.9, // Can be dragged to 90% of screen height
            builder: (context, scrollController) {
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => PharmViewModel(),
                onViewModelReady: (model) {
                  model.fetchLga(
                    country: countryController.text,
                    state: stateController.text,
                  );
                },
                disposeViewModel: false,
                builder: (_, PharmViewModel model, __) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 22.0.h),
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: TextFormWidget(
                            label: 'Search city',
                            isFilled: true,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            fillColor: AppColors.grey,
                            onChange: (p0) {
                              queryLga = p0;
                              model.notifyListeners();
                            },
                            suffixIcon: Icons.search_sharp,
                            controller: lgaController,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        queryLga == ''
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (model.getCityResponseModel != null &&
                                      model
                                          .getCityResponseModel!
                                          .data!
                                          .isNotEmpty)
                                    ...model.getCityResponseModel!.data!.map(
                                      (e) => GestureDetector(
                                        onTap: () {
                                          lgaController.text = e;
                                          Navigator.pop(context);
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4.6.w,
                                            horizontal: 20.w,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(6.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.transparent,
                                            ),
                                            child: SizedBox(
                                              width: 200.w,
                                              child: TextView(
                                                text: e,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 17.2.sp,

                                                  color: AppColors.black,
                                                ),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...model.getCityResponseModel!.data!
                                      .where(
                                        (o) => o.toLowerCase().contains(
                                          queryLga.toLowerCase(),
                                        ),
                                      )
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            lgaController.text = e;
                                            Navigator.pop(context);
                                            model.notifyListeners();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 4.6.w,
                                              horizontal: 20.w,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(6.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.transparent,
                                              ),
                                              child: TextView(
                                                text: e,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 17.2.sp,

                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                        SizedBox(height: 14.0.h),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget buildImage(String path) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        path,
        height: 20.h,
        width: 30.w,
        fit: BoxFit.cover,
        placeholderBuilder: (context) => Container(
          height: 20.h,
          width: 30.w,
          decoration: BoxDecoration(color: AppColors.grey),
        ),
      );
    }
    return Image.network(
      path,
      height: 20.h,
      width: 30.w,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 20.h,
        width: 30.w,
        decoration: BoxDecoration(color: AppColors.grey),
      ),
    );
  }

  Widget chooseNotChannelWidget(
    context, {
    required String text,
    required bool isTapped,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.infoGrey1.withOpacity(.9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: isTapped ? EdgeInsets.all(4.0.w) : EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: isTapped ? AppColors.primary : AppColors.transparent,
              border: Border.all(
                color: isTapped ? AppColors.transparent : AppColors.infoGrey,
                width: .78,
              ),
            ),
            child: isTapped
                ? Icon(Icons.check, size: 12.sp, color: AppColors.white)
                : SizedBox.shrink(),
          ),
          SizedBox(width: 10.w),
          TextView(
            text: text,
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 13.82.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
        ],
      ),
    ),
  );

  void signInPharmacy(context, {LoginEntityModel? signInEntity}) async {
    try {
      _isLoading = true;
      _loginPharmacyResponseModel = await runBusyFuture(
        repositoryImply.signIn(signInEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_loginPharmacyResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _loginPharmacyResponseModel?.message ?? '',
        );
        navigate.navigateTo(Routes.pharmacyDashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getUserDetails({context, phoneNo}) async {
    try {
      _isLoading = true;
      _getUserDetailsResponseModel = await runBusyFuture(
        repositoryImply.getUserDetails(phoneNo),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true9090887781);
    }
    notifyListeners();
  }

  Future<void> getTenant(context) async {
    try {
      _isLoading = true;
      _getTetantResponseModel = await runBusyFuture(
        repositoryImply.getTenant(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  bool returnBool() {
    if (_getTetantResponseModel == null ||
        _getTetantResponseModel!.data!.bankDetails == null) {
      return true;
    }
    return false;
  }

  Future<void> getPharmacyKyc(context) async {
    try {
      _isLoading = true;
      _getPharmacyKycResponseModel = await runBusyFuture(
        repositoryImply.getPharmacyKyc(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void updatePharmacyKyc(
    context, {
    UpdatePharmacyKycEntityModel? updateKyc,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updatePharmacyKyc(updateKyc!),
        throwException: true,
      );
      if (v['statusCode'] == 200) {
        AppUtils.snackbar(context, message: v['message']);
      } else {
        AppUtils.snackbar(context, message: v['message'], error: true);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void updatePharmacy(
    context, {
    UpdatePharmacyProfileEntityModel? update,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updatePharmacy(update),
        throwException: true,
      );
      _isLoading = false;
      AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void changeNumberPharmacy(context, {String? phone, String? id}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.changePhoneNo(changePhoneNo: phone, id: id),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 200) {
        await AppUtils.snackbar(context, message: v['message']);
        modalBottomSheetMenuChangeVerifyPhone(context: context, phoneNo: phone);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void verifyOtpPharmacy(
    context, {
    VerifyPhoneEntityModel? verifyEntity,
  }) async {
    try {
      _isLoading = true;
      _verifyPharmOtpRespnseModel = await runBusyFuture(
        repositoryImply.verifyPhoneOtp(verifyEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_verifyPharmOtpRespnseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _verifyPharmOtpRespnseModel?.message,
        );

        navigate.navigateTo(Routes.pharmacySetupPinScreen);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void verifyChangePhoneOtp({
    context,
    VerifyPhoneEntityModel? verifyPhoneEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.verifyChangePhoneOtp(verifyPhoneEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);

        navigate.navigateTo(
          Routes.pharmacyChangePhoneNumber,
          arguments: PharmacyChangePhoneNumberArguments(
            id: v['data']['resetToken'],
          ),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void verifyChangePhoneOtpChange({
    context,
    VerifyPhoneEntityModel? verifyPhoneEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.verifyChangePhoneOtpChange(verifyPhoneEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);

        navigate.navigateTo(Routes.pharmacyLoginScreen);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void sendOtpPharmacy(context, {String? phone}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.sendOtp(phone!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);

        modalBottomSheetMenuVerifyPhone(context: context, phoneNo: phone);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void setPinPharmacy(context, {SetPinEntityModel? setPinEntityModel}) async {
    try {
      _isLoading = true;
      _setPinPharmResponseModel = await runBusyFuture(
        repositoryImply.setPin(setPinEntityModel!),
        throwException: true,
      );
      _isLoading = false;
      if (_setPinPharmResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _setPinPharmResponseModel?.message,
        );
        navigate.navigateTo(Routes.pharmacyDashboard);

        SharedPreferencesService.instance.pinSet = setPinEntityModel.pin!;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        _start--;
      }
      notifyListeners();
    });
  }

  void resendOtpPharmacy(context, {ResendOtpEntityModel? resendotp}) async {
    try {
      _isLoading = true;
      startTimer();
      _resendOtpResponseModel = await runBusyFuture(
        repositoryImply.resendOtp(resendotp!),
        throwException: true,
      );
      _isLoading = false;
      if (_resendOtpResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _resendOtpResponseModel?.message,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void resetPinPharmacy(
    context, {
    ResetPasswordEntityModel? resetPasswordEntityModel,
    String? resetToken,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.resetPin(
          resetPasswordEntity: resetPasswordEntityModel!,
          resetToken: resetToken,
        ),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['data']['message']);
        navigate.navigateTo(Routes.pharmResetSuccessScreen);
        SharedPreferencesService.instance.pinSet =
            resetPasswordEntityModel.newPin!;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void forgotPasswordPharmacy(
    context, {
    ResendOtpEntityModel? forgotPassword,
  }) async {
    try {
      _isLoading = true;
      _forgotPasswordResponseModel = await runBusyFuture(
        repositoryImply.forgotPasword(forgotPassword!),
        throwException: true,
      );
      _isLoading = false;
      if (_forgotPasswordResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _forgotPasswordResponseModel?.message,
        );
        modalBottomSheetMenuForgotPassword(
          context: context,
          phoneNo: forgotPassword.phone,
          id:
              SharedPreferencesService.instance.usersData['_id'] ??
              SharedPreferencesService.instance.usersData['id'],
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void modalBottomSheetMenuForgotPassword({
    context,
    String? phoneNo,
    String? id,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => locator<PharmViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, PharmViewModel model, __) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(
                  context,
                ).viewInsets.bottom, // 👈 pushes content above keyboard
              ), //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: 40.w,
                      horizontal: 20.w,
                    ),
                    child: Form(
                      key: formKeyValidate2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 30.h, width: 30.w),
                              TextView(
                                text: 'Verify Phone Number',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: SvgPicture.asset(
                                  AppImage.x,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18.h),

                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      "Enter the 4-digit code we sent to your phone number ",
                                ),
                                TextSpan(
                                  text: "$phoneNo",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                const TextSpan(
                                  text: " to complete your verification.",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Center(
                            child: Pinput(
                              length: 4,
                              obscureText: true,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: BoxDecoration(
                                  color: AppColors.transparent,
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration: BoxDecoration(
                                  color: AppColors.transparent,
                                  border: Border.all(color: AppColors.primary),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: AppValidator.validateOTP(),
                              onCompleted: (pin) {
                                print('Entered PIN: $pin');
                                pinInput = pin;
                                notifyListeners();
                              },
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.w,
                              horizontal: 16.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.skyBlue,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Didn’t receive a code? ",
                                  ),
                                  TextSpan(
                                    text: _start == 60 || _start == 0
                                        ? "Resend"
                                        : "$_start seconds",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => model.resendOtpPharmacy(
                                        context,
                                        resendotp: ResendOtpEntityModel(
                                          phone: phoneNo,
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.24.h),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.w,
                              horizontal: 16.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.skyBlue,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                                children: [
                                  const TextSpan(text: "Incorrect Number? "),
                                  TextSpan(
                                    text: "Change",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => navigate.navigateTo(
                                        Routes.changePhoneNumber,
                                        arguments: ChangePhoneNumberArguments(
                                          id: id,
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: model.isLoading ? 20.h : 0.h),
                          model.isLoading
                              ? Center(
                                  child: SpinKitFadingCircle(
                                    color: AppColors.primary,
                                    size: 28.sp,
                                  ),
                                )
                              : SizedBox.shrink(),
                          SizedBox(height: 70.h),
                          ButtonWidget(
                            border: 100.r,
                            buttonColor: AppColors.primary,
                            buttonText: 'Continue',
                            color: AppColors.white,
                            isLoading: model.isLoading,
                            buttonBorderColor: AppColors.transparent,
                            onPressed: () {
                              if (formKeyValidate2.currentState!.validate()) {
                                verifyForgotPasswordPharmacy(
                                  context,
                                  verifyPhoneEntity: VerifyPhoneEntityModel(
                                    phone: '$phoneNo',
                                    otp: pinInput,
                                  ),
                                );
                              }
                              model.notifyListeners();
                            },
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void verifyForgotPasswordPharmacy(
    context, {
    VerifyPhoneEntityModel? verifyPhoneEntity,
  }) async {
    try {
      _isLoading = true;
      _verifyPassOtpRespnseModel = await runBusyFuture(
        repositoryImply.verifyForgotPassword(verifyPhoneEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_verifyPassOtpRespnseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _verifyPassOtpRespnseModel?.message,
        );
        navigate.navigateTo(
          Routes.pharmacyResetPinScreen,
          arguments: PharmacyResetPinScreenArguments(
            phone: verifyPhoneEntity.phone,
            resetToken: _verifyPassOtpRespnseModel!.data!.resetToken,
          ),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void modalBottomSheetMenuAddRole({context}) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5, // 80% of screen height
            minChildSize: 0.5, // Can be dragged to 30% of screen height
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => PharmViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, PharmViewModel model, __) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // 👈 pushes content above keyboard
                    ), //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                            horizontal: 20.w,
                          ),
                          child: Form(
                            key: formKeyValidateAddUser,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 30.w),
                                    TextView(
                                      text: 'Add Role',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        AppImage.x,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),
                                TextFormWidget(
                                  hint: 'Role Name',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  // controller: nameController,
                                  validator: AppValidator.validateString(),
                                  onChange: (p0) {},
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Description',
                                  maxline: 4,
                                  alignLabelWithHint: true,
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  // controller: nameController,
                                  validator: AppValidator.validateString(),
                                ),
                                SizedBox(height: 70.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Add',
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  isLoading: _isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    if (formKeyValidateAddUser.currentState!
                                        .validate()) {}
                                    model.notifyListeners();
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void modalBottomSheetMenuAddUser({context}) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9, // 80% of screen height
            minChildSize: 0.5, // Can be dragged to 30% of screen height
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => PharmViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, PharmViewModel model, __) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // 👈 pushes content above keyboard
                    ), //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                            horizontal: 20.w,
                          ),
                          child: Form(
                            key: formKeyValidateAddUser,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 30.w),
                                    TextView(
                                      text: 'Add User',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        AppImage.x,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),
                                TextFormWidget(
                                  hint: 'First Name',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  // controller: nameController,
                                  validator: AppValidator.validateString(),
                                  onChange: (p0) {},
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Last Name',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  // controller: nameController,
                                  validator: AppValidator.validateString(),
                                  onChange: (p0) {},
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Phone Number',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  // controller: nameController,
                                  validator: AppValidator.validateInt(),
                                  onChange: (p0) {},
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Email Address',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  // controller: nameController,
                                  validator: AppValidator.validateEmail(),
                                  onChange: (p0) {},
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Address',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  // controller: nameController,
                                  validator: AppValidator.validateString(),
                                  onChange: (p0) {},
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Gender',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  label: '--Select--',
                                  // controller: nameController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: Padding(
                                    padding: EdgeInsets.all(14.20.w),
                                    child: GestureDetector(
                                      child: SvgPicture.asset(
                                        AppImage.arrow_down,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Role',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  label: '--Select--',
                                  // controller: nameController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: Padding(
                                    padding: EdgeInsets.all(14.20.w),
                                    child: GestureDetector(
                                      child: SvgPicture.asset(
                                        AppImage.arrow_down,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Temporary 4-digit PIN',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  obscureText: true,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  // controller: nameController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: Padding(
                                    padding: EdgeInsets.all(14.20.w),
                                    child: GestureDetector(
                                      child: SvgPicture.asset(
                                        AppImage.closed_eye_user,
                                        // color: AppColors.app_green,
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Add',
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  isLoading: _isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    if (formKeyValidateAddUser.currentState!
                                        .validate()) {}
                                    model.notifyListeners();
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void showRemoveUserDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
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
                            'Are you sure you want to make remove this sub-user (James Smith)?',
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
                              onPressed: () async {
                                Navigator.pop(context);
                                await Future.delayed(
                                  Duration(milliseconds: 100),
                                );
                                // Add your update logic here
                              },
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

  getPopUpMenuDialog(BuildContext context) => PopupMenuButton<String>(
    onSelected: (String result) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Selected: $result')));
    },
    color: AppColors.white,
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      ...meansId.map(
        (o) => PopupMenuItem<String>(
          value: o.toString().toLowerCase(),
          child: TextView(
            text: o,
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.deep,
            ),
          ),
          onTap: () {
            meansIdController.text = o;
            notifyListeners();
          },
        ),
      ),
    ],
    child: Padding(
      padding: EdgeInsets.all(14.20.w),
      child: SvgPicture.asset(AppImage.arrow_down),
    ),
  );

  formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  Future<void> uploadImage({context, MultipartFile? file}) async {
    try {
      _isLoading = true;
      _uploadImageResponseModel = await runBusyFuture(
        repositoryImply.uploadImage(file!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void pickImageMeansId(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageMeansId = file;
          filenameMeansId = imageMeansId!.path.split("/").last;
          _isLoadingMeansId = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageMeansId).readAsBytesSync(),
              filename: imageMeansId!.path.split("/").last,
            ),
          );
          _isLoadingMeansId = _isLoading;
          _uploadImageResponseModelMeansID = _uploadImageResponseModel;
          kycDocumentsList.add(
            Document(
              documentType: 'MEANS_OF_IDENTIFICATION%${meansIdController.text}',
              file: _uploadImageResponseModelMeansID?.data?.toJson(),
            ),
          );
          _uploadImageResponseModel = null;
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  void pickImageCAC(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingCAC = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingCAC = _isLoading;
          _uploadImageResponseModelCAC = _uploadImageResponseModel;
          kycDocumentsList.add(
            Document(
              documentType: 'CAC_DOCUMENT',
              file: _uploadImageResponseModelCAC?.data?.toJson(),
            ),
          );
          _uploadImageResponseModel = null;
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  void pickImagePharmLicense(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imagePharmLicense = file;
          filenamePharmLicense = imagePharmLicense!.path.split("/").last;
          _isLoadingLicense = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imagePharmLicense).readAsBytesSync(),
              filename: imagePharmLicense!.path.split("/").last,
            ),
          );
          _isLoadingLicense = _isLoading;
          _uploadImageResponseModelPharmLicense = _uploadImageResponseModel;

          kycDocumentsList.add(
            Document(
              documentType: 'PHARMACY_LICENSE',
              file: _uploadImageResponseModelPharmLicense?.data?.toJson(),
            ),
          );
          _uploadImageResponseModel = null;
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  void pickImageTIN(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageTIN = file;
          filenameTIN = imageTIN!.path.split("/").last;
          _isLoadingTIN = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageTIN).readAsBytesSync(),
              filename: imageTIN!.path.split("/").last,
            ),
          );
          _isLoadingTIN = _isLoading;
          _uploadImageResponseModelTIN = _uploadImageResponseModel;
          _uploadImageResponseModel = null;
           kycDocumentsList.add(
            Document(
              documentType: 'TAX_IDENTIFICATION_NUMBER',
              file: _uploadImageResponseModelTIN?.data?.toJson(),
            ),
          );
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  String getKycStatus({id, cac, license, tin}) {
    if (id == 'PENDING' ||
        cac == 'PENDING' ||
        license == 'PENDING' ||
        tin == 'PENDING') {
      return 'Your KYC is submitted and under\nreview. We’ll notify you once it’s\nverified.';
    }
    if (id == 'APPROVED' &&
        cac == 'APPROVED' &&
        license == 'APPROVED' &&
        tin == 'APPROVED') {
      return 'Your KYC has been successfully\nverified. You can now access all\nservices.';
    }
    return 'Kindly upload and submit KYC for\nverification to obtain full access to\nplatform features.';
  }

  Color getKycStatusColor({id, cac, license, tin}) {
    if (id == 'PENDING' ||
        cac == 'PENDING' ||
        license == 'PENDING' ||
        tin == 'PENDING') {
      return AppColors.fadedyellow;
    }
    if (id == 'APPROVED' &&
        cac == 'APPROVED' &&
        license == 'APPROVED' &&
        tin == 'APPROVED') {
      return AppColors.app_green_light;
    }
    return AppColors.fadedyellow;
  }

  bool getKycStatusBool({id, cac, license, tin}) {
    if (id == 'PENDING' ||
        cac == 'PENDING' ||
        license == 'PENDING' ||
        tin == 'PENDING') {
      return true;
    }
    if (id == 'APPROVED' &&
        cac == 'APPROVED' &&
        license == 'APPROVED' &&
        tin == 'APPROVED') {
      return true;
    }
    return false;
  }
}
