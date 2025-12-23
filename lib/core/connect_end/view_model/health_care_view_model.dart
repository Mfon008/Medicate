// ignore_for_file: strict_top_level_inference
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_business_owner_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_provider_practitioner_entity_model.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/widget/add_role_modal_widget.dart';
import '../../../ui/widget/button.dart';
import '../../../ui/widget/delete_role_modal_widget.dart';
import '../../../ui/widget/text.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../app_assets/app_utils.dart';
import '../../app_assets/app_validation.dart';
import '../../app_assets/country_code_format.dart';
import '../../app_assets/image.dart';
import '../../config/colors.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/change_phone_no_response_model/change_phone_no_response_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_roles_response_model/get_roles_response_model.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';
import '../repo/healthcare_repo_impl.dart';

class HealthCareViewModel extends BaseViewModel {
  String? pinInput;
  final session = locator<SharedPreferencesService>();

  final logger = getLogger('HealthcareViewModel');

  final repositoryImply = HealthcareRepoImpl();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateVerifyChange = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidate2 = GlobalKey<FormState>();
  SignUpPhamaryResponseModel? _signUpHealthcareResponseModel;
  SignUpPhamaryResponseModel? get signUpHealthcareResponseModel =>
      _signUpHealthcareResponseModel;
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

  GetRolesResponseModel? _getRolesResponseModel;
  GetRolesResponseModel? get getRolesResponseModel => _getRolesResponseModel;

  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  TextEditingController meansIdController = TextEditingController();
  List<String> selectService = [];
  List<String> selectServicePractitioner = [];
  List services = [
    'Appointment scheduling',
    'Medication reminder',
    'Bulk Purchase',
    'Product listing',
  ];
  List servicesPractitioner = [
    'Appointment scheduling',
    'Medication reminder',
    'Product listing',
  ];

  String querySignUpCountry = '';
  String? searchRoles = '';

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

  GlobalKey<FormState> formKeyValidateVerify = GlobalKey<FormState>();

  List<String> areaExpertise = [
    'General Practitioners (GPs) & Family\nMedicine',
    'Gynecology',
    'Pediatrics',
  ];

  List<String> addAreaExpertise = [];

  int _start = 60;
  
  List<String> meansId = [
    'Driver’s License',
    'International Passport',
    'National ID',
    'Citizenship Card',
    'Biometric Residence Permit (BRP)',
    'State ID Card',
    'Green Card/Resident Card',
    'Voter ID Card',
    'Asylum Seeker ID',
    'Alien ID Card'
  ];

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

  void modalBottomSheetMenuCountry(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<HealthCareViewModel>.reactive(
                viewModelBuilder: () => this, // 👈 use current model
                disposeViewModel: false,
                builder: (_, model, _) {
                  final filtered = querySignUpCountry.isEmpty
                      ? countryCodeFormat
                      : countryCodeFormat.where((e) {
                          return e['country']!.toLowerCase().contains(
                            querySignUpCountry.toLowerCase(),
                          );
                        }).toList();
                  return Column(
                    children: [
                      SizedBox(height: 22.h),

                      // Search Bar
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
                          controller: countryController,
                          suffixIcon: Icons.search_sharp,
                          onChange: (value) {
                            querySignUpCountry = value;
                            model.notifyListeners();
                          },
                        ),
                      ),

                      SizedBox(height: 10.h),

                      // Expanded List
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: filtered.length,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemBuilder: (context, index) {
                            final item = filtered[index];

                            return GestureDetector(
                              onTap: () {
                                countryController.text = item['country'];
                                Navigator.pop(context);
                                notifyListeners();
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 8.h),
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 6.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 180.w,
                                      child: TextView(
                                        text: item['country'],
                                        textOverflow: TextOverflow.ellipsis,
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          fontSize: 17.2.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    buildImage(item['Flag']),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
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
              return ViewModelBuilder<HealthCareViewModel>.reactive(
                viewModelBuilder: () => HealthCareViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, HealthCareViewModel model, _) {
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
                                            ..onTap = () => model.resendOtp(
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
                                              Routes
                                                  .healthCareChangePhoneNumber,
                                              arguments:
                                                  HealthCareChangePhoneNumberArguments(
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
                                      verifyOtpHealthcare(
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

  void resendOtp(context, {ResendOtpEntityModel? resendotp}) async {
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

  void resetPin(
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

  void forgotPassword(context, {ResendOtpEntityModel? forgotPassword}) async {
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
              return ViewModelBuilder<HealthCareViewModel>.reactive(
                viewModelBuilder: () => HealthCareViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, HealthCareViewModel model, _) {
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
                                            ..onTap = () => model.resendOtp(
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
              return ViewModelBuilder<HealthCareViewModel>.reactive(
                viewModelBuilder: () => HealthCareViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, HealthCareViewModel model, _) {
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
                                            ..onTap = () => model.resendOtp(
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
        return ViewModelBuilder<HealthCareViewModel>.reactive(
          viewModelBuilder: () => locator<HealthCareViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, HealthCareViewModel model, _) {
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
                                      ..onTap = () => model.resendOtp(
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
                                verifyForgotPassword(
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

  void verifyForgotPassword(
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
          Routes.healthCareResetPinScreen,
          arguments: HealthCareResetPinScreenArguments(
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

  void signUpBusinessOwner(
    context, {
    SignUpHealthcareBusinessOwnerEntityModel? signUpEntity,
  }) async {
    try {
      _isLoading = true;
      _signUpHealthcareResponseModel = await runBusyFuture(
        repositoryImply.signUpBusinessOwner(signUpEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_signUpHealthcareResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _signUpHealthcareResponseModel?.message,
        );
        modalBottomSheetMenu(
          context: context,
          phoneNo: signUpEntity.phone,
          id: _signUpHealthcareResponseModel?.data?.tenantId,
          name: signUpEntity.healthcareFacilityName,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void signUpPractitioner(
    context, {
    SignUpHealthcareProviderPractitionerEntityModel? signUpEntity,
  }) async {
    try {
      _isLoading = true;
      _signUpHealthcareResponseModel = await runBusyFuture(
        repositoryImply.signUpPractitioner(signUpEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_signUpHealthcareResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _signUpHealthcareResponseModel?.message,
        );
        modalBottomSheetMenu(
          context: context,
          phoneNo: signUpEntity.phone,
          id: _signUpHealthcareResponseModel?.data?.tenantId,
          name: signUpEntity.healthcareFacilityName,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void signInHealthcare(context, {LoginEntityModel? signInEntity}) async {
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
        if (_loginPharmacyResponseModel!.data!.memberships![0].role ==
                'OWNER' &&
            _loginPharmacyResponseModel!.data!.memberships![0].tenantType ==
                'HEALTHCARE_PROVIDER') {
          navigate.navigateTo(Routes.businessProviderDashboard);
        } else if (_loginPharmacyResponseModel!.data!.memberships![0].role ==
                'OWNER' &&
            _loginPharmacyResponseModel!.data!.memberships![0].tenantType ==
                'HEALTHCARE_PRACTITIONER') {
          navigate.navigateTo(Routes.specialistsProviderDashboard);
        }
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void verifyOtpHealthcare(
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

        navigate.navigateTo(Routes.healthCareSetupPinScreen);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void changeNumberHealthCare(context, {String? phone, String? id}) async {
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

  void setPin(context, {SetPinEntityModel? setPinEntityModel}) async {
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
        if (_setPinPharmResponseModel!.data!.memberships![0].role == 'OWNER' &&
            _setPinPharmResponseModel!.data!.memberships![0].tenantType ==
                'HEALTHCARE_PROVIDER') {
          navigate.navigateTo(Routes.businessProviderDashboard);
        } else if (_setPinPharmResponseModel!.data!.memberships![0].role ==
                'OWNER' &&
            _setPinPharmResponseModel!.data!.memberships![0].tenantType ==
                'HEALTHCARE_PRACTITIONER') {
          navigate.navigateTo(Routes.specialistsProviderDashboard);
        }

        SharedPreferencesService.instance.pinSet = setPinEntityModel.pin!;
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

  void sendOtpHealthCare(context, {String? phone}) async {
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

  Future<void> getRoles(context) async {
    try {
      _isLoading = true;
      _getRolesResponseModel = await runBusyFuture(
        repositoryImply.getRoles(),
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

  Future<bool?> modalBottomSheetMenuAddRole({
    context,
    bool isEdit = false,
    rolename,
    roleDes,
    roleId,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return AddRoleModalWidget(
          isEdit: isEdit,
          rolename: rolename,
          roleDescription: roleDes,
          roleId: roleId,
          parentContext: context,
          onSuccess: () {
            Navigator.of(context).pop(true);
            // close modal and return true
          },
        );
      },
    );
  }

  Future<bool?> showRemoveRoleDialog({context, String? roleId}) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        return DeleteRoleModalWidget(
          roleId: roleId,
          parentContext: context,
          onSuccess: () {
            Navigator.of(context).pop(true);
          },
          onFailed: () {
            Navigator.of(context).pop(false);
          },
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
  
  // void updateHealthCare(
  //   context, {
  //   UpdatePharmacyProfileEntityModel? update,
  // }) async {
  //   try {
  //     _isLoading = true;
  //     var v = await runBusyFuture(
  //       repositoryImply.update(update),
  //       throwException: true,
  //     );
  //     _isLoading = false;
  //     AppUtils.snackbar(context, message: v['message']);
  //     getTenant(context);
  //   } catch (e) {
  //     _isLoading = false;
  //     logger.d(e);
  //     AppUtils.snackbar(context, message: e.toString(), error: true);
  //   }
  //   notifyListeners();
  // }
}
