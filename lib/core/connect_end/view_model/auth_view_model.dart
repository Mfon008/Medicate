// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, strict_top_level_inference, unused_field
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
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
import 'package:medicate_app/ui/dashboard/reminder/medication_class.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/dashboard/reminder/med_type.dart';
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
  List<MedicationClass> medicationClassList = [];

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
  List<List<String>> periodAfterLabels = [];

  int? dosageValue;
  int? dosageAddedValue;
  int? dosageAfterValue;
  List<List<TextEditingController>> doseControllers = [];
  List<List<TextEditingController>> doseAfterControllers = [];
  bool isChecked = false;

  TextEditingController medNameController = TextEditingController();
  TextEditingController medDosageController = TextEditingController();
  TextEditingController medDurationController = TextEditingController();
  TextEditingController medDailyInTakenController = TextEditingController();
  TextEditingController drugNameController = TextEditingController();
  TextEditingController medTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController endDateController = TextEditingController(text: '');
  MedicationClass? medCard;
  bool isTapped = false;
  bool isTappedCon = false;

  String medTypeResult = '';
  String medTypeResultImage = '';
  int? index;
  int? indexDuration;
  int? indexDaily;
  int linIndex = 1;

  DateFormat inputFormat = DateFormat("dd MMM, yyyy");
  DateTime? dateTimeObject;

  List<MedType> medTypeList = [
    MedType(medType: 'Pills', medTypeImage: AppImage.pill),
    MedType(medType: 'Syrups', medTypeImage: AppImage.syrup),
    MedType(medType: 'Injection', medTypeImage: AppImage.syringe),
    MedType(medType: 'Drips', medTypeImage: AppImage.drip),
    MedType(medType: 'Ointments', medTypeImage: AppImage.ointment),
    MedType(medType: 'Inhalers', medTypeImage: AppImage.inhaler),
    MedType(medType: 'Others', medTypeImage: AppImage.other_meds),
  ];

  int? _duration;
  List<int> intList = [];

  Future<String?> showDailyInTakeMenu(BuildContext context) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setMenuState) {
            return Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'No of Times to be taken daily',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    for (int i = 1; i < 6; i++)
                      GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            indexDaily = i;
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, indexDaily.toString());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: indexDaily == i
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: indexDaily == i
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              TextView(
                                text: i.toString(),
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (indexDaily == i)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<String?> showMedDurationMenu(BuildContext context) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setMenuState) {
            return Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'Duration',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    for (int i = 1; i < 15; i++)
                      GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            indexDuration = i;
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, indexDuration.toString());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: indexDuration == i
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: indexDuration == i
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              TextView(
                                text: i > 1 ? '$i days' : '$i day',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (indexDuration == i)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<String?> showMedDosageMenu(BuildContext context) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setMenuState) {
            return Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'Dosage',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    for (int i = 1; i < 11; i++)
                      GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            index = i;
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, index.toString());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == i
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: index == i
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              TextView(
                                text: i > 1 ? '$i tablets' : '$i tablet',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (index == i)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<Map<String, String>?> showMedTypeMenu(BuildContext context) async {
    return await showModalBottomSheet<Map<String, String>>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        String? localSelected = medTypeResult;

        return StatefulBuilder(
          builder: (ctx, setMenuState) {
            return Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'Medication Type',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    ...medTypeList.map((e) {
                      final isSelected = localSelected == e.medType;

                      return GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            localSelected = e.medType;
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, {
                              "type": e.medType!,
                              "icon": e.medTypeImage!,
                            });
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isSelected
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                e.medTypeImage!,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(width: 12.w),
                              TextView(
                                text: e.medType!,
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (isSelected)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String modalName() {
    if (linIndex == 2) {
      return 'Preview Medication';
    } else if (linIndex == 3) {
      return 'Choose Notification Channel';
    } else if (linIndex == 3) {
      return 'Make Payment';
    }
    return 'Add Medication';
  }

  void showReminderModal(context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    constraints: BoxConstraints(maxWidth: double.infinity),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.7, // Initial height as percentage of screen
            minChildSize: 0.5, // Minimum height
            maxChildSize: 0.88, // Maximum height
            expand: true, // Set to true for full height initially
            builder: (BuildContext context, ScrollController scrollController) {
              return ViewModelBuilder<AuthViewModel>.reactive(
                viewModelBuilder: () => locator<AuthViewModel>(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                onDispose: (viewModel) {},
                builder: (_, AuthViewModel model, _) {
                  return setModalFlow(
                    model: model,
                    context: context,
                    setModalState: setModalState,
                    scrollController: scrollController,
                  );
                },
              );
            },
          );
        },
      );
    },
  );

  addReminderToList(AuthViewModel model) async {
    List<Map<String, dynamic>> addTimePeriod = [];

    for (int day = 0; day < doseControllers.length; day++) {
      List<Map<String, String>> dayDoses = [];

      for (int i = 0; i < doseControllers[day].length; i++) {
        dayDoses.add({
          'time': doseControllers[day][i].text,
          'period': periodLabels[day][i],
        });
      }

      addTimePeriod.add({
        'day': day + 1, // so Day 1, Day 2, etc.
        'doses': dayDoses,
      });
    }

    await Future.delayed(Duration(seconds: 1), () {});
    model.medicationClassList.add(
      MedicationClass(
        medicationName: medNameController.text,
        drugName: drugNameController.text,
        medicationType: medTypeController.text,
        medicationTypeIcon: medTypeResultImage,
        description: descriptionController.text,
        medicationFile: model.imageDrug,
        dosage: model.getStringFrLabel(medDosageController.text),
        dateAndTime: model.dateTimeController.text,
        duration: medDurationController.text,
        endDate: endDateController.text,
        timesToTake: medDailyInTakenController.text,
        note: noteController.text,
        listOfTimes: intList,
        dosageMap: addTimePeriod,
      ),
    );
    await Future.delayed(Duration(seconds: 1), () {});
    clearReminderMedsVaraibles();
    model.notifyListeners();
  }

  clearReminderMedsVaraibles() {
    medTypeResultImage = '';
    imageDrug = null;
    medNameController.clear();
    drugNameController.clear();
    medTypeController.clear();
    descriptionController.clear();
    medDosageController.clear();
    dateTimeController.clear();
    medDurationController.clear();
    endDateController.clear();
    medDailyInTakenController.clear();
    noteController.clear();
  }

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

  void initDayDoseAfterControllers({
    required int dayIndex,
    required int count,
  }) {
    // Ensure outer list has enough days
    while (doseAfterControllers.length <= dayIndex) {
      doseAfterControllers.add([]);
      periodAfterLabels.add([]);
    }

    // Dispose old ones for that day
    for (var c in doseAfterControllers[dayIndex]) {
      c.dispose();
    }

    // Assign new ones
    doseAfterControllers[dayIndex] = List.generate(
      count,
      (_) => TextEditingController(),
    );

    periodAfterLabels[dayIndex] = List.generate(count, (_) => "Select Time");
  }

  dosageWidgetContainer({
    required BuildContext context,
    required int callback,
    required List<int> listOfTimes,
  }) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    // ✅ Only initialize once
    // Expand doseControllers if needed
    while (doseControllers.length <= callback) {
      doseControllers.add([]);
      periodLabels.add([]);
    }

    // Resize the specific day's list
    final currentControllers = doseControllers[callback];
    final currentLabels = periodLabels[callback];

    if (currentControllers.length < listOfTimes.length) {
      // Add more controllers
      for (int i = currentControllers.length; i < listOfTimes.length; i++) {
        currentControllers.add(TextEditingController());
        currentLabels.add('');
      }
    } else if (currentControllers.length > listOfTimes.length) {
      // Dispose and remove extra controllers
      for (int i = listOfTimes.length; i < currentControllers.length; i++) {
        currentControllers[i].dispose();
      }
      currentControllers.removeRange(
        listOfTimes.length,
        currentControllers.length,
      );
      currentLabels.removeRange(listOfTimes.length, currentLabels.length);
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
                    print('object::::$callback');
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

  dosageAddedWidgetContainer({
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
                            // final result = await selectDosageTime(
                            //   context: context,
                            // );

                            // if (result != null) {
                            //   // 👉 Update the controller for this dose
                            //   doseControllers[callback][i].text =
                            //       result["time"]!;

                            //   // 👉 Update period label for this dose

                            //   periodLabels[callback][i] = result["period"]!;
                            //   notifyListeners();
                            // }
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
                            // if (value != null && value) {
                            //   // ✅ Copy Day 1 (callback = 0) values to all other days
                            //   for (
                            //     int day = 1;
                            //     day < doseControllers.length;
                            //     day++
                            //   ) {
                            //     for (
                            //       int i = 0;
                            //       i < doseControllers[0].length;
                            //       i++
                            //     ) {
                            //       // Copy text
                            //       doseControllers[day][i].text =
                            //           doseControllers[0][i].text;
                            //       // Copy period
                            //       periodLabels[day][i] = periodLabels[0][i];
                            //     }
                            //   }
                            // } else {
                            //   for (
                            //     int day = 1;
                            //     day < doseControllers.length;
                            //     day++
                            //   ) {
                            //     for (
                            //       int i = 0;
                            //       i < doseControllers[day].length;
                            //       i++
                            //     ) {
                            //       doseControllers[day][i]
                            //           .clear(); // clear controller text
                            //       periodLabels[day][i] = ''; // reset label
                            //     }
                            //   }
                            // }
                            // isChecked = value ?? false;
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

  dosageAfterWidgetContainer({
    required BuildContext context,
    required int callback,
    required List<int> listOfTimes,
    required List<Map<String, dynamic>> dosageMap,
  }) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;

    // ✅ Ensure controllers & labels are initialized
    if (doseAfterControllers.length <= callback ||
        doseAfterControllers[callback].isEmpty) {
      initDayDoseAfterControllers(
        dayIndex: callback,
        count: listOfTimes.length,
      );
    }

    // ✅ Update controllers/labels with data from dosageMap
    if (callback < dosageMap.length) {
      final dayData = dosageMap[callback]; // e.g. { "day": 1, "doses": [...] }
      final doses = List<Map<String, dynamic>>.from(dayData["doses"] ?? []);

      for (int i = 0; i < doses.length; i++) {
        if (i < doseAfterControllers[callback].length) {
          doseAfterControllers[callback][i].text = doses[i]["time"] ?? "";
          periodAfterLabels[callback][i] = doses[i]["period"] ?? "";
        }
      }
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.w),
      padding: EdgeInsets.symmetric(
        vertical: dosageAfterValue == callback ? 12.w : 8.w,
        horizontal: 14.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey, width: 2),
      ),
      child: dosageAfterValue == callback
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Header
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
                        dosageAfterValue = null;
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

                // 🔹 Render doses
                ...doseAfterControllers[callback].asMap().entries.map((entry) {
                  final i = entry.key;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.w),
                    child: TextFormWidget(
                      hint: 'Dose ${i + 1}',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: periodAfterLabels[callback][i],
                      hintSize: 14.60.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: doseAfterControllers[callback][i],
                      suffixWidget: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: GestureDetector(
                          onTap: () async {
                            // final result = await selectDosageTime(
                            //   context: context,
                            // );
                            // if (result != null) {
                            //   doseAfterControllers[callback][i].text =
                            //       result["time"]!;
                            //   periodAfterLabels[callback][i] =
                            //       result["period"]!;
                            //   notifyListeners();
                            // }
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

                // 🔹 Apply to all days
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
                              for (
                                int day = 1;
                                day < doseAfterControllers.length;
                                day++
                              ) {
                                for (
                                  int i = 0;
                                  i < doseAfterControllers[0].length;
                                  i++
                                ) {
                                  doseAfterControllers[day][i].text =
                                      doseAfterControllers[0][i].text;
                                  periodAfterLabels[day][i] =
                                      periodAfterLabels[0][i];
                                }
                              }
                            } else {
                              for (
                                int day = 1;
                                day < doseAfterControllers.length;
                                day++
                              ) {
                                for (
                                  int i = 0;
                                  i < doseAfterControllers[day].length;
                                  i++
                                ) {
                                  doseAfterControllers[day][i].clear();
                                  periodAfterLabels[day][i] = '';
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
                          visualDensity: VisualDensity.compact,
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
                    dosageAfterValue = callback;
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

  setModalFlow({
    AuthViewModel? model,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
  }) {
    if (linIndex == 2) {
      return secondModalFlow(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    }
    return firstModalFLow(
      model: model,
      context: context,
      setModalState: setModalState,
      scrollController: scrollController,
    );
  }

  firstModalFLow({
    AuthViewModel? model,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
  }) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22.r),
      color: AppColors.white,
    ),
    child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.6.w, vertical: 20.w),
      controller: scrollController,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20, width: 20),
              TextView(
                text: modalName(),
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.70.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deep,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 4.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context!);
                  },
                  child: SvgPicture.asset(
                    AppImage.cancel,
                    height: 14.20,
                    width: 14.20,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 13.60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context!).size.width * .82,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ), // Adjust radius as needed
                  child: LinearProgressIndicator(
                    minHeight: 4.0, // Adjust height as needed
                    value: linIndex / 4,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/4',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          model!.medicationClassList.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormWidget(
                      hint: 'Medication Name',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: '',
                      hintSize: 14.60.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: medNameController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 16.h),
                    TextFormWidget(
                      hint: 'Drug Name',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: '',
                      hintSize: 14.60.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: drugNameController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Medication Type',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormWidget(
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: '',
                      hintSize: 16.60.sp,
                      readOnly: true,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      prefixWidget: medTypeResultImage.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.all(10.w),
                              child: SvgPicture.asset(medTypeResultImage),
                            )
                          : SizedBox.shrink(),
                      suffixWidget: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColors.greyee,
                        ),
                        onPressed: () async {
                          final result = await showMedTypeMenu(context!);

                          if (result != null) {
                            setModalState!(() {
                              medTypeResultImage = result["icon"] ?? '';
                              medTypeController.text = result["type"] ?? '';
                            });
                          }
                        },
                      ),
                      controller: medTypeController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Description',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormWidget(
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: '',
                      hintSize: 16.60.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: descriptionController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Medication picture upload',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          dashPattern: [3, 3],
                          strokeWidth: .94,
                          radius: Radius.circular(10),
                          color: AppColors.infoGrey1,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 16.20.w,
                            horizontal: 16.0.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 140.w,
                                height: 84.h,
                                decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: model.imageDrug != null
                                      ? Image.file(
                                          model.imageDrug!,
                                          height: 75.80.h,
                                          width: 70.80.w,
                                        )
                                      : SvgPicture.asset(AppImage.image_icon),
                                ),
                              ),
                              model.imageDrug != null
                                  ? Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            model.imageDrug = null;
                                            model.notifyListeners();
                                          },
                                          child: SvgPicture.asset(
                                            AppImage.delete,
                                            height: 16.68.h,
                                            width: 15.2.w,
                                          ),
                                        ),
                                        SizedBox(width: 18.30.w),
                                        GestureDetector(
                                          onTap: () =>
                                              model.pickDrugImage(context!),
                                          child: SvgPicture.asset(
                                            AppImage.upload,
                                            height: 17.0.h,
                                            width: 16.68.w,
                                          ),
                                        ),
                                      ],
                                    )
                                  : GestureDetector(
                                      onTap: () =>
                                          model.pickDrugImage(context!),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 22.w,
                                          vertical: 10.10.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                          color: AppColors.grey,
                                        ),
                                        child: TextView(
                                          text: 'Upload',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.40.sp,
                                            color: AppColors.deep,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0.h),
                    TextView(
                      text: 'SET SCHEDULE AND DOSAGE',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 14.80.sp,
                        color: AppColors.grey1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Divider(color: AppColors.grey),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Dosage ',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16.60.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: '(mg)',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16.60.sp,
                            color: AppColors.grey1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.0.h),
                    TextFormWidget(
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: model.getStringFrLabel(medDosageController.text),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 16.80.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      readOnly: true,
                      suffixWidget: IconButton(
                        onPressed: () async {
                          final result = await showMedDosageMenu(context!);
                          if (result != null) {
                            setModalState!(() {
                              medDosageController.text = result;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.grey1,
                          size: 20.sp,
                        ),
                      ),
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 24.0.h),
                    TextFormWidget(
                      hint: 'Start Date & Time',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: '',
                      readOnly: true,
                      hintSize: 14.60.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: model.dateTimeController,
                      suffixWidget: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: GestureDetector(
                          onTap: () => model.selectDate(context!),
                          child: SvgPicture.asset(
                            AppImage.calendar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 24.0.h),
                    TextFormWidget(
                      hint: 'Duration',
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
                      readOnly: true,
                      controller: medDurationController,
                      suffixWidget: IconButton(
                        onPressed: () async {
                          final result = await showMedDurationMenu(context!);
                          if (result != null) {
                            setModalState!(() {
                              medDurationController.text = model
                                  .getStringFrDuration(result);
                              _duration = int.parse(result);
                              intList = List.generate(
                                _duration!,
                                (index) => index,
                              );
                            });
                            dateTimeObject = inputFormat.parse(
                              model.pickedDate!,
                            );
                            endDateController.text = dateTimeObject!
                                .add(Duration(days: int.parse(result)))
                                .toString();
                            model.notifyListeners();
                          }
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.grey1,
                          size: 20.sp,
                        ),
                      ),
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 24.0.h),
                    Row(
                      children: [
                        TextView(
                          text: 'End Date ',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16.60.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.info_outline,
                          color: AppColors.yellow,
                          size: 20.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 14.0.h),
                    TextFormWidget(
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: endDateController.text.isNotEmpty
                          ? DateFormat(
                              'dd MMM yyyy',
                            ).format(DateTime.parse(endDateController.text))
                          : '',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 16.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      readOnly: true,

                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 24.0.h),
                    TextFormWidget(
                      hint: 'No of Times to be taken daily',
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
                      readOnly: true,
                      controller: medDailyInTakenController,
                      suffixWidget: IconButton(
                        onPressed: () async {
                          final result = await showDailyInTakeMenu(context!);
                          if (result != null) {
                            setModalState!(() {
                              medDailyInTakenController.text = result;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.grey1,
                          size: 20.sp,
                        ),
                      ),
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 24.0.h),
                    if (intList.isNotEmpty &&
                        medDailyInTakenController.text.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...intList.map(
                            (e) => model.dosageWidgetContainer(
                              context: context!,
                              callback: e,
                              listOfTimes: List.generate(
                                int.parse(medDailyInTakenController.text),
                                (index) => index,
                              ),
                            ),
                          ),
                          SizedBox(height: 14.0.h),
                          TextView(
                            text: 'Add Note',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16.60.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          TextFormWidget(
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            controller: noteController,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 16.80.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true, // Minimum number of lines visible
                            maxline:
                                3, // Maximum number of lines visible before scrolling
                            keyboardType: TextInputType.multiline,
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                addReminderToList(model);
                              },
                              child: TextView(
                                text: 'Add Another Medication',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 17.2.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primary,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationThickness: 1.4,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          ButtonWidget(
                            border: 100.r,
                            buttonColor: AppColors.primary,
                            buttonText: 'Preview',
                            color: AppColors.white,
                            buttonBorderColor: AppColors.transparent,
                            onPressed: () {
                              addReminderToList(model);
                              for (
                                var day = 0;
                                day < model.doseControllers.length;
                                day++
                              ) {
                                print("Day ${day + 1}:");
                                for (var dose in model.doseControllers[day]) {
                                  print("  ${dose.text}");
                                }
                              }
                            },
                          ),
                          SizedBox(height: 30.h),
                        ],
                      ),
                  ],
                )
              : Card(
                  color: AppColors.white,
                  elevation: .78,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.w,
                      horizontal: 13.6.w,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.buttonGrey1),
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        ...model.medicationClassList.map((e) {
                          return Card(
                            color: AppColors.white,
                            elevation: .78,
                            margin: EdgeInsets.only(bottom: 18.w),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 15.8.w,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.buttonGrey1,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 5.0.w,
                                      right: 5.0.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            TextView(
                                              text: medCard == e
                                                  ? ''
                                                  : 'Medication Name',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            medCard == e
                                                ? SizedBox.shrink()
                                                : Positioned(
                                                    right: -12.10,
                                                    child: TextView(
                                                      text: '*',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.red,
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                model.medicationClassList
                                                    .remove(e);
                                                model.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.delete,
                                                height: 16.68.h,
                                                width: 15.2.w,
                                              ),
                                            ),
                                            SizedBox(width: 12.30.w),
                                            GestureDetector(
                                              onTap: () {
                                                if (medCard == e) {
                                                  medCard = null;
                                                } else {
                                                  medCard = e;
                                                }
                                                model.notifyListeners();
                                              },
                                              child: TextView(
                                                text: medCard == e
                                                    ? 'Hide'
                                                    : 'Show',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: medCard == e
                                                      ? AppColors.red
                                                      : AppColors.primary,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: medCard == e
                                                      ? AppColors.red
                                                      : AppColors.primary,
                                                ),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width:
                                            //       medCard == e
                                            //       ? 6.w
                                            //       : 0.w,
                                            // ),
                                            // medCard == e
                                            //     ? IconButton(
                                            //         onPressed:
                                            //             () {},
                                            //         icon: Icon(
                                            //           Icons
                                            //               .system_update_outlined,
                                            //           size: 18.20
                                            //               .sp,
                                            //         ),
                                            //       )
                                            //     : SizedBox.shrink(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  medCard == e
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14.w,
                                            horizontal: 4.8.w,
                                          ),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextFormWidget(
                                                hint: 'Medication Name',
                                                borderColor:
                                                    AppColors.transparent,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                label: '',
                                                hintSize: 14.60.sp,
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  color: AppColors.infoGrey,
                                                ),
                                                fillColor: AppColors.grey,
                                                isFilled: true,
                                                readOnly: true,
                                                controller:
                                                    TextEditingController(
                                                      text: e.medicationName,
                                                    ),
                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 16.h),
                                              TextFormWidget(
                                                hint: 'Drug Name',
                                                borderColor:
                                                    AppColors.transparent,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                label: '',
                                                hintSize: 14.60.sp,
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  color: AppColors.infoGrey,
                                                ),
                                                fillColor: AppColors.grey,
                                                isFilled: true,
                                                readOnly: true,
                                                controller:
                                                    TextEditingController(
                                                      text: e.drugName,
                                                    ),
                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 16.h),
                                              TextView(
                                                text: 'Medication Type',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 16.60.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 12.h),
                                              TextFormWidget(
                                                borderColor:
                                                    AppColors.transparent,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                label: '',
                                                hintSize: 16.60.sp,
                                                readOnly: true,
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  color: AppColors.infoGrey,
                                                ),
                                                fillColor: AppColors.grey,
                                                isFilled: true,
                                                prefixWidget:
                                                    e.medicationType!.isNotEmpty
                                                    ? Padding(
                                                        padding: EdgeInsets.all(
                                                          10.w,
                                                        ),
                                                        child: SvgPicture.asset(
                                                          e.medicationTypeIcon!,
                                                        ),
                                                      )
                                                    : SizedBox.shrink(),
                                                suffixWidget: IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    color: AppColors.greyee,
                                                  ),
                                                  onPressed: () async {
                                                    // final result =
                                                    //     await showMedTypeMenu(
                                                    //       context,
                                                    //     );

                                                    // if (result !=
                                                    //     null) {
                                                    //   setModalState(() {
                                                    //     medTypeResultImage =
                                                    //         result["icon"] ??
                                                    //         '';
                                                    //     medTypeController.text =
                                                    //         result["type"] ??
                                                    //         '';
                                                    //   });
                                                    // }
                                                  },
                                                ),
                                                controller:
                                                    TextEditingController(
                                                      text: e.medicationType,
                                                    ),
                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 16.h),
                                              TextView(
                                                text: 'Description',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 16.60.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              TextFormWidget(
                                                borderColor:
                                                    AppColors.transparent,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                label: '',
                                                hintSize: 16.60.sp,
                                                readOnly: true,
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  color: AppColors.infoGrey,
                                                ),
                                                fillColor: AppColors.grey,
                                                isFilled: true,
                                                controller:
                                                    TextEditingController(
                                                      text: e.description,
                                                    ),
                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 16.h),
                                              TextView(
                                                text:
                                                    'Medication picture upload',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 16.60.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              SizedBox(
                                                width: double.infinity,
                                                child: DottedBorder(
                                                  options:
                                                      RoundedRectDottedBorderOptions(
                                                        dashPattern: [3, 3],
                                                        strokeWidth: .94,
                                                        radius: Radius.circular(
                                                          10,
                                                        ),
                                                        color:
                                                            AppColors.infoGrey1,
                                                      ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 16.20.w,
                                                          horizontal: 16.0.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10.r,
                                                          ),
                                                      color: AppColors.white,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 140.w,
                                                          height: 84.h,
                                                          decoration: BoxDecoration(
                                                            color:
                                                                AppColors.grey,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),
                                                          ),
                                                          child: Center(
                                                            child:
                                                                e.medicationFile !=
                                                                    null
                                                                ? Image.file(
                                                                    e.medicationFile!,
                                                                    height:
                                                                        75.80.h,
                                                                    width:
                                                                        70.80.w,
                                                                  )
                                                                : SvgPicture.asset(
                                                                    AppImage
                                                                        .image_icon,
                                                                  ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                // model.imageDrug = null;
                                                                // model.notifyListeners();
                                                              },
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .delete,
                                                                    height:
                                                                        16.68.h,
                                                                    width:
                                                                        15.2.w,
                                                                  ),
                                                            ),
                                                            SizedBox(
                                                              width: 18.30.w,
                                                            ),
                                                            GestureDetector(
                                                              // onTap: () => model.pickDrugImage(
                                                              //   context,
                                                              // ),
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .upload,
                                                                    height:
                                                                        17.0.h,
                                                                    width:
                                                                        16.68.w,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 24.0.h),
                                              TextView(
                                                text: 'SET SCHEDULE AND DOSAGE',
                                                textStyle: TextStyle(
                                                  fontFamily: 'GoogleSans',
                                                  fontSize: 14.80.sp,
                                                  color: AppColors.grey1,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 12.h),
                                              Divider(color: AppColors.grey),
                                              SizedBox(height: 12.h),
                                              Row(
                                                children: [
                                                  TextView(
                                                    text: 'Dosage ',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 16.60.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  TextView(
                                                    text: '(mg)',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 16.60.sp,
                                                      color: AppColors.grey1,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 14.0.h),
                                              TextFormWidget(
                                                borderColor:
                                                    AppColors.transparent,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                label: e.dosage,
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 16.80.sp,
                                                  color: AppColors.infoGrey,
                                                ),
                                                fillColor: AppColors.grey,
                                                isFilled: true,
                                                readOnly: true,
                                                suffixWidget: IconButton(
                                                  onPressed: () async {
                                                    // final result =
                                                    //     await showMedDosageMenu(
                                                    //       context,
                                                    //     );
                                                    // if (result !=
                                                    //     null) {
                                                    //   setModalState(() {
                                                    //     medDosageController.text =
                                                    //         result;
                                                    //   });
                                                    // }
                                                  },
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColors.grey1,
                                                    size: 20.sp,
                                                  ),
                                                ),
                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 24.0.h),
                                              TextFormWidget(
                                                hint: 'Start Date & Time',
                                                borderColor:
                                                    AppColors.transparent,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                label: '',
                                                readOnly: true,
                                                hintSize: 14.60.sp,
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  color: AppColors.infoGrey,
                                                ),
                                                fillColor: AppColors.grey,
                                                isFilled: true,

                                                controller:
                                                    TextEditingController(
                                                      text: e.dateAndTime,
                                                    ),
                                                suffixWidget: Padding(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: GestureDetector(
                                                    // onTap: () =>
                                                    // model.selectDate(
                                                    //   context,
                                                    // ),
                                                    child: SvgPicture.asset(
                                                      AppImage.calendar,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 24.0.h),
                                              TextFormWidget(
                                                hint: 'Duration',
                                                borderColor:
                                                    AppColors.transparent,
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
                                                readOnly: true,
                                                controller:
                                                    TextEditingController(
                                                      text: e.duration,
                                                    ),
                                                suffixWidget: IconButton(
                                                  onPressed: () async {
                                                    // final result =
                                                    //     await showMedDurationMenu(
                                                    //       context,
                                                    //     );
                                                    // if (result !=
                                                    //     null) {
                                                    //   setModalState(() {
                                                    //     medDurationController
                                                    //         .text = model.getStringFrDuration(
                                                    //       result,
                                                    //     );
                                                    //     _duration =
                                                    //         int.parse(
                                                    //           result,
                                                    //         );
                                                    //     intList = List.generate(
                                                    //       _duration!,
                                                    //       (
                                                    //         index,
                                                    //       ) =>
                                                    //           index,
                                                    //     );
                                                    //   });

                                                    //   dateTimeObject =
                                                    //       inputFormat.parse(
                                                    //         model.pickedDate!,
                                                    //       );
                                                    //   endDateController
                                                    //       .text = dateTimeObject!
                                                    //       .add(
                                                    //         Duration(
                                                    //           days: int.parse(
                                                    //             result,
                                                    //           ),
                                                    //         ),
                                                    //       )
                                                    //       .toString();
                                                    //   model
                                                    //       .notifyListeners();
                                                    // }
                                                  },
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColors.grey1,
                                                    size: 20.sp,
                                                  ),
                                                ),
                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 24.0.h),
                                              Row(
                                                children: [
                                                  TextView(
                                                    text: 'End Date ',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 16.60.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.info_outline,
                                                    color: AppColors.yellow,
                                                    size: 20.sp,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 14.0.h),
                                              TextFormWidget(
                                                borderColor:
                                                    AppColors.transparent,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                label: DateFormat('dd MMM yyyy')
                                                    .format(
                                                      DateTime.parse(
                                                        e.endDate!,
                                                      ),
                                                    ),
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 16.2.sp,
                                                  color: AppColors.infoGrey,
                                                ),
                                                fillColor: AppColors.grey,
                                                isFilled: true,
                                                readOnly: true,

                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 24.0.h),
                                              TextFormWidget(
                                                hint:
                                                    'No of Times to be taken daily',
                                                borderColor:
                                                    AppColors.transparent,
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
                                                readOnly: true,
                                                controller:
                                                    TextEditingController(
                                                      text: e.timesToTake,
                                                    ),
                                                suffixWidget: IconButton(
                                                  onPressed: () async {
                                                    // final result =
                                                    //     await showDailyInTakeMenu(
                                                    //       context,
                                                    //     );
                                                    // if (result !=
                                                    //     null) {
                                                    //   setModalState(() {
                                                    //     medDailyInTakenController.text =
                                                    //         result;
                                                    //   });
                                                    // }
                                                  },
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColors.grey1,
                                                    size: 20.sp,
                                                  ),
                                                ),
                                                validator:
                                                    AppValidator.validateString(),
                                              ),
                                              SizedBox(height: 24.0.h),
                                              if (e.listOfTimes!.isNotEmpty &&
                                                  e.timesToTake!.isNotEmpty)
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ...e.listOfTimes!.map(
                                                      (list) => model
                                                          .dosageAfterWidgetContainer(
                                                            context: context!,
                                                            callback: list,
                                                            dosageMap:
                                                                e.dosageMap,
                                                            listOfTimes:
                                                                List.generate(
                                                                  int.parse(
                                                                    e.timesToTake!,
                                                                  ),
                                                                  (index) =>
                                                                      index,
                                                                ),
                                                          ),
                                                    ),
                                                    SizedBox(height: 14.0.h),
                                                    TextView(
                                                      text: 'Add Note',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 16.60.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    TextFormWidget(
                                                      borderColor:
                                                          AppColors.transparent,
                                                      borderTopLeft: 10.r,
                                                      borderTopRight: 10.r,
                                                      borderBottomLeft: 10.r,
                                                      borderBottomRight: 10.r,
                                                      labelStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Arial',
                                                        fontSize: 16.80.sp,
                                                        color:
                                                            AppColors.infoGrey,
                                                      ),
                                                      fillColor: AppColors.grey,
                                                      isFilled:
                                                          true, // Minimum number of lines visible
                                                      readOnly: true,
                                                      maxline:
                                                          3, // Maximum number of lines visible before scrolling
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      validator:
                                                          AppValidator.validateString(),
                                                      controller:
                                                          TextEditingController(
                                                            text: e.note,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14.w,
                                            horizontal: 16.w,
                                          ),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColors.grey,
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                          child: TextView(
                                            text: e.medicationName ?? '',
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Arial',
                                              fontSize: 17.2.sp,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Medication Name',
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: '',
                          hintSize: 14.60.sp,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: medNameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 16.h),
                        TextFormWidget(
                          hint: 'Drug Name',
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: '',
                          hintSize: 14.60.sp,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: drugNameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 16.h),
                        TextView(
                          text: 'Medication Type',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16.60.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: '',
                          hintSize: 16.60.sp,
                          readOnly: true,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          prefixWidget: medTypeResultImage.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: SvgPicture.asset(medTypeResultImage),
                                )
                              : SizedBox.shrink(),
                          suffixWidget: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.greyee,
                            ),
                            onPressed: () async {
                              final result = await showMedTypeMenu(context!);

                              if (result != null) {
                                setModalState!(() {
                                  medTypeResultImage = result["icon"] ?? '';
                                  medTypeController.text = result["type"] ?? '';
                                });
                              }
                            },
                          ),
                          controller: medTypeController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 16.h),
                        TextView(
                          text: 'Description',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16.60.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextFormWidget(
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: '',
                          hintSize: 16.60.sp,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: descriptionController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 16.h),
                        TextView(
                          text: 'Medication picture upload',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16.60.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: double.infinity,
                          child: DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              dashPattern: [3, 3],
                              strokeWidth: .94,
                              radius: Radius.circular(10),
                              color: AppColors.infoGrey1,
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 16.20.w,
                                horizontal: 16.0.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 140.w,
                                    height: 84.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: model.imageDrug != null
                                          ? Image.file(
                                              model.imageDrug!,
                                              height: 75.80.h,
                                              width: 70.80.w,
                                            )
                                          : SvgPicture.asset(
                                              AppImage.image_icon,
                                            ),
                                    ),
                                  ),
                                  model.imageDrug != null
                                      ? Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                model.imageDrug = null;
                                                model.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.delete,
                                                height: 16.68.h,
                                                width: 15.2.w,
                                              ),
                                            ),
                                            SizedBox(width: 18.30.w),
                                            GestureDetector(
                                              onTap: () =>
                                                  model.pickDrugImage(context!),
                                              child: SvgPicture.asset(
                                                AppImage.upload,
                                                height: 17.0.h,
                                                width: 16.68.w,
                                              ),
                                            ),
                                          ],
                                        )
                                      : GestureDetector(
                                          onTap: () =>
                                              model.pickDrugImage(context!),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 22.w,
                                              vertical: 10.10.w,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              color: AppColors.grey,
                                            ),
                                            child: TextView(
                                              text: 'Upload',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 14.40.sp,
                                                color: AppColors.deep,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0.h),
                        TextView(
                          text: 'SET SCHEDULE AND DOSAGE',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.80.sp,
                            color: AppColors.grey1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Divider(color: AppColors.grey),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            TextView(
                              text: 'Dosage ',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16.60.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextView(
                              text: '(mg)',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16.60.sp,
                                color: AppColors.grey1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.0.h),
                        TextFormWidget(
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: model.getStringFrLabel(
                            medDosageController.text,
                          ),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 16.80.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: true,
                          suffixWidget: IconButton(
                            onPressed: () async {
                              final result = await showMedDosageMenu(context!);
                              if (result != null) {
                                setModalState!(() {
                                  medDosageController.text = result;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.grey1,
                              size: 20.sp,
                            ),
                          ),
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 24.0.h),
                        TextFormWidget(
                          hint: 'Start Date & Time',
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: '',
                          readOnly: true,
                          hintSize: 14.60.sp,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: model.dateTimeController,
                          suffixWidget: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: GestureDetector(
                              onTap: () => model.selectDate(context!),
                              child: SvgPicture.asset(
                                AppImage.calendar,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 24.0.h),
                        TextFormWidget(
                          hint: 'Duration',
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
                          readOnly: true,
                          controller: medDurationController,
                          suffixWidget: IconButton(
                            onPressed: () async {
                              final result = await showMedDurationMenu(
                                context!,
                              );
                              if (result != null) {
                                setModalState!(() {
                                  medDurationController.text = model
                                      .getStringFrDuration(result);
                                  _duration = int.parse(result);
                                  intList = List.generate(
                                    _duration!,
                                    (index) => index,
                                  );
                                });

                                dateTimeObject = inputFormat.parse(
                                  model.pickedDate!,
                                );
                                endDateController.text = dateTimeObject!
                                    .add(Duration(days: int.parse(result)))
                                    .toString();
                                model.notifyListeners();
                              }
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.grey1,
                              size: 20.sp,
                            ),
                          ),
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 24.0.h),
                        Row(
                          children: [
                            TextView(
                              text: 'End Date ',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16.60.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.info_outline,
                              color: AppColors.yellow,
                              size: 20.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 14.0.h),
                        TextFormWidget(
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: endDateController.text.isNotEmpty
                              ? DateFormat(
                                  'dd MMM yyyy',
                                ).format(DateTime.parse(endDateController.text))
                              : '',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 16.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: true,

                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 24.0.h),
                        TextFormWidget(
                          hint: 'No of Times to be taken daily',
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
                          readOnly: true,
                          controller: medDailyInTakenController,
                          suffixWidget: IconButton(
                            onPressed: () async {
                              final result = await showDailyInTakeMenu(
                                context!,
                              );
                              if (result != null) {
                                setModalState!(() {
                                  medDailyInTakenController.text = result;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.grey1,
                              size: 20.sp,
                            ),
                          ),
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 24.0.h),
                        if (intList.isNotEmpty &&
                            medDailyInTakenController.text.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...intList.map(
                                (e) => model.dosageWidgetContainer(
                                  context: context!,
                                  callback: e,
                                  listOfTimes: List.generate(
                                    int.parse(medDailyInTakenController.text),
                                    (index) => index,
                                  ),
                                ),
                              ),
                              SizedBox(height: 14.0.h),
                              TextView(
                                text: 'Add Note',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextFormWidget(
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  fontSize: 16.80.sp,
                                  color: AppColors.infoGrey,
                                ),
                                fillColor: AppColors.grey,
                                isFilled:
                                    true, // Minimum number of lines visible
                                maxline:
                                    3, // Maximum number of lines visible before scrolling
                                keyboardType: TextInputType.multiline,
                                validator: AppValidator.validateString(),
                                controller: noteController,
                              ),
                              SizedBox(height: 20.h),
                              Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    addReminderToList(model);
                                  },
                                  child: TextView(
                                    text: 'Add Another Medication',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 17.2.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primary,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationThickness: 1.4,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.h),
                              ButtonWidget(
                                border: 100.r,
                                buttonColor: AppColors.primary,
                                buttonText: 'Preview',

                                color: AppColors.white,
                                buttonBorderColor: AppColors.transparent,
                                onPressed: () {
                                  // addReminderToList(model);
                                  linIndex++;
                                  model.notifyListeners();
                                },
                              ),
                              SizedBox(height: 30.h),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    ),
  );

  secondModalFlow({
    AuthViewModel? model,
    StateSetter? setModalState,
    ScrollController? scrollController,
    BuildContext? context,
  }) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22.r),
      color: AppColors.white,
    ),
    child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.6.w, vertical: 20.w),
      controller: scrollController,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20, width: 20),
              TextView(
                text: modalName(),
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.70.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deep,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 4.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context!);
                  },
                  child: SvgPicture.asset(
                    AppImage.cancel,
                    height: 14.20,
                    width: 14.20,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 13.60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context!).size.width * .82,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ), // Adjust radius as needed
                  child: LinearProgressIndicator(
                    minHeight: 4.0, // Adjust height as needed
                    value: linIndex / 4,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/4',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    ),
  );
}
