// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, strict_top_level_inference, unused_field
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/country_code_format.dart';
import 'package:medicate_app/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/support_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_user_profile_entity.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/widget/button.dart';
import '../../../ui/widget/text.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../app_assets/app_utils.dart';
import '../../app_assets/app_validation.dart';
import '../../app_assets/image.dart';
import '../../app_assets/image_picker.dart';
import '../../config/colors.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/change_phone_no_response_model/change_phone_no_response_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_response_model/set_pin_response_model.dart';
import '../model/sign_up_response_model/sign_up_response_model.dart';
import '../model/update_user_profile_response_model/update_user_profile_response_model.dart';
import '../model/verify_otp_response_model/verify_otp_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_phone_entity_model.dart';
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

  LoginResponseModel? _loginResponseModel;
  LoginResponseModel? get loginResponseModel => _loginResponseModel;

  SignUpResponseModel? _signUpResponseModel;
  SignUpResponseModel? get signUpResponseModel => _signUpResponseModel;
  UpdateUserProfileResponseModel? _updateUserProfileResponseModel;
  UpdateUserProfileResponseModel? get updateUserProfileResponseModel =>
      _updateUserProfileResponseModel;
  VerifyOtpResponseModel? _verifyOtpRespnseModel;
  VerifyOtpResponseModel? get verifyOtpRespnseModel => _verifyOtpRespnseModel;
  SetPinResponseModel? _setPinResponseModel;
  SetPinResponseModel? get setPinResponseModel => _setPinResponseModel;
  ResendOtpResponseModel? _resendOtpResponseModel;
  ResendOtpResponseModel? get resendOtpResponseModel => _resendOtpResponseModel;
  ChangePhoneNoResponseModel? _changePhoneNoResponseModel;
  ChangePhoneNoResponseModel? get changePhoneNoResponseModel =>
      _changePhoneNoResponseModel;
  GetUserDetailsResponseModel? _getUserDetailsResponseModel;
  GetUserDetailsResponseModel? get getUserDetailsResponseModel =>
      _getUserDetailsResponseModel;
  ForgotPasswordResponseModel? _forgotPasswordResponseModel;
  ForgotPasswordResponseModel? get forgotPasswordResponseModel =>
      _forgotPasswordResponseModel;
  VerifyPassOtpRespnseModel? _verifyPassOtpRespnseModel;
  VerifyPassOtpRespnseModel? get verifyPassOtpRespnseModel =>
      _verifyPassOtpRespnseModel;
  String? pinInput;

  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidate2 = GlobalKey<FormState>();
  TextEditingController countryController = TextEditingController();
  String querySignUpCountry = '';

  AuthViewModel({this.context});

  Timer? _timer;
  int _start = 60;
  final _pickImage = ImagePickerHandler();
  File? image;
  File? imageDrug;
  String? filename;
  String? drugFilename;

  TextEditingController dateTimeController = TextEditingController();
  String? pickedDate;
  List<List<String>> periodLabels = [];

  int? dosageValue;
  List<List<TextEditingController>> doseControllers = [];

  void initDayDoseControllers({required int dayIndex, required int count}) {
    // Ensure outer list has enough days
    while (doseControllers.length <= dayIndex) {
      doseControllers.add([]);
      periodLabels.add([]);
    }

    // Dispose old ones for that day
    for (var c in doseControllers[dayIndex]) {
      c.dispose();
    }

    // Assign new ones
    doseControllers[dayIndex] = List.generate(
      count,
      (_) => TextEditingController(),
    );

    periodLabels[dayIndex] = List.generate(count, (_) => "Select Time");
  }

  bool isChecked = false;

  dosageWidgetContainer({
    required BuildContext context,
    required int callback,
    required List<int> listOfTimes,
  }) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    // ✅ Only initialize once
    if (doseControllers.length <= callback ||
        doseControllers[callback].isEmpty) {
      initDayDoseControllers(dayIndex: callback, count: listOfTimes.length);
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.w),
      padding: EdgeInsets.symmetric(
        vertical: dosageValue == callback ? 12.w : 8.w,
        horizontal: 14.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey, width: 2),
      ),
      child: dosageValue == callback
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Day ${callback + 1}',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 15.20.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        dosageValue = null;
                        notifyListeners();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_up,
                        color: AppColors.grey1,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ...listOfTimes.asMap().entries.map((entry) {
                  final i = entry.key; // index
                  final e = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.w),
                    child: TextFormWidget(
                      hint: 'Dose ${e + 1}',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: periodLabels.isEmpty
                          ? ''
                          : periodLabels[callback][i],
                      hintSize: 14.60.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: doseControllers[callback][i],
                      suffixWidget: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await selectDosageTime(
                              context: context,
                            );

                            if (result != null) {
                              // 👉 Update the controller for this dose
                              doseControllers[callback][i].text =
                                  result["time"]!;

                              // 👉 Update period label for this dose

                              periodLabels[callback][i] = result["period"]!;
                              notifyListeners();
                            }
                          },
                          child: TextView(
                            text: 'Edit',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 13.60.sp,
                              color: AppColors.fineGrey,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.fineGrey,
                            ),
                          ),
                        ),
                      ),
                      validator: AppValidator.validateString(),
                    ),
                  );
                }),

                SizedBox(height: callback == 0 ? 12.0.h : 0.h),
                if (callback == 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Apply to all days',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Transform.scale(
                        scale: isTablet(context) ? 1.5 : 1.1,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            if (value != null && value) {
                              // ✅ Copy Day 1 (callback = 0) values to all other days
                              for (
                                int day = 1;
                                day < doseControllers.length;
                                day++
                              ) {
                                for (
                                  int i = 0;
                                  i < doseControllers[0].length;
                                  i++
                                ) {
                                  // Copy text
                                  doseControllers[day][i].text =
                                      doseControllers[0][i].text;
                                  // Copy period
                                  periodLabels[day][i] = periodLabels[0][i];
                                }
                              }
                            } else {
                              for (
                                int day = 1;
                                day < doseControllers.length;
                                day++
                              ) {
                                for (
                                  int i = 0;
                                  i < doseControllers[day].length;
                                  i++
                                ) {
                                  doseControllers[day][i]
                                      .clear(); // clear controller text
                                  periodLabels[day][i] = ''; // reset label
                                }
                              }
                            }
                            isChecked = value ?? false;
                            notifyListeners();
                          },
                          activeColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          visualDensity: VisualDensity
                              .compact, // 👈 reduces internal padding
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 12.0.h),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Day ${callback + 1}',
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 15.20.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    dosageValue = callback;
                    notifyListeners();
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.grey1,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDated = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // The date initially displayed
      firstDate: DateTime.now(), // The earliest selectable date
      lastDate: DateTime(2101), // The latest selectable date
    );

    if (pickedDated != null) {
      pickedDate = DateFormat('dd MMM, yyyy').format(pickedDated);
      selectTime(context);
    }
    notifyListeners();
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // The time initially displayed
    );

    if (pickedTime != null) {
      dateTimeController.text =
          '${pickedDate!} ${formatTime('${pickedTime.hour}:${pickedTime.minute}')}';
    }
    notifyListeners();
  }

  String getPeriodLabel(TimeOfDay time) {
    if (time.hour >= 5 && time.hour < 12) {
      return "Morning";
    } else if (time.hour >= 12 && time.hour < 17) {
      return "Afternoon";
    } else if (time.hour >= 17 && time.hour < 21) {
      return "Evening";
    } else {
      return "Night";
    }
  }

  Future<Map<String, String>?> selectDosageTime({
    required BuildContext context,
  }) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      final formattedTime = DateFormat(
        "h:mm a",
      ).format(dateTime); // 👉 12-hour with AM/PM
      final period = getPeriodLabel(pickedTime);

      return {"time": formattedTime, "period": period};
    }
    return null;
  }

  String formatTime(String timeString) {
    DateTime dateTime = DateFormat("HH:mm").parse(timeString);
    return DateFormat("hh:mm a").format(dateTime);
  }

  String getStringFrLabel(String i) {
    if (i == '') {
      return '';
    }
    if (int.parse(i) > 1) {
      return '$i tablets';
    }
    return '$i tablet';
  }

  String getStringFrDuration(String i) {
    if (i == '') {
      return '';
    }
    if (int.parse(i) > 1) {
      return '$i days';
    }
    return '$i day';
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        _start--;
      }
      notifyListeners();
    });
  }

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

  void signIn(context, {LoginEntityModel? signInEntity}) async {
    try {
      _isLoading = true;
      _loginResponseModel = await runBusyFuture(
        repositoryImply.signIn(signInEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_loginResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _loginResponseModel?.message ?? '',
        );
        navigate.navigateTo(Routes.dashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void signUp(context, {SignUpEntityModel? signUpEntity}) async {
    try {
      _isLoading = true;
      _signUpResponseModel = await runBusyFuture(
        repositoryImply.signUp(signUpEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_signUpResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _signUpResponseModel?.message,
        );
        modalBottomSheetMenu(
          context: context,
          phoneNo: signUpEntity.phone,
          id: _signUpResponseModel?.data?.id,
          name: signUpEntity.fullName,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void changeNumber(
    context, {
    ResendOtpEntityModel? resendOtpEntityModel,
    String? id,
    String? name,
  }) async {
    try {
      _isLoading = true;
      _changePhoneNoResponseModel = await runBusyFuture(
        repositoryImply.changePhoneNo(
          changePhoneNo: resendOtpEntityModel!,
          id: id,
        ),
        throwException: true,
      );
      _isLoading = false;
      if (_changePhoneNoResponseModel?.statusCode == 200) {
        await AppUtils.snackbar(
          context,
          message: _changePhoneNoResponseModel?.message,
        );
        modalBottomSheetMenu(
          context: context,
          phoneNo: resendOtpEntityModel.phone,
          id: _signUpResponseModel?.data?.id,
          name: name,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void verifyOtp(context, {VerifyPhoneEntityModel? verifyEntity}) async {
    try {
      _isLoading = true;
      _verifyOtpRespnseModel = await runBusyFuture(
        repositoryImply.verifyPhoneOtp(verifyEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_verifyOtpRespnseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _verifyOtpRespnseModel?.message,
        );

        navigate.navigateTo(Routes.setupPinScreen);
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
      _setPinResponseModel = await runBusyFuture(
        repositoryImply.setPin(setPinEntityModel!),
        throwException: true,
      );
      _isLoading = false;
      if (_setPinResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _setPinResponseModel?.message,
        );
        navigate.navigateTo(Routes.dashboard);

        SharedPreferencesService.instance.pinSet = setPinEntityModel.pin!;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
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
        navigate.navigateTo(Routes.successScreen);
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

  void verifyForgotPassword(
    context, {
    VerifyPhoneEntityModel? verifyPhoneEntity,
  }) async {
    print('meee');
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
          Routes.resetPinScreen,
          arguments: ResetPinScreenArguments(phone: verifyPhoneEntity.phone),
        );
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

  void support({context, SupportEntityModel? supportEntity}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.support(supportEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (v['message'] != null) {
        await AppUtils.snackbar(
          context,
          message: 'Request has been sent successfully..!',
        );
        navigate.back();
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void uploadProfilePicture({context, MultipartFile? file}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.uploadProPicture(file!),
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

  void uploadUserProfile({context, UpdateUserProfileEntity? userEntity}) async {
    try {
      _isLoading = true;
      _updateUserProfileResponseModel = await runBusyFuture(
        repositoryImply.uploadUserProfile(userEntity),
        throwException: true,
      );
      AppUtils.snackbar(
        context,
        message: _updateUserProfileResponseModel?.message ?? '',
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  void pickImage(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) {
          image = file;
          filename = image!.path.split("/").last;
          uploadProfilePicture(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(image).readAsBytesSync(),
              filename: image!.path.split("/").last,
            ),
          );

          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  void pickDrugImage(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) {
          imageDrug = file;
          drugFilename = imageDrug!.path.split("/").last;
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

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
        return ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
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
                      key: formKeyValidate,
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
                                    text: "Resend",
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
                              if (formKeyValidate.currentState!.validate()) {
                                verifyOtp(
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
    );
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
        return ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => locator<AuthViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
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
              return ViewModelBuilder<AuthViewModel>.reactive(
                viewModelBuilder: () => AuthViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, AuthViewModel model, __) {
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
}
