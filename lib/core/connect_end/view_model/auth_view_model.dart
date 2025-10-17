// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, strict_top_level_inference, unused_field, use_build_context_synchronously
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/country_code_format.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_entity_model/create_reminder_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_entity_model/medication_image.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_entity_model/payment.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_response_model/create_reminder_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/daily_dose_time.dart'
    as getId;
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/data.dart'
    as getReminderId;
import 'package:medicate_app/core/connect_end/model/get_today_reminder_model/get_today_reminder_model.dart';
import 'package:medicate_app/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/support_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_doses_status_model/update_doses_status_model.dart';
import 'package:medicate_app/core/connect_end/model/update_user_profile_entity.dart';
import 'package:medicate_app/core/connect_end/model/upload_image_reminder_response_model/upload_image_reminder_response_model.dart';
import 'package:medicate_app/ui/dashboard/reminder/medication_class.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/dashboard/reminder/med_type.dart';
import '../../../ui/widget/button.dart';
import '../../../ui/widget/text.dart';
import '../../../ui/widget/text_form_dose_widget.dart';
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
import '../model/create_reminder_entity_model/daily_dose_time.dart';
import '../model/create_reminder_entity_model/medication.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_reminder_by_id/get_reminder_by_id.dart';
import '../model/get_reminder_response_model/get_reminder_response_model.dart';
import '../model/get_today_reminder_model/datum.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_response_model/set_pin_response_model.dart';
import '../model/sign_up_response_model/sign_up_response_model.dart';
import '../model/update_reminder_entity_model/update_reminder_entity_model.dart';
import '../model/update_user_profile_response_model/update_user_profile_response_model.dart';
import '../model/verify_otp_response_model/verify_otp_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_phone_entity_model.dart';
import '../repo/repo_impl.dart';

String startDateIso = '';

List<MedicationClass> medicationClassList = [];

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
  bool isShowMoreSecondModalFlow = false;
  bool get isTogglePasswordConfirm => _isTogglePasswordConfirm;
  bool _isTogglePasswordConfirm = false;
  bool onToggleMic = false;

  LoginResponseModel? _loginResponseModel;
  LoginResponseModel? get loginResponseModel => _loginResponseModel;
  GetReminderById? _getReminderByIdModel;
  GetReminderById? get getReminderByIdModel => _getReminderByIdModel;
  GetTodayReminderModel? _getTodaysReminderModel;
  GetTodayReminderModel? get getTodaysReminderModel => _getTodaysReminderModel;
  UpdateDosesStatusModel? _updateDosesStatusModel;
  UpdateDosesStatusModel? get updateDosesStatusModel => _updateDosesStatusModel;

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
  CreateReminderResponseModel? _createReminderResponseModel;
  CreateReminderResponseModel? get createReminderResponseModel =>
      _createReminderResponseModel;
  UploadImageReminderResponseModel? _uploadImageReminderResponseModel;
  UploadImageReminderResponseModel? get uploadImageReminderResponseModel =>
      _uploadImageReminderResponseModel;
  GetReminderResponseModel? _getReminderResponseModel;
  GetReminderResponseModel? get getReminderResponseModel =>
      _getReminderResponseModel;
  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidate2 = GlobalKey<FormState>();
  TextEditingController countryController = TextEditingController();
  String querySignUpCountry = '';
  int indexOfMedicationClassList = 0;
  bool isNotTapped = false;

  GlobalKey<FormState> formKeyEmailReminder = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPhoneReminder = GlobalKey<FormState>();

  GlobalKey<FormState> firstFormReminderKey = GlobalKey<FormState>();
  GlobalKey<FormState> firstFormReminderUpdateKey = GlobalKey<FormState>();
  GlobalKey<FormState> secondFormReminderKey = GlobalKey<FormState>();
  GlobalKey<FormState> secondFormReminderUpdateKey = GlobalKey<FormState>();

  AuthViewModel({this.context});

  Timer? _timer;
  int _start = 60;
  final _pickImage = ImagePickerHandler();
  File? image;
  File? imageDrug;
  String? filename;
  String? drugFilename;
  int costTotal = 0;

  TextEditingController dateTimeController = TextEditingController();
  TextEditingController dateTimeControllerUpdate = TextEditingController();
  String? pickedDate;
  String endDateIso = '';
  String endDateIsoUpdate = '';

  List<List<String>> periodLabels = [];
  List<List<String>> periodAfterLabels = [];

  int? dosageValue;
  int? dosageAddedValue;
  int? dosageAfterValue;
  List<List<TextEditingController>> doseControllers = [];
  List<List<TextEditingController>> doseAfterControllers = [];
  bool isChecked = false;
  int? totalDuration;
  bool isPhoneValid = false;

  TextEditingController medNameController = TextEditingController();
  TextEditingController medDosageController = TextEditingController();
  TextEditingController medDurationController = TextEditingController();
  TextEditingController medDailyInTakenController = TextEditingController();
  TextEditingController drugNameController = TextEditingController();
  TextEditingController medTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController endDateController = TextEditingController(text: '');
  TextEditingController medNameControllerUpdate = TextEditingController();
  TextEditingController medDosageControllerUpdate = TextEditingController();
  TextEditingController medDurationControllerUpdate = TextEditingController();
  TextEditingController medDailyInTakenControllerUpdate =
      TextEditingController();
  TextEditingController drugNameControllerUpdate = TextEditingController();
  TextEditingController medTypeControllerUpdate = TextEditingController();
  TextEditingController descriptionControllerUpdate = TextEditingController();
  TextEditingController noteControllerUpdate = TextEditingController();
  TextEditingController endDateControllerUpdate = TextEditingController(
    text: '',
  );
  MedicationClass? medCard;
  bool isTapped = false;
  bool isTappedCon = false;
  bool isTappedPhoneAdded = false;
  bool isTappedEmailAdded = false;

  String medTypeResult = '';
  String medTypeResultImage = '';
  String medTypeResultImageUpdate = '';
  int? index;
  int? indexDuration;
  int? indexDaily;
  int linIndex = 1;
  int linIndexUpdate = 1;
  int pageOngoing = 1;
  int pageCompleted = 1;
  int pageToday = 1;
  String onTapPaymentMeth = '';
  bool isLoadNoMore = false;
  bool onTapToAddAnotherReminder = false;
  bool onTapViewSingleReminder = false;

  DateFormat inputFormat = DateFormat("dd MMM, yyyy");
  DateTime? dateTimeObject;

  List<MedType> medTypeList = [
    MedType(medType: 'Pill', medTypeImage: AppImage.pill),
    MedType(medType: 'Syrup', medTypeImage: AppImage.syrup),
    MedType(medType: 'Injection', medTypeImage: AppImage.syringe),
    MedType(medType: 'Drip', medTypeImage: AppImage.drip),
    MedType(medType: 'Ointment', medTypeImage: AppImage.ointment),
    MedType(medType: 'Inhaler', medTypeImage: AppImage.inhaler),
    MedType(medType: 'Others', medTypeImage: AppImage.other_meds),
  ];

  int? _duration;
  List<String> emailReminderList = [];
  List<String> addedEmailReminderList = [];
  List<String> phoneReminderList = [];
  List<String> addedPhoneReminderList = [];
  List<String> notificationChannel = [];
  List<int> intList = [];
  final List<int> selectedIndexes = [];
  final List<String> channels = [
    'Email (Free)',
    'Push (Free)',
    'SMS (₦10.00)',
    'Whatsapp (₦20.00)',
    'Phone Call (₦50.00)',
  ];

  List<TextEditingController> medicationNameUpdateControllers = [];
  List<TextEditingController> drugNameUpdateControllers = [];
  List<TextEditingController> medTypeUpdateControllers = [];
  List<TextEditingController> descriptionUpdateControllers = [];
  List<TextEditingController> dosageUpdateControllers = [];
  List<TextEditingController> startDateUpdateControllers = [];
  List<TextEditingController> durationUpdateControllers = [];
  List<TextEditingController> endDateUpdateController = [];
  List<TextEditingController> timesToTakeUpdateController = [];
  List<TextEditingController> noteUpdateController = [];
  List<File> medicationUpdateFile = [];
  List<String> meyTypeUpdateIcon = [];
  String isReminderStatus = 'ongoing';
  String timePeriod = 'morning';

  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('+234')) {
      return phoneNumber.replaceFirst('+234', '0');
    }
    return phoneNumber; // return unchanged if it doesn't start with +234
  }

  errorRemidnderImage(medType) {
    if (medType == 'PILL') {
      return AppImage.pills;
    }
    if (medType == 'SYRUP') {
      return AppImage.syrup;
    }
    if (medType == 'INJECTION') {
      return AppImage.syringe;
    }
    if (medType == 'DRIP') {
      return AppImage.drip;
    }
    if (medType == 'OINTMENT') {
      return AppImage.ointment;
    }
    if (medType == 'INHALER') {
      return AppImage.inhaler;
    }
    if (medType == 'OTHERS') {
      return AppImage.other_meds;
    }
    return AppImage.pill;
  }

  bool checkReminderEmpty() {
    final reminders = getReminderResponseModel?.data?.reminders;

    if (reminders == null || reminders.isEmpty) return true;

    if (isReminderStatus == 'ongoing' && reminders.isNotEmpty) return true;
    if (isReminderStatus == 'completed' && reminders.isNotEmpty) return true;
    if (isReminderStatus == 'today' && reminders.isNotEmpty) return true;

    return false;
  }

  void initUpdateControllers() {
    medicationNameUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.medicationName))
        .toList();
    drugNameUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.drugName))
        .toList();
    medTypeUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.medicationType))
        .toList();
    meyTypeUpdateIcon = medicationClassList
        .map((e) => e.medicationTypeIcon!)
        .toList();
    dosageUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.dosage))
        .toList();
    startDateUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.dateAndTime))
        .toList();
    // update the start date iso as well when selecting date
    // update the end date iso as well when selecting date
    durationUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.duration))
        .toList();
    endDateUpdateController = medicationClassList
        .map((e) => TextEditingController(text: e.endDate))
        .toList();
    timesToTakeUpdateController = medicationClassList
        .map((e) => TextEditingController(text: e.timesToTake))
        .toList();
    noteUpdateController = medicationClassList
        .map((e) => TextEditingController(text: e.note))
        .toList();
    notifyListeners();
  }

  buildChannelList(selectedIndexes) {
    notificationChannel.clear();
    if (selectedIndexes.contains(0)) {
      notificationChannel.add('EMAIL');
    }
    if (selectedIndexes.contains(1)) {
      notificationChannel.add('PUSH');
    }
    if (selectedIndexes.contains(2)) {
      notificationChannel.add('SMS');
    }
    if (selectedIndexes.contains(3)) {
      notificationChannel.add('WHATSAPP');
    }
    if (selectedIndexes.contains(4)) {
      notificationChannel.add('PHONE_CALL');
    }
    notifyListeners();
  }

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
                      text: 'Medication Types',
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
    } else if (linIndex == 4) {
      return 'Make Payment';
    }
    return 'Add Medication';
  }

  String modalNameUpdate() {
    if (linIndexUpdate == 2) {
      return 'Preview Medication';
    } else if (linIndexUpdate == 3) {
      return 'Choose Notification Channel';
    } else if (linIndexUpdate == 4) {
      return 'Make Payment';
    }
    return 'Edit Medication';
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
            initialChildSize: 0.88, // Initial height as percentage of screen
            minChildSize: 0.7, // Minimum height
            maxChildSize: 0.89, // Maximum height
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

  void showUpdateReminderModal({context, data}) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    constraints: BoxConstraints(maxWidth: double.infinity),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.88, // Initial height as percentage of screen
            minChildSize: 0.7, // Minimum height
            maxChildSize: 0.89, // Maximum height
            expand: true, // Set to true for full height initially
            builder: (BuildContext context, ScrollController scrollController) {
              return ViewModelBuilder<AuthViewModel>.reactive(
                viewModelBuilder: () => locator<AuthViewModel>(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                onDispose: (viewModel) {},
                builder: (_, AuthViewModel model, _) {
                  return setModalFlowUpdate(
                    model: model,
                    data: data,
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

    for (int day = 0; day < model.doseControllers.length; day++) {
      List<Map<String, String>> dayDoses = [];

      for (int i = 0; i < model.doseControllers[day].length; i++) {
        dayDoses.add({
          'time': model.doseControllers[day][i].text,
          'period': model.periodLabels[day][i],
          'date': startDateIso.substring(0, 10),
          'isoDate': startDateIso,
        });
      }

      addTimePeriod.add({
        'day': day + 1, // so Day 1, Day 2, etc.
        'doses': dayDoses,
      });
    }

    await Future.delayed(Duration(seconds: 1), () {});
    medicationClassList.add(
      MedicationClass(
        medicationName: medNameController.text,
        drugName: drugNameController.text,
        medicationType: medTypeController.text,
        medicationTypeIcon: medTypeResultImage,
        description: descriptionController.text,
        medicationFile: model.imageDrug,
        dosage: model.getStringFrLabel(medDosageController.text),
        imageData: model.uploadImageReminderResponseModel!.data,
        dateAndTime: model.dateTimeController.text,
        duration: medDurationController.text,
        endDate: endDateController.text,
        startDateIso: DateTime.parse(startDateIso),
        endDateIso: DateTime.parse(endDateIso),
        timesToTake: medDailyInTakenController.text,
        note: noteController.text,
        listOfTimes: intList,
        dosageMap: addTimePeriod,
      ),
    );
    await Future.delayed(Duration(seconds: 1), () {});
    clearReminderMedsVaraibles(model);
    model.notifyListeners();
  }

  clearReminderMedsVaraibles(model) {
    medTypeResultImage = '';
    model.imageDrug = null;
    medNameController.clear();
    drugNameController.clear();
    medTypeController.clear();
    descriptionController.clear();
    medDosageController.clear();
    model.dateTimeController.clear();
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
                    child: TextFormDoseWidget(
                      hint: 'Dose ${e + 1}',
                      borderColor: AppColors.transparent,
                      label: periodLabels.isEmpty
                          ? ''
                          : periodLabels[callback][i],
                      hintSize: 13.40.sp,
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
    required Color color,
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
        border: Border.all(color: color, width: 2),
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

  dosagePreviewWidgetContainer({
    required BuildContext context,
    required int callback,
    required Color color,
    required List<int> listOfTimes,
    required List<Map<String, dynamic>> dosageMap,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.w),
      padding: EdgeInsets.symmetric(
        vertical: dosageAfterValue == callback ? 12.w : 8.w,
        horizontal: 14.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
        color: AppColors.white,
      ),
      child: dosageAfterValue == callback
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Render each day
                ...dosageMap.asMap().entries.map((entry) {
                  final v = entry.value; // {day: 1, doses: [...]}

                  return Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Day header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: "Day ${v['day']}",
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 15.20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                dosageAfterValue = null;
                                locator<AuthViewModel>().notifyListeners();
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.grey1,
                                size: 24.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),

                        // 🔹 Loop through doses of this day
                        ...List.generate((v['doses'] as List).length, (j) {
                          final dose = v['doses'][j];
                          final isLast = j == (v['doses'] as List).length - 1;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.h),
                              TextView(
                                text: "Dose ${j + 1}",
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              TextView(
                                text: "${dose['time']}",
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 6.10.h),
                              if (!isLast)
                                Divider(
                                  color: AppColors.fineGrey,
                                  thickness: .4,
                                ),
                              if (!isLast) SizedBox(height: 6.10.h),
                            ],
                          );
                        }),
                      ],
                    ),
                  );
                }),
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
                    locator<AuthViewModel>().notifyListeners();
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

  viewPreviewWidgetContainer({
    required BuildContext context,
    required int callback,
    required Color color,
    required List<int> listOfTimes,
    required List<getId.DailyDoseTime> dosageMap,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.w),
      padding: EdgeInsets.symmetric(
        vertical: dosageAfterValue == callback ? 10.w : 6.w,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
        color: AppColors.white,
      ),
      child: dosageAfterValue == callback
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Day header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: "Day ${callback + 1}",
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 15.20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
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
                // 🔹 Render each day
                ...dosageMap.asMap().entries.map((entry) {
                  final i = entry.key;
                  final v = entry.value;
                  final isLast = i == (dosageMap as List).length - 1;

                  return Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4.h),
                            TextView(
                              text: "Dose ${i + 1}",
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            TextView(
                              text: "${v.time} ${checkTimePeriod(v.time)}",
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 6.10.h),
                            if (!isLast)
                              Divider(color: AppColors.fineGrey, thickness: .4),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
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

      await selectTime(context);
      startDateIso = DateTime.utc(
        pickedDated.year,
        pickedDated.month,
        pickedDated.day,
      ).toIso8601String();
      print('After time select → startDateIso: $startDateIso');
      print('iso$startDateIso');
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
        "HH:mm a",
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
          uploadImageReminder(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageDrug).readAsBytesSync(),
              filename: imageDrug!.path.split("/").last,
            ),
          );
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
    } else if (linIndex == 3) {
      return thirdModalFlow(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    } else if (linIndex == 4) {
      return fourthModalFlow(
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
                    value: linIndex / 3,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/3',
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
          medicationClassList.isEmpty
              ? Form(
                  key: firstFormReminderKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormWidget(
                        hint: 'Medication Name',
                        borderColor: AppColors.transparent,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        hintSize: 12.42.sp,
                        fillColor: AppColors.grey,
                        isFilled: true,
                        controller: medNameController,
                        validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                      ),
                      SizedBox(height: 16.h),

                      TextFormWidget(
                        hint: 'Drug Name',
                        borderColor: AppColors.transparent,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        hintSize: 12.42.sp,
                        fillColor: AppColors.grey,
                        isFilled: true,
                        controller: drugNameController,
                        validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                      ),
                      SizedBox(height: 16.h),
                      TextView(
                        text: 'Medication Type',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.sp,
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
                        readOnly: true,
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
                            final result = await showMedTypeMenu(context);

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
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                      ),
                      SizedBox(height: 16.h),
                      TextView(
                        text: 'Description',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.sp,
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
                        fillColor: AppColors.grey,
                        isFilled: true,
                        controller: descriptionController,
                        validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                      ),
                      SizedBox(height: 16.h),
                      TextView(
                        text: 'Medication picture upload',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.sp,
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
                                    child: model!.imageDrug != null
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
                                              print(
                                                'null delete${model.imageDrug}',
                                              );
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
                                                model.pickDrugImage(context),
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
                                            model.pickDrugImage(context),
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
                              fontSize: 14.6.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextView(
                            text: '(mg)',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.60.sp,
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
                          fontSize: 14.80.sp,
                          color: AppColors.infoGrey,
                        ),
                        fillColor: AppColors.grey,
                        isFilled: true,
                        readOnly: true,
                        suffixWidget: IconButton(
                          onPressed: () async {
                            final result = await showMedDosageMenu(context);
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

                        style: TextStyle(
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          color: AppColors.infoGrey.withOpacity(.90),
                        ),
                      ),
                      SizedBox(height: 24.0.h),
                      TextFormWidget(
                        hint: 'Start Date & Time',
                        borderColor: AppColors.transparent,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        readOnly: true,
                        hintSize: 12.42.sp,
                        fillColor: AppColors.grey,
                        isFilled: true,
                        controller: model.dateTimeController,
                        suffixWidget: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: GestureDetector(
                            onTap: () => model.selectDate(context),
                            child: SvgPicture.asset(
                              AppImage.calendar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                      ),
                      SizedBox(height: 24.0.h),
                      TextFormWidget(
                        hint: 'Duration',
                        label: 'E.g 15',
                        borderColor: AppColors.transparent,
                        keyboardType: TextInputType.number,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        hintSize: 12.42.sp,
                        fillColor: AppColors.grey,
                        isFilled: true,
                        controller: medDurationController,
                        onChange: (p0) {
                          if (p0 != null && p0.trim().isNotEmpty) {
                            final parsed = int.tryParse(p0.trim());
                            if (parsed != null) {
                              _duration = parsed;
                              intList = List.generate(
                                _duration!,
                                (index) => index,
                              );
                              dateTimeObject = inputFormat.parse(
                                model.pickedDate!,
                              );
                              final localDate = dateTimeObject!;
                              final utcStartDate = DateTime.utc(
                                localDate.year,
                                localDate.month,
                                localDate.day,
                              );

                              // Now safely add your duration
                              final utcEndDate = utcStartDate.add(
                                Duration(days: _duration!),
                              );

                              // Display or store
                              endDateController.text = utcEndDate
                                  .toIso8601String();
                              endDateIso = utcEndDate.toIso8601String();
                            } else {
                              // Optional: handle invalid input (e.g., show error or clear output)
                              print('⚠️ Invalid number input: $p0');
                            }
                          } else {
                            // Optional: clear output when input is empty
                            endDateController.clear();
                          }
                          model.notifyListeners();
                        },
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                        labelStyle: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                          color: AppColors.infoGrey,
                        ),
                      ),
                      SizedBox(height: 24.0.h),
                      Row(
                        children: [
                          TextView(
                            text: 'End Date ',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
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
                                'dd MMM, yyyy',
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
                        // validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                        hintSize: 14.sp,
                      ),
                      SizedBox(height: 24.0.h),
                      TextFormWidget(
                        hint: 'No of Times to be taken daily',
                        borderColor: AppColors.transparent,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        hintSize: 12.52.sp,
                        fillColor: AppColors.grey,
                        isFilled: true,
                        readOnly: true,
                        controller: medDailyInTakenController,
                        suffixWidget: IconButton(
                          onPressed: () async {
                            final result = await showDailyInTakeMenu(context);
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
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                      ),
                      SizedBox(height: 24.0.h),
                      if (intList.isNotEmpty &&
                          medDailyInTakenController.text.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...intList.map(
                              (e) => model.dosageWidgetContainer(
                                context: context,
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
                                fontSize: 14.sp,
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
                              fillColor: AppColors.grey,
                              isFilled: true, // Minimum number of lines visible
                              maxline:
                                  3, // Maximum number of lines visible before scrolling
                              keyboardType: TextInputType.multiline,
                              validator: AppValidator.validateString(),
                              style: TextStyle(
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'GoogleSans',
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (firstFormReminderKey.currentState!
                                      .validate()) {
                                    addReminderToList(model);
                                  } else {
                                    AppUtils.snackbar(
                                      context,
                                      message:
                                          'Kindly input all required fields.',
                                      error: true,
                                    );
                                  }
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
                              onPressed: () async {
                                if (firstFormReminderKey.currentState!
                                    .validate()) {
                                  await addReminderToList(model);
                                  linIndex++;
                                  model.notifyListeners();
                                }
                                // for (
                                //   var day = 0;
                                //   day < model.doseControllers.length;
                                //   day++
                                // ) {
                                //   print("Day ${day + 1}:");
                                //   for (var dose in model.doseControllers[day]) {
                                //     print("  ${dose.text}");
                                //   }
                                // }
                              },
                            ),
                            SizedBox(height: 130.h),
                          ],
                        ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    ...medicationClassList.asMap().entries.map((entry) {
                      final index = entry.key;
                      final e = entry.value;
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
                            border: Border.all(color: AppColors.buttonGrey1),
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
                                            fontSize: 14.sp,
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
                                                    fontWeight: FontWeight.w500,
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
                                            medicationClassList.remove(e);
                                            model!.notifyListeners();
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
                                            model!.notifyListeners();
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
                                            borderColor: AppColors.transparent,
                                            borderTopLeft: 10.r,
                                            borderTopRight: 10.r,
                                            borderBottomLeft: 10.r,
                                            borderBottomRight: 10.r,
                                            hintSize: 12.52.sp,
                                            fillColor: AppColors.grey,
                                            isFilled: true,
                                            controller: TextEditingController(
                                              text: e.medicationName,
                                            ),
                                            validator:
                                                AppValidator.validateString(),
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                            onChange: (val) {
                                              medicationClassList[index]
                                                      .medicationName =
                                                  val;
                                              model!.notifyListeners();
                                            },
                                          ),
                                          SizedBox(height: 16.h),
                                          TextFormWidget(
                                            hint: 'Drug Name',
                                            borderColor: AppColors.transparent,
                                            borderTopLeft: 10.r,
                                            borderTopRight: 10.r,
                                            borderBottomLeft: 10.r,
                                            borderBottomRight: 10.r,
                                            hintSize: 12.52.sp,
                                            fillColor: AppColors.grey,
                                            isFilled: true,
                                            readOnly: true,
                                            controller: TextEditingController(
                                              text: e.drugName,
                                            ),
                                            validator:
                                                AppValidator.validateString(),
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                          TextView(
                                            text: 'Medication Type',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.sp,
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
                                            readOnly: true,
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
                                            controller: TextEditingController(
                                              text: e.medicationType,
                                            ),
                                            validator:
                                                AppValidator.validateString(),
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                          TextView(
                                            text: 'Description',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.0.sp,
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
                                            readOnly: true,
                                            fillColor: AppColors.grey,
                                            isFilled: true,
                                            controller: TextEditingController(
                                              text: e.description,
                                            ),
                                            validator:
                                                AppValidator.validateString(),
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                          TextView(
                                            text: 'Medication picture upload',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.sp,
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
                                                        color: AppColors.grey,
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
                                                                height: 75.80.h,
                                                                width: 70.80.w,
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
                                                                AppImage.delete,
                                                                height: 16.68.h,
                                                                width: 15.2.w,
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
                                                                AppImage.upload,
                                                                height: 17.0.h,
                                                                width: 16.68.w,
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
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextView(
                                                text: '(mg)',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.60.sp,
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
                                            label: e.dosage,
                                            labelStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Arial',
                                              fontSize: 16.20.sp,
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
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 24.0.h),
                                          TextFormWidget(
                                            hint: 'Start Date & Time',
                                            borderColor: AppColors.transparent,
                                            borderTopLeft: 10.r,
                                            borderTopRight: 10.r,
                                            borderBottomLeft: 10.r,
                                            borderBottomRight: 10.r,
                                            readOnly: true,
                                            hintSize: 12.52.sp,

                                            fillColor: AppColors.grey,
                                            isFilled: true,

                                            controller: TextEditingController(
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
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 24.0.h),
                                          TextFormWidget(
                                            hint: 'Duration',
                                            hintSize: 12.52.sp,
                                            keyboardType: TextInputType.number,
                                            borderColor: AppColors.transparent,
                                            borderTopLeft: 10.r,
                                            borderTopRight: 10.r,
                                            borderBottomLeft: 10.r,
                                            borderBottomRight: 10.r,
                                            fillColor: AppColors.grey,
                                            isFilled: true,
                                            readOnly: true,
                                            onChange: (p0) {
                                              if (p0 != null &&
                                                  p0.trim().isNotEmpty) {
                                                final parsed = int.tryParse(
                                                  p0.trim(),
                                                );

                                                if (parsed != null) {
                                                  _duration = parsed;

                                                  intList = List.generate(
                                                    _duration!,
                                                    (index) => index,
                                                  );

                                                  dateTimeObject = inputFormat
                                                      .parse(
                                                        model!.pickedDate!,
                                                      );

                                                  endDateController.text =
                                                      dateTimeObject!
                                                          .add(
                                                            Duration(
                                                              days: _duration!,
                                                            ),
                                                          )
                                                          .toString();
                                                } else {
                                                  // Optional: handle invalid input (e.g., show error or clear output)
                                                  print(
                                                    '⚠️ Invalid number input: $p0',
                                                  );
                                                }
                                              } else {
                                                // Optional: clear output when input is empty
                                                endDateController.clear();
                                              }

                                              model!.notifyListeners();
                                            },

                                            controller: TextEditingController(
                                              text: e.duration,
                                            ),
                                            validator:
                                                AppValidator.validateString(),
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 24.0.h),
                                          Row(
                                            children: [
                                              TextView(
                                                text: 'End Date ',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.sp,
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
                                            label: DateFormat('dd MMM yyyy')
                                                .format(
                                                  DateTime.parse(e.endDate!),
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
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 24.0.h),
                                          TextFormWidget(
                                            hint:
                                                'No of Times to be taken daily',
                                            borderColor: AppColors.transparent,
                                            borderTopLeft: 10.r,
                                            borderTopRight: 10.r,
                                            borderBottomLeft: 10.r,
                                            borderBottomRight: 10.r,
                                            hintSize: 12.52.sp,
                                            fillColor: AppColors.grey,
                                            isFilled: true,
                                            readOnly: true,
                                            controller: TextEditingController(
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
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 24.0.h),
                                          if (e.listOfTimes!.isNotEmpty &&
                                              e.timesToTake!.isNotEmpty)
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ...e.listOfTimes!.map(
                                                  (list) => model!
                                                      .dosageAfterWidgetContainer(
                                                        context: context,
                                                        callback: list,
                                                        color: AppColors.grey,
                                                        dosageMap: e.dosageMap,
                                                        listOfTimes:
                                                            List.generate(
                                                              int.parse(
                                                                e.timesToTake!,
                                                              ),
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
                                                  borderColor:
                                                      AppColors.transparent,
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
                                                  readOnly: true,
                                                  maxline:
                                                      3, // Maximum number of lines visible before scrolling
                                                  keyboardType:
                                                      TextInputType.multiline,
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
                                          fontSize: 15.60.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 30.h),

                    !onTapToAddAnotherReminder
                        ? Column(
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    onTapToAddAnotherReminder = true;
                                    model!.notifyListeners();
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
                              SizedBox(height: 20.h),
                              ButtonWidget(
                                border: 100.r,
                                buttonColor: AppColors.primary,
                                buttonText: 'Preview',
                                color: AppColors.white,
                                buttonBorderColor: AppColors.transparent,
                                onPressed: () {
                                  linIndex++;
                                  model!.notifyListeners();
                                },
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
                                border: Border.all(
                                  color: AppColors.buttonGrey1,
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.white,
                              ),
                              child: Form(
                                key: secondFormReminderKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.all(10.w),
                                        child: GestureDetector(
                                          onTap: () {
                                            onTapToAddAnotherReminder = false;
                                            model!.notifyListeners();
                                          },
                                          child: SvgPicture.asset(
                                            AppImage.cancel,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    TextFormWidget(
                                      hint: 'Medication Name',
                                      borderColor: AppColors.transparent,
                                      borderTopLeft: 10.r,
                                      borderTopRight: 10.r,
                                      borderBottomLeft: 10.r,
                                      borderBottomRight: 10.r,
                                      hintSize: 12.52.sp,
                                      fillColor: AppColors.grey,
                                      isFilled: true,
                                      controller: medNameController,
                                      validator: AppValidator.validateString(),
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    TextFormWidget(
                                      hint: 'Drug Name',
                                      borderColor: AppColors.transparent,
                                      borderTopLeft: 10.r,
                                      borderTopRight: 10.r,
                                      borderBottomLeft: 10.r,
                                      borderBottomRight: 10.r,
                                      hintSize: 12.52.sp,
                                      fillColor: AppColors.grey,
                                      isFilled: true,
                                      controller: drugNameController,
                                      validator: AppValidator.validateString(),
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    TextView(
                                      text: 'Medication Type',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.sp,
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
                                      readOnly: true,
                                      fillColor: AppColors.grey,
                                      isFilled: true,
                                      prefixWidget:
                                          medTypeResultImage.isNotEmpty
                                          ? Padding(
                                              padding: EdgeInsets.all(10.w),
                                              child: SvgPicture.asset(
                                                medTypeResultImage,
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                      suffixWidget: IconButton(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: AppColors.greyee,
                                        ),
                                        onPressed: () async {
                                          final result = await showMedTypeMenu(
                                            context,
                                          );

                                          if (result != null) {
                                            setModalState!(() {
                                              medTypeResultImage =
                                                  result["icon"] ?? '';
                                              medTypeController.text =
                                                  result["type"] ?? '';
                                            });
                                          }
                                        },
                                      ),
                                      controller: medTypeController,
                                      validator: AppValidator.validateString(),
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    TextView(
                                      text: 'Description',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.sp,
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
                                      fillColor: AppColors.grey,
                                      isFilled: true,
                                      controller: descriptionController,
                                      validator: AppValidator.validateString(),
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    TextView(
                                      text: 'Medication picture upload',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.sp,
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
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child:
                                                      model!.imageDrug != null
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
                                                            model.imageDrug =
                                                                null;
                                                            notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                                AppImage.delete,
                                                                height: 16.68.h,
                                                                width: 15.2.w,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          width: 18.30.w,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () => model
                                                              .pickDrugImage(
                                                                context,
                                                              ),
                                                          child:
                                                              SvgPicture.asset(
                                                                AppImage.upload,
                                                                height: 17.0.h,
                                                                width: 16.68.w,
                                                              ),
                                                        ),
                                                      ],
                                                    )
                                                  : GestureDetector(
                                                      onTap: () =>
                                                          model.pickDrugImage(
                                                            context,
                                                          ),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 22.w,
                                                              vertical: 10.10.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                32,
                                                              ),
                                                          color: AppColors.grey,
                                                        ),
                                                        child: TextView(
                                                          text: 'Upload',
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 14.40.sp,
                                                            color:
                                                                AppColors.deep,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextView(
                                          text: '(mg)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.6.sp,
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
                                      fillColor: AppColors.grey,
                                      isFilled: true,
                                      readOnly: true,
                                      suffixWidget: IconButton(
                                        onPressed: () async {
                                          final result =
                                              await showMedDosageMenu(context);
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
                                      // validator: AppValidator.validateString(),
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 24.0.h),
                                    TextFormWidget(
                                      hint: 'Start Date & Time',
                                      borderColor: AppColors.transparent,
                                      borderTopLeft: 10.r,
                                      borderTopRight: 10.r,
                                      borderBottomLeft: 10.r,
                                      borderBottomRight: 10.r,
                                      readOnly: true,
                                      hintSize: 12.52.sp,
                                      fillColor: AppColors.grey,
                                      isFilled: true,
                                      controller: model.dateTimeController,
                                      suffixWidget: Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: GestureDetector(
                                          onTap: () =>
                                              model.selectDate(context),
                                          child: SvgPicture.asset(
                                            AppImage.calendar,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      validator: AppValidator.validateString(),
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 24.0.h),
                                    TextFormWidget(
                                      hint: 'Duration',
                                      label: 'E.g 15',
                                      keyboardType: TextInputType.number,
                                      borderColor: AppColors.transparent,
                                      borderTopLeft: 10.r,
                                      borderTopRight: 10.r,
                                      borderBottomLeft: 10.r,
                                      borderBottomRight: 10.r,
                                      fillColor: AppColors.grey,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      isFilled: true,
                                      hintSize: 12.52.sp,
                                      controller: medDurationController,
                                      onChange: (p0) {
                                        if (p0 != null &&
                                            p0.trim().isNotEmpty) {
                                          final parsed = int.tryParse(
                                            p0.trim(),
                                          );

                                          if (parsed != null) {
                                            _duration = parsed;

                                            intList = List.generate(
                                              _duration!,
                                              (index) => index,
                                            );

                                            dateTimeObject = inputFormat.parse(
                                              model.pickedDate!,
                                            );

                                            endDateController
                                                .text = dateTimeObject!
                                                .add(Duration(days: _duration!))
                                                .toString();
                                          }
                                        } else {
                                          endDateController.clear();
                                        }
                                        model.notifyListeners();
                                      },

                                      validator: AppValidator.validateString(),
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 24.0.h),
                                    Row(
                                      children: [
                                        TextView(
                                          text: 'End Date ',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.sp,
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
                                          ? DateFormat('dd MMM, yyyy').format(
                                              DateTime.parse(
                                                endDateController.text,
                                              ),
                                            )
                                          : '',
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                        fontSize: 14.2.sp,
                                        color: AppColors.infoGrey,
                                      ),
                                      fillColor: AppColors.grey,
                                      isFilled: true,
                                      readOnly: true,
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 24.0.h),
                                    TextFormWidget(
                                      hint: 'No of Times to be taken daily',
                                      borderColor: AppColors.transparent,
                                      borderTopLeft: 10.r,
                                      borderTopRight: 10.r,
                                      borderBottomLeft: 10.r,
                                      borderBottomRight: 10.r,
                                      hintSize: 12.52.sp,
                                      fillColor: AppColors.grey,
                                      isFilled: true,
                                      readOnly: true,
                                      controller: medDailyInTakenController,
                                      suffixWidget: IconButton(
                                        onPressed: () async {
                                          final result =
                                              await showDailyInTakeMenu(
                                                context,
                                              );
                                          if (result != null) {
                                            setModalState!(() {
                                              medDailyInTakenController.text =
                                                  result;
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
                                      style: TextStyle(
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'GoogleSans',
                                      ),
                                    ),
                                    SizedBox(height: 24.0.h),
                                    if (intList.isNotEmpty &&
                                        medDailyInTakenController
                                            .text
                                            .isNotEmpty)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ...intList.map(
                                            (e) => model.dosageWidgetContainer(
                                              context: context,
                                              callback: e,
                                              listOfTimes: List.generate(
                                                int.parse(
                                                  medDailyInTakenController
                                                      .text,
                                                ),
                                                (index) => index,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 14.0.h),
                                          TextView(
                                            text: 'Add Note',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.6.sp,
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
                                            hintSize: 12.52.sp,
                                            fillColor: AppColors.grey,
                                            isFilled:
                                                true, // Minimum number of lines visible
                                            maxline:
                                                3, // Maximum number of lines visible before scrolling
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator:
                                                AppValidator.validateString(),
                                            controller: noteController,
                                            style: TextStyle(
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'GoogleSans',
                                            ),
                                          ),
                                          SizedBox(height: 20.h),
                                          Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (secondFormReminderKey
                                                    .currentState!
                                                    .validate()) {
                                                  addReminderToList(model);
                                                } else {
                                                  AppUtils.snackbar(
                                                    context,
                                                    message:
                                                        'Kindly input all required fields.',
                                                    error: true,
                                                  );
                                                }
                                              },
                                              child: TextView(
                                                text: 'Add Another Medication',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 16.2.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.primary,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      AppColors.primary,
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
                                            buttonBorderColor:
                                                AppColors.transparent,
                                            onPressed: () async {
                                              if (secondFormReminderKey
                                                  .currentState!
                                                  .validate()) {
                                                await addReminderToList(model);
                                                linIndex++;
                                                model.notifyListeners();
                                              } else {
                                                AppUtils.snackbar(
                                                  context,
                                                  message:
                                                      'Kindly input all required fields.',
                                                  error: true,
                                                );
                                              }
                                            },
                                          ),
                                          SizedBox(height: 30.h),
                                        ],
                                      )
                                    else
                                      Column(
                                        children: [
                                          SizedBox(height: 30.h),
                                          ButtonWidget(
                                            border: 100.r,
                                            buttonColor: AppColors.primary,
                                            buttonText: 'Preview',
                                            color: AppColors.white,
                                            buttonBorderColor:
                                                AppColors.transparent,
                                            onPressed: () {
                                              if (secondFormReminderKey
                                                  .currentState!
                                                  .validate()) {
                                                linIndex++;
                                                model.notifyListeners();
                                              }
                                            },
                                          ),
                                          SizedBox(height: 30.h),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    value: linIndex / 3,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/3',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed:
                    medicationClassList[indexOfMedicationClassList] ==
                        medicationClassList.first
                    ? () {}
                    : () {
                        indexOfMedicationClassList -= 1;
                        model!.notifyListeners();
                      },
                icon: Icon(
                  Icons.arrow_back,
                  size: 22.sp,
                  color:
                      medicationClassList[indexOfMedicationClassList] ==
                          medicationClassList.first
                      ? AppColors.primaryLight.withOpacity(.7)
                      : AppColors.primary,
                ),
              ),
              TextView(
                text:
                    '${indexOfMedicationClassList + 1}/${medicationClassList.length}',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              IconButton(
                onPressed:
                    medicationClassList[indexOfMedicationClassList] ==
                        medicationClassList.last
                    ? () {}
                    : () {
                        indexOfMedicationClassList += 1;
                        model!.notifyListeners();
                      },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 22.sp,
                  color:
                      medicationClassList[indexOfMedicationClassList] ==
                          medicationClassList.last
                      ? AppColors.primaryLight.withOpacity(.7)
                      : AppColors.primary1,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.20.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 2.w),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Medication Name',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].medicationName}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Drug Name',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].drugName}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 6.0.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.w,
                    horizontal: 108.0.w,
                  ),
                  width: double.infinity,
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.file(
                    medicationClassList[indexOfMedicationClassList]
                        .medicationFile!,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Medication Type',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      medicationClassList[indexOfMedicationClassList]
                          .medicationTypeIcon!,
                    ),
                    SizedBox(width: 6.0.w),
                    TextView(
                      text:
                          '${medicationClassList[indexOfMedicationClassList].medicationType}',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Description',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].description}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          TextView(
            text: 'SET SCHEDULE AND DOSAGE',
            textStyle: TextStyle(
              fontFamily: 'GoogleSans',
              fontSize: 14.80.sp,
              color: AppColors.grey1,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.grey),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 2.w),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Dosage',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].dosage}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Start Date & Time',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].dateAndTime}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Duration',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextView(
                      text:
                          '${medicationClassList[indexOfMedicationClassList].duration}',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 6.0.w),
                    GestureDetector(
                      onTap: () {
                        isShowMoreSecondModalFlow = !isShowMoreSecondModalFlow;
                        model!.notifyListeners();
                      },
                      child: TextView(
                        text: isShowMoreSecondModalFlow
                            ? 'Hide details'
                            : 'Show more',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(height: isShowMoreSecondModalFlow ? 10.w : 0.h),
                isShowMoreSecondModalFlow
                    ? Column(
                        children: [
                          ...medicationClassList[indexOfMedicationClassList]
                              .dosageMap!
                              .asMap()
                              .entries
                              .map((entry) {
                                final i = entry.key; // 0, 1, 2
                                final v = entry.value; // {day: x, doses: [...]}

                                return dosagePreviewWidgetContainer(
                                  context: context,
                                  callback: i, // ✅ now an index (int)
                                  color: AppColors.grey,
                                  listOfTimes: List.generate(
                                    int.parse(
                                      medicationClassList[indexOfMedicationClassList]
                                          .timesToTake!,
                                    ),
                                    (index) => index,
                                  ),
                                  dosageMap: [
                                    v,
                                  ], // ✅ wrap v in a list so widget only sees one day
                                );
                              }),
                        ],
                      )
                    : SizedBox.shrink(),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'End Date',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text: DateFormat("dd MMM, y").format(
                    DateTime.parse(
                      '${medicationClassList[indexOfMedicationClassList].endDate}',
                    ),
                  ),
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'No of Times to be taken',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text: showNoTimes(
                    int.parse(
                      medicationClassList[indexOfMedicationClassList]
                          .timesToTake!,
                    ),
                  ),
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Note',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text: medicationClassList[indexOfMedicationClassList].note!,
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          SizedBox(height: 16.20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed:
                    medicationClassList[indexOfMedicationClassList] ==
                        medicationClassList.first
                    ? () {}
                    : () {
                        indexOfMedicationClassList -= 1;
                        notifyListeners();
                      },
                icon: Icon(
                  Icons.arrow_back,
                  size: 22.sp,
                  color:
                      medicationClassList[indexOfMedicationClassList] ==
                          medicationClassList.first
                      ? AppColors.primaryLight.withOpacity(.7)
                      : AppColors.primary,
                ),
              ),
              TextView(
                text:
                    '${indexOfMedicationClassList + 1}/${medicationClassList.length}',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              IconButton(
                onPressed:
                    medicationClassList[indexOfMedicationClassList] ==
                        medicationClassList.last
                    ? () {}
                    : () {
                        indexOfMedicationClassList += 1;
                        model!.notifyListeners();
                        print(indexOfMedicationClassList);
                      },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 22.sp,
                  color:
                      medicationClassList[indexOfMedicationClassList] ==
                          medicationClassList.last
                      ? AppColors.primaryLight.withOpacity(.7)
                      : AppColors.primary1,
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.dashboard,
                  buttonText: 'Make Updates',
                  color: AppColors.deep,
                  fontSize: 14.sp,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    linIndex--;
                    indexOfMedicationClassList = 0;
                    model!.notifyListeners();
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  fontSize: 14.sp,
                  buttonColor: AppColors.primary,
                  buttonText: 'Continue',
                  color: AppColors.white,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    linIndex++;
                    model!.notifyListeners();
                    print('medicationClassList$medicationClassList');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
        ],
      ),
    ),
  );

  thirdModalFlow({
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    value: linIndex / 3,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/3',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          ...List.generate(channels.length, (index) {
            return chooseNotChannelWidget(
              context,
              text: channels[index],
              isTapped: selectedIndexes.contains(index), // ✅ reflect state
              onTap: () {
                if (selectedIndexes.contains(index)) {
                  // unselect
                  selectedIndexes.remove(index);
                } else {
                  // select
                  selectedIndexes.add(index);
                  // ✅ Show specific dialogs
                  if (index == 0) {
                    // Email
                    showEmailDialog(context);
                  } else if ([2, 3, 4].contains(index)) {
                    // Phone-related channels

                    showPhoneDialog(context);
                    isPhoneValid = false;
                    model!.notifyListeners();
                  }
                } // ✅ update selection
                buildChannelList(selectedIndexes);
                addCostTotal();
                model!.notifyListeners();
              },
            );
          }),
          SizedBox(height: emailReminderList.isNotEmpty ? 20.h : 0.h),

          emailReminderList.isNotEmpty
              ? isTappedEmailAdded
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.infoGrey1),
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.white,
                        ),
                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Add Email Address',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.deep,
                                  ),
                                ),
                                Row(
                                  children: [
                                    TextView(
                                      text: 'Emails available',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          223,
                                          233,
                                          247,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        border: Border.all(
                                          color: AppColors.primary.withOpacity(
                                            .4,
                                          ),
                                        ),
                                      ),
                                      child: TextView(
                                        text: '${emailReminderList.length}',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 11.8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isTappedEmailAdded = !isTappedEmailAdded;
                                    model!.notifyListeners();
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.drop_up,
                                    height: 22.0.h,
                                    width: 22.0.w,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                IconButton(
                                  onPressed: () => showEmailDialog(context),
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: AppColors.primary1,
                                    size: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.infoGrey1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                                color: AppColors.dashboard,
                              ),
                              padding: EdgeInsets.all(12.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Add Email Address',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 16.2.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.deep,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextView(
                                            text: 'Emails available',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.8.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(width: 6.w),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                223,
                                                233,
                                                247,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                color: AppColors.primary
                                                    .withOpacity(.4),
                                              ),
                                            ),
                                            child: TextView(
                                              text:
                                                  '${emailReminderList.length}',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 11.8.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          isTappedEmailAdded =
                                              !isTappedEmailAdded;
                                          model!.notifyListeners();
                                        },
                                        child: SvgPicture.asset(
                                          AppImage.drop_up,
                                          height: 22.0.h,
                                          width: 22.0.w,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      IconButton(
                                        onPressed: () =>
                                            showEmailDialog(context),
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: AppColors.primary1,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.20.h),
                            ...emailReminderList.asMap().entries.map((entry) {
                              final index = entry.key;
                              final o = entry.value;
                              final isLast =
                                  index == emailReminderList.length - 1;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.20.w,
                                      right: 20.w,
                                      bottom: 12.w,
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (addedEmailReminderList.contains(
                                              o,
                                            )) {
                                              addedEmailReminderList.remove(o);
                                            } else {
                                              addedEmailReminderList.add(o);
                                            }
                                            model!.notifyListeners();
                                          },
                                          child: Container(
                                            padding:
                                                addedEmailReminderList.contains(
                                                  o,
                                                )
                                                ? EdgeInsets.all(4.0.w)
                                                : EdgeInsets.all(10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              color:
                                                  addedEmailReminderList
                                                      .contains(o)
                                                  ? AppColors.primary
                                                  : AppColors.transparent,
                                              border: Border.all(
                                                color:
                                                    addedEmailReminderList
                                                        .contains(o)
                                                    ? AppColors.transparent
                                                    : AppColors.infoGrey,
                                                width: .78,
                                              ),
                                            ),
                                            child:
                                                addedEmailReminderList.contains(
                                                  o,
                                                )
                                                ? Icon(
                                                    Icons.check,
                                                    size: 12.sp,
                                                    color: AppColors.white,
                                                  )
                                                : SizedBox.shrink(),
                                          ),
                                        ),
                                        // Transform.scale(
                                        //   scale:
                                        //       MediaQuery.of(
                                        //             context,
                                        //           ).size.shortestSide >=
                                        //           600
                                        //       ? 1.5
                                        //       : 1.1,
                                        //   child: Checkbox(
                                        //     value: addedEmailReminderList
                                        //         .contains(o),
                                        //     onChanged: (_) {
                                        //       if (addedEmailReminderList
                                        //           .contains(o)) {
                                        //         addedEmailReminderList.remove(
                                        //           o,
                                        //         );
                                        //       } else {
                                        //         addedEmailReminderList.add(o);
                                        //       }
                                        //       model!.notifyListeners();
                                        //     },
                                        //     activeColor: AppColors.primary,
                                        //     shape: RoundedRectangleBorder(
                                        //       borderRadius:
                                        //           BorderRadius.circular(4),
                                        //     ),
                                        //     visualDensity: VisualDensity
                                        //         .compact, // 👈 reduces internal padding
                                        //   ),
                                        // ),
                                        SizedBox(width: 9.10.w),
                                        SizedBox(
                                          width: 220.w,
                                          child: TextView(
                                            text: o,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.ellipsis,
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showEmailDialog(
                                                  context,
                                                  isEdit: true,
                                                  index: index,
                                                  email:
                                                      emailReminderList[index],
                                                );
                                                model!.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.edit_pen,
                                                height: 22.0.h,
                                                width: 22.0.w,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            GestureDetector(
                                              onTap: () {
                                                emailReminderList.removeAt(
                                                  index,
                                                );
                                                model!.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.delete,
                                                height: 22.0.h,
                                                width: 22.0.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!isLast)
                                    Divider(color: AppColors.infoGrey1),
                                  SizedBox(height: 5.10.h),
                                ],
                              );
                            }),
                          ],
                        ),
                      )
              : SizedBox.shrink(),
          SizedBox(height: phoneReminderList.isNotEmpty ? 20.h : 0.h),

          phoneReminderList.isNotEmpty
              ? isTappedPhoneAdded
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.infoGrey1),
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.white,
                        ),

                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Add Phone Number',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.deep,
                                  ),
                                ),
                                Row(
                                  children: [
                                    TextView(
                                      text: 'Numbers available',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          223,
                                          233,
                                          247,
                                        ),

                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        border: Border.all(
                                          color: AppColors.primary.withOpacity(
                                            .4,
                                          ),
                                        ),
                                      ),
                                      child: TextView(
                                        text: '${phoneReminderList.length}',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 11.8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isTappedPhoneAdded = !isTappedPhoneAdded;
                                    model!.notifyListeners();
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.drop_up,
                                    height: 22.0.h,
                                    width: 22.0.w,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                IconButton(
                                  onPressed: () {
                                    showPhoneDialog(context);
                                    isPhoneValid = false;
                                    model!.notifyListeners();
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: AppColors.primary1,
                                    size: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.infoGrey1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                                color: AppColors.dashboard,
                              ),

                              padding: EdgeInsets.all(12.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Add Phone Number',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 15.8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.deep,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextView(
                                            text: 'Numbers available',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.8.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(width: 6.w),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                223,
                                                233,
                                                247,
                                              ),

                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                color: AppColors.primary
                                                    .withOpacity(.4),
                                              ),
                                            ),
                                            child: TextView(
                                              text:
                                                  '${phoneReminderList.length}',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 11.8.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          isTappedPhoneAdded =
                                              !isTappedPhoneAdded;
                                          model!.notifyListeners();
                                        },
                                        child: SvgPicture.asset(
                                          AppImage.drop_up,
                                          height: 22.0.h,
                                          width: 22.0.w,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      IconButton(
                                        onPressed: () {
                                          showPhoneDialog(context);

                                          isPhoneValid = false;
                                          model!.notifyListeners();
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: AppColors.primary1,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.20.h),
                            Padding(
                              padding: EdgeInsets.only(left: 12.w, right: 20.w),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(4.0.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        color: AppColors.primary,
                                        border: Border.all(
                                          color: AppColors.transparent,
                                          width: .78,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 12.sp,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 9.10.w),
                                  TextView(
                                    text: formatPhoneNumber(
                                      SharedPreferencesService
                                          .instance
                                          .usersData['user']['phone'],
                                    ),
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(1.2.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.app_green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 13.4.sp,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      TextView(
                                        text: 'Primary',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 13.72.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.0.h),
                            Divider(color: AppColors.infoGrey1),

                            ...phoneReminderList.asMap().entries.map((entry) {
                              final index = entry.key;
                              final o = entry.value;
                              final isLast =
                                  index == phoneReminderList.length - 1;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.w,
                                      right: 20.w,
                                      bottom: 12.w,
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (addedPhoneReminderList.contains(
                                              o,
                                            )) {
                                              addedPhoneReminderList.remove(o);
                                            } else {
                                              addedPhoneReminderList.add(o);
                                            }
                                            model!.notifyListeners();
                                          },
                                          child: Container(
                                            padding:
                                                addedPhoneReminderList.contains(
                                                  o,
                                                )
                                                ? EdgeInsets.all(4.0.w)
                                                : EdgeInsets.all(10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              color:
                                                  addedPhoneReminderList
                                                      .contains(o)
                                                  ? AppColors.primary
                                                  : AppColors.transparent,
                                              border: Border.all(
                                                color:
                                                    addedPhoneReminderList
                                                        .contains(o)
                                                    ? AppColors.transparent
                                                    : AppColors.infoGrey,
                                                width: .78,
                                              ),
                                            ),
                                            child:
                                                addedPhoneReminderList.contains(
                                                  o,
                                                )
                                                ? Icon(
                                                    Icons.check,
                                                    size: 12.sp,
                                                    color: AppColors.white,
                                                  )
                                                : SizedBox.shrink(),
                                          ),
                                        ),
                                        SizedBox(width: 9.10.w),
                                        TextView(
                                          text: formatPhoneNumber(o),
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.2.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showPhoneDialog(
                                                  context,
                                                  isEdit: true,
                                                  index: index,
                                                  phoneNumber:
                                                      phoneReminderList[index],
                                                );
                                                isPhoneValid = false;
                                                model!.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.edit_pen,
                                                height: 22.0.h,
                                                width: 22.0.w,
                                              ),
                                            ),
                                            SizedBox(width: 16.10.w),
                                            GestureDetector(
                                              onTap: () {
                                                phoneReminderList.removeAt(
                                                  index,
                                                );
                                                model!.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.delete,
                                                height: 22.0.h,
                                                width: 22.0.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!isLast)
                                    Divider(color: AppColors.infoGrey1),
                                  SizedBox(height: 5.10.h),
                                ],
                              );
                            }),
                          ],
                        ),
                      )
              : SizedBox.shrink(),
          phoneReminderList.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.0.h),
                    TextView(
                      text: 'COST SUMMARY',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 14.80.sp,
                        color: AppColors.grey1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.2.h),
                    Divider(color: AppColors.infoGrey1),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          dashPattern: [3, 3],
                          strokeWidth: .99,
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
                            color: AppColors.dashboard,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Total Days',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextView(
                                    text: '${returnTotalDays()}',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.10.h),
                              Divider(color: AppColors.infoGrey1),
                              SizedBox(height: 6.10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Reminders per day',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextView(
                                    text: '3',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.10.h),
                              Divider(color: AppColors.infoGrey1),
                              SizedBox(height: 6.10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Total Reminders',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextView(
                                    text: '${returnTotalDays() * 3}',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: selectedIndexes.contains(3)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(3)
                                  ? Divider(color: AppColors.infoGrey1)
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(3)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(3)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'WhatsApp  (x5 msgs)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text: '₦25',
                                          textStyle: TextStyle(
                                            // fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(2)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(2)
                                  ? Divider(color: AppColors.infoGrey1)
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(2)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(2)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'SMS  (x5 msgs)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text: '₦50',
                                          textStyle: TextStyle(
                                            // fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(4)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(4)
                                  ? Divider(color: AppColors.infoGrey1)
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(4)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(4)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'Phone Calls  (x5 calls)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text: '₦100',
                                          textStyle: TextStyle(
                                            // fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(height: 6.10.h),
                              Divider(color: AppColors.infoGrey1),
                              SizedBox(height: 6.10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Total',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextView(
                                    text: '₦$costTotal.00',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          SizedBox(height: _isLoading ? 20.h : 0.h),

          _isLoading
              ? SpinKitCircle(color: AppColors.primary, size: 50.sp)
              : SizedBox.shrink(),
          SizedBox(
            height: phoneReminderList.isNotEmpty
                ? 40.h
                : _isLoading
                ? 106.h
                : 206.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.dashboard,
                  buttonText: 'Previous',
                  color: AppColors.deep,
                  fontSize: 14.sp,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    linIndex--;
                    model!.notifyListeners();
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  fontSize: 14.sp,
                  buttonColor: AppColors.primary,
                  buttonText: 'Make Payment',
                  color: AppColors.white,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    if (phoneReminderList.contains(
                      SharedPreferencesService
                          .instance
                          .usersData['user']['phone'],
                    )) {
                    } else {
                      phoneReminderList.add(
                        SharedPreferencesService
                            .instance
                            .usersData['user']['phone'],
                      );
                    }
                    if (phoneReminderList.isNotEmpty) {
                      linIndex++;
                    } else {
                      createReminder(
                        context,
                        createReminderEntityModel: CreateReminderEntityModel(
                          medications: medicationClassList.map((m) {
                            return Medication(
                              medicationName: m.medicationName,
                              drugName: m.drugName,
                              dosage: m.dosage,
                              medicationType: m.medicationType!.toUpperCase(),
                              startDateTime: m.startDateIso,
                              endDateTime: m.endDateIso,
                              durationInDays: int.parse(m.duration!),
                              timesPerDay: int.parse(m.timesToTake!),
                              dailyDoseTimes: (m.dosageMap as List)
                                  .map(
                                    (dayData) => (dayData['doses'] as List)
                                        .map(
                                          (dose) => DailyDoseTime.fromJson(
                                            dose as Map<String, dynamic>,
                                          ),
                                        )
                                        .toList(),
                                  )
                                  .toList(),
                              note: m.note,
                              medicationImage: MedicationImage.fromJson(
                                m.imageData!.toJson(),
                              ),
                            );
                          }).toList(),
                          timeZone: "Africa/Lagos",
                          notificationChannels: notificationChannel,
                          emails: emailReminderList,
                          phoneNumbers: phoneReminderList,
                          payment: Payment(amount: costTotal, currency: "NGN"),
                        ),
                      );
                    }
                    model!.notifyListeners();
                    print('medicationClassList$medicationClassList');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
        ],
      ),
    ),
  );

  fourthModalFlow({
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(height: 32.h),
          TextView(
            text: 'Amount',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15.90.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 14.2.h),
          Container(
            height: 70.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.skyBlue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: TextView(
                text: '₦$costTotal.00',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 20.90.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.reminder,
                ),
              ),
            ),
          ),
          SizedBox(height: 22.h),
          TextView(
            text: 'Select Payment Method',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 16.90.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.deep,
            ),
          ),
          SizedBox(height: 12.h),
          paymentWidget(
            isWallet: true,
            text: 'Pay with Wallet',
            icon: AppImage.wallet_pay,
            onTap: () {
              onTapPaymentMeth = 'Pay with Wallet';
              model!.notifyListeners();
            },
          ),
          paymentWidget(
            isWallet: false,
            text: 'Pay with Card',
            icon: AppImage.card_pay,
            onTap: () {
              onTapPaymentMeth = 'Pay with Card';
              model!.notifyListeners();
            },
          ),
          paymentWidget(
            isWallet: false,
            text: 'Pay with Bank Transfer',
            icon: AppImage.bank_transfer,
            onTap: () {
              onTapPaymentMeth = 'Pay with Bank Transfer';
              model!.notifyListeners();
            },
          ),
          paymentWidget(
            isWallet: false,
            text: 'Pay with Mobile Money',
            icon: AppImage.online_mobile,
            onTap: () {
              onTapPaymentMeth = 'Pay with Mobile Money';
              model!.notifyListeners();
            },
          ),
          paymentWidget(
            isWallet: false,
            text: 'Pay with USSD',
            icon: AppImage.ussd_pay,
            onTap: () {
              onTapPaymentMeth = 'Pay with USSD';
              model!.notifyListeners();
            },
          ),
          SizedBox(height: _isLoading ? 20.h : 0.h),
          _isLoading
              ? SpinKitCircle(color: AppColors.primary, size: 50.sp)
              : SizedBox.shrink(),
          SizedBox(height: 120.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.dashboard,
                  buttonText: 'Previous',
                  color: AppColors.deep,
                  fontSize: 14.sp,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    linIndex--;
                    model!.notifyListeners();
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  fontSize: 14.sp,
                  buttonColor: onTapPaymentMeth != ''
                      ? AppColors.primary
                      : AppColors.infoGrey,
                  buttonText: 'Continue',
                  color: AppColors.white,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: onTapPaymentMeth != ''
                      ? () {
                          createReminder(
                            context,
                            createReminderEntityModel:
                                CreateReminderEntityModel(
                                  medications: medicationClassList.map((m) {
                                    return Medication(
                                      medicationName: m.medicationName,
                                      drugName: m.drugName,
                                      dosage: m.dosage,
                                      medicationType: m.medicationType!
                                          .toUpperCase(),
                                      startDateTime: m.startDateIso,
                                      endDateTime: m.endDateIso,
                                      durationInDays: int.parse(m.duration!),
                                      timesPerDay: int.parse(m.timesToTake!),
                                      dailyDoseTimes: (m.dosageMap as List)
                                          .map(
                                            (
                                              dayData,
                                            ) => (dayData['doses'] as List)
                                                .map(
                                                  (
                                                    dose,
                                                  ) => DailyDoseTime.fromJson(
                                                    dose
                                                        as Map<String, dynamic>,
                                                  ),
                                                )
                                                .toList(),
                                          )
                                          .toList(),
                                      note: m.note,
                                      medicationImage: MedicationImage.fromJson(
                                        m.imageData!.toJson(),
                                      ),
                                    );
                                  }).toList(),
                                  timeZone: "Africa/Lagos",
                                  notificationChannels: notificationChannel,
                                  emails: emailReminderList,
                                  phoneNumbers: phoneReminderList,
                                  payment: Payment(
                                    amount: costTotal,
                                    currency: "NGN",
                                  ),
                                ),
                          );
                          model!.notifyListeners();
                          print('medicationClassList$medicationClassList');
                        }
                      : () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
        ],
      ),
    ),
  );

  setModalFlowUpdate({
    AuthViewModel? model,
    getReminderId.Data? data,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
  }) {
    if (linIndexUpdate == 2) {
      return secondModalFlowUpdate(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    } else if (linIndexUpdate == 3) {
      return thirdModalFlowUpdate(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    } else if (linIndexUpdate == 4) {
      return fourthModalFlowUpdate(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    }
    return firstModalFLowUpdate(
      model: model,
      data: data,
      context: context,
      setModalState: setModalState,
      scrollController: scrollController,
    );
  }

  firstModalFLowUpdate({
    AuthViewModel? model,
    getReminderId.Data? data,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
  }) {
    medNameControllerUpdate.text = data!.medication!.medicationName!;
    medDosageControllerUpdate.text = data.medication!.dosage!;
    medDurationControllerUpdate.text = data.medication!.durationInDays!
        .toString();
    medDailyInTakenControllerUpdate.text = data.medication!.timesPerDay
        .toString();
    drugNameControllerUpdate.text = data.medication!.drugName!;
    medTypeControllerUpdate.text = data.medication!.medicationType!;
    medTypeResultImageUpdate = data.medication!.medicationType!;
    noteControllerUpdate.text = data.medication!.note!;
    endDateControllerUpdate.text = data.medication!.endDateTime.toString();

    return Container(
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
                  text: modalNameUpdate(),
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
                      value: linIndex / 3,
                      color: AppColors.primary, // Progress bar color
                      backgroundColor:
                          Colors.grey[300], // Background track color
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                TextView(
                  text: '$linIndexUpdate/3',
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
            Form(
              key: firstFormReminderUpdateKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormWidget(
                    hint: 'Medication Name',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    hintSize: 12.42.sp,
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: medNameControllerUpdate,
                    validator: AppValidator.validateString(),
                    readOnly: true,
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextFormWidget(
                    hint: 'Drug Name',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    hintSize: 12.42.sp,
                    fillColor: AppColors.grey,
                    isFilled: true,
                    readOnly: true,
                    controller: drugNameControllerUpdate,
                    validator: AppValidator.validateString(),
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextView(
                    text: 'Medication Type',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
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
                    readOnly: true,
                    fillColor: AppColors.grey,
                    isFilled: true,
                    prefixWidget: medTypeResultImageUpdate.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.all(10.w),
                            child: SvgPicture.asset(
                              isMedTypeView(medTypeResultImageUpdate),
                              color: AppColors.primary,
                            ),
                          )
                        : SizedBox.shrink(),
                    controller: medTypeControllerUpdate,
                    validator: AppValidator.validateString(),
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextView(
                    text: 'Description',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
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
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: descriptionControllerUpdate,
                    validator: AppValidator.validateString(),
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextView(
                    text: 'Medication picture upload',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
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
                                child: model!.imageDrug != null
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
                                            model.pickDrugImage(context),
                                        child: SvgPicture.asset(
                                          AppImage.upload,
                                          height: 17.0.h,
                                          width: 16.68.w,
                                        ),
                                      ),
                                    ],
                                  )
                                : GestureDetector(
                                    onTap: () => model.pickDrugImage(context),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 22.w,
                                        vertical: 10.10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
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
                          fontSize: 14.6.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextView(
                        text: '(mg)',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.60.sp,
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
                    label: medDosageControllerUpdate.text,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.80.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    readOnly: true,
                    suffixWidget: IconButton(
                      onPressed: () async {
                        final result = await showMedDosageMenu(context);
                        if (result != null) {
                          setModalState!(() {
                            medDosageControllerUpdate.text = model
                                .getStringFrLabel(result);
                          });
                        }
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.grey1,
                        size: 20.sp,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      color: AppColors.infoGrey.withOpacity(.90),
                    ),
                  ),
                  SizedBox(height: 24.0.h),
                  TextFormWidget(
                    hint: 'Start Date & Time',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    readOnly: true,
                    hintSize: 12.42.sp,
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: model.dateTimeControllerUpdate,
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: GestureDetector(
                        onTap: () => model.selectDate(context),
                        child: SvgPicture.asset(
                          AppImage.calendar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    validator: AppValidator.validateString(),
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                  SizedBox(height: 24.0.h),
                  TextFormWidget(
                    hint: 'Duration',
                    label: 'E.g 15',
                    borderColor: AppColors.transparent,
                    keyboardType: TextInputType.number,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    hintSize: 12.42.sp,
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: medDurationControllerUpdate,
                    onChange: (p0) {
                      if (p0 != null && p0.trim().isNotEmpty) {
                        final parsed = int.tryParse(p0.trim());
                        if (parsed != null) {
                          _duration = parsed;
                          intList = List.generate(_duration!, (index) => index);
                          dateTimeObject = inputFormat.parse(model.pickedDate!);
                          final localDate = dateTimeObject!;
                          final utcStartDate = DateTime.utc(
                            localDate.year,
                            localDate.month,
                            localDate.day,
                          );

                          // Now safely add your duration
                          final utcEndDate = utcStartDate.add(
                            Duration(days: _duration!),
                          );

                          // Display or store
                          endDateControllerUpdate.text = utcEndDate
                              .toIso8601String();
                          endDateIsoUpdate = utcEndDate.toIso8601String();
                        } else {
                          // Optional: handle invalid input (e.g., show error or clear output)
                          print('⚠️ Invalid number input: $p0');
                        }
                      } else {
                        // Optional: clear output when input is empty
                        endDateControllerUpdate.clear();
                      }
                      model.notifyListeners();
                    },
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                    ),
                    labelStyle: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 24.0.h),
                  Row(
                    children: [
                      TextView(
                        text: 'End Date ',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.sp,
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
                    label: endDateControllerUpdate.text.isNotEmpty
                        ? DateFormat(
                            'dd MMM, yyyy',
                          ).format(DateTime.parse(endDateControllerUpdate.text))
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
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                    ),
                    hintSize: 14.sp,
                  ),
                  SizedBox(height: 24.0.h),
                  TextFormWidget(
                    hint: 'No of Times to be taken daily',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    hintSize: 12.52.sp,
                    fillColor: AppColors.grey,
                    isFilled: true,
                    readOnly: true,
                    controller: medDailyInTakenControllerUpdate,
                    suffixWidget: IconButton(
                      onPressed: () async {
                        final result = await showDailyInTakeMenu(context);
                        if (result != null) {
                          setModalState!(() {
                            medDailyInTakenControllerUpdate.text = result;
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
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                  SizedBox(height: 24.0.h),
                  if (intList.isNotEmpty &&
                      medDailyInTakenControllerUpdate.text.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...intList.map(
                          (e) => model.dosageWidgetContainer(
                            context: context,
                            callback: e,
                            listOfTimes: List.generate(
                              int.parse(medDailyInTakenControllerUpdate.text),
                              (index) => index,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.0.h),
                        TextView(
                          text: 'Add Note',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.sp,
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
                          controller: noteControllerUpdate,
                          fillColor: AppColors.grey,
                          isFilled: true, // Minimum number of lines visible
                          maxline:
                              3, // Maximum number of lines visible before scrolling
                          keyboardType: TextInputType.multiline,
                          validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'GoogleSans',
                          ),
                        ),
                        SizedBox(height: 30.h),
                        ButtonWidget(
                          border: 100.r,
                          buttonColor: AppColors.primary,
                          buttonText: 'Next',
                          color: AppColors.white,
                          buttonBorderColor: AppColors.transparent,
                          onPressed: () async {
                            if (firstFormReminderUpdateKey.currentState!
                                .validate()) {
                              linIndexUpdate++;
                              model.notifyListeners();
                            }
                          },
                        ),
                        SizedBox(height: 130.h),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  secondModalFlowUpdate({
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    value: linIndex / 3,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/3',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed:
                    medicationClassList[indexOfMedicationClassList] ==
                        medicationClassList.first
                    ? () {}
                    : () {
                        indexOfMedicationClassList -= 1;
                        model!.notifyListeners();
                      },
                icon: Icon(
                  Icons.arrow_back,
                  size: 22.sp,
                  color:
                      medicationClassList[indexOfMedicationClassList] ==
                          medicationClassList.first
                      ? AppColors.primaryLight.withOpacity(.7)
                      : AppColors.primary,
                ),
              ),
              TextView(
                text:
                    '${indexOfMedicationClassList + 1}/${medicationClassList.length}',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              IconButton(
                onPressed:
                    medicationClassList[indexOfMedicationClassList] ==
                        medicationClassList.last
                    ? () {}
                    : () {
                        indexOfMedicationClassList += 1;
                        model!.notifyListeners();
                      },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 22.sp,
                  color:
                      medicationClassList[indexOfMedicationClassList] ==
                          medicationClassList.last
                      ? AppColors.primaryLight.withOpacity(.7)
                      : AppColors.primary1,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.20.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 2.w),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Medication Name',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].medicationName}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Drug Name',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].drugName}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 6.0.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.w,
                    horizontal: 108.0.w,
                  ),
                  width: double.infinity,
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.file(
                    medicationClassList[indexOfMedicationClassList]
                        .medicationFile!,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Medication Type',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      medicationClassList[indexOfMedicationClassList]
                          .medicationTypeIcon!,
                    ),
                    SizedBox(width: 6.0.w),
                    TextView(
                      text:
                          '${medicationClassList[indexOfMedicationClassList].medicationType}',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Description',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].description}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          TextView(
            text: 'SET SCHEDULE AND DOSAGE',
            textStyle: TextStyle(
              fontFamily: 'GoogleSans',
              fontSize: 14.80.sp,
              color: AppColors.grey1,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.grey),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 2.w),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Dosage',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].dosage}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Start Date & Time',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text:
                      '${medicationClassList[indexOfMedicationClassList].dateAndTime}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Duration',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextView(
                      text:
                          '${medicationClassList[indexOfMedicationClassList].duration}',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 6.0.w),
                    GestureDetector(
                      onTap: () {
                        isShowMoreSecondModalFlow = !isShowMoreSecondModalFlow;
                        model!.notifyListeners();
                      },
                      child: TextView(
                        text: isShowMoreSecondModalFlow
                            ? 'Hide details'
                            : 'Show more',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(height: isShowMoreSecondModalFlow ? 10.w : 0.h),
                isShowMoreSecondModalFlow
                    ? Column(
                        children: [
                          ...medicationClassList[indexOfMedicationClassList]
                              .dosageMap!
                              .asMap()
                              .entries
                              .map((entry) {
                                final i = entry.key; // 0, 1, 2
                                final v = entry.value; // {day: x, doses: [...]}

                                return dosagePreviewWidgetContainer(
                                  context: context,
                                  callback: i, // ✅ now an index (int)
                                  color: AppColors.grey,
                                  listOfTimes: List.generate(
                                    int.parse(
                                      medicationClassList[indexOfMedicationClassList]
                                          .timesToTake!,
                                    ),
                                    (index) => index,
                                  ),
                                  dosageMap: [
                                    v,
                                  ], // ✅ wrap v in a list so widget only sees one day
                                );
                              }),
                        ],
                      )
                    : SizedBox.shrink(),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'End Date',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text: DateFormat("dd MMM, y").format(
                    DateTime.parse(
                      '${medicationClassList[indexOfMedicationClassList].endDate}',
                    ),
                  ),
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'No of Times to be taken',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text: showNoTimes(
                    int.parse(
                      medicationClassList[indexOfMedicationClassList]
                          .timesToTake!,
                    ),
                  ),
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColors.infoGrey.withOpacity(.2),
                  thickness: .7,
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Note',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 6.0.h),
                TextView(
                  text: medicationClassList[indexOfMedicationClassList].note!,
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          SizedBox(height: 16.20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed:
                    medicationClassList[indexOfMedicationClassList] ==
                        medicationClassList.first
                    ? () {}
                    : () {
                        indexOfMedicationClassList -= 1;
                        notifyListeners();
                      },
                icon: Icon(
                  Icons.arrow_back,
                  size: 22.sp,
                  color:
                      medicationClassList[indexOfMedicationClassList] ==
                          medicationClassList.first
                      ? AppColors.primaryLight.withOpacity(.7)
                      : AppColors.primary,
                ),
              ),
              TextView(
                text:
                    '${indexOfMedicationClassList + 1}/${medicationClassList.length}',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              IconButton(
                onPressed:
                    medicationClassList[indexOfMedicationClassList] ==
                        medicationClassList.last
                    ? () {}
                    : () {
                        indexOfMedicationClassList += 1;
                        model!.notifyListeners();
                        print(indexOfMedicationClassList);
                      },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 22.sp,
                  color:
                      medicationClassList[indexOfMedicationClassList] ==
                          medicationClassList.last
                      ? AppColors.primaryLight.withOpacity(.7)
                      : AppColors.primary1,
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.dashboard,
                  buttonText: 'Make Updates',
                  color: AppColors.deep,
                  fontSize: 14.sp,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    linIndex--;
                    indexOfMedicationClassList = 0;
                    model!.notifyListeners();
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  fontSize: 14.sp,
                  buttonColor: AppColors.primary,
                  buttonText: 'Continue',
                  color: AppColors.white,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    linIndex++;
                    model!.notifyListeners();
                    print('medicationClassList$medicationClassList');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
        ],
      ),
    ),
  );

  thirdModalFlowUpdate({
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    value: linIndex / 3,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/3',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          ...List.generate(channels.length, (index) {
            return chooseNotChannelWidget(
              context,
              text: channels[index],
              isTapped: selectedIndexes.contains(index), // ✅ reflect state
              onTap: () {
                if (selectedIndexes.contains(index)) {
                  // unselect
                  selectedIndexes.remove(index);
                } else {
                  // select
                  selectedIndexes.add(index);
                  // ✅ Show specific dialogs
                  if (index == 0) {
                    // Email
                    showEmailDialog(context);
                  } else if ([2, 3, 4].contains(index)) {
                    // Phone-related channels

                    showPhoneDialog(context);
                    isPhoneValid = false;
                    model!.notifyListeners();
                  }
                } // ✅ update selection
                buildChannelList(selectedIndexes);
                addCostTotal();
                model!.notifyListeners();
              },
            );
          }),
          SizedBox(height: emailReminderList.isNotEmpty ? 20.h : 0.h),

          emailReminderList.isNotEmpty
              ? isTappedEmailAdded
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.infoGrey1),
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.white,
                        ),
                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Add Email Address',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.deep,
                                  ),
                                ),
                                Row(
                                  children: [
                                    TextView(
                                      text: 'Emails available',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          223,
                                          233,
                                          247,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        border: Border.all(
                                          color: AppColors.primary.withOpacity(
                                            .4,
                                          ),
                                        ),
                                      ),
                                      child: TextView(
                                        text: '${emailReminderList.length}',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 11.8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isTappedEmailAdded = !isTappedEmailAdded;
                                    model!.notifyListeners();
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.drop_up,
                                    height: 22.0.h,
                                    width: 22.0.w,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                IconButton(
                                  onPressed: () => showEmailDialog(context),
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: AppColors.primary1,
                                    size: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.infoGrey1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                                color: AppColors.dashboard,
                              ),
                              padding: EdgeInsets.all(12.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Add Email Address',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 16.2.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.deep,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextView(
                                            text: 'Emails available',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.8.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(width: 6.w),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                223,
                                                233,
                                                247,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                color: AppColors.primary
                                                    .withOpacity(.4),
                                              ),
                                            ),
                                            child: TextView(
                                              text:
                                                  '${emailReminderList.length}',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 11.8.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          isTappedEmailAdded =
                                              !isTappedEmailAdded;
                                          model!.notifyListeners();
                                        },
                                        child: SvgPicture.asset(
                                          AppImage.drop_up,
                                          height: 22.0.h,
                                          width: 22.0.w,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      IconButton(
                                        onPressed: () =>
                                            showEmailDialog(context),
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: AppColors.primary1,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.20.h),
                            ...emailReminderList.asMap().entries.map((entry) {
                              final index = entry.key;
                              final o = entry.value;
                              final isLast =
                                  index == emailReminderList.length - 1;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.20.w,
                                      right: 20.w,
                                      bottom: 12.w,
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (addedEmailReminderList.contains(
                                              o,
                                            )) {
                                              addedEmailReminderList.remove(o);
                                            } else {
                                              addedEmailReminderList.add(o);
                                            }
                                            model!.notifyListeners();
                                          },
                                          child: Container(
                                            padding:
                                                addedEmailReminderList.contains(
                                                  o,
                                                )
                                                ? EdgeInsets.all(4.0.w)
                                                : EdgeInsets.all(10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              color:
                                                  addedEmailReminderList
                                                      .contains(o)
                                                  ? AppColors.primary
                                                  : AppColors.transparent,
                                              border: Border.all(
                                                color:
                                                    addedEmailReminderList
                                                        .contains(o)
                                                    ? AppColors.transparent
                                                    : AppColors.infoGrey,
                                                width: .78,
                                              ),
                                            ),
                                            child:
                                                addedEmailReminderList.contains(
                                                  o,
                                                )
                                                ? Icon(
                                                    Icons.check,
                                                    size: 12.sp,
                                                    color: AppColors.white,
                                                  )
                                                : SizedBox.shrink(),
                                          ),
                                        ),
                                        // Transform.scale(
                                        //   scale:
                                        //       MediaQuery.of(
                                        //             context,
                                        //           ).size.shortestSide >=
                                        //           600
                                        //       ? 1.5
                                        //       : 1.1,
                                        //   child: Checkbox(
                                        //     value: addedEmailReminderList
                                        //         .contains(o),
                                        //     onChanged: (_) {
                                        //       if (addedEmailReminderList
                                        //           .contains(o)) {
                                        //         addedEmailReminderList.remove(
                                        //           o,
                                        //         );
                                        //       } else {
                                        //         addedEmailReminderList.add(o);
                                        //       }
                                        //       model!.notifyListeners();
                                        //     },
                                        //     activeColor: AppColors.primary,
                                        //     shape: RoundedRectangleBorder(
                                        //       borderRadius:
                                        //           BorderRadius.circular(4),
                                        //     ),
                                        //     visualDensity: VisualDensity
                                        //         .compact, // 👈 reduces internal padding
                                        //   ),
                                        // ),
                                        SizedBox(width: 9.10.w),
                                        SizedBox(
                                          width: 220.w,
                                          child: TextView(
                                            text: o,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.ellipsis,
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showEmailDialog(
                                                  context,
                                                  isEdit: true,
                                                  index: index,
                                                  email:
                                                      emailReminderList[index],
                                                );
                                                model!.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.edit_pen,
                                                height: 22.0.h,
                                                width: 22.0.w,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            GestureDetector(
                                              onTap: () {
                                                emailReminderList.removeAt(
                                                  index,
                                                );
                                                model!.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.delete,
                                                height: 22.0.h,
                                                width: 22.0.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!isLast)
                                    Divider(color: AppColors.infoGrey1),
                                  SizedBox(height: 5.10.h),
                                ],
                              );
                            }),
                          ],
                        ),
                      )
              : SizedBox.shrink(),
          SizedBox(height: phoneReminderList.isNotEmpty ? 20.h : 0.h),

          phoneReminderList.isNotEmpty
              ? isTappedPhoneAdded
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.infoGrey1),
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.white,
                        ),

                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Add Phone Number',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.deep,
                                  ),
                                ),
                                Row(
                                  children: [
                                    TextView(
                                      text: 'Numbers available',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          223,
                                          233,
                                          247,
                                        ),

                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        border: Border.all(
                                          color: AppColors.primary.withOpacity(
                                            .4,
                                          ),
                                        ),
                                      ),
                                      child: TextView(
                                        text: '${phoneReminderList.length}',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 11.8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isTappedPhoneAdded = !isTappedPhoneAdded;
                                    model!.notifyListeners();
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.drop_up,
                                    height: 22.0.h,
                                    width: 22.0.w,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                IconButton(
                                  onPressed: () {
                                    showPhoneDialog(context);
                                    isPhoneValid = false;
                                    model!.notifyListeners();
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: AppColors.primary1,
                                    size: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.infoGrey1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                                color: AppColors.dashboard,
                              ),

                              padding: EdgeInsets.all(12.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Add Phone Number',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 15.8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.deep,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextView(
                                            text: 'Numbers available',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.8.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(width: 6.w),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                223,
                                                233,
                                                247,
                                              ),

                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                color: AppColors.primary
                                                    .withOpacity(.4),
                                              ),
                                            ),
                                            child: TextView(
                                              text:
                                                  '${phoneReminderList.length}',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 11.8.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          isTappedPhoneAdded =
                                              !isTappedPhoneAdded;
                                          model!.notifyListeners();
                                        },
                                        child: SvgPicture.asset(
                                          AppImage.drop_up,
                                          height: 22.0.h,
                                          width: 22.0.w,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      IconButton(
                                        onPressed: () {
                                          showPhoneDialog(context);

                                          isPhoneValid = false;
                                          model!.notifyListeners();
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: AppColors.primary1,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.20.h),
                            Padding(
                              padding: EdgeInsets.only(left: 12.w, right: 20.w),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(4.0.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        color: AppColors.primary,
                                        border: Border.all(
                                          color: AppColors.transparent,
                                          width: .78,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 12.sp,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 9.10.w),
                                  TextView(
                                    text: formatPhoneNumber(
                                      SharedPreferencesService
                                          .instance
                                          .usersData['user']['phone'],
                                    ),
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(1.2.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.app_green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 13.4.sp,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      TextView(
                                        text: 'Primary',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 13.72.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.0.h),
                            Divider(color: AppColors.infoGrey1),

                            ...phoneReminderList.asMap().entries.map((entry) {
                              final index = entry.key;
                              final o = entry.value;
                              final isLast =
                                  index == phoneReminderList.length - 1;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.w,
                                      right: 20.w,
                                      bottom: 12.w,
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (addedPhoneReminderList.contains(
                                              o,
                                            )) {
                                              addedPhoneReminderList.remove(o);
                                            } else {
                                              addedPhoneReminderList.add(o);
                                            }
                                            model!.notifyListeners();
                                          },
                                          child: Container(
                                            padding:
                                                addedPhoneReminderList.contains(
                                                  o,
                                                )
                                                ? EdgeInsets.all(4.0.w)
                                                : EdgeInsets.all(10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              color:
                                                  addedPhoneReminderList
                                                      .contains(o)
                                                  ? AppColors.primary
                                                  : AppColors.transparent,
                                              border: Border.all(
                                                color:
                                                    addedPhoneReminderList
                                                        .contains(o)
                                                    ? AppColors.transparent
                                                    : AppColors.infoGrey,
                                                width: .78,
                                              ),
                                            ),
                                            child:
                                                addedPhoneReminderList.contains(
                                                  o,
                                                )
                                                ? Icon(
                                                    Icons.check,
                                                    size: 12.sp,
                                                    color: AppColors.white,
                                                  )
                                                : SizedBox.shrink(),
                                          ),
                                        ),
                                        SizedBox(width: 9.10.w),
                                        TextView(
                                          text: formatPhoneNumber(o),
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.2.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showPhoneDialog(
                                                  context,
                                                  isEdit: true,
                                                  index: index,
                                                  phoneNumber:
                                                      phoneReminderList[index],
                                                );
                                                isPhoneValid = false;
                                                model!.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.edit_pen,
                                                height: 22.0.h,
                                                width: 22.0.w,
                                              ),
                                            ),
                                            SizedBox(width: 16.10.w),
                                            GestureDetector(
                                              onTap: () {
                                                phoneReminderList.removeAt(
                                                  index,
                                                );
                                                model!.notifyListeners();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.delete,
                                                height: 22.0.h,
                                                width: 22.0.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!isLast)
                                    Divider(color: AppColors.infoGrey1),
                                  SizedBox(height: 5.10.h),
                                ],
                              );
                            }),
                          ],
                        ),
                      )
              : SizedBox.shrink(),
          phoneReminderList.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.0.h),
                    TextView(
                      text: 'COST SUMMARY',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 14.80.sp,
                        color: AppColors.grey1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.2.h),
                    Divider(color: AppColors.infoGrey1),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          dashPattern: [3, 3],
                          strokeWidth: .99,
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
                            color: AppColors.dashboard,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Total Days',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextView(
                                    text: '${returnTotalDays()}',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.10.h),
                              Divider(color: AppColors.infoGrey1),
                              SizedBox(height: 6.10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Reminders per day',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextView(
                                    text: '3',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.10.h),
                              Divider(color: AppColors.infoGrey1),
                              SizedBox(height: 6.10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Total Reminders',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextView(
                                    text: '${returnTotalDays() * 3}',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: selectedIndexes.contains(3)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(3)
                                  ? Divider(color: AppColors.infoGrey1)
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(3)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(3)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'WhatsApp  (x5 msgs)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text: '₦25',
                                          textStyle: TextStyle(
                                            // fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(2)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(2)
                                  ? Divider(color: AppColors.infoGrey1)
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(2)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(2)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'SMS  (x5 msgs)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text: '₦50',
                                          textStyle: TextStyle(
                                            // fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(4)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(4)
                                  ? Divider(color: AppColors.infoGrey1)
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(4)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(4)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'Phone Calls  (x5 calls)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text: '₦100',
                                          textStyle: TextStyle(
                                            // fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(height: 6.10.h),
                              Divider(color: AppColors.infoGrey1),
                              SizedBox(height: 6.10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Total',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextView(
                                    text: '₦$costTotal.00',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.80.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          SizedBox(height: _isLoading ? 20.h : 0.h),

          _isLoading
              ? SpinKitCircle(color: AppColors.primary, size: 50.sp)
              : SizedBox.shrink(),
          SizedBox(
            height: phoneReminderList.isNotEmpty
                ? 40.h
                : _isLoading
                ? 106.h
                : 206.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.dashboard,
                  buttonText: 'Previous',
                  color: AppColors.deep,
                  fontSize: 14.sp,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    linIndex--;
                    model!.notifyListeners();
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  fontSize: 14.sp,
                  buttonColor: AppColors.primary,
                  buttonText: 'Make Payment',
                  color: AppColors.white,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    if (phoneReminderList.contains(
                      SharedPreferencesService
                          .instance
                          .usersData['user']['phone'],
                    )) {
                    } else {
                      phoneReminderList.add(
                        SharedPreferencesService
                            .instance
                            .usersData['user']['phone'],
                      );
                    }
                    if (phoneReminderList.isNotEmpty) {
                      linIndex++;
                    } else {
                      createReminder(
                        context,
                        createReminderEntityModel: CreateReminderEntityModel(
                          medications: medicationClassList.map((m) {
                            return Medication(
                              medicationName: m.medicationName,
                              drugName: m.drugName,
                              dosage: m.dosage,
                              medicationType: m.medicationType!.toUpperCase(),
                              startDateTime: m.startDateIso,
                              endDateTime: m.endDateIso,
                              durationInDays: int.parse(m.duration!),
                              timesPerDay: int.parse(m.timesToTake!),
                              dailyDoseTimes: (m.dosageMap as List)
                                  .map(
                                    (dayData) => (dayData['doses'] as List)
                                        .map(
                                          (dose) => DailyDoseTime.fromJson(
                                            dose as Map<String, dynamic>,
                                          ),
                                        )
                                        .toList(),
                                  )
                                  .toList(),
                              note: m.note,
                              medicationImage: MedicationImage.fromJson(
                                m.imageData!.toJson(),
                              ),
                            );
                          }).toList(),
                          timeZone: "Africa/Lagos",
                          notificationChannels: notificationChannel,
                          emails: emailReminderList,
                          phoneNumbers: phoneReminderList,
                          payment: Payment(amount: costTotal, currency: "NGN"),
                        ),
                      );
                    }
                    model!.notifyListeners();
                    print('medicationClassList$medicationClassList');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
        ],
      ),
    ),
  );

  fourthModalFlowUpdate({
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(height: 32.h),
          TextView(
            text: 'Amount',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15.90.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 14.2.h),
          Container(
            height: 70.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.skyBlue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: TextView(
                text: '₦$costTotal.00',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 20.90.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.reminder,
                ),
              ),
            ),
          ),
          SizedBox(height: 22.h),
          TextView(
            text: 'Select Payment Method',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 16.90.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.deep,
            ),
          ),
          SizedBox(height: 12.h),
          paymentWidget(
            isWallet: true,
            text: 'Pay with Wallet',
            icon: AppImage.wallet_pay,
            onTap: () {
              onTapPaymentMeth = 'Pay with Wallet';
              model!.notifyListeners();
            },
          ),
          paymentWidget(
            isWallet: false,
            text: 'Pay with Card',
            icon: AppImage.card_pay,
            onTap: () {
              onTapPaymentMeth = 'Pay with Card';
              model!.notifyListeners();
            },
          ),
          paymentWidget(
            isWallet: false,
            text: 'Pay with Bank Transfer',
            icon: AppImage.bank_transfer,
            onTap: () {
              onTapPaymentMeth = 'Pay with Bank Transfer';
              model!.notifyListeners();
            },
          ),
          paymentWidget(
            isWallet: false,
            text: 'Pay with Mobile Money',
            icon: AppImage.online_mobile,
            onTap: () {
              onTapPaymentMeth = 'Pay with Mobile Money';
              model!.notifyListeners();
            },
          ),
          paymentWidget(
            isWallet: false,
            text: 'Pay with USSD',
            icon: AppImage.ussd_pay,
            onTap: () {
              onTapPaymentMeth = 'Pay with USSD';
              model!.notifyListeners();
            },
          ),
          SizedBox(height: _isLoading ? 20.h : 0.h),
          _isLoading
              ? SpinKitCircle(color: AppColors.primary, size: 50.sp)
              : SizedBox.shrink(),
          SizedBox(height: 120.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.dashboard,
                  buttonText: 'Previous',
                  color: AppColors.deep,
                  fontSize: 14.sp,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {
                    linIndex--;
                    model!.notifyListeners();
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: ButtonWidget(
                  border: 100.r,
                  fontSize: 14.sp,
                  buttonColor: onTapPaymentMeth != ''
                      ? AppColors.primary
                      : AppColors.infoGrey,
                  buttonText: 'Continue',
                  color: AppColors.white,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: onTapPaymentMeth != ''
                      ? () {
                          createReminder(
                            context,
                            createReminderEntityModel:
                                CreateReminderEntityModel(
                                  medications: medicationClassList.map((m) {
                                    return Medication(
                                      medicationName: m.medicationName,
                                      drugName: m.drugName,
                                      dosage: m.dosage,
                                      medicationType: m.medicationType!
                                          .toUpperCase(),
                                      startDateTime: m.startDateIso,
                                      endDateTime: m.endDateIso,
                                      durationInDays: int.parse(m.duration!),
                                      timesPerDay: int.parse(m.timesToTake!),
                                      dailyDoseTimes: (m.dosageMap as List)
                                          .map(
                                            (
                                              dayData,
                                            ) => (dayData['doses'] as List)
                                                .map(
                                                  (
                                                    dose,
                                                  ) => DailyDoseTime.fromJson(
                                                    dose
                                                        as Map<String, dynamic>,
                                                  ),
                                                )
                                                .toList(),
                                          )
                                          .toList(),
                                      note: m.note,
                                      medicationImage: MedicationImage.fromJson(
                                        m.imageData!.toJson(),
                                      ),
                                    );
                                  }).toList(),
                                  timeZone: "Africa/Lagos",
                                  notificationChannels: notificationChannel,
                                  emails: emailReminderList,
                                  phoneNumbers: phoneReminderList,
                                  payment: Payment(
                                    amount: costTotal,
                                    currency: "NGN",
                                  ),
                                ),
                          );
                          model!.notifyListeners();
                          print('medicationClassList$medicationClassList');
                        }
                      : () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
        ],
      ),
    ),
  );

  String showNoTimes(number) {
    if (number == 1) {
      return 'Once Daily';
    } else if (number == 2) {
      return 'Twice Daily';
    } else if (number == 3) {
      return 'Thrice Daily';
    } else if (number == 4) {
      return 'Four Daily';
    }
    return 'Five Daily';
  }

  chooseNotChannelWidget(
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
              fontSize: 15.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
        ],
      ),
    ),
  );

  void showUpdateDoseDialog(BuildContext context, {Datum? o}) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        return ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          onDispose: (viewModel) {},
          builder: (_, AuthViewModel model, _) {
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
                      label: Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
                      padding: EdgeInsets.all(21.4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: AppColors.skyBlue,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              isMedTypeView(o!.medicationType),
                              color: AppColors.primary,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          TextView(
                            text: o.drugName ?? '',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextView(
                                text: 'Note: ',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 14.2.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.reminder,
                                ),
                              ),
                              TextView(
                                text: '${o.note}',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 13.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.w,
                              horizontal: 20.w,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.skyBlue,
                              border: Border.all(
                                color: AppColors.buttonGrey1,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    TextView(
                                      text: '2 Tablets',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 4.10.h),
                                    TextView(
                                      text: 'Dosage to be taken',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5.10.h),
                                Column(
                                  children: [
                                    TextView(
                                      text:
                                          '${o.time} ${checkTimePeriod(o.time)}',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 4.10.h),
                                    TextView(
                                      text: 'Scheduled Time',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: model.isLoading ? 20.h : 0.h),
                          model.isLoading
                              ? SpinKitWaveSpinner(
                                  color: AppColors.primary,
                                  size: 32.0.sp,
                                )
                              : SizedBox.shrink(),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Expanded(
                                child: ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.white,
                                  buttonText: 'Missed',
                                  color: AppColors.red,
                                  buttonBorderColor: AppColors.red,
                                  onPressed: () {
                                    model.updateDosesStatus(
                                      context,
                                      reminder: o.reminderId,
                                      dose: o.doseId,
                                      status: 'MISSED',
                                    );
                                    model.notifyListeners();
                                  },
                                ),
                              ),
                              SizedBox(width: 30.w),

                              Expanded(
                                child: ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.app_green,
                                  buttonText: 'Taken',
                                  color: AppColors.white,
                                  buttonBorderColor: AppColors.app_green,
                                  onPressed: () {
                                    model.updateDosesStatus(
                                      context,
                                      reminder: o.reminderId,
                                      dose: o.doseId,
                                      status: 'TAKEN',
                                    );
                                    model.notifyListeners();
                                  },
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
      },
    );
  }

  void showEmailDialog(
    BuildContext context, {
    bool isEdit = false,
    int? index,
    String? email,
  }) {
    TextEditingController emailController = TextEditingController();
    if (isEdit) {
      emailController.text = email!;
    }

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
                  padding: EdgeInsets.all(34.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextView(
                        text: !isEdit ? 'Add Email' : 'Edit Email',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextView(
                        text: 'Email',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          color: AppColors.black,
                          fontSize: 12.20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Form(
                        key: formKeyEmailReminder,
                        child: TextFormWidget(
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: AppValidator.validateEmail(),
                          inputFormatters: [
                            TextInputFormatter.withFunction((
                              oldValue,
                              newValue,
                            ) {
                              return newValue.copyWith(
                                text: newValue.text.toLowerCase(),
                                selection: newValue.selection,
                              );
                            }),
                          ],
                        ),
                      ),

                      SizedBox(height: 35.h),

                      // 🔹 Save button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKeyEmailReminder.currentState!.validate()) {
                              if (!isEdit) {
                                emailReminderList.add(
                                  emailController.text.trim(),
                                );
                              } else {
                                emailReminderList[index!] =
                                    emailController.text;
                              }
                              Navigator.pop(context);
                              emailController.clear();
                            }
                            locator<AuthViewModel>().notifyListeners();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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

  void showPhoneDialog(
    BuildContext context, {
    bool isEdit = false,
    int? index,
    String? phoneNumber,
  }) {
    TextEditingController phoneController = TextEditingController();
    if (isEdit) {
      phoneController.text = phoneNumber!.substring(4);
    }

    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        print("isPhoneValid$isPhoneValid");
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
                  padding: EdgeInsets.all(34.w),
                  child: Form(
                    key: formKeyPhoneReminder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextView(
                          text: !isEdit
                              ? 'Add Phone Number'
                              : 'Edit Phone Number',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextView(
                          text: 'Phone Number',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            color: AppColors.black,
                            fontSize: 12.20.sp,
                            fontWeight: FontWeight.w400,
                          ),
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
                                    : EdgeInsets.zero,
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
                                  onChange: (p0) {},
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    final result = AppValidator.validatePhone()(
                                      value,
                                    );
                                    if (result != null) {
                                      isPhoneValid = true;
                                    } else {
                                      isPhoneValid = false;
                                    }
                                    print(isPhoneValid);
                                    notifyListeners();
                                    return result;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 35.h),
                        // 🔹 Save button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKeyPhoneReminder.currentState!
                                  .validate()) {
                                if (!isEdit) {
                                  phoneReminderList.add(
                                    '+234${phoneController.text.trim()}',
                                  );
                                } else {
                                  phoneReminderList[index!] =
                                      '+234${phoneController.text.trim()}';
                                }
                                Navigator.pop(context);
                                phoneController.clear();
                              }
                              locator<AuthViewModel>().notifyListeners();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  returnTotalDays() {
    totalDuration = medicationClassList.fold(
      0,
      (sum, item) => sum! + int.parse(item.duration!.substring(0, 1)),
    );
    return totalDuration;
  }

  void addCostTotal() {
    costTotal = 0;
    if (selectedIndexes.contains(2)) {
      costTotal += 50;
    }
    if (selectedIndexes.contains(3)) {
      costTotal += 25;
    }
    if (selectedIndexes.contains(4)) {
      costTotal += 100;
    }
    notifyListeners();
  }

  paymentWidget({
    bool isWallet = false,
    String? text,
    String? icon,
    Function()? onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 12.w),
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: onTapPaymentMeth == text ? AppColors.primary : AppColors.f1,
          width: onTapPaymentMeth == text ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(icon!, width: 18.125.w, height: 18.h),
          SizedBox(width: 10.w),
          TextView(
            text: text ?? '',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
          Spacer(),
          !isWallet
              ? SizedBox.shrink()
              : Row(
                  children: [
                    TextView(
                      text: '₦0.00',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    TextView(
                      text: 'Fund',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.0.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    ),
  );

  void createReminder(
    context, {
    CreateReminderEntityModel? createReminderEntityModel,
  }) async {
    try {
      _isLoading = true;
      _createReminderResponseModel = await runBusyFuture(
        repositoryImply.createReminder(createReminderEntityModel!),
        throwException: true,
      );
      _isLoading = false;
      if (_createReminderResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _createReminderResponseModel?.message ?? '',
        );
        navigate.navigateTo(
          Routes.paymentStatusScreen,
          arguments: PaymentStatusScreenArguments(isSuccessful: true),
        );
      } else {
        navigate.navigateTo(
          Routes.paymentStatusScreen,
          arguments: PaymentStatusScreenArguments(isSuccessful: false),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    locator<AuthViewModel>().notifyListeners();
  }

  void getReminder(context, {String? status, String? page}) async {
    try {
      _isLoading = true;
      _getReminderResponseModel = await runBusyFuture(
        repositoryImply.getReminder(
          status: status,
          page: page,
          limit: 20.toString(),
        ),
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

  void getReminderById(context, String? id) async {
    try {
      _isLoading = true;
      _getReminderByIdModel = await runBusyFuture(
        repositoryImply.getReminderById(id),
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

  void getTodaysReminder(context, {String? period, String? date}) async {
    try {
      _isLoading = true;
      _getTodaysReminderModel = await runBusyFuture(
        repositoryImply.getTodaysReminder(period: period, date: date),
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

  void updateDosesStatus(
    context, {
    String? reminder,
    String? dose,
    String? status,
  }) async {
    try {
      _isLoading = true;
      _updateDosesStatusModel = await runBusyFuture(
        repositoryImply.updateDosesStatusModel(
          status: status,
          doseId: dose,
          reminderId: reminder,
        ),
        throwException: true,
      );
      AppUtils.snackbar(context, message: _updateDosesStatusModel?.message);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void updateReminder(
    context, {
    String? reminderId,
    UpdateReminderEntityModel? updateReminder,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateReminder(
          reminderId: reminderId,
          updateReminder: updateReminder,
        ),
        throwException: true,
      );
      AppUtils.snackbar(context, message: v['data']['message']);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  onAddGoingLoading() async {
    pageOngoing++;
    onLoading(pageOngoing);
    notifyListeners();
  }

  onAddCompletedLoading() async {
    pageCompleted++;
    onLoading(pageCompleted);
    notifyListeners();
  }

  onAddTodayLoading() async {
    pageToday++;
    onLoading(pageToday);
    notifyListeners();
  }

  onSubGoingLoading() async {
    pageOngoing--;
    onLoading(pageOngoing);
    notifyListeners();
  }

  onSubCompletedLoading() async {
    pageCompleted--;
    onLoading(pageCompleted);
    notifyListeners();
  }

  onSubTodayLoading() async {
    pageToday--;
    onLoading(pageToday);
    notifyListeners();
  }

  Future<void> onLoading(page) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (_getReminderResponseModel!.data!.reminders!.isNotEmpty) {
      try {
        _isLoading = true;
        _getReminderResponseModel = await runBusyFuture(
          repositoryImply.getReminder(
            status: isReminderStatus,
            page: page.toString(),
            limit: 20.toString(),
          ),
        );
        _isLoading = false;
      } catch (e) {
        _isLoading = false;
        rethrow;
      }
    } else {
      isLoadNoMore = true;
      null;
    }
    _isLoading = false;
    notifyListeners();
  }

  void uploadImageReminder({context, MultipartFile? file}) async {
    try {
      _isLoading = true;
      _uploadImageReminderResponseModel = await runBusyFuture(
        repositoryImply.uploadImageReminder(file!),
        throwException: true,
      );
      _isLoading = false;
      if (_uploadImageReminderResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: 'Image uploaded successfully..!',
        );
      }
      logger.d(_uploadImageReminderResponseModel?.toJson());
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  String isMedTypeView(medType) {
    if (medType == 'PILL') {
      return AppImage.pills;
    }
    if (medType == 'SYRUP') {
      return AppImage.syrup;
    }
    if (medType == 'INJECTION') {
      return AppImage.syringe;
    }
    if (medType == 'DRIP') {
      return AppImage.drip;
    }
    if (medType == 'OINTMENT') {
      return AppImage.ointment;
    }
    if (medType == 'INHALER') {
      return AppImage.inhaler;
    }
    return AppImage.other_meds;
  }

  checkTimePeriod(time) {
    int hour = int.parse(time.split(":")[0]);
    if (hour < 12) {
      return "AM";
    } else {
      return "PM";
    }
  }

  Color checkMedsStatusColor(meds) {
    if (meds == 'PENDING') {
      return AppColors.transparent;
    }
    if (meds == 'MISSED') {
      return AppColors.red;
    }
    return AppColors.green;
  }

  Widget checkMedsStatusWidget(meds) {
    if (meds == 'PENDING') {
      return SvgPicture.asset(AppImage.pending_meds);
    }
    if (meds == 'MISSED') {
      return Padding(
        padding: EdgeInsets.all(2.w),
        child: SvgPicture.asset(
          AppImage.cancel,
          color: AppColors.white,
          height: 5.6.h,
          width: 5.6.w,
        ),
      );
    }
    return Icon(Icons.check, size: 10.4.sp, color: AppColors.white);
  }

  String getNumberOfTimes(int times) {
    switch (times) {
      case 1:
        return 'Once daily';
      case 2:
        return 'Twice daily';
      case 3:
        return 'Thrice daily';
      default:
        if (times > 3 && times <= 12) {
          return '$times times daily';
        } else {
          return 'Invalid number of times';
        }
    }
  }

  Future<void> showUpdateMedicationDialog({
    BuildContext? context,
    getReminderId.Data? data,
  }) async {
    return showDialog(
      context: context!,
      barrierDismissible: false, // Prevent dismiss when tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top warning icon
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.yellow.withOpacity(.09),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.yellow,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppImage.ex_error,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextView(
                  text: "Update Medication",
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.bblack,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      "Are you sure you want to make updates to this medication?",
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.success,
                  ),
                ),

                SizedBox(height: 24.h),

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
                          horizontal: 42.w,
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
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await Future.delayed(Duration(milliseconds: 100));
                        showUpdateReminderModal(context: context, data: data);
                        // Add your update logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w,
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
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
