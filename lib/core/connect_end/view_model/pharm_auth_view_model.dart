// ignore_for_file: strict_top_level_inference, use_build_context_synchronously, prefer_typing_uninitialized_variables, deprecated_member_use, unnecessary_null_comparison, library_prefixes
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/connect_end/model/create_tenant_reminder_entity_model/patient_details.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/get_reminder_for_tenant_response_model.dart';
import 'package:medicate_app/core/connect_end/model/upload_image_reminder_response_model/data.dart'
    as phImg;
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/daily_dose_time.dart'
    as getId;
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/data.dart'
    as getReminderId;
import 'package:medicate_app/core/connect_end/model/create_user_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/roles_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_kyc_entity_model/file.dart'
    as ph;
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
import 'package:medicate_app/core/connect_end/model/update_pharmacy_profile_entity_model/logo.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/upload_image_response_model/upload_image_response_model.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/widget/deactivate_user_modal_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../ui/dashboard/profile/wallet/fund_screen.dart';
import '../../../ui/dashboard/reminder/med_type.dart';
import '../../../ui/dashboard/reminder/medication_class.dart';
import '../../../ui/widget/add_role_modal_widget.dart';
import '../../../ui/widget/add_user_modal_widget.dart';
import '../../../ui/widget/button.dart';
import '../../../ui/widget/delete_role_modal_widget.dart';
import '../../../ui/widget/text.dart';
import '../../../ui/widget/text_form_dose_widget.dart';
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
import '../model/create_payment_wallet_entity_model.dart';
import '../model/create_payment_wallet_model/create_payment_wallet_model.dart';
import '../model/create_tenant_reminder_entity_model/create_tenant_reminder_entity_model.dart';
import '../model/create_reminder_response_model/create_reminder_response_model.dart';
import '../model/create_tenant_reminder_entity_model/daily_dose_time.dart';
import '../model/create_tenant_reminder_entity_model/medication.dart';
import '../model/create_tenant_reminder_entity_model/medication_image.dart';
import '../model/create_tenant_reminder_entity_model/payment.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_created_user_response_model/get_created_user_response_model.dart';
import '../model/get_created_user_response_model/staff.dart';
import '../model/get_reminder_by_id/get_reminder_by_id.dart';
import '../model/get_roles_response_model/get_roles_response_model.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/get_today_reminder_model/get_today_reminder_model.dart';
import '../model/get_transaction_wallet_response_model/get_transaction_wallet_response_model.dart';
import '../model/get_transaction_wallet_response_model/transaction.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/get_wallet_response_model/get_wallet_response_model.dart';
import '../model/initiate_payment_response_model/initiate_payment_response_model.dart';
import '../model/initiate_payment_wallet_entity_model.dart';
import '../model/login_entity_model.dart';
import '../model/pay_with_wallet_entity_model.dart';
import '../model/pay_with_wallet_response_model/pay_with_wallet_response_model.dart';
import '../model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/sign_up_pharmacy_entity_model.dart';
import '../model/update_doses_status_model/update_doses_status_model.dart';
import '../model/update_pharmacy_kyc_entity_model/document.dart';
import '../model/update_reminder_entity_model/update_reminder_entity_model.dart';
import '../model/update_role_entity_model.dart';
import '../model/update_user_entity_model.dart';
import '../model/upload_image_reminder_response_model/upload_image_reminder_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';
import '../repo/pharm_repo_impl.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/daily_dose_time.dart'
    as getR;
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/reminder.dart'
    as tenantReminder;
import 'package:medicate_app/core/connect_end/model/update_reminder_entity_model/daily_dose_time.dart'
    as upReminder;
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/payment.dart'
    as pyR;

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
  GlobalKey<FormState> formKeyValidateAddRole = GlobalKey<FormState>();
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

  GetRolesResponseModel? _getRolesResponseModel;
  GetRolesResponseModel? get getRolesResponseModel => _getRolesResponseModel;

  GetCreatedUserResponseModel? _getCreatedUserResponseModel;
  GetCreatedUserResponseModel? get getCreatedUserResponseModel =>
      _getCreatedUserResponseModel;
  TextEditingController countryController = TextEditingController();
  TextEditingController rolenameController = TextEditingController();
  TextEditingController roleDescriptionController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  TextEditingController meansIdController = TextEditingController();
  GlobalKey<FormState> formKeyValidate2 = GlobalKey<FormState>();
  bool? onTapToAddUser = false;
  bool? onTapToAddRole = false;
  List<String> selectService = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userGenderController = TextEditingController();
  TextEditingController userPinController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  String? userRoleControllerId;

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
  UploadImageReminderResponseModel? _uploadImageReminderResponseModel;
  UploadImageReminderResponseModel? get uploadImageReminderResponseModel =>
      _uploadImageReminderResponseModel;

  CreateReminderResponseModel? _createReminderResponseModel;
  CreateReminderResponseModel? get createReminderResponseModel =>
      _createReminderResponseModel;

  InitiatePaymentResponseModel? _initiatePaymentResponseModel;
  InitiatePaymentResponseModel? get initiatePaymentResponseModel =>
      _initiatePaymentResponseModel;
  GetReminderForTenantResponseModel? _getReminderResponseModel;
  GetReminderForTenantResponseModel? get getReminderResponseModel =>
      _getReminderResponseModel;
  GetReminderForTenantResponseModel? _getReminderForTenantResponseModel;
  GetReminderForTenantResponseModel? get getReminderForTenantResponseModel =>
      _getReminderForTenantResponseModel;
  GetReminderById? _getReminderByIdModel;
  GetReminderById? get getReminderByIdModel => _getReminderByIdModel;

  GetTodayReminderModel? _getTodaysReminderModel;
  GetTodayReminderModel? get getTodaysReminderModel => _getTodaysReminderModel;
  UpdateDosesStatusModel? _updateDosesStatusModel;
  UpdateDosesStatusModel? get updateDosesStatusModel => _updateDosesStatusModel;

  CreatePaymentWalletModel? _createPaymentWalletModel;
  CreatePaymentWalletModel? get createPaymentWalletModel =>
      _createPaymentWalletModel;
  GetWalletResponseModel? _getWalletBalanceResponseModel;
  GetWalletResponseModel? get getWalletBalanceResponseModel =>
      _getWalletBalanceResponseModel;
  GetTransactionWalletResponseModel? _getWalletTransactionHistoryResponseModel;
  GetTransactionWalletResponseModel?
  get getWalletTransactionHistoryResponseModel =>
      _getWalletTransactionHistoryResponseModel;
  PayWithWalletResponseModel? _payWithWalletResponseModel;
  PayWithWalletResponseModel? get payWithWalletResponseModel =>
      _payWithWalletResponseModel;

  int linIndex = 1;
  int linIndexUpdate = 1;
  int indexOfMedicationClassList = 0;
  String onTapPaymentMeth = '';
  int? indexDaily;
  bool isChecked = false;
  bool onTapToAddAnotherReminder = false;
  bool isCheckedUp = false;
  int costTotal = 0;

  bool isTappedPhoneAdded = false;
  bool isTappedEmailAdded = false;

  String startDateIso = '';

  List<MedicationClass> medicationClassList = [];

  List<dynamic> medTypeUpdateIcon = [];
  List<int>? indexDailyList = [1, 2, 3, 4];
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
  List<dynamic> medicationFileUpdate = [];
  List<int> listOfTimesUpdate = [];
  List<dynamic> allNotificationChannels = [];
  List<dynamic> meyTypeUpdateIcon = [];
  List<dynamic>? formatSelectedTimeAndPeriodList = [];
  String? formattedSelectedTimeAndPeriod;
  String? numberOfDurationsInDays;
  List<dynamic>? numberOfDurationsInDaysList = [];

  List<FocusNode> medNameUpdateFocusNodes = [];
  List<FocusNode> drugNameUpdateFocusNodes = [];
  List<FocusNode> descriptionUpdateFocusNodes = [];
  List<FocusNode> durationUpdateFocusNodes = [];
  List<FocusNode> timesToTakeUpdateFocusNodes = [];
  List<FocusNode> noteUpdateFocusNodes = [];
  bool isShowMoreSecondModalFlow = false;
  final List<NotificationChannel> channels = [
    NotificationChannel(
      notification: 'Email (Free)',
      notificationIcon: AppImage.channel_email,
    ),
    NotificationChannel(
      notification: 'Push (Free)',
      notificationIcon: AppImage.bell,
    ),
    NotificationChannel(
      notification: 'SMS (₦15.00)',
      notificationIcon: AppImage.sms,
    ),
    NotificationChannel(
      notification: 'Whatsapp (₦20.00)',
      notificationIcon: AppImage.whatsapp,
    ),
    NotificationChannel(
      notification: 'Phone Call (₦50.00)',
      notificationIcon: AppImage.phone,
    ),
  ];
  List<String> emailReminderList = [];
  List<String> addedEmailReminderList = [];
  List<String> phoneReminderList = [];
  List<String> addedPhoneReminderList = [];
  List<String> notificationChannel = [];

  int? index;
  int totalDayDuration = 0;
  int? totalDuration;
  int? numberOfTimes;
  String endDateIso = '';
  String medTypeResult = '';
  String medTypeResultImage = '';
  String medTypeResultImageUpdate = '';
  String isReminderStatus = 'all';
  String timePeriod = 'morning';
  var totalCount;
  var takenCount;
  String? getTime;

  dynamic userDetailData;
  dynamic timeSelected;

  int? _getTotalTimesForReminder;

  List<List<String>> periodLabels = [];
  List<List<String>> periodLabelsUpdate = [];
  List<List<String>> periodAfterLabels = [];
  List<MedType> medTypeList = [
    MedType(medType: 'Tablet', medTypeImage: AppImage.tablet),
    MedType(medType: 'Capsule', medTypeImage: AppImage.pill),
    MedType(medType: 'Syrup', medTypeImage: AppImage.syrup),
    MedType(medType: 'Injection', medTypeImage: AppImage.syringe),
    MedType(medType: 'Ointment', medTypeImage: AppImage.ointment),
    MedType(medType: 'Inhaler', medTypeImage: AppImage.inhaler),
    MedType(medType: 'Others', medTypeImage: AppImage.other_meds),
  ];

  List<String>? tabletDosageList = [
    '1 tablet',
    '2 tablets',
    '3 tablets',
    '½ tablet',
    '1½ tablets',
  ];

  List<String>? syrupDosageList = [
    '5ml',
    '10ml',
    '15ml',
    '20ml',
    '2.5ml',
    '1 teaspoon',
    '2 teaspoons',
    '3 teaspoons',
  ];

  List<String>? injectionDosageList = [
    '0.5ml',
    '1ml',
    '2ml',
    '5ml',
    '10ml',
    '1 unit',
    '5 units',
    '10 units',
  ];

  List<String>? ointmentDosageList = [
    'Pea-sized amount',
    'Thin layer',
    'Thick layer',
    '1 inch strip',
    '2 inch strip',
  ];
  List<String>? inhalerDosageList = ['1 puff', '2 puffs', '3 puffs', '4 puffs'];
  List<String>? capsuleDosageList = [
    '1 capsule',
    '2 capsules',
    '3 capsules',
    '4 capsules',
  ];

  int? dosageValue;
  int? dosageAddedValue;
  int? dosageAfterValue;
  List<List<TextEditingController>> doseControllers = [];
  List<List<TextEditingController>> doseControllersUpdate = [];
  // List<List<TextEditingController>> doseAfterControllers = [];

  GlobalKey<FormState> firstFormReminderKey = GlobalKey<FormState>();
  GlobalKey<FormState> firstFormReminderUpdateKey = GlobalKey<FormState>();
  GlobalKey<FormState> secondFormReminderKey = GlobalKey<FormState>();
  GlobalKey<FormState> secondFormReminderUpdateKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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

  TextEditingController fundAmountController = TextEditingController();
  MedicationClass? medCard;
  String? pickedDate;
  File? imageDrug;
  String? drugFilename;
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController dateTimeControllerUpdate = TextEditingController();
  TextEditingController createAddPhoneController = TextEditingController();

  List<List<upReminder.DailyDoseTime>> dailyDose = [];

  final _pickImage = ImagePickerHandler();

  List listOfDosage = [];

  List<Staff> checkOwnerRole = [];
  File? imageMeansId;
  String? filenameMeansId;
  File? imageCAC;
  String? filenameCAC;
  File? imageTIN;
  String? filenameTIN;
  File? imagePharmLicense;
  String? filenamePharmLicense;
  List<Document> kycDocumentsList = [];
  int v = 1;

  int pageAll = 1;
  int pageOngoing = 1;
  int pageCompleted = 1;
  int pageToday = 1;

  bool _onTempPinTap = false;
  bool get onTempPinTap => _onTempPinTap;
  bool isTapped = false;
  bool isPhoneValid = false;
  bool isLoadNoMore = false;
  bool onTapViewSingleReminder = false;

  bool isTappedCopyall = false;

  bool isCusSchedule = false;
  List<bool> isCusScheduleUpdate = [];

  bool _updateControllersInitialized = false;

  bool get updateControllersInitialized => _updateControllersInitialized;

  int calculationForTotalReminderForEmail = 0;
  int calculationForTotalReminderForPhone = 0;
  // int? calculationForTotalReminderPerDay;

  List<int> intList = [];
  List<int> intListCustom = [];

  GlobalKey<FormState> formKeyEmailReminder = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPhoneReminder = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyCreateAddPhoneReminder = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyFundWallet = GlobalKey<FormState>();

  DateFormat inputFormat = DateFormat("dd MMM, yyyy");
  DateTime? dateTimeObject;
  List<String> selectedTimes = []; // ["09:30 AM", "10:30 AM"]
  List<String> selectedCustomTimes = []; // ["09:30 AM", "10:30 AM"]

  File? image;
  String? searchUsers = '';
  String? searchRoles = '';
  String? searchuserByPharm = '';
  String? searchuserByPharmReminder = '';
  String? imageReminderUpdate;
  String? filename;
  int _start = 60;
  String querySignUpCountry = '';
  String queryState = '';
  String queryLga = '';
  String errorUser = '';
  List services = [
    'Sell Medications',
    'Bulk Purchase',
    'Order Fulfilment',
    'Appointment Scheduling',
    'Setup Reminders for Customers',
  ];

  List meansId = [
    'NIN',
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

  var vdelete;
  var vdeactivate;
  String vdeleteErrorMessage = '';
  String vdeactivateErrorMessage = '';
  final List<int> selectedIndexes = [];
  List<String>? formattedSelectedTimeAndPeriodList = [];

  Map<int, String?> selectedTimePerDay = {};
  Map<int, int?> selectedDoseIndexPerDay = {};
  Map<int, List<String>> timesPerDay = {};

  String? pickedEndDate;

  int? globalTimeIndex;
  int? returnNoDays;
  DateTime? pickedDatedStart;
  String? pickedDatedStartString;

  getTimeFreq() => formattedSelectedTimeAndPeriod ?? '--:--';

  getTimeFreqIndex(index) => formatSelectedTimeAndPeriodList![index];

  getTimeFreqCustom(int day) => selectedTimePerDay[day] ?? '--:--';

  Future<void> selectTimeFreq({
    BuildContext? context,
    PharmViewModel? model,
  }) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context!,
      initialTime: TimeOfDay.now(),
    );

    if (model!.globalTimeIndex != null) {
      model.formattedSelectedTimeAndPeriodList![model.globalTimeIndex!] =
          formatTimeFreq(pickedTime!);
      formattedSelectedTimeAndPeriod = formatTimeFreq(pickedTime);
    } else {
      if (pickedTime != null) {
        formattedSelectedTimeAndPeriod = formatTimeFreq(pickedTime);
      }
    }
    globalTimeIndex = null;
    model.notifyListeners();
  }

  Future<void> selectTimeFreqIndex({
    BuildContext? context,
    StateSetter? setModalState,
    int? index,
  }) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context!,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      formattedSelectedTimeAndPeriod = formatTimeFreq(pickedTime);
    }
    setModalState!(() {});
    notifyListeners();
  }

  Future<void> selectTimeFreqCustom({
    BuildContext? context,
    int? dayIndex,
    StateSetter? setModalState,
    PharmViewModel? model,
  }) async {
    if (context == null || dayIndex == null || model == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    final formatted = formatTimeFreq(pickedTime);

    // Ensure list exists
    model.timesPerDay[dayIndex] ??= [];

    final times = model.timesPerDay[dayIndex]!;

    // Safe previous selected time
    final prevTime = selectedTimePerDay[dayIndex];

    if (prevTime != null) {
      final existingIndex = times.indexOf(prevTime);

      if (existingIndex != -1) {
        // ✅ UPDATE existing
        times[existingIndex] = formatted;
        print('Updated time at index $existingIndex');
      } else {
        // ✅ Add new
        if (!times.contains(formatted)) times.add(formatted);
      }
    } else {
      // First time adding
      if (!times.contains(formatted)) times.add(formatted);
    }

    // Update selected map
    selectedTimePerDay[dayIndex] = formatted;

    model.setSelectedTimeForDay(dayIndex, formatted);
    model.notifyListeners();
    setModalState?.call(() {});
  }

  Future<void> selectTimeFreqCustomUpdate({
    required BuildContext context,
    required PharmViewModel model,
    required int medicationIndex,
    required int dayIndex, // 0-based
    int? doseIndex, // null = add, not null = update
    required StateSetter setModalState,
  }) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    final formatted = formatTimeFreq(pickedTime);

    final raw = model.startDateUpdateControllers[medicationIndex].text;
    final clean = raw.replaceAll(RegExp(r'\s+'), ' ').trim();

    final startDate = DateFormat('dd MMM, yyyy').parse(clean);
    final currentDate = startDate.add(Duration(days: dayIndex));

    final combined = combineDateAndTime(date: currentDate, time: formatted);

    final newDose = {
      "time": formatted,
      "date": DateFormat('yyyy-MM-dd').format(currentDate),
      "isoDate": combined.toUtc().toIso8601String(),
    };

    final doses =
        model.medicationClassList[medicationIndex].dosageMap[dayIndex]['doses'];

    /// ✅ UPDATE
    if (doseIndex != null && doseIndex < doses.length) {
      doses[doseIndex] = newDose;
    }
    /// ✅ ADD
    else {
      final exists = doses.any((e) => e['time'] == formatted);
      if (!exists) {
        doses.add(newDose);
      }
    }

    /// update selection state
    model.selectedTimePerDay[dayIndex] = formatted;
    model.selectedDoseIndexPerDay[dayIndex] = doseIndex;

    model.notifyListeners();
    setModalState(() {});
  }

  String formatTimeFreq(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String formatTimeFreqIndex(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String getReturnDurationNumberOfDays(returnNoDay) {
    if (returnNoDay! > 1) {
      return '$returnNoDay Days';
    } else {
      return '$returnNoDay Day';
    }
  }

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

  calculateDaysLeft() {
    if (getReminderByIdModel!.data!.medication!.endDateTime!
                .difference(
                  getReminderByIdModel!.data!.medication!.startDateTime!,
                )
                .inDays +
            1 <
        1) {
      return 0;
    } else {
      return getReminderByIdModel!.data!.medication!.endDateTime!
              .difference(
                getReminderByIdModel!.data!.medication!.startDateTime!,
              )
              .inDays +
          1;
    }
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
                              text: "${v.time}",
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

  bool isOnToggleTempPinTap() {
    _onTempPinTap = !_onTempPinTap;
    notifyListeners();
    return _onTempPinTap;
  }

  void pickImage(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          image = file;
          filename = image!.path.split("/").last;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(image).readAsBytesSync(),
              filename: image!.path.split("/").last,
            ),
          );
          updatePharmacy(
            context,
            update: UpdatePharmacyProfileEntityModel(
              logo: Logo(
                width: _uploadImageResponseModel!.data!.width,
                height: _uploadImageResponseModel!.data!.height,
                format: _uploadImageResponseModel!.data!.format,
                url: _uploadImageResponseModel!.data!.url!,
                mimeType: _uploadImageResponseModel!.data!.mimeType,
                size: _uploadImageResponseModel!.data!.size,
              ),
            ),
          );

          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
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
                builder: (_, PharmViewModel model, _) {
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
                builder: (_, PharmViewModel model, _) {
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
                builder: (_, PharmViewModel model, _) {
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
              return ViewModelBuilder<PharmViewModel>.reactive(
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

  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('+234')) {
      return phoneNumber.replaceFirst('+234', '0');
    }
    if (!phoneNumber.startsWith('0')) {
      return '0$phoneNumber';
    }
    return phoneNumber; // return unchanged if it doesn't start with +234
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

  returnChannelIconHeight(text) {
    if (text == 'SMS (₦150.00)') {
      return 24.0.h;
    }
    if (text == 'Email (Free)') {
      return 13.8.h;
    }
    return 17.8.h;
  }

  returnChannelIconWidth(text) {
    if (text == 'SMS (₦150.00)') {
      return 24.0.w;
    }
    if (text == 'Email (Free)') {
      return 10.8.w;
    }
    return 18.w;
  }

  Widget chooseNotChannelWidget(
    context, {
    required String text,
    String? svgIcon,
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
          svgIcon == null
              ? SizedBox.shrink()
              : SvgPicture.asset(
                  svgIcon,
                  height: returnChannelIconHeight(text),
                  width: returnChannelIconWidth(text),
                  color: AppColors.infoGrey,
                ),
          SizedBox(width: svgIcon == null ? 6.w : 10.w),
          TextView(
            text: text,
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15.22.sp,
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

  Future<void> addRoles(
    BuildContext context, {
    RolesEntityModel? roleEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.addRole(roleEntity!),
        throwException: true,
      );
      _isLoading = false;

      await AppUtils.snackbar(context, message: v['message']);
      rolenameController.clear();
      roleDescriptionController.clear();
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  bool checkIfOnlyRoleIsOwner() {
    checkOwnerRole = getCreatedUserResponseModel!.data!.staff!;
    String searchValue = "OWNER";

    if (checkOwnerRole.every((item) => item.role!.name == searchValue)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addUsers(context, {CreateUserEntityModel? createEntity}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.addUser(createEntity!),
        throwException: true,
      );
      _isLoading = false;

      await AppUtils.snackbar(context, message: v['message']);
      nameController.clear();
      lastNameController.clear();
      userPhoneController.clear();
      userEmailController.clear();
      userAddressController.clear();
      userGenderController.clear();
      userRoleController.clear();
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
      AppUtils.snackbar(context, message: 'Please try again.', error: true);
    }
    notifyListeners();
  }

  Future<void> getUser(context) async {
    try {
      _isLoading = true;
      _getCreatedUserResponseModel = await runBusyFuture(
        repositoryImply.getUsers(),
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

  Future<void> updateRole(context, {UpdateRoleEntityModel? updateRole}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateRoles(updateRole!),
        throwException: true,
      );
      _isLoading = false;
      await AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateUser(context, {UpdateUserEntityModel? updateUser}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateUser(updateUser!),
        throwException: true,
      );
      _isLoading = false;
      await AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      _isLoading = false;
      errorUser = e.toString();
      logger.d(e);
    }
    notifyListeners();
    // return error;
  }

  Future<void> deleteRole(BuildContext context, {String? roleId}) async {
    try {
      _isLoading = true;
      vdelete = await runBusyFuture(
        repositoryImply.deleteRole(roleId!),
        throwException: true,
      );
      _isLoading = false;
      await AppUtils.snackbar(context, message: vdelete['message']);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      vdeleteErrorMessage = e.toString();
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deactivateUser(context, {String? id}) async {
    try {
      _isLoading = true;
      vdeactivate = await runBusyFuture(
        repositoryImply.deleteUser(id!),
        throwException: true,
      );

      _isLoading = false;
      await AppUtils.snackbar(context, message: vdeactivate['message']);
      Navigator.pop(context);
      getUser(context);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      vdeactivateErrorMessage = e.toString();
      // AppUtils.snackbar(context, message: e.toString(), error: true);
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
        getPharmacyKyc(context);
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
      getTenant(context);
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
          builder: (_, PharmViewModel model, _) {
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

  Future<bool?> modalBottomSheetMenuAddUser({
    context,
    bool isEdit = false,
    firstName,
    lastName,
    phone,
    email,
    address,
    gender,
    role,
    roleId,
    pin,
    membershipId,
    country,
    state,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return AddUserModalWidget(
          parentContext: context,
          isEdit: isEdit,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          email: email,
          address: address,
          gender: gender,
          role: role,
          roleId: roleId,
          membershipId: membershipId,
          country: country,
          state: state,
          onSuccess: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop(true);
              }
            });
            // Navigator.of(context).pop(true);
            // close modal and return true
          },
        );
      },
    );
  }

  String getFirstWord(String fullName) {
    return fullName.trim().split(' ').first;
  }

  String getSecondWord(String fullName) {
    return fullName.trim().split(' ').last;
  }

  Future<bool?> showRemoveUserDialog(
    BuildContext context, {
    String? id,
    String? userName,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        return DeactivateUserModalWidget(
          onSuccess: () {
            Navigator.of(context).pop(true);
          },
          onFailed: () {
            Navigator.of(context).pop(false);
          },
          parentContext: context,
          userId: id,
          userName: userName,
        );
      },
    );
  }

  String formatTime(String timeString) {
    DateTime dateTime = DateFormat("HH:mm").parse(timeString);
    return DateFormat("hh:mm a").format(dateTime);
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

  Future<void> selectDate({
    BuildContext? context,
    StateSetter? setModalState,
    PharmViewModel? model,
  }) async {
    pickedDatedStart = await showDatePicker(
      context: context!,
      initialDate: DateTime.now(), // The date initially displayed
      firstDate: DateTime.now(), // The earliest selectable date
      lastDate: DateTime(2101), // The latest selectable date
    );
    pickedDatedStartString = pickedDatedStart.toString();

    if (pickedDatedStart != null) {
      pickedDate = DateFormat('dd MMM, yyyy').format(pickedDatedStart!);
      dateTimeController.text = pickedDate!;
      startDateIso = DateTime.utc(
        pickedDatedStart!.year,
        pickedDatedStart!.month,
        pickedDatedStart!.day,
      ).toIso8601String();
      _calculateEndDate(setModalState: setModalState, model: model);
    }
    setModalState!(() {});
    notifyListeners();
  }

  Future<void> _calculateEndDate({
    StateSetter? setModalState,
    PharmViewModel? model,
  }) async {
    if (model!.pickedDatedStart != null &&
        model.medDurationController.text.isNotEmpty) {
      final days = int.tryParse(model.medDurationController.text) ?? 0;

      // ✅ Calculate directly
      final endDate = model.pickedDatedStart!.add(Duration(days: days - 1));

      // ✅ Store DateTime (recommended)
      model.pickedEndDate = endDate.toString();

      // ✅ Format ONLY for UI
      model.endDateController.text = DateFormat('dd MMM, yyyy').format(endDate);

      // ✅ Convert to ISO (no need for parse again)
      model.endDateIso = DateTime.utc(
        endDate.year,
        endDate.month,
        endDate.day,
      ).toIso8601String();

      model.returnNoDays = days;

      await Future.delayed(const Duration(seconds: 1));

      model.intListCustom = List.generate(
        model.returnNoDays!,
        (index) => index,
      );

      setModalState?.call(() {});
      notifyListeners();
    }
  }

  Future<void> _calculateEndDateUpdate({
    StateSetter? setModalState,
    PharmViewModel? model,
    int? index,
  }) async {
    if (model!.startDateUpdateControllers[index!].text.isNotEmpty &&
        model.durationUpdateControllers[index].text.isNotEmpty) {
      final days =
          int.tryParse(model.durationUpdateControllers[index].text) ?? 0;

      // ✅ FIXED parsing
      final startDate = DateFormat(
        'dd MMM, yyyy',
      ).parse(model.startDateUpdateControllers[index].text);

      final endDate = startDate.add(Duration(days: days - 1));

      // ✅ Format for UI
      model.endDateUpdateController[index].text = DateFormat(
        'dd MMM, yyyy',
      ).format(endDate);

      // ✅ ISO
      model.endDateIso = DateTime.utc(
        endDate.year,
        endDate.month,
        endDate.day,
      ).toIso8601String();

      // model.returnNoDays = days;
      model.medicationClassList[index].duration = days.toString();

      model.numberOfDurationsInDaysList![index] = getReturnDurationNumberOfDays(
        days,
      );

      await Future.delayed(const Duration(seconds: 1));

      model.intListCustom = List.generate(days, (i) => i);
      setModalState?.call(() {});
      notifyListeners();
    }
  }

  Future<void> selectEndDate({
    BuildContext? context,
    StateSetter? setModalState,
  }) async {
    if (pickedDatedStart == null) return;
    // final DateTime nextDay = pickedDatedStart!.add(const Duration(days: 1));
    final DateTime nextDay = pickedDatedStart!;

    final DateTime? pickedDated = await showDatePicker(
      context: context!,
      initialDate: nextDay,
      firstDate: nextDay,
      lastDate: DateTime(2101),
    );

    if (pickedDated != null) {
      pickedEndDate = DateFormat('dd MMM, yyyy').format(pickedDated);
      returnNoDays = pickedDated.difference(pickedDatedStart!).inDays + 1;
      numberOfDurationsInDays = getReturnDurationNumberOfDays(returnNoDays);
      endDateController.text = pickedEndDate!;
      final localDate = DateFormat('dd MMM, yyyy').parse(pickedEndDate!);

      final utcDate = DateTime.utc(
        localDate.year,
        localDate.month,
        localDate.day,
      );
      endDateIso = utcDate.toIso8601String();
      await Future.delayed(Duration(seconds: 1));
      intListCustom = List.generate(returnNoDays!, (index) => index);
    }
    setModalState!(() {});
    notifyListeners();
  }

  Future<void> selectEndDateUpdate({
    BuildContext? context,
    StateSetter? setModalState,
    int? index,
    PharmViewModel? model,
  }) async {
    if (pickedDate == null) return;
    // final DateTime nextDay = pickedDate!.add(const Duration(days: 1));
    final parsed = DateFormat('dd MMM, yyyy').parse(pickedDate!);

    // Create the date directly in UTC (no timezone shift)
    final utcDate = DateTime.utc(parsed.year, parsed.month, parsed.day);
    final DateTime nextDay = DateTime.parse(utcDate.toIso8601String());
    final DateTime? pickedDated = await showDatePicker(
      context: context!,
      initialDate: nextDay,
      firstDate: nextDay,
      lastDate: DateTime(2101),
    );

    if (pickedDated != null) {
      pickedEndDate = DateFormat('dd MMM, yyyy').format(pickedDated);
      final parsed = DateFormat(
        'dd MMM, yyyy',
      ).parse(model!.startDateUpdateControllers[index!].text);
      final parsedEnd = DateFormat('dd MMM, yyyy').parse(pickedEndDate!);

      // Create midnight UTC using only the date
      final utcDateStart = DateTime.utc(parsed.year, parsed.month, parsed.day);
      final utcDateEnd = DateTime.utc(
        parsedEnd.year,
        parsedEnd.month,
        parsedEnd.day,
      );
      returnNoDays =
          DateTime.parse(
            utcDateEnd.toIso8601String(),
          ).difference(DateTime.parse(utcDateStart.toIso8601String())).inDays +
          1;
      model.medicationClassList[index].duration = returnNoDays.toString();

      model.numberOfDurationsInDaysList![index] = getReturnDurationNumberOfDays(
        returnNoDays,
      );

      model.endDateUpdateController[index].text = pickedEndDate!;
      model.medicationClassList[index].endDate = pickedEndDate!;
      final localDate = DateFormat('dd MMM, yyyy').parse(pickedEndDate!);

      final utcDate = DateTime.utc(
        localDate.year,
        localDate.month,
        localDate.day,
      );
      endDateIso = utcDate.toIso8601String();
      await Future.delayed(Duration(seconds: 1));
      intListCustom = List.generate(returnNoDays!, (index) => index);
    }
    setModalState!(() {});
    model!.notifyListeners();
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
              file: ph.File(
                width: _uploadImageResponseModelMeansID!.data!.width,
                height: _uploadImageResponseModelMeansID!.data!.height,
                format: _uploadImageResponseModelMeansID!.data!.format,
                url: _uploadImageResponseModelMeansID!.data!.url!,
                mimeType: _uploadImageResponseModelMeansID!.data!.mimeType,
                size: _uploadImageResponseModelMeansID!.data!.size,
              ),
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
              file: ph.File(
                width: _uploadImageResponseModelCAC!.data!.width,
                height: _uploadImageResponseModelCAC!.data!.height,
                format: _uploadImageResponseModelCAC!.data!.format,
                url: _uploadImageResponseModelCAC!.data!.url!,
                mimeType: _uploadImageResponseModelCAC!.data!.mimeType,
                size: _uploadImageResponseModelCAC!.data!.size,
              ),
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
              file: ph.File(
                width: _uploadImageResponseModelPharmLicense!.data!.width,
                height: _uploadImageResponseModelPharmLicense!.data!.height,
                format: _uploadImageResponseModelPharmLicense!.data!.format,
                url: _uploadImageResponseModelPharmLicense!.data!.url!,
                mimeType: _uploadImageResponseModelPharmLicense!.data!.mimeType,
                size: _uploadImageResponseModelPharmLicense!.data!.size,
              ),
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
              file: ph.File(
                width: _uploadImageResponseModelTIN!.data!.width,
                height: _uploadImageResponseModelTIN!.data!.height,
                format: _uploadImageResponseModelTIN!.data!.format,
                url: _uploadImageResponseModelTIN!.data!.url!,
                mimeType: _uploadImageResponseModelTIN!.data!.mimeType,
                size: _uploadImageResponseModelTIN!.data!.size,
              ),
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

  Future<void> uploadImageReminder({context, MultipartFile? file}) async {
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

  String getStringFrLabel(String i) {
    if (i == '') {
      return '';
    }
    if (int.parse(i) > 1) {
      return '$i tablets';
    }
    return '$i tablet';
  }

  String modalName() {
    if (linIndex == 2) {
      return 'Preview Medication';
    } else if (linIndex == 3) {
      return 'Make Payment';
    }
    // else if (linIndex == 4) {
    //   return 'Make Payment';
    // }
    return 'Add Medication';
  }

  void pickDrugUpdateImage({BuildContext? context, index}) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          medicationClassList[index].medicationFile = file;
          drugFilename = medicationClassList[index].medicationFile!.path
              .split("/")
              .last;
          await uploadImageReminder(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(
                medicationClassList[index].medicationFile,
              ).readAsBytesSync(),
              filename: medicationClassList[index].medicationFile!.path
                  .split("/")
                  .last,
            ),
          );
          medicationClassList[index].imageData =
              _uploadImageReminderResponseModel!.data;
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  Future<String?> showDailyInTakeMenu({
    BuildContext? context,
    StateSetter? setModalState,
    PharmViewModel? model,
  }) async {
    return await showModalBottomSheet<String>(
      context: context!,
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
                      text: 'Frequency',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    ...indexDailyList!.map(
                      (e) => GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            indexDaily = e;
                            model!.isCusSchedule = false;
                            setModalState!(() {});
                            model.notifyListeners();
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, indexDaily.toString());
                          });
                          print('iiiiiiiiiiii::: ${model!.isCusSchedule} ');
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: indexDaily == e
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: indexDaily == e
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              TextView(
                                text: showNoTimesMode(e),
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (indexDaily == e)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setMenuState(() {
                          model.isCusSchedule = true;
                          indexDaily = 5;
                          medDailyInTakenController.text = 'Custom Schedule';
                          setModalState!(() {});
                          model.notifyListeners();
                        });

                        Future.delayed(Duration(milliseconds: 200), () {
                          Navigator.pop(ctx, indexDaily.toString());
                        });
                        print(
                          'isCusScheduleisCusScheduleisCusSchedule::: ${model.isCusSchedule} ',
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.w),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.w,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: model!.isCusSchedule
                              ? AppColors.skyBlue
                              : AppColors.white,
                          border: Border.all(
                            color: model.isCusSchedule
                                ? AppColors.primary1
                                : Colors.transparent,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.lightBlue,
                              size: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                            TextView(
                              text: 'Custom Schedule',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.60.sp,
                                color: AppColors.lightBlue,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            if (model.isCusSchedule)
                              Icon(
                                Icons.check,
                                color: AppColors.primary1,
                                size: 15.60.sp,
                              ),
                          ],
                        ),
                      ),
                    ),

                    // for (int i = 1; i < 6; i++)
                    //   GestureDetector(
                    //     onTap: () {
                    //       setMenuState(() {
                    //         indexDaily = i;
                    //       });

                    //       Future.delayed(Duration(milliseconds: 200), () {
                    //         Navigator.pop(ctx, indexDaily.toString());
                    //       });
                    //     },
                    //     child: Container(
                    //       margin: EdgeInsets.only(bottom: 12.w),
                    //       padding: EdgeInsets.symmetric(
                    //         vertical: 12.w,
                    //         horizontal: 12.w,
                    //       ),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         color: indexDaily == i
                    //             ? AppColors.skyBlue
                    //             : AppColors.white,
                    //         border: Border.all(
                    //           color: indexDaily == i
                    //               ? AppColors.primary1
                    //               : Colors.transparent,
                    //         ),
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           TextView(
                    //             text: i.toString(),
                    //             textStyle: TextStyle(
                    //               fontFamily: 'Arial',
                    //               fontSize: 16.60.sp,
                    //               color: AppColors.black,
                    //               fontWeight: FontWeight.w400,
                    //             ),
                    //           ),
                    //           const Spacer(),
                    //           if (indexDaily == i)
                    //             Icon(
                    //               Icons.check,
                    //               color: AppColors.primary1,
                    //               size: 15.60.sp,
                    //             ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<String?> showDailyInTakeMenuUpdate({
    BuildContext? context,
    StateSetter? setModalState,
    PharmViewModel? model,
    int? index,
  }) async {
    return await showModalBottomSheet<String>(
      context: context!,
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
                      text: 'Frequency',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    ...indexDailyList!.map(
                      (e) => GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            indexDaily = e;
                            setModalState!(() {});
                            model!.notifyListeners();
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
                            color: indexDaily == e
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: indexDaily == e
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              TextView(
                                text: showNoTimesMode(e),
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (indexDaily == e)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setMenuState(() {
                          indexDaily = 0;
                          setModalState!(() {});
                          model!.notifyListeners();
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
                          color: indexDaily == 0
                              ? AppColors.skyBlue
                              : AppColors.white,
                          border: Border.all(
                            color: indexDaily == 0
                                ? AppColors.primary1
                                : Colors.transparent,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.lightBlue,
                              size: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                            TextView(
                              text: 'Custom Schedule',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.60.sp,
                                color: AppColors.lightBlue,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            if (indexDaily == 0)
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

  addReminderToList({
    PharmViewModel? model,
    StateSetter? setModalState,
    BuildContext? context,
  }) async {
    List<Map<String, dynamic>> addTimePeriod = [];
    String startDateIsoWithin = startDateIso;
    _isLoading = true;
    model!.notifyListeners();

    if (model.isCusSchedule) {
      for (int day = 0; day < model.returnNoDays!; day++) {
        List<Map<String, String>> dayDoses = [];
        for (int i = 0; i < model.timesPerDay[day]!.length; i++) {
          dayDoses.add({
            'time': model.timesPerDay[day]![i],
            'date': startDateIsoWithin.substring(0, 10),
            'isoDate': startDateIsoWithin,
          });
        }
        startDateIsoWithin = DateTime.parse(
          startDateIsoWithin,
        ).add(Duration(days: 0 + 1)).toString();

        addTimePeriod.add({
          'day': day + 1, // so Day 1, Day 2, etc.
          'doses': dayDoses,
        });
      }
    } else {
      for (int day = 0; day < model.returnNoDays!; day++) {
        List<Map<String, String>> dayDoses = [];
        for (int i = 0; i < formattedSelectedTimeAndPeriodList!.length; i++) {
          dayDoses.add({
            'time': formattedSelectedTimeAndPeriodList![i],
            'date': startDateIsoWithin.substring(0, 10),
            'isoDate': startDateIsoWithin,
          });
        }
        startDateIsoWithin = DateTime.parse(
          startDateIsoWithin,
        ).add(Duration(days: 0 + 1)).toString();

        addTimePeriod.add({
          'day': day + 1, // so Day 1, Day 2, etc.
          'doses': dayDoses,
        });
      }
    }

    await Future.delayed(Duration(seconds: 1), () {});
    model.medicationClassList.add(
      MedicationClass(
        medicationName: model.medNameController.text,
        medicationType: model.medTypeController.text,
        medicationTypeIcon: model.medTypeResultImage,
        medicationFile: model.imageDrug,
        dosage: medDosageController.text,
        imageData: model.uploadImageReminderResponseModel?.data ?? phImg.Data(),
        dateAndTime: model.dateTimeController.text,
        duration: returnNoDays.toString(),
        endDate: endDateController.text,
        isCusSchedule: model.isCusSchedule,
        startDateIso: DateTime.parse(startDateIso),
        endDateIso: DateTime.parse(endDateIso),
        timesToTake: medDailyInTakenController.text,
        note: model.noteController.text,
        dosageMap: addTimePeriod,
      ),
    );
    await Future.delayed(Duration(seconds: 1), () {});
    model.markUpdateControllersInitializedFalse();
    clearReminderMedsVaraibles(model);
    _isLoading = false;
    model.notifyListeners();
    AppUtils.snackbar(context, message: 'Medication has been added.');
    setModalState!(() {});
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
    returnNoDays = null;
    isTappedCopyall = false;
    model.intListCustom.clear();
    model.timesPerDay!.clear();
    model.formattedSelectedTimeAndPeriod = '--:--';
    model.formatSelectedTimeAndPeriodList.clear();
    model.formattedSelectedTimeAndPeriodList!.clear();
    model.numberOfDurationsInDays = '';
    noteController.clear();
  }

  errorRemidnderImage(medType) {
    if (medType == 'TABLET') {
      return AppImage.tablet;
    }
    if (medType == 'CAPSULE') {
      return AppImage.pills;
    }
    if (medType == 'SYRUP') {
      return AppImage.syrup;
    }
    if (medType == 'INJECTION') {
      return AppImage.syringe;
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

    if (isReminderStatus == 'all' && reminders.isNotEmpty) return true;
    if (isReminderStatus == 'ongoing' && reminders.isNotEmpty) return true;
    if (isReminderStatus == 'completed' && reminders.isNotEmpty) return true;
    if (isReminderStatus == 'today' && reminders.isNotEmpty) return true;

    return false;
  }

  void markUpdateControllersInitialized() =>
      _updateControllersInitialized = true;

  void markUpdateControllersInitializedFalse() =>
      _updateControllersInitialized = false;

  void initUpdateControllers({setModalState, model}) async {
    if (model.updateControllersInitialized ||
        model.medicationClassList.isEmpty) {
      return; // ✅ RUNS ONLY ONCE
    }
    model.markUpdateControllersInitialized();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setModalState(() {
        model.medicationNameUpdateControllers = model.medicationClassList
            .map<TextEditingController>(
              (e) => TextEditingController(text: e.medicationName),
            )
            .toList();
        model.medNameUpdateFocusNodes.add(FocusNode());
        model.numberOfDurationsInDaysList = model.medicationClassList
            .map(
              (e) => getReturnDurationNumberOfDays(
                int.parse(e.duration.toString().substring(0, 1)),
              ),
            )
            .toList();
        model.timesToTakeUpdateController = model.medicationClassList
            .map<TextEditingController>(
              (e) => TextEditingController(text: e.timesToTake),
            )
            .toList();
        model.timesToTakeUpdateFocusNodes.add(FocusNode());
        model.medTypeUpdateControllers = model.medicationClassList
            .map<TextEditingController>(
              (e) => TextEditingController(text: e.medicationType),
            )
            .toList();
        model.medTypeUpdateIcon = model.medicationClassList
            .map((e) => e.medicationTypeIcon!)
            .toList();
        model.dosageUpdateControllers = model.medicationClassList
            .map<TextEditingController>(
              (e) => TextEditingController(text: e.dosage),
            )
            .toList();
        model.startDateUpdateControllers = model.medicationClassList
            .map<TextEditingController>(
              (e) => TextEditingController(text: e.dateAndTime),
            )
            .toList();
        model.durationUpdateControllers = model.medicationClassList
            .map<TextEditingController>(
              (e) => TextEditingController(text: e.duration.toString()),
            )
            .toList();
        model.endDateUpdateController = model.medicationClassList
            .map<TextEditingController>(
              (e) => TextEditingController(text: e.endDate),
            )
            .toList();
        model.noteUpdateController = model.medicationClassList
            .map<TextEditingController>(
              (e) => TextEditingController(text: e.note),
            )
            .toList();
        model.noteUpdateFocusNodes.add(FocusNode());
        model.medicationFileUpdate = model.medicationClassList
            .map((e) => e.medicationFile ?? File(''))
            .toList();
        model.isCusScheduleUpdate = model.medicationClassList.map<bool>((e) {
          final v = e.isCusSchedule;

          if (v is bool) return v;
          if (v is String) return v.toLowerCase() == 'true';
          if (v is int) return v == 1;

          return false;
        }).toList();
      });

      // for (var med in model.medicationClassList) {
      //   final dosageMap = med.dosageMap ?? [];

      //   // Map through the day-level list
      //   final controllersPerDay = dosageMap.map<List<TextEditingController>>((
      //     dayItem,
      //   ) {
      //     final doses = (dayItem['doses'] ?? []) as List;

      //     // Create controllers for each dose
      //     final doseControllers = doses.map<TextEditingController>((dose) {
      //       final timeValue = dose['time']?.toString() ?? '';
      //       return TextEditingController(text: timeValue);
      //     }).toList();

      //     return doseControllers;
      //   }).toList();

      //   doseAfterControllers =
      //       controllersPerDay; // assign per medication if you're looping
      //   // If you want to store for multiple meds: use a parent list like List<List<List<TextEditingController>>>>
      // }

      model.notifyListeners();
    });
  }

  dosageTypeList({type, setMenuState, ctx, model}) {
    if (type == 'Tablet') {
      return Column(
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

          ...tabletDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.medDosageController.text = e;
                  model.notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, e.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.medDosageController.text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.medDosageController.text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.medDosageController.text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.medDosageController.text = 'custom';
                index = 0;
                notifyListeners();
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.medDosageController.text == 'custom'
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.medDosageController.text == 'custom'
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),

                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.medDosageController.text == 'custom')
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
      );
    }
    if (type == 'Syrup') {
      return Column(
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
          ...syrupDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.medDosageController.text = e;
                  notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.medDosageController.text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.medDosageController.text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.medDosageController.text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.medDosageController.text = '';
                notifyListeners();
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.medDosageController.text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.medDosageController.text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),

                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.medDosageController.text == '')
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
      );
    }
    if (type == 'Injection') {
      return Column(
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

          ...injectionDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.medDosageController.text = e;
                  notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.medDosageController.text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.medDosageController.text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.medDosageController.text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.medDosageController.text = '';
                notifyListeners();
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.medDosageController.text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.medDosageController.text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),

                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.medDosageController.text == '')
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
      );
    }
    if (type == 'Ointment') {
      return Column(
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
          ...ointmentDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.medDosageController.text = e;
                  notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.medDosageController.text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.medDosageController.text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.medDosageController.text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.medDosageController.text = '';
                notifyListeners();
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.medDosageController.text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.medDosageController.text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),

                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.medDosageController.text == '')
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
      );
    }
    if (type == 'Inhaler') {
      return Column(
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
          ...inhalerDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.medDosageController.text = e;
                  model.notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.medDosageController.text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.medDosageController.text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.medDosageController.text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.medDosageController.text = '';
                notifyListeners();
              });
              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.medDosageController.text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.medDosageController.text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),
                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.medDosageController.text == '')
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
      );
    }
    if (type == 'Capsule') {
      return Column(
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
          ...capsuleDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.medDosageController.text = e;
                  model.notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.medDosageController.text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.medDosageController.text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.medDosageController.text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.medDosageController.text = '';
                notifyListeners();
              });
              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.medDosageController.text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.medDosageController.text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),
                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.medDosageController.text == '')
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
      );
    }
  }

  dosageTypeListUpdate({type, setMenuState, ctx, model, index}) {
    if (type == 'Tablet') {
      return Column(
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

          ...tabletDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.dosageUpdateControllers[index].text = e;
                  model.medicationClassList[index].dosage = e;
                  model.notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.dosageUpdateControllers[index].text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.dosageUpdateControllers[index].text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.dosageUpdateControllers[index].text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.dosageUpdateControllers[index].text = '';
                index = 0;
                notifyListeners();
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.dosageUpdateControllers[index].text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.dosageUpdateControllers[index].text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),

                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.dosageUpdateControllers[index].text == '')
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
      );
    }
    if (type == 'Syrup') {
      return Column(
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
          ...syrupDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.dosageUpdateControllers[index].text = e;
                  model.medicationClassList[index].dosage = e;
                  model.notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.dosageUpdateControllers[index].text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.dosageUpdateControllers[index].text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.dosageUpdateControllers[index].text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.dosageUpdateControllers[index].text = '';
                notifyListeners();
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.dosageUpdateControllers[index].text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.dosageUpdateControllers[index].text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),

                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.dosageUpdateControllers[index].text == '')
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
      );
    }
    if (type == 'Injection') {
      return Column(
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

          ...injectionDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.dosageUpdateControllers[index].text = e;
                  model.medicationClassList[index].dosage = e;
                  notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.dosageUpdateControllers[index].text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.dosageUpdateControllers[index].text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.dosageUpdateControllers[index].text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.dosageUpdateControllers[index].text = '';
                notifyListeners();
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.dosageUpdateControllers[index].text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.dosageUpdateControllers[index].text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),

                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.dosageUpdateControllers[index].text == '')
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
      );
    }
    if (type == 'Ointment') {
      return Column(
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
          ...ointmentDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.dosageUpdateControllers[index].text = e;
                  model.medicationClassList[index].dosage = e;
                  notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.dosageUpdateControllers[index].text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.dosageUpdateControllers[index].text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.dosageUpdateControllers[index].text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.dosageUpdateControllers[index].text = '';
                notifyListeners();
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.dosageUpdateControllers[index].text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.dosageUpdateControllers[index].text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),

                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.dosageUpdateControllers[index].text == '')
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
      );
    }
    if (type == 'Inhaler') {
      return Column(
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
          ...inhalerDosageList!.map(
            (e) => GestureDetector(
              onTap: () {
                setMenuState(() {
                  model.dosageUpdateControllers[index].text = e;
                  model.medicationClassList[index].dosage = e;
                  model.notifyListeners();
                });

                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, index.toString());
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.dosageUpdateControllers[index].text == e
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.dosageUpdateControllers[index].text == e
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.dosageUpdateControllers[index].text == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setMenuState(() {
                model.dosageUpdateControllers[index].text = '';
                notifyListeners();
              });
              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, index.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.dosageUpdateControllers[index].text == ''
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: model.dosageUpdateControllers[index].text == ''
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.lightBlue, size: 16.sp),
                  SizedBox(width: 4.w),
                  TextView(
                    text: 'Enter custom dosage',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (model.dosageUpdateControllers[index].text == '')
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
      );
    }
  }

  Future<String?> showMedDosageMenu({
    BuildContext? context,
    String? type,
    PharmViewModel? model,
  }) async {
    return await showModalBottomSheet<String>(
      context: context!,
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
                child: model!.dosageTypeList(
                  type: type!,
                  setMenuState: setMenuState,
                  ctx: ctx,
                  model: model,
                ),
              ),
            );
          },
        );
      },
    );
  }

  showMedDosageMenuUpdate({
    BuildContext? context,
    String? type,
    PharmViewModel? model,
    int? index,
  }) async {
    return showModalBottomSheet<String>(
      context: context!,
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
                child: model!.dosageTypeListUpdate(
                  type: type!,
                  setMenuState: setMenuState,
                  ctx: ctx,
                  model: model,
                  index: index,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showReminderModal(context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    constraints: BoxConstraints(maxWidth: double.infinity),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: DraggableScrollableSheet(
              initialChildSize: 0.88, // Initial height as percentage of screen
              minChildSize: 0.7, // Minimum height
              maxChildSize: 0.89, // Maximum height
              expand: false, // Set to true for full height initially
              builder:
                  (BuildContext context, ScrollController scrollController) {
                    return ViewModelBuilder<PharmViewModel>.reactive(
                      viewModelBuilder: () => locator<PharmViewModel>(),
                      onViewModelReady: (model) {
                        final defaultTime = DateTime(
                          0,
                          1,
                          1,
                          0,
                          0,
                        ); // hour=0, minute=0

                        formattedSelectedTimeAndPeriod = DateFormat(
                          'h:mm a',
                        ).format(defaultTime);
                      },
                      disposeViewModel: false,
                      onDispose: (viewModel) {},
                      builder: (_, PharmViewModel model, _) {
                        return setModalFlow(
                          model: model,
                          context: context,
                          setModalState: setModalState,
                          scrollController: scrollController,
                        );
                      },
                    );
                  },
            ),
          );
        },
      );
    },
  );

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
                    }),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  paymentWidget({
    context,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10.w),
                    ViewModelBuilder<PharmViewModel>.reactive(
                      viewModelBuilder: () => PharmViewModel(),
                      onViewModelReady: (model) {
                        model.getWalletBalance(context);
                      },
                      disposeViewModel: false,
                      builder: (_, PharmViewModel model, _) {
                        return SizedBox(
                          width: 90.w,
                          child: TextView(
                            text: formatNaira(
                              int.parse(
                                model
                                        .getWalletBalanceResponseModel
                                        ?.data
                                        ?.balance ??
                                    "0",
                              ),
                            ),
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.infoGrey,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 12.w),
                    GestureDetector(
                      onTap: () => fundPaymentWallet(context),
                      child: TextView(
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
                    ),
                  ],
                ),
        ],
      ),
    ),
  );

  void initDayTimes(List<int> days) {
    for (final day in days) {
      selectedTimePerDay.putIfAbsent(day, () => null);
      timesPerDay.putIfAbsent(day, () => []);
    }
  }

  returnTotalDays(model) {
    if (model.medicationClassList.isEmpty) {
      totalDuration =
          _getReminderByIdModel?.data?.medication?.durationInDays ?? 0;
    } else {
      totalDuration = model.medicationClassList.fold(
        0,
        (sum, item) => sum! + int.parse(item.duration!.substring(0, 1)),
      );
    }

    return totalDuration;
  }

  // setNoOfTimesWithDurationUpdate(index) {
  //   if (medicationClassList[index].timesToTake!.isNotEmpty) {
  //     final timesCount =
  //         int.tryParse(medicationClassList[index].timesToTake.toString()) ?? 0;
  //     final durationCount =
  //         int.tryParse(
  //           medicationClassList[index].duration?.toString() ?? '0',
  //         ) ??
  //         0;
  //     // 🔹 Get the old data before rebuilding
  //     final oldControllers = List<List<TextEditingController>>.from(
  //       doseAfterControllers,
  //     );
  //     final oldPeriods = List<List<String>>.from(periodAfterLabels);
  //     // 🔹 Rebuild dosageMap safely (preserve where possible)
  //     medicationClassList[index].dosageMap = List.generate(durationCount, (
  //       day,
  //     ) {
  //       final oldDay = (day < medicationClassList[index].dosageMap.length)
  //           ? medicationClassList[index].dosageMap[day]
  //           : null;
  //       final oldDoses = oldDay != null
  //           ? List<Map<String, dynamic>>.from(oldDay['doses'])
  //           : [];
  //       return {
  //         "day": day + 1,
  //         "doses": List.generate(timesCount, (doseIndex) {
  //           if (doseIndex < oldDoses.length) {
  //             // preserve previous time + period if available
  //             return {
  //               "time": oldDoses[doseIndex]["time"] ?? "",
  //               "period": oldDoses[doseIndex]["period"] ?? "",
  //               "date": oldDoses[doseIndex]["date"] ?? "",
  //               "isoDate": oldDoses[doseIndex]["isoDate"] ?? "",
  //             };
  //           }
  //           // otherwise new empty slot
  //           return {"time": "", "period": "", "date": "", "isoDate": ""};
  //         }),
  //       };
  //     });

  //     // 🔹 Rebuild controllers but preserve existing values
  //     doseAfterControllers = List.generate(durationCount, (dayIndex) {
  //       return List.generate(timesCount, (doseIndex) {
  //         if (dayIndex < oldControllers.length &&
  //             doseIndex < oldControllers[dayIndex].length) {
  //           return oldControllers[dayIndex][doseIndex];
  //         } else {
  //           return TextEditingController(
  //             text:
  //                 medicationClassList[index]
  //                     .dosageMap[dayIndex]["doses"][doseIndex]["time"] ??
  //                 "",
  //           );
  //         }
  //       });
  //     });

  //     // 🔹 Rebuild period labels safely
  //     periodAfterLabels = List.generate(durationCount, (dayIndex) {
  //       return List.generate(timesCount, (doseIndex) {
  //         if (dayIndex < oldPeriods.length &&
  //             doseIndex < oldPeriods[dayIndex].length) {
  //           return oldPeriods[dayIndex][doseIndex];
  //         } else {
  //           return medicationClassList[index]
  //                   .dosageMap[dayIndex]["doses"][doseIndex]["period"] ??
  //               "";
  //         }
  //       });
  //     });
  //     notifyListeners();
  //   }
  // }

  void copyDayOneToAllUpdate({
    StateSetter? setModalState,
    PharmViewModel? viewModel,
    dynamic timePerDay,
    int? index,
  }) {
    final dayOneTimes = timePerDay;

    if (dayOneTimes == null || dayOneTimes.isEmpty) return;
    for (final d in viewModel!.medicationClassList[index!].dosageMap) {
      if (d != null) {
        d['doses'] = List.from(dayOneTimes);
      }
    }

    setModalState!(() {});
  }

  void removeTimeForDay(int day, String time, StateSetter setModalState) {
    timesPerDay[day]!.remove(time);
    setModalState(() {});
    notifyListeners();
  }

  void addTimeForDay(int day, StateSetter setModalState) {
    final time = selectedTimePerDay[day];

    if (time == null) return;

    if (timesPerDay[day]!.length >= 100) {
      // Optional: show toast/snackbar
      return;
    }

    if (!timesPerDay[day]!.contains(time)) {
      timesPerDay[day]!.add(time);
    }

    setModalState(() {});
    notifyListeners();
  }

  setModalFlow({
    PharmViewModel? model,
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

  DateTime combineDateAndTime({
    required DateTime date,
    required String time, // e.g. "09:30 AM"
  }) {
    final timeFormat = DateFormat('hh:mm a');
    final parsedTime = timeFormat.parse(time);

    return DateTime(
      date.year,
      date.month,
      date.day,
      parsedTime.hour,
      parsedTime.minute,
    );
  }

  Future<void> buildDosageMap({PharmViewModel? model, int? index}) async {
    final duration = int.tryParse(
      model!.medicationClassList[index!].duration ?? '',
    );
    if (duration == null || model.selectedTimes.isEmpty) return;

    final startDate = DateFormat(
      'dd MMM, yyyy',
    ).parse(model.startDateUpdateControllers[index].text);

    List<Map<String, dynamic>> dosageMap = [];

    for (int day = 0; day < duration; day++) {
      final currentDate = startDate.add(Duration(days: day));

      List<Map<String, String>> doses = [];

      for (final time in model.selectedTimes) {
        final combined = combineDateAndTime(date: currentDate, time: time);
        doses.add({
          'time': time,
          'date': DateFormat('yyyy-MM-dd').format(currentDate),
          'isoDate': combined.toUtc().toIso8601String(),
        });
      }

      dosageMap.add({'day': day + 1, 'doses': doses});
    }

    model.medicationClassList[index].dosageMap = dosageMap;
    model.notifyListeners();
  }

  // Future<void> buildCustomDosageMap({
  //   PharmViewModel? model,
  //   int? index,
  //   int? day,
  // }) async {
  //   final duration = int.tryParse(
  //     model!.medicationClassList[index!].duration ?? '',
  //   );
  //   if (duration == null) return;

  //   final startDate = DateFormat(
  //     'dd MMM, yyyy hh:mm a',
  //   ).parse(model.startDateUpdateControllers[index].text);

  //   final currentDate = startDate.add(Duration(days: day! - 1));

  //   List<Map<String, String>> doses = [];
  //   if (model.medicationClassList[index].dosageMap[day - 1]['day'] == day &&
  //       model.medicationClassList[index].dosageMap[day - 1]['doses'].any(
  //         (e) => e['time'] == model.selectedTimePerDay[day - 1],
  //       )) {
  //     return;
  //   } else {
  //     final combined = combineDateAndTime(
  //       date: currentDate,
  //       time: selectedTimePerDay[day - 1]!,
  //     );
  //     doses.add({
  //       'time': selectedTimePerDay[day - 1]!,
  //       'date': DateFormat('yyyy-MM-dd').format(currentDate),
  //       'isoDate': combined.toUtc().toIso8601String(),
  //     });
  //     model.medicationClassList[index].dosageMap[day - 1]['doses'].add(
  //       doses[0],
  //     );
  //   }
  //   model.notifyListeners();
  // }

  void removeTimeAt({
    required int medicationIndex,
    required int timeIndex,
    required PharmViewModel model,
  }) {
    for (final day in model.medicationClassList[medicationIndex].dosageMap) {
      if (timeIndex < day['doses'].length) {
        day['doses'].removeAt(timeIndex);
      }
    }

    model.selectedTimes.removeAt(timeIndex);
    model.notifyListeners();
  }

  void removeCustomTimeAt({
    required PharmViewModel model,
    required int medicationIndex,
    required int dayIndex,
    required int timeIndex,
  }) {
    final doses =
        model.medicationClassList[medicationIndex].dosageMap[dayIndex]['doses'];

    if (timeIndex >= 0 && timeIndex < doses.length) {
      doses.removeAt(timeIndex);
    }

    notifyListeners();
  }

  void buildEmptyCustomDosageMap({
    required int medicationIndex,
    required int duration,
  }) {
    medicationClassList[medicationIndex].dosageMap = List.generate(duration, (
      day,
    ) {
      return {'day': day + 1, 'doses': <Map<String, dynamic>>[]};
    });
  }

  Future<void> selectTimeFreqUpdate({
    BuildContext? context,
    StateSetter? setModalState,
    PharmViewModel? model,
    int? index,
  }) async {
    final pickedTime = await showTimePicker(
      context: context!,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    final formattedTime = formatTimeFreq(pickedTime);

    final maxTimes = int.tryParse(
      model!.medicationClassList[index!].timesToTake ?? '',
    );

    /// ✅ UPDATE MODE
    if (model.globalTimeIndex != null) {
      model.selectedTimes[model.globalTimeIndex!] = formattedTime;
    }
    /// ✅ ADD MODE
    else {
      if (model.selectedTimes.contains(formattedTime)) return;

      if (maxTimes != null && model.selectedTimes.length >= maxTimes) return;

      model.selectedTimes.add(formattedTime);
    }

    model.getTime = formattedTime;

    /// rebuild map AFTER change
    await model.buildDosageMap(model: model, index: index);

    setModalState!(() {});
    model.notifyListeners();
  }

  reminderWidget({
    context,
    isTab,
    tenantReminder.Reminder? reminder,
    PharmViewModel? model,
    bool isComplete = false,
  }) => GestureDetector(
    onTap: () => navigate.navigateTo(
      Routes.pharmViewMedicationScreen,
      arguments: PharmViewMedicationScreenArguments(id: reminder.id),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 10.w),
      margin: EdgeInsets.only(bottom: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 36.0.w,
                horizontal: 36.40.w,
              ),
              width: MediaQuery.of(context).size.width / 2.5,
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.dashboard,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.network(
                reminder?.medication?.medicationImage?.url ?? '',
                height: 76.h,
                width: 76.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Padding(
                  padding: EdgeInsets.all(18.w),
                  child: SvgPicture.asset(
                    color: AppColors.primary,
                    model!.errorRemidnderImage(
                      reminder!.medication!.medicationType,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15.20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 140.w,
                child: TextView(
                  text: reminder?.medication?.medicationName ?? '',
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 16.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.reminder,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text:
                    '${DateFormat('MMM d').format(reminder!.medication!.startDateTime!)} - ${DateFormat('MMM d').format(reminder.medication!.endDateTime!)}',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: isTab ? 230.w : 130.w,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ), // Adjust radius as needed
                      child: LinearProgressIndicator(
                        minHeight: 4.0, // Adjust height as needed
                        value: model!.getReminderStatusValue(
                          reminder.medication!.dailyDoseTimes!,
                        ),
                        color: AppColors.lightBlue, // Progress bar color
                        backgroundColor:
                            Colors.grey[300], // Background track color
                      ),
                    ),
                  ),
                  SizedBox(width: 7.10.w),
                  TextView(
                    text: '${model.takenCount}/${model.totalCount}',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              TextView(
                text: 'Dosage',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  TextView(
                    text: reminder.medication?.dosage ?? '',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(width: 4.6.w),
                  TextView(
                    text: 'x${reminder.medication?.timesPerDay} daily',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3.2.w),
                    decoration: BoxDecoration(
                      color: !isComplete
                          ? payStatusColor(reminder.payments)
                          : AppColors.app_green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4.6.w),
                  TextView(
                    text: !isComplete
                        ? payStatus(reminder.payments)
                        : 'Completed',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );

  payStatus(List<pyR.Payment>? payments) {
    if (payments!.isNotEmpty && payments[0].status == 'SUCCESS') {
      return 'Paid';
    }
    if (payments.isNotEmpty && payments[0].status == 'PENDING') {
      return 'Pending';
    }
    return 'Free';
  }

  payStatusColor(List<pyR.Payment>? payments) {
    if (payments!.isNotEmpty && payments[0].status == 'SUCCESS') {
      return AppColors.app_green;
    }
    if (payments.isNotEmpty && payments[0].status == 'PENDING') {
      return AppColors.yellow;
    }
    return AppColors.greygrey;
  }

  firstUserReminderModalFLow({
    PharmViewModel? model,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
    String? id,
  }) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: AppColors.white,
      ),
      child: ViewModelBuilder<PharmViewModel>.reactive(
        viewModelBuilder: () => PharmViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            model.isReminderStatus = 'all';
            await model.getTodaysReminder(
              context,
              period: model.timePeriod,
              date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            );
            model.getTenantReminderById(
              context,
              id: id,
              page: model.pageOngoing.toString(),
              limit: 10.toString(),
            );
          });
        },
        disposeViewModel: false,
        onDispose: (viewModel) {},
        builder: (_, PharmViewModel model, _) {
          return SingleChildScrollView(
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
                          value: linIndex / 2,
                          color: AppColors.primary, // Progress bar color
                          backgroundColor:
                              Colors.grey[300], // Background track color
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    TextView(
                      text: '$linIndex/2',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 13.2.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.6.w,
                    vertical: 12.6.w,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.greygreyer,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Patient Name',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextView(
                        text:
                            '${userDetailData['data']['fullName'] ?? userDetailData['data']['generatedName'] ?? ''}',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: AppColors.fineGrey, thickness: .4),
                      SizedBox(height: 10.h),
                      TextView(
                        text: 'Phone Number',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextView(
                        text:
                            userDetailData['data']['phone']
                                .toString()
                                .substring(4)
                                .startsWith('0')
                            ? userDetailData['data']['phone']
                                  .toString()
                                  .substring(4)
                            : '0${userDetailData['data']['phone'].toString().substring(4)}',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: AppColors.fineGrey, thickness: .4),
                      SizedBox(height: 10.h),
                      TextView(
                        text: 'Email',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextView(
                        text: '${userDetailData['data']['email'] ?? ''}',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 6.10.h),
                    ],
                  ),
                ),
                SizedBox(height: 17.20.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: PopupMenuButton<String>(
                    color: AppColors.white,
                    child: Container(
                      width: 166.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 3.2.w,
                        horizontal: 12.w,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 20.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.04),
                        borderRadius: BorderRadius.circular(32.r),
                        border: Border.all(color: AppColors.primary),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: model.isReminderStatus.capitalize(),
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(14.20.w),
                            child: SvgPicture.asset(AppImage.arrow_down),
                          ),
                        ],
                      ),
                    ),

                    onSelected: (String result) async {
                      model.isReminderStatus = result;
                      await Future.delayed(Duration(milliseconds: 400));
                      model.getTenantReminderById(
                        context,
                        id: id,
                        status: model.isReminderStatus,
                        page: model.pageOngoing.toString(),
                        limit: 10.toString(),
                      );
                      setModalState!(() {});
                      model.notifyListeners();
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                            value: 'all',
                            child: TextView(
                              text: 'All',
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontSize: 15.2.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'ongoing',
                            child: TextView(
                              text: 'Ongoing',
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontSize: 15.2.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'completed',
                            child: TextView(
                              text: 'Completed',
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontSize: 15.2.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child:
                      model.getReminderForTenantResponseModel != null &&
                          model
                              .getReminderForTenantResponseModel!
                              .data!
                              .reminders!
                              .isNotEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * .62,
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(height: 30.h),
                                if (model.isReminderStatus == 'all')
                                  ...model
                                      .getReminderForTenantResponseModel!
                                      .data!
                                      .reminders!
                                      .reversed
                                      .map(
                                        (e) => reminderWidget(
                                          context: context,
                                          isTab: isTablet(context),
                                          reminder: e,
                                          model: model,
                                        ),
                                      ),

                                if (model.isReminderStatus == 'ongoing')
                                  ...model
                                      .getReminderForTenantResponseModel!
                                      .data!
                                      .reminders!
                                      .reversed
                                      .map(
                                        (e) => reminderWidget(
                                          context: context,
                                          isTab: isTablet(context),
                                          reminder: e,
                                          model: model,
                                        ),
                                      ),

                                if (model.isReminderStatus == 'completed')
                                  ...model
                                      .getReminderForTenantResponseModel!
                                      .data!
                                      .reminders!
                                      .reversed
                                      .map(
                                        (e) => reminderWidget(
                                          context: context,
                                          isTab: isTablet(context),
                                          reminder: e,
                                          model: model,
                                          isComplete: true,
                                        ),
                                      ),

                                if (model.isReminderStatus == 'today' &&
                                    model.getTodaysReminderModel != null)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.w,
                                      horizontal: 20.w,
                                    ),
                                    margin: EdgeInsets.only(bottom: 16.w),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: 'Today’s Medications',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 13.2.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.calendar,
                                              height: 18.h,
                                              width: 18.w,
                                              color: AppColors.infoGrey,
                                            ),
                                            SizedBox(width: 10.h),
                                            TextView(
                                              text: DateFormat(
                                                'EEEE, MMMM dd',
                                              ).format(DateTime.now()),
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 15.2.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Divider(
                                          thickness: .14,
                                          color: AppColors.infoGrey,
                                        ),
                                        SizedBox(height: 14.h),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                model.timePeriod = 'morning';
                                                await Future.delayed(
                                                  Duration(milliseconds: 100),
                                                );
                                                model.getTodaysReminder(
                                                  context,
                                                  period: model.timePeriod,
                                                  date: DateFormat(
                                                    'yyyy-MM-dd',
                                                  ).format(DateTime.now()),
                                                );
                                                model.notifyListeners();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 8.w,
                                                  horizontal: 24.0.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        model.timePeriod ==
                                                            'morning'
                                                        ? AppColors.primary
                                                        : AppColors.f1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        22.0,
                                                      ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.set,
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    TextView(
                                                      text: 'Morning',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 13.2.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.infoGrey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.4.h),
                                            GestureDetector(
                                              onTap: () async {
                                                model.timePeriod = 'afternoon';

                                                await Future.delayed(
                                                  Duration(milliseconds: 100),
                                                );
                                                model.getTodaysReminder(
                                                  context,
                                                  period: model.timePeriod,
                                                  date: DateFormat(
                                                    'yyyy-MM-dd',
                                                  ).format(DateTime.now()),
                                                );
                                                model.notifyListeners();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 8.w,
                                                  horizontal: 24.0.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        model.timePeriod ==
                                                            'afternoon'
                                                        ? AppColors.primary
                                                        : AppColors.f1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        22.0,
                                                      ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.noon,
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    TextView(
                                                      text: 'Afternoon',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 13.2.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.infoGrey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        GestureDetector(
                                          onTap: () async {
                                            model.timePeriod = 'evening';
                                            await Future.delayed(
                                              Duration(milliseconds: 100),
                                            );
                                            model.getTodaysReminder(
                                              context,
                                              period: model.timePeriod,
                                              date: DateFormat(
                                                'yyyy-MM-dd',
                                              ).format(DateTime.now()),
                                            );
                                            model.notifyListeners();
                                          },
                                          child: Container(
                                            width: 130.0.w,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 8.w,
                                              horizontal: 24.0.w,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    model.timePeriod ==
                                                        'evening'
                                                    ? AppColors.primary
                                                    : AppColors.f1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(22.0),
                                            ),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(AppImage.dawn),
                                                SizedBox(width: 6.w),
                                                TextView(
                                                  text: 'Evening',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 13.2.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30.h),
                                        ...model.getTodaysReminderModel!.data!.asMap().entries.map((
                                          entry,
                                        ) {
                                          final index = entry.key;
                                          final o = entry.value;
                                          final isLast =
                                              index ==
                                              model
                                                      .getTodaysReminderModel!
                                                      .data!
                                                      .length -
                                                  1;
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(
                                                      14.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.skyBlue,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      model.isMedTypeView(
                                                        o.medicationType,
                                                      ),
                                                      color: AppColors.primary,
                                                      height: 18.h,
                                                      width: 18.w,
                                                    ),
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextView(
                                                        text:
                                                            o.medicationType
                                                                ?.capitalize() ??
                                                            '',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 13.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              AppColors.grey1,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 120.w,
                                                        child: TextView(
                                                          text:
                                                              o.medicationName ??
                                                              '',
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          maxLines: 1,
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'GoogleSans',
                                                            fontSize: 15.2.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.deep,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    children: [
                                                      TextView(
                                                        text:
                                                            '${o.time} ${model.checkTimePeriod(o.time)}',
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 18.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                          1.2.w,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: model
                                                              .checkMedsStatusColor(
                                                                o.status,
                                                              ),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: model
                                                            .checkMedsStatusWidget(
                                                              o.status,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.30.h),
                                              if (!isLast)
                                                Divider(
                                                  color: AppColors.infoGrey,
                                                  thickness: .14,
                                                ),
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  ),

                                SizedBox(height: 2.0.h),
                                model.isReminderStatus == 'today'
                                    ? SizedBox.shrink()
                                    : Divider(
                                        color: AppColors.buttonGrey1,
                                        thickness: .4,
                                      ),
                                SizedBox(height: 4.0.h),
                                model.isReminderStatus == 'today'
                                    ? SizedBox.shrink()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed:
                                                model
                                                        .getReminderForTenantResponseModel!
                                                        .data!
                                                        .meta!
                                                        .page ==
                                                    1
                                                ? () {}
                                                : () async {
                                                    if (model
                                                            .isReminderStatus ==
                                                        'ongoing') {
                                                      model.onSubGoingLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'completed') {
                                                      model
                                                          .onSubCompletedLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'today') {
                                                      model.onSubTodayLoading();
                                                    }
                                                  },
                                            icon: Icon(
                                              Icons.arrow_back,
                                              color:
                                                  model
                                                          .getReminderForTenantResponseModel!
                                                          .data!
                                                          .meta!
                                                          .page ==
                                                      1
                                                  ? AppColors.primary1
                                                        .withOpacity(.4)
                                                  : AppColors.primary1,
                                              size: 20.sp,
                                            ),
                                          ),

                                          model.isLoading
                                              ? SpinKitFadingCircle(
                                                  size: 20.sp,
                                                  color: AppColors.fineGrey,
                                                )
                                              : TextView(
                                                  text:
                                                      'Page ${model.getReminderForTenantResponseModel!.data!.meta!.page} of ${model.getReminderForTenantResponseModel!.data!.meta!.totalPages}',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 15.2.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                          IconButton(
                                            onPressed:
                                                model
                                                            .getReminderForTenantResponseModel!
                                                            .data!
                                                            .meta!
                                                            .page ==
                                                        model
                                                            .getReminderForTenantResponseModel!
                                                            .data!
                                                            .meta!
                                                            .totalPages ||
                                                    model
                                                            .getReminderForTenantResponseModel!
                                                            .data!
                                                            .meta!
                                                            .totalPages ==
                                                        0
                                                ? () {}
                                                : () async {
                                                    if (model
                                                            .isReminderStatus ==
                                                        'ongoing') {
                                                      model.onAddGoingLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'completed') {
                                                      model
                                                          .onAddCompletedLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'today') {
                                                      model.onAddTodayLoading();
                                                    }
                                                  },
                                            icon: Icon(
                                              Icons.arrow_forward,
                                              color:
                                                  model
                                                              .getReminderForTenantResponseModel!
                                                              .data!
                                                              .meta!
                                                              .page ==
                                                          model
                                                              .getReminderForTenantResponseModel!
                                                              .data!
                                                              .meta!
                                                              .totalPages ||
                                                      model
                                                              .getReminderForTenantResponseModel!
                                                              .data!
                                                              .meta!
                                                              .totalPages ==
                                                          0
                                                  ? AppColors.primary1
                                                        .withOpacity(.4)
                                                  : AppColors.primary1,
                                              size: 20.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                SizedBox(height: 40.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Continue',
                                  color: AppColors.white,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () async {
                                    linIndex++;
                                    setModalState!(() {});
                                    model.notifyListeners();
                                  },
                                ),
                                SizedBox(height: 16.h),
                                !model.isTapped
                                    ? SizedBox.shrink()
                                    : Container(
                                        width: 156.0.w,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 18.22.w,
                                          vertical: 18.20.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(
                                            20.w,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                linIndex++;
                                                setModalState!(() {});
                                                model.notifyListeners();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    AppImage.person_plus,
                                                  ),
                                                  SizedBox(width: 6.10.w),
                                                  TextView(
                                                    text: 'Set up Yourself',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 13.2.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.reminder,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.ai_star,
                                                ),
                                                SizedBox(width: 6.10.w),
                                                TextView(
                                                  text: 'AI Setup',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 13.2.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.reminder,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                SizedBox(height: model.isTapped ? 70.h : 50.h),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 130.h),
                            SvgPicture.asset(AppImage.reminder),
                            SizedBox(height: 20.h),
                            TextView(
                              text: 'Here you’ll see your schedule for the day',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: 2.10.h),
                            TextView(
                              text: 'Tap on the plus button to add one',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            GestureDetector(
                              onTap: () => setModalState!(() {
                                model.isTapped = !model.isTapped;
                              }),
                              child: Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                                child: !model.isTapped
                                    ? Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                        size: 20.sp,
                                      )
                                    : SvgPicture.asset(
                                        AppImage.x,
                                        color: AppColors.white,
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            !model.isTapped
                                ? SizedBox.shrink()
                                : Container(
                                    width: 156.0.w,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 18.22.w,
                                      vertical: 18.20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20.w),
                                    ),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            linIndex++;
                                            setModalState!(() {});
                                            model.notifyListeners();
                                            print('object0000000e');
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                AppImage.person_plus,
                                              ),
                                              SizedBox(width: 6.10.w),
                                              TextView(
                                                text: 'Set up Yourself',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 13.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(AppImage.ai_star),
                                            SizedBox(width: 6.10.w),
                                            TextView(
                                              text: 'AI Setup',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 13.2.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  firstModalFLow({
    PharmViewModel? model,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
  }) {
    initUpdateControllers(setModalState: setModalState, model: model);
    model!.initDayTimes(model.intListCustom);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: AppColors.white,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.6.w, vertical: 20.w),
        controller: scrollController,
        child: Form(
          key: firstFormReminderKey,
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
                      onTap: () async {
                        await model.clearReminderMedsVaraibles(model);
                        model.medicationClassList.clear();
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
                    width: MediaQuery.of(context!).size.width * .80,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ), // Adjust radius as needed
                      child: LinearProgressIndicator(
                        minHeight: 5.0, // Adjust height as needed
                        value: linIndex / 2,
                        color: AppColors.primary, // Progress bar color
                        backgroundColor:
                            Colors.grey[300], // Background track color
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  TextView(
                    text: '$linIndex/2',
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
              TextView(
                text: 'PATIENTS DETAILS',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 14.80.sp,
                  color: AppColors.deep,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12.h),
              Divider(color: AppColors.grey),
              SizedBox(height: 12.h),
              TextFormWidget(
                hint: 'Patient Name',
                hintWeight: FontWeight.w400,
                hintColor: AppColors.reminder,
                borderColor: AppColors.infoGrey1,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                label: 'Enter patients full name',
                hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                fillColor: AppColors.white,
                isFilled: true,
                controller: model.fullNameController,
                validator: AppValidator.validateString(),
                style: TextStyle(
                  fontSize: 16.20.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GoogleSans',
                ),
                labelStyle: TextStyle(
                  fontSize: 14.20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fineGrey,
                  fontFamily: 'Arial',
                ),
              ),
              SizedBox(height: 16.h),
              TextFormWidget(
                hint: 'Phone Number',
                hintWeight: FontWeight.w400,
                hintColor: AppColors.reminder,
                borderColor: AppColors.infoGrey1,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                label: 'e.g. +234 7058932586',
                hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                fillColor: AppColors.white,
                isFilled: true,
                controller: model.phoneNumberController,
                onChange: (v) {
                  setModalState!(() {});
                },
                validator: (value) =>
                    AppValidator.validatePhoneNewPatient()(value),
                style: TextStyle(
                  fontSize: 16.20.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GoogleSans',
                ),
                labelStyle: TextStyle(
                  fontSize: 14.20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fineGrey,
                  fontFamily: 'Arial',
                ),
              ),
              SizedBox(height: 16.h),
              TextFormWidget(
                hint: 'Email Address',
                isShowHint: true,
                hintWeight: FontWeight.w400,
                hintColor: AppColors.reminder,
                borderColor: AppColors.infoGrey1,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                label: 'patient@example.com',
                hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                fillColor: AppColors.white,
                isFilled: true,
                controller: model.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: AppValidator.validateEmail(),
                inputFormatters: [
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    return newValue.copyWith(
                      text: newValue.text.toLowerCase(),
                      selection: newValue.selection,
                    );
                  }),
                ],

                style: TextStyle(
                  fontSize: 16.20.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GoogleSans',
                ),
                labelStyle: TextStyle(
                  fontSize: 14.20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fineGrey,
                  fontFamily: 'Arial',
                ),
              ),
              SizedBox(height: 8.h),
              TextView(
                text: 'Required if email notifications are selected',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 12.80.sp,
                  color: AppColors.infoGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),

              model.medicationClassList.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.0.h),
                        TextView(
                          text: 'MEDICATION DETAILS',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.80.sp,
                            color: AppColors.deep,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Divider(color: AppColors.grey),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'Medication Name',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          fillColor: AppColors.white,
                          isFilled: true,
                          controller: model.medNameController,
                          validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'GoogleSans',
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormWidget(
                          hint: 'Medication Type',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          readOnly: true,
                          fillColor: AppColors.white,
                          isFilled: true,
                          prefixWidget: model.medTypeResultImage.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: SvgPicture.asset(
                                    model.medTypeResultImage,
                                  ),
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
                                  model.medTypeResultImage =
                                      result["icon"] ?? '';
                                  model.medTypeController.text =
                                      result["type"] ?? '';
                                });
                              }
                            },
                          ),
                          controller: model.medTypeController,
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
                            color: AppColors.deep,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Divider(color: AppColors.grey),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'Dosage',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          controller: model.medDosageController,
                          fillColor: AppColors.white,
                          isFilled: true,
                          readOnly:
                              model.medTypeController.text == 'Others' ||
                                  model.medDosageController.text == 'custom'
                              ? false
                              : true,
                          suffixWidget: IconButton(
                            onPressed:
                                model.medTypeController.text == 'Others' ||
                                    model.medTypeController.text == 'custom'
                                ? () {}
                                : () async {
                                    showMedDosageMenu(
                                      context: context,
                                      type: model.medTypeController.text,
                                      model: model,
                                    );
                                  },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.faintedGrey,
                              size: 20.sp,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(height: 24.0.h),
                        TextFormWidget(
                          hint: 'Frequency',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.white,
                          isFilled: true,
                          readOnly: true,
                          controller: TextEditingController(
                            text: model.medDailyInTakenController.text == ''
                                ? ''
                                : model.medDailyInTakenController.text
                                          .toLowerCase() ==
                                      'custom schedule'
                                ? model.medDailyInTakenController.text
                                : showNoTimesMode(
                                    int.parse(
                                      model.medDailyInTakenController.text,
                                    ),
                                  ),
                          ),
                          suffixWidget: IconButton(
                            onPressed: () async {
                              final result = await showDailyInTakeMenu(
                                context: context,
                                setModalState: setModalState,
                                model: model,
                              );
                              if (result != null) {
                                setModalState!(() {
                                  model.medDailyInTakenController.text = result;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.faintedGrey,
                              size: 20.sp,
                            ),
                          ),
                          validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'GoogleSans',
                          ),
                        ),
                        SizedBox(height: 24.0.h),
                        TextFormWidget(
                          hint: 'Start Date',
                          label: '13 Feb, 2026',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          readOnly: true,
                          fillColor: AppColors.white,
                          isFilled: true,
                          controller: model.dateTimeController,
                          suffixWidget: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: GestureDetector(
                              onTap: () => model.selectDate(
                                context: context,
                                setModalState: setModalState,
                              ),
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
                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'GoogleSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                        SizedBox(height: 24.0.h),
                        TextFormWidget(
                          hint: 'Duration',
                          label: '',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          controller: model.medDurationController,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 16.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.appWhite,
                          isFilled: true,
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'GoogleSans',
                          ),
                          onChange: (p0) => _calculateEndDate(
                            setModalState: setModalState,
                            model: model,
                          ),
                        ),
                        SizedBox(height: 24.0.h),
                        TextFormWidget(
                          hint: 'End Date',
                          label: '18 Feb, 2026',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          controller: model.endDateController,
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
                          // suffixWidget: Padding(
                          //   padding: EdgeInsets.all(8.w),
                          //   child: GestureDetector(
                          //     onTap: () => model.selectEndDate(
                          //       context: context,
                          //       setModalState: setModalState,
                          //     ),
                          //     child: SvgPicture.asset(
                          //       AppImage.calendar,
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                        ),
                        SizedBox(height: 24.0.h),

                        // TextView(
                        //   text: 'Duration',
                        //   textStyle: TextStyle(
                        //     fontFamily: 'Arial',
                        //     fontSize: 14.sp,
                        //     fontWeight: FontWeight.w400,
                        //     color: AppColors.reminder,
                        //   ),
                        // ),
                        // SizedBox(height: 14.0.h),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(16.w, 0.w, 0.w, 0.w),
                        //   width: double.infinity,
                        //   height: 50.h,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10.r),
                        //     color: AppColors.dashboard,
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       TextView(
                        //         text: model.numberOfDurationsInDays ?? '',
                        //         textStyle: TextStyle(
                        //           fontFamily: 'GoogleSans',
                        //           fontSize: 14.sp,
                        //           fontWeight: FontWeight.w700,
                        //           color: AppColors.primary1,
                        //         ),
                        //       ),
                        //       TextView(
                        //         text: model.endDateController.text != ''
                        //             ? ' (${model.dateTimeController.text.substring(0, 6)} - ${model.endDateController.text})'
                        //             : '',
                        //         textStyle: TextStyle(
                        //           fontFamily: 'Arial',
                        //           fontSize: 14.sp,
                        //           fontWeight: FontWeight.w400,
                        //           color: AppColors.reminder,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 24.0.h),
                        model.isCusSchedule
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          TextView(
                                            text: 'Configure Times Per Day',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.reminder,
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextView(
                                            text: 'Copy Day 1 to All',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.74.sp,
                                              color: AppColors.reminder,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 8.w),

                                          GestureDetector(
                                            onTap: () {
                                              isTappedCopyall =
                                                  !isTappedCopyall;
                                              if (isTappedCopyall) {
                                                copyDayOneToAll(
                                                  setModalState: setModalState!,
                                                  viewModel: model,
                                                );
                                              }
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              padding: isTappedCopyall
                                                  ? EdgeInsets.all(0.w)
                                                  : EdgeInsets.all(8.0.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                color: isTappedCopyall
                                                    ? AppColors.primary
                                                    : AppColors.transparent,
                                                border: Border.all(
                                                  color: isTappedCopyall
                                                      ? AppColors.transparent
                                                      : AppColors.infoGrey,
                                                  width: .78,
                                                ),
                                              ),
                                              child: isTappedCopyall
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 14.sp,
                                                      color: AppColors.white,
                                                    )
                                                  : SizedBox.shrink(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.h),
                                  SizedBox(
                                    height: model.intListCustom.isEmpty
                                        ? 0.h
                                        : model.intListCustom.length > 1
                                        ? 208.h
                                        : 110.h,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ...model.intListCustom.map(
                                            (e) => Container(
                                              padding: EdgeInsets.all(10.w),
                                              margin: EdgeInsets.only(
                                                bottom: 12.w,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColors.f1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                              12.w,
                                                              3.84.w,
                                                              12.0.w,
                                                              3.84.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.r,
                                                              ),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primaryLight
                                                                .withOpacity(
                                                                  .3,
                                                                ),
                                                          ),
                                                          color: AppColors
                                                              .primaryLight
                                                              .withOpacity(.1),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            TextView(
                                                              text: 'Day',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .fineGrey,
                                                              ),
                                                            ),
                                                            TextView(
                                                              text: '${e + 1}',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'GoogleSans',
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 4.0.w),

                                                      Expanded(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                16.w,
                                                                8.0.w,
                                                                16.0.w,
                                                                8.0.w,
                                                              ),
                                                          width:
                                                              double.infinity,
                                                          height: 50.h,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10.r,
                                                                ),
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .infoGrey1,
                                                            ),
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              TextView(
                                                                text:
                                                                    getTimeFreqCustom(
                                                                      e,
                                                                    ),
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .reminder,
                                                                ),
                                                              ),
                                                              IconButton(
                                                                onPressed: () {
                                                                  selectTimeFreqCustom(
                                                                    context:
                                                                        context,
                                                                    dayIndex: e,
                                                                    setModalState:
                                                                        setModalState,
                                                                    model:
                                                                        model,
                                                                  );
                                                                  model
                                                                      .notifyListeners();
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .access_time_rounded,
                                                                  color: AppColors
                                                                      .fineGrey,
                                                                  size: 20.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 4.0.w),
                                                      GestureDetector(
                                                        onTap: () {
                                                          selectedTimePerDay[e] =
                                                              null;
                                                          model.addTimeForDay(
                                                            e,
                                                            setModalState!,
                                                          );
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                14.w,
                                                                8.0.w,
                                                                16.0.w,
                                                                8.0.w,
                                                              ),
                                                          width: 56.2,
                                                          height: 50.h,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10.r,
                                                                ),
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .infoGrey1,
                                                            ),
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .fineGrey,
                                                              size: 20.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                              7.8.w,
                                                              1.0.w,
                                                              7.8.w,
                                                              1.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                22,
                                                              ),
                                                          color: AppColors
                                                              .lightBlue,
                                                        ),
                                                        child: TextView(
                                                          text:
                                                              '${model.timesPerDay[e]!.length}x',
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'GoogleSans',
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  model
                                                          .timesPerDay[e]!
                                                          .isNotEmpty
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                    top: 2.w,
                                                                  ),
                                                              child: TextView(
                                                                text:
                                                                    DateFormat(
                                                                      'MMM dd',
                                                                    ).format(
                                                                      DateTime.parse(
                                                                        model
                                                                            .pickedDatedStartString!,
                                                                      ).add(
                                                                        Duration(
                                                                          days:
                                                                              e,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .fineGrey,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Expanded(
                                                              child: Wrap(
                                                                spacing: 10.0,
                                                                runSpacing:
                                                                    10.0,
                                                                children: [
                                                                  ...model.timesPerDay[e]!.map(
                                                                    (
                                                                      time,
                                                                    ) => GestureDetector(
                                                                      onTap: () {
                                                                        selectedTimePerDay[e] =
                                                                            time;
                                                                        setModalState!(
                                                                          () {},
                                                                        );
                                                                        model
                                                                            .notifyListeners();
                                                                      },
                                                                      child: Container(
                                                                        width:
                                                                            110.w,
                                                                        padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              4.w,
                                                                          horizontal:
                                                                              10.w,
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            22.r,
                                                                          ),
                                                                          border: Border.all(
                                                                            color:
                                                                                selectedTimePerDay[e] ==
                                                                                    time
                                                                                ? AppColors.transparent
                                                                                : AppColors.app_green,
                                                                          ),
                                                                          color:
                                                                              selectedTimePerDay[e] ==
                                                                                  time
                                                                              ? AppColors.app_green
                                                                              : AppColors.white,
                                                                        ),
                                                                        child: Row(
                                                                          children: [
                                                                            TextView(
                                                                              text: time,
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 13.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color:
                                                                                    selectedTimePerDay[e] ==
                                                                                        time
                                                                                    ? AppColors.white
                                                                                    : AppColors.app_green,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 6.w,
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                model.removeTimeForDay(
                                                                                  e,
                                                                                  time,
                                                                                  setModalState!,
                                                                                );
                                                                              },
                                                                              child: SvgPicture.asset(
                                                                                AppImage.x,
                                                                                color:
                                                                                    selectedTimePerDay[e] ==
                                                                                        time
                                                                                    ? AppColors.white
                                                                                    : AppColors.app_green,
                                                                                height: 16.20.h,
                                                                                width: 16.w,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      TextView(
                                        text: 'Time',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.reminder,
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
                                  SizedBox(height: 14.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                            16.w,
                                            8.0.w,
                                            16.0.w,
                                            8.0.w,
                                          ),
                                          width: double.infinity,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            border: Border.all(
                                              color: AppColors.infoGrey1,
                                            ),
                                            color: AppColors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextView(
                                                text: getTimeFreq(),
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  selectTimeFreq(
                                                    context: context,
                                                    model: model,
                                                  );
                                                  setModalState!(() {});
                                                },
                                                icon: Icon(
                                                  Icons.access_time_rounded,
                                                  color: AppColors.fineGrey,
                                                  size: 20.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4.0.w),
                                      GestureDetector(
                                        onTap: () {
                                          if (model
                                                      .medDailyInTakenController
                                                      .text !=
                                                  '' &&
                                              model
                                                      .formattedSelectedTimeAndPeriodList!
                                                      .length <
                                                  int.parse(
                                                    model
                                                        .medDailyInTakenController
                                                        .text,
                                                  )) {
                                            if (model
                                                .formattedSelectedTimeAndPeriodList!
                                                .contains(
                                                  formattedSelectedTimeAndPeriod,
                                                )) {
                                              formattedSelectedTimeAndPeriod =
                                                  '--:--';
                                              model.globalTimeIndex = null;
                                            } else {
                                              model
                                                  .formattedSelectedTimeAndPeriodList!
                                                  .add(
                                                    formattedSelectedTimeAndPeriod!,
                                                  );
                                            }
                                          } else {}
                                          setModalState!(() {});
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                            16.w,
                                            8.0.w,
                                            16.0.w,
                                            8.0.w,
                                          ),
                                          width: 62,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            border: Border.all(
                                              color: AppColors.infoGrey1,
                                            ),
                                            color: AppColors.white,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.fineGrey,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 24.0.h),
                                  model
                                          .formattedSelectedTimeAndPeriodList!
                                          .isNotEmpty
                                      ? Wrap(
                                          spacing: 10.0,
                                          runSpacing: 10.0,
                                          children: [
                                            ...model.formattedSelectedTimeAndPeriodList!.asMap().entries.map((
                                              entry,
                                            ) {
                                              final index =
                                                  entry.key; // ✅ index
                                              final value =
                                                  entry.value; // ✅ time string

                                              return GestureDetector(
                                                onTap: () {
                                                  formattedSelectedTimeAndPeriod =
                                                      value;
                                                  model.formattedSelectedTimeAndPeriod =
                                                      value;
                                                  model.globalTimeIndex = index;
                                                  setModalState!(() {});
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                  width: 104.w,
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 4.w,
                                                    horizontal: 10.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22.r,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          formattedSelectedTimeAndPeriod ==
                                                              value
                                                          ? AppColors
                                                                .transparent
                                                          : AppColors.app_green,
                                                    ),
                                                    color:
                                                        formattedSelectedTimeAndPeriod ==
                                                            value
                                                        ? AppColors.app_green
                                                        : AppColors.white,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      TextView(
                                                        text: value,
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 13.2.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              formattedSelectedTimeAndPeriod ==
                                                                  value
                                                              ? AppColors.white
                                                              : AppColors
                                                                    .app_green,
                                                        ),
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      GestureDetector(
                                                        onTap: () {
                                                          model
                                                              .formattedSelectedTimeAndPeriodList!
                                                              .remove(value);
                                                          setModalState!(() {});
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        child: SvgPicture.asset(
                                                          AppImage.x,
                                                          color:
                                                              formattedSelectedTimeAndPeriod ==
                                                                  value
                                                              ? AppColors.white
                                                              : AppColors
                                                                    .app_green,
                                                          height: 16.20.h,
                                                          width: 16.w,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),

                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Notes & Instructions',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          label: 'e.g. Take with food, avoid grapefruit juice',
                          labelStyle: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.infoGrey,
                            fontFamily: 'Arial',
                          ),
                          isShowHint: true,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          controller: model.noteController,
                          fillColor: AppColors.white,
                          isFilled: true, // Minimum number of lines visible
                          maxline:
                              3, // Maximum number of lines visible before scrolling
                          keyboardType: TextInputType.multiline,
                          validator: AppValidator.validateString(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'GoogleSans',
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextView(
                          text:
                              'These notes will be included in notification messages',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 12.4.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.infoGrey,
                          ),
                        ),
                        SizedBox(height: 24.0.h),
                        TextView(
                          text: 'NOTIFICATION CHANNELS',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.80.sp,
                            color: AppColors.deep,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Divider(color: AppColors.grey),
                        SizedBox(height: 12.h),
                        ...List.generate(channels.length, (index) {
                          return chooseNotChannelWidget(
                            context,
                            svgIcon: channels[index].notificationIcon!,
                            text: channels[index].notification!,
                            isTapped: selectedIndexes.contains(
                              index,
                            ), // ✅ reflect state
                            onTap: () {
                              if (selectedIndexes.contains(index)) {
                                // unselect
                                selectedIndexes.remove(index);
                                if (!selectedIndexes.contains(0) &&
                                    !selectedIndexes.contains(1)) {
                                  isTappedEmailAdded = false;
                                  model.notifyListeners();
                                }
                                if (!selectedIndexes.contains(2) &&
                                    !selectedIndexes.contains(3) &&
                                    !selectedIndexes.contains(4)) {
                                  isTappedPhoneAdded = false;
                                  model.notifyListeners();
                                }
                              } else {
                                // select
                                selectedIndexes.add(index);
                                // ✅ Show specific dialogs
                                if (index == 0 || index == 1) {
                                  // Email
                                  isTappedEmailAdded = true;
                                  addedEmailReminderList.add(
                                    model.emailController.text,
                                  );
                                  model.notifyListeners();
                                } else if ([2, 3, 4].contains(index)) {
                                  // Phone-related channels
                                  isTappedPhoneAdded = true;
                                  isPhoneValid = false;
                                  addedPhoneReminderList.add(
                                    returnAddingPhoneNoStructureWith234(
                                      model.phoneNumberController.text,
                                    ),
                                  );
                                  model.notifyListeners();
                                }
                              }
                              // ✅ update selection
                              buildChannelList(selectedIndexes);
                              model.notifyListeners();
                            },
                          );
                        }),
                        SizedBox(height: 12.h),
                        isTappedEmailAdded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: addedEmailReminderList.isEmpty
                                            ? AppColors.red
                                            : AppColors.infoGrey1,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.infoGrey1,
                                            ),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          addedEmailReminderList
                                                              .isEmpty
                                                          ? AppColors.red
                                                          : AppColors.deep,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      TextView(
                                                        text:
                                                            'Emails available',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.8.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .fineGrey,
                                                        ),
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              const Color.fromARGB(
                                                                255,
                                                                223,
                                                                233,
                                                                247,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12.r,
                                                              ),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primary
                                                                .withOpacity(
                                                                  .4,
                                                                ),
                                                          ),
                                                        ),
                                                        child: TextView(
                                                          text:
                                                              '${emailReminderList.length + 1}',
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 11.8.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .primary,
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
                                                      model.notifyListeners();
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
                                                        showEmailDialog(
                                                          context,
                                                          model: model,
                                                        ),
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
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 12.w,
                                            right: 20.w,
                                            top: 10.w,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (addedEmailReminderList
                                                      .contains(
                                                        model
                                                            .emailController
                                                            .text,
                                                      )) {
                                                    addedEmailReminderList
                                                        .remove(
                                                          model
                                                              .emailController
                                                              .text,
                                                        );
                                                  } else {
                                                    addedEmailReminderList
                                                        .clear();
                                                    addedEmailReminderList.add(
                                                      model
                                                          .emailController
                                                          .text,
                                                    );
                                                  }
                                                  setModalState!(() {});
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                  padding:
                                                      addedEmailReminderList
                                                          .contains(
                                                            model
                                                                .emailController
                                                                .text,
                                                          )
                                                      ? EdgeInsets.all(4.0.w)
                                                      : EdgeInsets.all(4.0.w),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6.r,
                                                        ),
                                                    color:
                                                        addedEmailReminderList
                                                            .contains(
                                                              model
                                                                  .emailController
                                                                  .text,
                                                            )
                                                        ? AppColors.primary
                                                        : AppColors.transparent,
                                                    border: Border.all(
                                                      color:
                                                          addedEmailReminderList
                                                              .contains(
                                                                model
                                                                    .emailController
                                                                    .text,
                                                              )
                                                          ? AppColors
                                                                .transparent
                                                          : AppColors.infoGrey,
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
                                                text:
                                                    model.emailController.text,

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
                                                    padding: EdgeInsets.all(
                                                      1.2.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.app_green,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                        SizedBox(height: 15.20.h),
                                        ...emailReminderList.asMap().entries.map((
                                          entry,
                                        ) {
                                          final index = entry.key;
                                          final o = entry.value;
                                          final isLast =
                                              index ==
                                              emailReminderList.length - 1;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                        if (addedEmailReminderList
                                                            .contains(o)) {
                                                          addedEmailReminderList
                                                              .remove(o);
                                                        } else {
                                                          addedEmailReminderList
                                                              .add(o);
                                                        }
                                                        setModalState!(() {});
                                                        model.notifyListeners();
                                                      },
                                                      child: Container(
                                                        padding:
                                                            addedEmailReminderList
                                                                .contains(o)
                                                            ? EdgeInsets.all(
                                                                4.0.w,
                                                              )
                                                            : EdgeInsets.all(
                                                                10.w,
                                                              ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                6.r,
                                                              ),
                                                          color:
                                                              addedEmailReminderList
                                                                  .contains(o)
                                                              ? AppColors
                                                                    .primary
                                                              : AppColors
                                                                    .transparent,
                                                          border: Border.all(
                                                            color:
                                                                addedEmailReminderList
                                                                    .contains(o)
                                                                ? AppColors
                                                                      .transparent
                                                                : AppColors
                                                                      .infoGrey,
                                                            width: .78,
                                                          ),
                                                        ),
                                                        child:
                                                            addedEmailReminderList
                                                                .contains(o)
                                                            ? Icon(
                                                                Icons.check,
                                                                size: 12.sp,
                                                                color: AppColors
                                                                    .white,
                                                              )
                                                            : SizedBox.shrink(),
                                                      ),
                                                    ),
                                                    SizedBox(width: 9.10.w),
                                                    SizedBox(
                                                      width: 220.w,
                                                      child: TextView(
                                                        text: o,
                                                        maxLines: 1,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .reminder,
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
                                                              model: model,
                                                            );
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                                AppImage
                                                                    .edit_pen,
                                                                height: 22.0.h,
                                                                width: 22.0.w,
                                                              ),
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        GestureDetector(
                                                          onTap: () {
                                                            emailReminderList
                                                                .removeAt(
                                                                  index,
                                                                );
                                                            addedEmailReminderList
                                                                .remove(o);
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
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
                                                Divider(
                                                  color: AppColors.infoGrey1,
                                                ),
                                              SizedBox(height: 5.10.h),
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  SizedBox.shrink(),
                                  addedEmailReminderList.isEmpty
                                      ? TextView(
                                          text: 'Atleast one email is required',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.80.sp,
                                            color: AppColors.red,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 20.h),
                        isTappedPhoneAdded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: addedEmailReminderList.isEmpty
                                            ? AppColors.red
                                            : AppColors.infoGrey1,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.infoGrey1,
                                            ),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          addedPhoneReminderList
                                                              .isEmpty
                                                          ? AppColors.red
                                                          : AppColors.deep,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      TextView(
                                                        text:
                                                            'Numbers available',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 15.8.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .fineGrey,
                                                        ),
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              const Color.fromARGB(
                                                                255,
                                                                223,
                                                                233,
                                                                247,
                                                              ),

                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12.r,
                                                              ),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primary
                                                                .withOpacity(
                                                                  .4,
                                                                ),
                                                          ),
                                                        ),
                                                        child: TextView(
                                                          text:
                                                              '${phoneReminderList.length + 1}',
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 11.8.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .primary,
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
                                                      model.notifyListeners();
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
                                                      showPhoneDialog(
                                                        context,
                                                        model: model,
                                                      );

                                                      isPhoneValid = false;
                                                      model.notifyListeners();
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
                                          padding: EdgeInsets.only(
                                            left: 12.w,
                                            right: 20.w,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (addedPhoneReminderList.contains(
                                                    returnPhoneNoStructureWith234Rep(
                                                      model
                                                          .phoneNumberController
                                                          .text,
                                                    ),
                                                  )) {
                                                    addedPhoneReminderList.remove(
                                                      returnPhoneNoStructureWith234Rep(
                                                        model
                                                            .phoneNumberController
                                                            .text,
                                                      ),
                                                    );
                                                  } else {
                                                    addedPhoneReminderList
                                                        .clear();
                                                    addedPhoneReminderList.add(
                                                      returnPhoneNoStructureWith234Rep(
                                                        model
                                                            .phoneNumberController
                                                            .text,
                                                      ),
                                                    );
                                                  }
                                                  setModalState!(() {});
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                  padding:
                                                      addedPhoneReminderList.contains(
                                                        returnPhoneNoStructureWith234Rep(
                                                          model
                                                              .phoneNumberController
                                                              .text,
                                                        ),
                                                      )
                                                      ? EdgeInsets.all(4.0.w)
                                                      : EdgeInsets.all(4.0.w),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6.r,
                                                        ),
                                                    color:
                                                        addedPhoneReminderList.contains(
                                                          returnPhoneNoStructureWith234Rep(
                                                            model
                                                                .phoneNumberController
                                                                .text,
                                                          ),
                                                        )
                                                        ? AppColors.primary
                                                        : AppColors.transparent,
                                                    border: Border.all(
                                                      color:
                                                          addedPhoneReminderList
                                                              .contains(
                                                                returnPhoneNoStructureWith234Rep(
                                                                  model
                                                                      .phoneNumberController
                                                                      .text,
                                                                ),
                                                              )
                                                          ? AppColors
                                                                .transparent
                                                          : AppColors.infoGrey,
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
                                                  model
                                                      .phoneNumberController
                                                      .text,
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
                                                    padding: EdgeInsets.all(
                                                      1.2.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.app_green,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                        ...phoneReminderList.asMap().entries.map((
                                          entry,
                                        ) {
                                          final index = entry.key;
                                          final o = entry.value;
                                          final isLast =
                                              index ==
                                              phoneReminderList.length - 1;

                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                        if (addedPhoneReminderList
                                                            .contains(
                                                              returnPhoneNoStructureWith234(
                                                                o,
                                                              ),
                                                            )) {
                                                          addedPhoneReminderList
                                                              .remove(
                                                                returnPhoneNoStructureWith234(
                                                                  o,
                                                                ),
                                                              );
                                                        } else {
                                                          addedPhoneReminderList
                                                              .add(
                                                                returnPhoneNoStructureWith234(
                                                                  o,
                                                                ),
                                                              );
                                                        }
                                                        setModalState!(() {});
                                                        model.notifyListeners();
                                                      },
                                                      child: Container(
                                                        padding:
                                                            addedPhoneReminderList
                                                                .contains(
                                                                  returnPhoneNoStructureWith234(
                                                                    o,
                                                                  ),
                                                                )
                                                            ? EdgeInsets.all(
                                                                4.0.w,
                                                              )
                                                            : EdgeInsets.all(
                                                                10.w,
                                                              ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                6.r,
                                                              ),
                                                          color:
                                                              addedPhoneReminderList
                                                                  .contains(
                                                                    returnPhoneNoStructureWith234(
                                                                      o,
                                                                    ),
                                                                  )
                                                              ? AppColors
                                                                    .primary
                                                              : AppColors
                                                                    .transparent,
                                                          border: Border.all(
                                                            color:
                                                                addedPhoneReminderList
                                                                    .contains(
                                                                      returnPhoneNoStructureWith234(
                                                                        o,
                                                                      ),
                                                                    )
                                                                ? AppColors
                                                                      .transparent
                                                                : AppColors
                                                                      .infoGrey,
                                                            width: .78,
                                                          ),
                                                        ),
                                                        child:
                                                            addedPhoneReminderList
                                                                .contains(
                                                                  returnPhoneNoStructureWith234(
                                                                    o,
                                                                  ),
                                                                )
                                                            ? Icon(
                                                                Icons.check,
                                                                size: 12.sp,
                                                                color: AppColors
                                                                    .white,
                                                              )
                                                            : SizedBox.shrink(),
                                                      ),
                                                    ),
                                                    SizedBox(width: 9.10.w),
                                                    TextView(
                                                      text: formatPhoneNumber(
                                                        o,
                                                      ),
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.reminder,
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
                                                              model: model,
                                                            );
                                                            isPhoneValid =
                                                                false;
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                                AppImage
                                                                    .edit_pen,
                                                                height: 22.0.h,
                                                                width: 22.0.w,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          width: 16.10.w,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            phoneReminderList
                                                                .removeAt(
                                                                  index,
                                                                );
                                                            addedPhoneReminderList
                                                                .remove(o);
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
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
                                                Divider(
                                                  color: AppColors.infoGrey1,
                                                ),
                                              SizedBox(height: 5.10.h),
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.0.h),
                                  addedPhoneReminderList.isEmpty
                                      ? TextView(
                                          text:
                                              'Atleast one phone number is required',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.80.sp,
                                            color: AppColors.red,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 32.20.h),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              if (firstFormReminderKey.currentState!
                                  .validate()) {
                                model.addReminderToList(
                                  model: model,
                                  setModalState: setModalState,
                                  context: context,
                                );
                                onTapToAddAnotherReminder = true;
                                model.notifyListeners();
                              } else {
                                AppUtils.snackbar(
                                  context,
                                  message: 'Kindly input all required fields.',
                                  error: true,
                                );
                              }
                            },
                            child: TextView(
                              text: 'Add Another Medication',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 17.2.sp,
                                fontWeight: FontWeight.w500,
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
                          buttonText: 'Continue',
                          color: AppColors.white,
                          buttonBorderColor: AppColors.transparent,
                          isLoading: model.isLoading,
                          onPressed: () async {
                            if (firstFormReminderKey.currentState!.validate()) {
                              await model.addReminderToList(
                                model: model,
                                setModalState: setModalState,
                                context: context,
                              );
                              if (isTappedEmailAdded &&
                                      addedEmailReminderList.isEmpty ||
                                  isTappedPhoneAdded &&
                                      addedPhoneReminderList.isEmpty) {
                                if (isTappedEmailAdded &&
                                    addedEmailReminderList.isEmpty) {}
                                if (isTappedPhoneAdded &&
                                    addedPhoneReminderList.isEmpty) {}
                              } else {
                                linIndex++;
                                addCostTotal(model);
                              }
                              setModalState!(() {});
                              model.notifyListeners();
                            }
                          },
                        ),
                        SizedBox(height: 50.h),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        ...model.medicationClassList.asMap().entries.map((
                          entry,
                        ) {
                          MedicationClass e = entry.value;
                          int index = entry.key;
                          final doseItem = index < e.dosageMap.length
                              ? e.dosageMap[index]
                              : null;
                          final doses = doseItem?['doses'];
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
                                                hintWeight: FontWeight.w400,
                                                hintColor: AppColors.reminder,
                                                borderColor:
                                                    AppColors.infoGrey1,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                hintSize: Platform.isAndroid
                                                    ? 14.sp
                                                    : 12.sp,
                                                fillColor: AppColors.white,
                                                isFilled: true,
                                                focusNode: model
                                                    .medNameUpdateFocusNodes[index],
                                                controller: model
                                                    .medicationNameUpdateControllers[index],
                                                validator:
                                                    AppValidator.validateString(),
                                                style: TextStyle(
                                                  fontSize: 16.20.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'GoogleSans',
                                                ),
                                                onChange: (val) {
                                                  model
                                                          .medicationClassList[index]
                                                          .medicationName =
                                                      val;
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback((
                                                        _,
                                                      ) {
                                                        final controller = model
                                                            .medicationNameUpdateControllers[index];
                                                        final focusNode = model
                                                            .medNameUpdateFocusNodes[index];
                                                        // Keep cursor at end
                                                        controller.selection =
                                                            TextSelection.fromPosition(
                                                              TextPosition(
                                                                offset:
                                                                    controller
                                                                        .text
                                                                        .length,
                                                              ),
                                                            );

                                                        // Re-request focus
                                                        focusNode
                                                            .requestFocus();

                                                        // ;
                                                      });
                                                  model.notifyListeners();
                                                },
                                              ),
                                              SizedBox(height: 16.h),
                                              TextFormWidget(
                                                hint: 'Medication Type',
                                                hintWeight: FontWeight.w400,
                                                hintColor: AppColors.reminder,
                                                borderColor:
                                                    AppColors.infoGrey1,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                hintSize: Platform.isAndroid
                                                    ? 14.sp
                                                    : 12.sp,
                                                readOnly: true,
                                                fillColor: AppColors.white,
                                                isFilled: true,
                                                prefixWidget:
                                                    model
                                                        .medTypeUpdateIcon[index]
                                                        .isNotEmpty
                                                    ? Padding(
                                                        padding: EdgeInsets.all(
                                                          10.w,
                                                        ),
                                                        child: SvgPicture.asset(
                                                          model
                                                              .medTypeUpdateIcon[index],
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
                                                    final result =
                                                        await showMedTypeMenu(
                                                          context,
                                                        );

                                                    if (result != null) {
                                                      setModalState!(() {
                                                        model
                                                                .medicationClassList[index]
                                                                .medicationTypeIcon =
                                                            result["icon"] ??
                                                            '';
                                                        model
                                                                .medicationClassList[index]
                                                                .medicationType =
                                                            result["type"] ??
                                                            '';
                                                        final controller = model
                                                            .medTypeUpdateControllers[index];
                                                        final focusNode = model
                                                            .medNameUpdateFocusNodes[index]; // create a list of FocusNodes if you haven’t

                                                        controller.text =
                                                            result["type"] ??
                                                            '';
                                                        controller.selection =
                                                            TextSelection.fromPosition(
                                                              TextPosition(
                                                                offset:
                                                                    controller
                                                                        .text
                                                                        .length,
                                                              ),
                                                            );

                                                        // Re-request focus so user stays in the same field
                                                        focusNode
                                                            .requestFocus();
                                                      });
                                                    }
                                                    model.notifyListeners();
                                                  },
                                                ),
                                                controller: model
                                                    .medTypeUpdateControllers[index],
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
                                                text:
                                                    'Medication picture upload',
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
                                                                model.medicationFileUpdate[index] !=
                                                                    null
                                                                ? Image.file(
                                                                    model
                                                                        .medicationFileUpdate[index],
                                                                    height:
                                                                        75.80.h,
                                                                    width:
                                                                        70.80.w,
                                                                    errorBuilder:
                                                                        (
                                                                          context,
                                                                          error,
                                                                          stackTrace,
                                                                        ) => SvgPicture.asset(
                                                                          AppImage
                                                                              .image_icon,
                                                                        ),
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
                                                                medicationClassList[index]
                                                                        .medicationFile =
                                                                    null;
                                                                model
                                                                    .notifyListeners();
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
                                                              onTap: () => model
                                                                  .pickDrugUpdateImage(
                                                                    context:
                                                                        context,
                                                                    index:
                                                                        index,
                                                                  ),
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
                                                  color: AppColors.deep,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 12.h),
                                              Divider(color: AppColors.grey),
                                              SizedBox(height: 12.h),
                                              TextFormWidget(
                                                hint: 'Dosage',
                                                hintWeight: FontWeight.w400,
                                                hintColor: AppColors.reminder,
                                                hintSize: Platform.isAndroid
                                                    ? 14.sp
                                                    : 12.sp,
                                                borderColor:
                                                    AppColors.infoGrey1,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                controller: model
                                                    .dosageUpdateControllers[index],
                                                fillColor: AppColors.white,
                                                isFilled: true,
                                                readOnly:
                                                    model
                                                                .medicationClassList[index]
                                                                .medicationType ==
                                                            'Others' ||
                                                        model
                                                                .medicationClassList[index]
                                                                .medicationType ==
                                                            'custom'
                                                    ? false
                                                    : true,
                                                suffixWidget: IconButton(
                                                  onPressed:
                                                      model
                                                                  .medicationClassList[index]
                                                                  .medicationType ==
                                                              'Others' ||
                                                          model
                                                                  .medicationClassList[index]
                                                                  .medicationType ==
                                                              'custom'
                                                      ? () {}
                                                      : () async {
                                                          model.showMedDosageMenuUpdate(
                                                            context: context,
                                                            type: model
                                                                .medicationClassList[index]
                                                                .medicationType,
                                                            model: model,
                                                            index: index,
                                                          );
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
                                                hint: 'Frequency',
                                                hintWeight: FontWeight.w400,
                                                hintColor: AppColors.reminder,
                                                hintSize: Platform.isAndroid
                                                    ? 14.sp
                                                    : 12.sp,
                                                borderColor:
                                                    AppColors.infoGrey1,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                fillColor: AppColors.white,
                                                isFilled: true,
                                                readOnly: true,
                                                controller: TextEditingController(
                                                  text:
                                                      model
                                                              .medicationClassList[index]
                                                              .timesToTake ==
                                                          ''
                                                      ? ''
                                                      : model
                                                                .medicationClassList[index]
                                                                .timesToTake!
                                                                .toLowerCase() ==
                                                            'custom schedule'
                                                      ? model
                                                            .medicationClassList[index]
                                                            .timesToTake
                                                      : model.showNoTimesMode(
                                                          int.parse(
                                                            model
                                                                .medicationClassList[index]
                                                                .timesToTake!,
                                                          ),
                                                        ),
                                                ),
                                                suffixWidget: IconButton(
                                                  onPressed: () async {
                                                    final result = await model
                                                        .showDailyInTakeMenuUpdate(
                                                          context: context,
                                                          setModalState:
                                                              setModalState,
                                                          model: model,
                                                          index: index,
                                                        );
                                                    if (result != null) {
                                                      if (result == '0') {
                                                        model
                                                                .medicationClassList[index]
                                                                .isCusSchedule =
                                                            true;
                                                      } else {
                                                        model
                                                                .medicationClassList[index]
                                                                .isCusSchedule =
                                                            false;
                                                      }
                                                      model
                                                              .medicationClassList[index]
                                                              .timesToTake =
                                                          result;
                                                      setModalState!(() {});
                                                      model.notifyListeners();
                                                    }
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
                                                hint: 'Start Date',
                                                hintWeight: FontWeight.w400,
                                                hintColor: AppColors.reminder,
                                                hintSize: Platform.isAndroid
                                                    ? 14.sp
                                                    : 12.sp,
                                                borderColor:
                                                    AppColors.infoGrey1,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                readOnly: true,
                                                fillColor: AppColors.white,
                                                isFilled: true,
                                                controller: model
                                                    .startDateUpdateControllers[index],
                                                suffixWidget: Padding(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        model.selectDateUPDATE(
                                                          context: context,
                                                          index: index,
                                                          model: model,
                                                          setModalState:
                                                              setModalState,
                                                        ),
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
                                                label: '',
                                                hintWeight: FontWeight.w400,
                                                hintColor: AppColors.reminder,
                                                hintSize: Platform.isAndroid
                                                    ? 14.sp
                                                    : 12.sp,
                                                borderColor:
                                                    AppColors.infoGrey1,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                controller: model
                                                    .durationUpdateControllers[index],
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 16.2.sp,
                                                  color: AppColors.infoGrey,
                                                ),
                                                fillColor: AppColors.appWhite,
                                                isFilled: true,
                                                style: TextStyle(
                                                  fontSize: 16.20.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'GoogleSans',
                                                ),
                                                onChange: (p0) =>
                                                    _calculateEndDateUpdate(
                                                      setModalState:
                                                          setModalState,
                                                      model: model,
                                                      index: index,
                                                    ),
                                              ),
                                              SizedBox(height: 24.0.h),
                                              TextFormWidget(
                                                hint: 'End Date',
                                                hintWeight: FontWeight.w400,
                                                hintColor: AppColors.reminder,
                                                hintSize: Platform.isAndroid
                                                    ? 14.sp
                                                    : 12.sp,
                                                borderColor:
                                                    AppColors.infoGrey1,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                controller: model
                                                    .endDateUpdateController[index],
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
                                                // suffixWidget: Padding(
                                                //   padding: EdgeInsets.all(8.w),
                                                //   child: GestureDetector(
                                                //     onTap: () => model
                                                //         .selectEndDateUpdate(
                                                //           context: context,
                                                //           setModalState:
                                                //               setModalState,
                                                //           model: model,
                                                //           index: index,
                                                //         ),
                                                //     child: SvgPicture.asset(
                                                //       AppImage.calendar,
                                                //       fit: BoxFit.cover,
                                                //     ),
                                                //   ),
                                                // ),
                                              ),
                                              SizedBox(height: 24.0.h),

                                              // TextView(
                                              //   text: 'Duration',
                                              //   textStyle: TextStyle(
                                              //     fontFamily: 'Arial',
                                              //     fontSize: 14.sp,
                                              //     fontWeight: FontWeight.w400,
                                              //     color: AppColors.reminder,
                                              //   ),
                                              // ),
                                              // SizedBox(height: 14.0.h),
                                              // Container(
                                              //   padding: EdgeInsets.fromLTRB(
                                              //     16.w,
                                              //     0.w,
                                              //     0.w,
                                              //     0.w,
                                              //   ),
                                              //   width: double.infinity,
                                              //   height: 50.h,
                                              //   decoration: BoxDecoration(
                                              //     borderRadius:
                                              //         BorderRadius.circular(
                                              //           10.r,
                                              //         ),
                                              //     color: AppColors.dashboard,
                                              //   ),
                                              //   child: Row(
                                              //     children: [
                                              //       TextView(
                                              //         text: getReturnDurationNumberOfDays(
                                              //           int.parse(
                                              //             model
                                              //                 .medicationClassList[index]
                                              //                 .duration!,
                                              //           ),
                                              //         ),
                                              //         textStyle: TextStyle(
                                              //           fontFamily:
                                              //               'GoogleSans',
                                              //           fontSize: 16.sp,
                                              //           fontWeight:
                                              //               FontWeight.w700,
                                              //           color:
                                              //               AppColors.primary1,
                                              //         ),
                                              //       ),
                                              //       TextView(
                                              //         text:
                                              //             model
                                              //                     .endDateUpdateController[index]
                                              //                     .text ==
                                              //                 ''
                                              //             ? ''
                                              //             : ' (${model.startDateUpdateControllers[index].text.substring(0, 6)} - ${model.endDateUpdateController[index].text})',
                                              //         textStyle: TextStyle(
                                              //           fontFamily: 'Arial',
                                              //           fontSize: 14.sp,
                                              //           fontWeight:
                                              //               FontWeight.w400,
                                              //           color:
                                              //               AppColors.reminder,
                                              //         ),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                              SizedBox(height: 24.0.h),
                                              model
                                                      .medicationClassList[index]
                                                      .isCusSchedule!
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Stack(
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                TextView(
                                                                  text:
                                                                      'Configure Times Per Day',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  right: -12.10,
                                                                  child: TextView(
                                                                    text: '*',
                                                                    textStyle: TextStyle(
                                                                      fontFamily:
                                                                          'Arial',
                                                                      fontSize:
                                                                          18.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColors
                                                                          .red,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                TextView(
                                                                  text:
                                                                      'Copy Day 1 to All',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontSize:
                                                                        13.74
                                                                            .sp,
                                                                    color: AppColors
                                                                        .reminder,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 8.w,
                                                                ),

                                                                GestureDetector(
                                                                  onTap: () {
                                                                    isTappedCopyall =
                                                                        !isTappedCopyall;
                                                                    if (isTappedCopyall) {
                                                                      copyDayOneToAllUpdate(
                                                                        setModalState:
                                                                            setModalState,
                                                                        viewModel:
                                                                            model,
                                                                        timePerDay:
                                                                            e.dosageMap[0]['doses'],
                                                                        index:
                                                                            index,
                                                                      );
                                                                    }
                                                                    model
                                                                        .notifyListeners();
                                                                  },
                                                                  child: Container(
                                                                    padding:
                                                                        isTappedCopyall
                                                                        ? EdgeInsets.all(
                                                                            0.w,
                                                                          )
                                                                        : EdgeInsets.all(
                                                                            8.0.w,
                                                                          ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            4.r,
                                                                          ),
                                                                      color:
                                                                          isTappedCopyall
                                                                          ? AppColors.primary
                                                                          : AppColors.transparent,
                                                                      border: Border.all(
                                                                        color:
                                                                            isTappedCopyall
                                                                            ? AppColors.transparent
                                                                            : AppColors.infoGrey,
                                                                        width:
                                                                            .78,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        isTappedCopyall
                                                                        ? Icon(
                                                                            Icons.check,
                                                                            size:
                                                                                14.sp,
                                                                            color:
                                                                                AppColors.white,
                                                                          )
                                                                        : SizedBox.shrink(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 14.h),
                                                        SizedBox(
                                                          height:
                                                              List.generate(
                                                                int.parse(
                                                                  model
                                                                      .medicationClassList[index]
                                                                      .duration!,
                                                                ),
                                                                (index) =>
                                                                    index,
                                                              ).isEmpty
                                                              ? 0
                                                              : List.generate(
                                                                      int.parse(
                                                                        model
                                                                            .medicationClassList[index]
                                                                            .duration!,
                                                                      ),
                                                                      (index) =>
                                                                          index,
                                                                    ).length >
                                                                    1
                                                              ? 208.h
                                                              : 110.h,
                                                          child: SingleChildScrollView(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ...List.generate(
                                                                  int.parse(
                                                                    model
                                                                        .medicationClassList[index]
                                                                        .duration!,
                                                                  ),
                                                                  (index) =>
                                                                      index,
                                                                ).map((list) {
                                                                  if (list >=
                                                                      e
                                                                          .dosageMap
                                                                          .length) {
                                                                    model.buildEmptyCustomDosageMap(
                                                                      duration: int.parse(
                                                                        model
                                                                            .medicationClassList[index]
                                                                            .duration!,
                                                                      ),
                                                                      medicationIndex:
                                                                          index,
                                                                    );
                                                                    return const SizedBox.shrink();
                                                                  }
                                                                  return Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          10.w,
                                                                        ),
                                                                    margin: EdgeInsets.only(
                                                                      bottom:
                                                                          12.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color: AppColors
                                                                            .f1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                    ),
                                                                    child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            Container(
                                                                              padding: EdgeInsets.fromLTRB(
                                                                                12.w,
                                                                                3.84.w,
                                                                                12.0.w,
                                                                                3.84.w,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(
                                                                                  8.r,
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: AppColors.primaryLight.withOpacity(
                                                                                    .3,
                                                                                  ),
                                                                                ),
                                                                                color: AppColors.primaryLight.withOpacity(
                                                                                  .1,
                                                                                ),
                                                                              ),
                                                                              child: Column(
                                                                                children: [
                                                                                  TextView(
                                                                                    text: 'Day',
                                                                                    textStyle: TextStyle(
                                                                                      fontFamily: 'Arial',
                                                                                      fontSize: 12.sp,
                                                                                      fontWeight: FontWeight.w400,
                                                                                      color: AppColors.fineGrey,
                                                                                    ),
                                                                                  ),
                                                                                  TextView(
                                                                                    text: '${list + 1}',
                                                                                    textStyle: TextStyle(
                                                                                      fontFamily: 'GoogleSans',
                                                                                      fontSize: 16.sp,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: AppColors.reminder,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 4.0.w,
                                                                            ),

                                                                            Expanded(
                                                                              child: Container(
                                                                                padding: EdgeInsets.fromLTRB(
                                                                                  16.w,
                                                                                  8.0.w,
                                                                                  16.0.w,
                                                                                  8.0.w,
                                                                                ),
                                                                                width: double.infinity,
                                                                                height: 50.h,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                    10.r,
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: AppColors.infoGrey1,
                                                                                  ),
                                                                                  color: AppColors.white,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    TextView(
                                                                                      text: getTimeFreqCustom(
                                                                                        list,
                                                                                      ),
                                                                                      textStyle: TextStyle(
                                                                                        fontFamily: 'Arial',
                                                                                        fontSize: 14.sp,
                                                                                        fontWeight: FontWeight.w400,
                                                                                        color: AppColors.reminder,
                                                                                      ),
                                                                                    ),
                                                                                    IconButton(
                                                                                      onPressed: () {
                                                                                        final selectedIndex = model.selectedDoseIndexPerDay[list];

                                                                                        if (selectedIndex ==
                                                                                            null) {
                                                                                          // ❌ Nothing selected → don't update
                                                                                          return;
                                                                                        }
                                                                                        selectTimeFreqCustomUpdate(
                                                                                          context: context,
                                                                                          model: model,
                                                                                          medicationIndex: index,
                                                                                          dayIndex: list,
                                                                                          doseIndex: selectedIndex, // ✅ update mode
                                                                                          setModalState: setModalState!,
                                                                                        );
                                                                                        model.notifyListeners();
                                                                                      },
                                                                                      icon: Icon(
                                                                                        Icons.access_time_rounded,
                                                                                        color: AppColors.fineGrey,
                                                                                        size: 20.sp,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 4.0.w,
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                model.selectedDoseIndexPerDay[list] = null;
                                                                                selectTimeFreqCustomUpdate(
                                                                                  context: context,
                                                                                  model: model,
                                                                                  medicationIndex: index,
                                                                                  dayIndex: list,
                                                                                  doseIndex: null, // ✅ update mode
                                                                                  setModalState: setModalState!,
                                                                                );
                                                                                setModalState(
                                                                                  () {},
                                                                                );
                                                                                model.notifyListeners();
                                                                              },
                                                                              child: Container(
                                                                                padding: EdgeInsets.fromLTRB(
                                                                                  14.w,
                                                                                  8.0.w,
                                                                                  16.0.w,
                                                                                  8.0.w,
                                                                                ),
                                                                                width: 56.2,
                                                                                height: 50.h,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                    10.r,
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: AppColors.infoGrey1,
                                                                                  ),
                                                                                  color: AppColors.white,
                                                                                ),
                                                                                child: Center(
                                                                                  child: Icon(
                                                                                    Icons.add,
                                                                                    color: AppColors.fineGrey,
                                                                                    size: 20.sp,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 4.w,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.fromLTRB(
                                                                                7.8.w,
                                                                                1.0.w,
                                                                                7.8.w,
                                                                                1.0.w,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(
                                                                                  22,
                                                                                ),
                                                                                color: AppColors.lightBlue,
                                                                              ),
                                                                              child: TextView(
                                                                                text: '${e.dosageMap[list]['doses'].length}x',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'GoogleSans',
                                                                                  fontSize: 12.sp,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  color: AppColors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10.h,
                                                                        ),
                                                                        e.dosageMap[list]['doses']!.isNotEmpty
                                                                            ? Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.only(
                                                                                      top: 2.w,
                                                                                    ),
                                                                                    child: TextView(
                                                                                      text:
                                                                                          DateFormat(
                                                                                            'MMM dd',
                                                                                          ).format(
                                                                                            DateTime.parse(
                                                                                              model.pickedDatedStartString!,
                                                                                            ).add(
                                                                                              Duration(
                                                                                                days: list,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      textStyle: TextStyle(
                                                                                        fontFamily: 'Arial',
                                                                                        fontSize: 12.sp,
                                                                                        fontWeight: FontWeight.w400,
                                                                                        color: AppColors.fineGrey,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 10.w,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Wrap(
                                                                                      spacing: 10.0,
                                                                                      runSpacing: 10.0,
                                                                                      children: [
                                                                                        ...e.dosageMap[list]['doses'].asMap().entries.map(
                                                                                          (
                                                                                            entry,
                                                                                          ) {
                                                                                            final timeIndex = entry.key;
                                                                                            final time = entry.value;
                                                                                            return GestureDetector(
                                                                                              onTap: () {
                                                                                                model.selectedTimePerDay[list] = time['time'];
                                                                                                model.selectedDoseIndexPerDay[list] = timeIndex; // ✅ VERY IMPORTANT
                                                                                                model.timeSelected = time;
                                                                                                setModalState!(
                                                                                                  () {},
                                                                                                );
                                                                                                model.notifyListeners();
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 110.w,
                                                                                                padding: EdgeInsets.symmetric(
                                                                                                  vertical: 4.w,
                                                                                                  horizontal: 10.w,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(
                                                                                                    22.r,
                                                                                                  ),
                                                                                                  border: Border.all(
                                                                                                    color:
                                                                                                        model.selectedTimePerDay[list] ==
                                                                                                            time['time']
                                                                                                        ? AppColors.transparent
                                                                                                        : AppColors.app_green,
                                                                                                  ),
                                                                                                  color:
                                                                                                      model.selectedTimePerDay[list] ==
                                                                                                          time['time']
                                                                                                      ? AppColors.app_green
                                                                                                      : AppColors.white,
                                                                                                ),
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    TextView(
                                                                                                      text: time['time'],
                                                                                                      textStyle: TextStyle(
                                                                                                        fontFamily: 'GoogleSans',
                                                                                                        fontSize: 13.2.sp,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        color:
                                                                                                            model.selectedTimePerDay[list] ==
                                                                                                                time['time']
                                                                                                            ? AppColors.white
                                                                                                            : AppColors.app_green,
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      width: 6.w,
                                                                                                    ),
                                                                                                    GestureDetector(
                                                                                                      onTap: () {
                                                                                                        model.removeCustomTimeAt(
                                                                                                          model: model,
                                                                                                          medicationIndex: index,
                                                                                                          dayIndex: list,
                                                                                                          timeIndex: timeIndex,
                                                                                                        );
                                                                                                        setModalState!(
                                                                                                          () {},
                                                                                                        );
                                                                                                        model.notifyListeners();
                                                                                                      },
                                                                                                      child: SvgPicture.asset(
                                                                                                        AppImage.x,
                                                                                                        color:
                                                                                                            model.selectedTimePerDay[list] ==
                                                                                                                time['time']
                                                                                                            ? AppColors.white
                                                                                                            : AppColors.app_green,
                                                                                                        height: 16.20.h,
                                                                                                        width: 16.w,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            : SizedBox.shrink(),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            TextView(
                                                              text: 'Time',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                            Positioned(
                                                              right: -12.10,
                                                              child: TextView(
                                                                text: '*',
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      18.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      AppColors
                                                                          .red,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 14.h),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets.fromLTRB(
                                                                      16.w,
                                                                      8.0.w,
                                                                      16.0.w,
                                                                      8.0.w,
                                                                    ),
                                                                width: double
                                                                    .infinity,
                                                                height: 50.h,
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10.r,
                                                                      ),
                                                                  border: Border.all(
                                                                    color: AppColors
                                                                        .infoGrey1,
                                                                  ),
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    TextView(
                                                                      text:
                                                                          model
                                                                              .getTime ??
                                                                          '',
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            14.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                    IconButton(
                                                                      onPressed:
                                                                          model.medicationClassList[index].timesToTake ==
                                                                              'Custom Schedule'
                                                                          ? null
                                                                          // : model.selectedTimes.length >=
                                                                          //       int.parse(
                                                                          //         model.medicationClassList[index].timesToTake!,
                                                                          //       )
                                                                          // ? null
                                                                          : () => selectTimeFreqUpdate(
                                                                              context: context,
                                                                              setModalState: setModalState!,
                                                                              model: model,
                                                                              index: index,
                                                                            ),
                                                                      icon: Icon(
                                                                        Icons
                                                                            .access_time_rounded,
                                                                        color: AppColors
                                                                            .fineGrey,
                                                                        size: 20
                                                                            .sp,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 4.0.w,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                final maxTimes =
                                                                    int.parse(
                                                                      model
                                                                          .medicationClassList[index]
                                                                          .timesToTake!,
                                                                    );
                                                                if (model
                                                                        .selectedTimes
                                                                        .length <=
                                                                    maxTimes) {
                                                                  model.buildDosageMap(
                                                                    index:
                                                                        index,
                                                                    model:
                                                                        model,
                                                                  );
                                                                }
                                                                setModalState!(
                                                                  () {},
                                                                );
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets.fromLTRB(
                                                                      16.w,
                                                                      8.0.w,
                                                                      16.0.w,
                                                                      8.0.w,
                                                                    ),
                                                                width: 62,
                                                                height: 50.h,
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10.r,
                                                                      ),
                                                                  border: Border.all(
                                                                    color: AppColors
                                                                        .infoGrey1,
                                                                  ),
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                ),
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: AppColors
                                                                      .fineGrey,
                                                                  size: 20.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 24.0.h,
                                                        ),

                                                        if (doses != null &&
                                                            doses.isNotEmpty)
                                                          Wrap(
                                                            spacing: 10.0,
                                                            runSpacing: 10.0,
                                                            children: [
                                                              ...doses.asMap().entries.map((
                                                                entry,
                                                              ) {
                                                                final timeIndex =
                                                                    entry.key;
                                                                final time =
                                                                    entry.value;

                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    model.getTime =
                                                                        time['time'];
                                                                    model.globalTimeIndex =
                                                                        timeIndex;
                                                                    setModalState
                                                                        ?.call(
                                                                          () {},
                                                                        );
                                                                    model
                                                                        .notifyListeners();
                                                                  },
                                                                  child: Container(
                                                                    width:
                                                                        110.w,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          4.w,
                                                                      horizontal:
                                                                          10.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            22.r,
                                                                          ),
                                                                      border: Border.all(
                                                                        color:
                                                                            model.getTime ==
                                                                                time['time']
                                                                            ? AppColors.transparent
                                                                            : AppColors.app_green,
                                                                      ),
                                                                      color:
                                                                          model.getTime ==
                                                                              time['time']
                                                                          ? AppColors.app_green
                                                                          : AppColors.white,
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        TextView(
                                                                          text:
                                                                              time['time'],
                                                                          textStyle: TextStyle(
                                                                            fontFamily:
                                                                                'GoogleSans',
                                                                            fontSize:
                                                                                13.2.sp,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color:
                                                                                model.getTime ==
                                                                                    time['time']
                                                                                ? AppColors.white
                                                                                : AppColors.app_green,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              6.w,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap: () {
                                                                            model.removeTimeAt(
                                                                              model: model,
                                                                              medicationIndex: index,
                                                                              timeIndex: timeIndex,
                                                                            );
                                                                            setModalState?.call(
                                                                              () {},
                                                                            );
                                                                            model.notifyListeners();
                                                                          },
                                                                          child: SvgPicture.asset(
                                                                            AppImage.x,
                                                                            color:
                                                                                model.getTime ==
                                                                                    time['time']
                                                                                ? AppColors.white
                                                                                : AppColors.app_green,
                                                                            height:
                                                                                16.20.h,
                                                                            width:
                                                                                16.w,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            ],
                                                          )
                                                        else
                                                          SizedBox.shrink(),
                                                      ],
                                                    ),

                                              SizedBox(height: 20.h),
                                              TextFormWidget(
                                                hint: 'Notes & Instructions',
                                                hintWeight: FontWeight.w400,
                                                hintColor: AppColors.reminder,
                                                hintSize: Platform.isAndroid
                                                    ? 14.sp
                                                    : 12.sp,
                                                borderColor:
                                                    AppColors.infoGrey1,
                                                label:
                                                    'e.g. Take with food, avoid grapefruit juice',
                                                labelStyle: TextStyle(
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.infoGrey,
                                                  fontFamily: 'Arial',
                                                ),
                                                isShowHint: true,
                                                borderTopLeft: 10.r,
                                                borderTopRight: 10.r,
                                                borderBottomLeft: 10.r,
                                                borderBottomRight: 10.r,
                                                controller: model
                                                    .noteUpdateController[index],
                                                onChange: (v) {
                                                  model
                                                          .medicationClassList[index]
                                                          .note =
                                                      v;
                                                  setModalState!(() {});
                                                  model.notifyListeners();
                                                },
                                                fillColor: AppColors.white,
                                                isFilled:
                                                    true, // Minimum number of lines visible
                                                maxline:
                                                    3, // Maximum number of lines visible before scrolling
                                                keyboardType:
                                                    TextInputType.multiline,
                                                validator:
                                                    AppValidator.validateString(),
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                                style: TextStyle(
                                                  fontSize: 16.20.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'GoogleSans',
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              TextView(
                                                text:
                                                    'These notes will be included in notification messages',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 12.4.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.infoGrey,
                                                ),
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
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            border: Border.all(
                                              color: AppColors.infoGrey1,
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
                            ? SizedBox.shrink()
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.all(10.w),
                                            child: GestureDetector(
                                              onTap: () {
                                                onTapToAddAnotherReminder =
                                                    false;
                                                model.notifyListeners();
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
                                          hintWeight: FontWeight.w400,
                                          hintColor: AppColors.reminder,
                                          borderColor: AppColors.infoGrey1,
                                          borderTopLeft: 10.r,
                                          borderTopRight: 10.r,
                                          borderBottomLeft: 10.r,
                                          borderBottomRight: 10.r,
                                          hintSize: Platform.isAndroid
                                              ? 14.sp
                                              : 12.sp,
                                          fillColor: AppColors.white,
                                          isFilled: true,
                                          controller: model.medNameController,
                                          validator:
                                              AppValidator.validateString(),
                                          style: TextStyle(
                                            fontSize: 16.20.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'GoogleSans',
                                          ),
                                        ),

                                        SizedBox(height: 16.h),
                                        TextFormWidget(
                                          hint: 'Medication Type',
                                          hintWeight: FontWeight.w400,
                                          hintColor: AppColors.reminder,
                                          borderColor: AppColors.infoGrey1,
                                          borderTopLeft: 10.r,
                                          borderTopRight: 10.r,
                                          borderBottomLeft: 10.r,
                                          borderBottomRight: 10.r,
                                          hintSize: Platform.isAndroid
                                              ? 14.sp
                                              : 12.sp,
                                          readOnly: true,
                                          fillColor: AppColors.white,
                                          isFilled: true,
                                          prefixWidget:
                                              model
                                                  .medTypeResultImage
                                                  .isNotEmpty
                                              ? Padding(
                                                  padding: EdgeInsets.all(10.w),
                                                  child: SvgPicture.asset(
                                                    model.medTypeResultImage,
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
                                              final result = await model
                                                  .showMedTypeMenu(context);

                                              if (result != null) {
                                                setModalState!(() {
                                                  model.medTypeResultImage =
                                                      result["icon"] ?? '';
                                                  model.medTypeController.text =
                                                      result["type"] ?? '';
                                                });
                                              }
                                            },
                                          ),
                                          controller: model.medTypeController,
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
                                                    BorderRadius.circular(10.r),
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
                                                          model.imageDrug !=
                                                              null
                                                          ? Image.file(
                                                              model.imageDrug!,
                                                              height: 75.80.h,
                                                              width: 70.80.w,
                                                              errorBuilder:
                                                                  (
                                                                    context,
                                                                    error,
                                                                    stackTrace,
                                                                  ) => SvgPicture.asset(
                                                                    AppImage
                                                                        .image_icon,
                                                                  ),
                                                            )
                                                          : SvgPicture.asset(
                                                              AppImage
                                                                  .image_icon,
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
                                                                model
                                                                    .notifyListeners();
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
                                                              onTap: () => model
                                                                  .pickDrugImage(
                                                                    context,
                                                                  ),
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
                                                        )
                                                      : GestureDetector(
                                                          onTap: () => model
                                                              .pickDrugImage(
                                                                context,
                                                              ),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      22.w,
                                                                  vertical:
                                                                      10.10.w,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        32,
                                                                      ),
                                                                  color:
                                                                      AppColors
                                                                          .grey,
                                                                ),
                                                            child: TextView(
                                                              text: 'Upload',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize:
                                                                    14.40.sp,
                                                                color: AppColors
                                                                    .deep,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
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
                                            color: AppColors.deep,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        Divider(color: AppColors.grey),
                                        SizedBox(height: 12.h),
                                        TextFormWidget(
                                          hint: 'Dosage',
                                          hintWeight: FontWeight.w400,
                                          hintColor: AppColors.reminder,
                                          hintSize: Platform.isAndroid
                                              ? 14.sp
                                              : 12.sp,
                                          borderColor: AppColors.infoGrey1,
                                          borderTopLeft: 10.r,
                                          borderTopRight: 10.r,
                                          borderBottomLeft: 10.r,
                                          borderBottomRight: 10.r,
                                          controller: model.medDosageController,
                                          fillColor: AppColors.white,
                                          isFilled: true,
                                          readOnly:
                                              model.medTypeController.text ==
                                                      'Others' ||
                                                  model
                                                          .medDosageController
                                                          .text ==
                                                      'custom'
                                              ? false
                                              : true,
                                          suffixWidget: IconButton(
                                            onPressed:
                                                model.medTypeController.text ==
                                                        'Others' ||
                                                    model
                                                            .medTypeController
                                                            .text ==
                                                        'custom'
                                                ? () {}
                                                : () async {
                                                    showMedDosageMenu(
                                                      context: context,
                                                      type: model
                                                          .medTypeController
                                                          .text,
                                                      model: model,
                                                    );
                                                  },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColors.faintedGrey,
                                              size: 20.sp,
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontSize: 15.20.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Arial',
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        SizedBox(height: 24.0.h),
                                        TextFormWidget(
                                          hint: 'Frequency',
                                          hintWeight: FontWeight.w400,
                                          hintColor: AppColors.reminder,
                                          hintSize: Platform.isAndroid
                                              ? 14.sp
                                              : 12.sp,
                                          borderColor: AppColors.infoGrey1,
                                          borderTopLeft: 10.r,
                                          borderTopRight: 10.r,
                                          borderBottomLeft: 10.r,
                                          borderBottomRight: 10.r,
                                          fillColor: AppColors.white,
                                          isFilled: true,
                                          readOnly: true,
                                          controller: TextEditingController(
                                            text:
                                                model
                                                        .medDailyInTakenController
                                                        .text ==
                                                    ''
                                                ? ''
                                                : model
                                                          .medDailyInTakenController
                                                          .text
                                                          .toLowerCase() ==
                                                      'custom schedule'
                                                ? model
                                                      .medDailyInTakenController
                                                      .text
                                                : showNoTimesMode(
                                                    int.parse(
                                                      model
                                                          .medDailyInTakenController
                                                          .text,
                                                    ),
                                                  ),
                                          ),
                                          suffixWidget: IconButton(
                                            onPressed: () async {
                                              final result =
                                                  await showDailyInTakeMenu(
                                                    context: context,
                                                    setModalState:
                                                        setModalState,
                                                    model: model,
                                                  );
                                              if (result != null) {
                                                setModalState!(() {
                                                  model
                                                          .medDailyInTakenController
                                                          .text =
                                                      result;
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColors.faintedGrey,
                                              size: 20.sp,
                                            ),
                                          ),
                                          validator:
                                              AppValidator.validateString(),
                                          style: TextStyle(
                                            fontSize: 15.20.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'GoogleSans',
                                          ),
                                        ),
                                        SizedBox(height: 24.0.h),
                                        TextFormWidget(
                                          hint: 'Start Date',
                                          borderColor: AppColors.infoGrey1,
                                          borderTopLeft: 10.r,
                                          borderTopRight: 10.r,
                                          borderBottomLeft: 10.r,
                                          borderBottomRight: 10.r,
                                          readOnly: true,
                                          hintSize: 12.52.sp,
                                          fillColor: AppColors.white,
                                          isFilled: true,
                                          controller: model.dateTimeController,
                                          suffixWidget: Padding(
                                            padding: EdgeInsets.all(8.w),
                                            child: GestureDetector(
                                              onTap: () => model.selectDate(
                                                context: context,
                                                setModalState: setModalState,
                                              ),
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
                                          label: '',
                                          hintWeight: FontWeight.w400,
                                          hintColor: AppColors.reminder,
                                          hintSize: Platform.isAndroid
                                              ? 14.sp
                                              : 12.sp,
                                          borderColor: AppColors.infoGrey1,
                                          borderTopLeft: 10.r,
                                          borderTopRight: 10.r,
                                          borderBottomLeft: 10.r,
                                          borderBottomRight: 10.r,
                                          controller:
                                              model.medDurationController,
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Arial',
                                            fontSize: 16.2.sp,
                                            color: AppColors.infoGrey,
                                          ),
                                          fillColor: AppColors.appWhite,
                                          isFilled: true,
                                          style: TextStyle(
                                            fontSize: 16.20.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'GoogleSans',
                                          ),
                                          onChange: (p0) => _calculateEndDate(
                                            setModalState: setModalState,
                                            model: model,
                                          ),
                                        ),
                                        SizedBox(height: 24.0.h),
                                        TextFormWidget(
                                          hint: 'End Date',
                                          label: '18 Feb, 2026',
                                          hintWeight: FontWeight.w400,
                                          hintColor: AppColors.reminder,
                                          hintSize: Platform.isAndroid
                                              ? 14.sp
                                              : 12.sp,
                                          borderColor: AppColors.infoGrey1,
                                          borderTopLeft: 10.r,
                                          borderTopRight: 10.r,
                                          borderBottomLeft: 10.r,
                                          borderBottomRight: 10.r,
                                          controller: model.endDateController,
                                          // suffixWidget: Padding(
                                          //   padding: EdgeInsets.all(8.w),
                                          //   child: GestureDetector(
                                          //     onTap: () => model.selectEndDate(
                                          //       context: context,
                                          //       setModalState: setModalState,
                                          //     ),
                                          //     child: SvgPicture.asset(
                                          //       AppImage.calendar,
                                          //       fit: BoxFit.cover,
                                          //     ),
                                          //   ),
                                          // ),
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
                                        // TextView(
                                        //   text: 'Duration',
                                        //   textStyle: TextStyle(
                                        //     fontFamily: 'Arial',
                                        //     fontSize: 14.sp,
                                        //     fontWeight: FontWeight.w400,
                                        //     color: AppColors.reminder,
                                        //   ),
                                        // ),
                                        // SizedBox(height: 14.0.h),
                                        // Container(
                                        //   padding: EdgeInsets.fromLTRB(
                                        //     16.w,
                                        //     0.w,
                                        //     0.w,
                                        //     0.w,
                                        //   ),
                                        //   width: double.infinity,
                                        //   height: 50.h,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(
                                        //       10.r,
                                        //     ),
                                        //     color: AppColors.dashboard,
                                        //   ),
                                        //   child: Row(
                                        //     children: [
                                        //       TextView(
                                        //         text:
                                        //             model
                                        //                 .numberOfDurationsInDays ??
                                        //             '',
                                        //         textStyle: TextStyle(
                                        //           fontFamily: 'GoogleSans',
                                        //           fontSize: 14.sp,
                                        //           fontWeight: FontWeight.w700,
                                        //           color: AppColors.primary1,
                                        //         ),
                                        //       ),
                                        //       TextView(
                                        //         text:
                                        //             model
                                        //                     .endDateController
                                        //                     .text !=
                                        //                 ''
                                        //             ? ' (${model.dateTimeController.text.substring(0, 6)} - ${model.endDateController.text})'
                                        //             : '',
                                        //         textStyle: TextStyle(
                                        //           fontFamily: 'Arial',
                                        //           fontSize: 14.sp,
                                        //           fontWeight: FontWeight.w400,
                                        //           color: AppColors.reminder,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // SizedBox(height: 24.0.h),
                                        model.isCusSchedule
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Configure Times Per Day',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Copy Day 1 to All',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize:
                                                                  13.74.sp,
                                                              color: AppColors
                                                                  .reminder,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          SizedBox(width: 8.w),

                                                          GestureDetector(
                                                            onTap: () {
                                                              isTappedCopyall =
                                                                  !isTappedCopyall;
                                                              if (isTappedCopyall) {
                                                                copyDayOneToAll(
                                                                  setModalState:
                                                                      setModalState!,
                                                                  viewModel:
                                                                      model,
                                                                );
                                                              }
                                                              model
                                                                  .notifyListeners();
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  isTappedCopyall
                                                                  ? EdgeInsets.all(
                                                                      0.w,
                                                                    )
                                                                  : EdgeInsets.all(
                                                                      8.0.w,
                                                                    ),
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      4.r,
                                                                    ),
                                                                color:
                                                                    isTappedCopyall
                                                                    ? AppColors
                                                                          .primary
                                                                    : AppColors
                                                                          .transparent,
                                                                border: Border.all(
                                                                  color:
                                                                      isTappedCopyall
                                                                      ? AppColors
                                                                            .transparent
                                                                      : AppColors
                                                                            .infoGrey,
                                                                  width: .78,
                                                                ),
                                                              ),
                                                              child:
                                                                  isTappedCopyall
                                                                  ? Icon(
                                                                      Icons
                                                                          .check,
                                                                      size:
                                                                          14.sp,
                                                                      color: AppColors
                                                                          .white,
                                                                    )
                                                                  : SizedBox.shrink(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 14.h),
                                                  SizedBox(
                                                    height:
                                                        model
                                                            .intListCustom
                                                            .isEmpty
                                                        ? 0.h
                                                        : model
                                                                  .intListCustom
                                                                  .length >
                                                              1
                                                        ? 208.h
                                                        : 110.h,
                                                    child: SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          ...model.intListCustom.map(
                                                            (e) => Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              margin:
                                                                  EdgeInsets.only(
                                                                    bottom:
                                                                        12.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color:
                                                                      AppColors
                                                                          .f1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                          12.w,
                                                                          3.84.w,
                                                                          12.0.w,
                                                                          3.84.w,
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            8.r,
                                                                          ),
                                                                          border: Border.all(
                                                                            color: AppColors.primaryLight.withOpacity(
                                                                              .3,
                                                                            ),
                                                                          ),
                                                                          color: AppColors
                                                                              .primaryLight
                                                                              .withOpacity(
                                                                                .1,
                                                                              ),
                                                                        ),
                                                                        child: Column(
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Day',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'Arial',
                                                                                fontSize: 12.sp,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: AppColors.fineGrey,
                                                                              ),
                                                                            ),
                                                                            TextView(
                                                                              text: '${e + 1}',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 16.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            4.0.w,
                                                                      ),

                                                                      Expanded(
                                                                        child: Container(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                            12.w,
                                                                            8.0.w,
                                                                            4.w,
                                                                            10.0.w,
                                                                          ),
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              50.h,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                              10.r,
                                                                            ),
                                                                            border: Border.all(
                                                                              color: AppColors.infoGrey1,
                                                                            ),
                                                                            color:
                                                                                AppColors.white,
                                                                          ),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              TextView(
                                                                                text: getTimeFreqCustom(
                                                                                  e,
                                                                                ),
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 14.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.reminder,
                                                                                ),
                                                                              ),
                                                                              IconButton(
                                                                                onPressed: () {
                                                                                  selectTimeFreqCustom(
                                                                                    context: context,
                                                                                    dayIndex: e,
                                                                                    setModalState: setModalState,
                                                                                    model: model,
                                                                                  );
                                                                                  model.notifyListeners();
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.access_time_rounded,
                                                                                  color: AppColors.fineGrey,
                                                                                  size: 20.sp,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            4.0.w,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap: () {
                                                                          selectedTimePerDay[e] =
                                                                              null;
                                                                          model.addTimeForDay(
                                                                            e,
                                                                            setModalState!,
                                                                          );
                                                                        },
                                                                        child: Container(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                            14.w,
                                                                            8.0.w,
                                                                            16.0.w,
                                                                            8.0.w,
                                                                          ),
                                                                          width:
                                                                              56.2,
                                                                          height:
                                                                              50.h,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                              10.r,
                                                                            ),
                                                                            border: Border.all(
                                                                              color: AppColors.infoGrey1,
                                                                            ),
                                                                            color:
                                                                                AppColors.white,
                                                                          ),
                                                                          child: Center(
                                                                            child: Icon(
                                                                              Icons.add,
                                                                              color: AppColors.fineGrey,
                                                                              size: 20.sp,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            4.w,
                                                                      ),
                                                                      Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                          7.8.w,
                                                                          1.0.w,
                                                                          7.8.w,
                                                                          1.0.w,
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            22,
                                                                          ),
                                                                          color:
                                                                              AppColors.lightBlue,
                                                                        ),
                                                                        child: TextView(
                                                                          text:
                                                                              '${model.timesPerDay[e]!.length}x',
                                                                          textStyle: TextStyle(
                                                                            fontFamily:
                                                                                'GoogleSans',
                                                                            fontSize:
                                                                                12.sp,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color:
                                                                                AppColors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        10.h,
                                                                  ),
                                                                  model
                                                                          .timesPerDay[e]!
                                                                          .isNotEmpty
                                                                      ? Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(
                                                                                top: 2.w,
                                                                              ),
                                                                              child: TextView(
                                                                                text:
                                                                                    DateFormat(
                                                                                      'MMM dd',
                                                                                    ).format(
                                                                                      DateTime.parse(
                                                                                        model.pickedDatedStartString!,
                                                                                      ).add(
                                                                                        Duration(
                                                                                          days: e,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 12.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10.w,
                                                                            ),
                                                                            Expanded(
                                                                              child: Wrap(
                                                                                spacing: 10.0,
                                                                                runSpacing: 10.0,
                                                                                children: [
                                                                                  ...model.timesPerDay[e]!.map(
                                                                                    (
                                                                                      time,
                                                                                    ) => GestureDetector(
                                                                                      onTap: () {
                                                                                        selectedTimePerDay[e] = time;
                                                                                        setModalState!(
                                                                                          () {},
                                                                                        );
                                                                                        model.notifyListeners();
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 110.w,
                                                                                        padding: EdgeInsets.symmetric(
                                                                                          vertical: 4.w,
                                                                                          horizontal: 10.w,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(
                                                                                            22.r,
                                                                                          ),
                                                                                          border: Border.all(
                                                                                            color:
                                                                                                selectedTimePerDay[e] ==
                                                                                                    time
                                                                                                ? AppColors.transparent
                                                                                                : AppColors.app_green,
                                                                                          ),
                                                                                          color:
                                                                                              selectedTimePerDay[e] ==
                                                                                                  time
                                                                                              ? AppColors.app_green
                                                                                              : AppColors.white,
                                                                                        ),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            TextView(
                                                                                              text: time,
                                                                                              textStyle: TextStyle(
                                                                                                fontFamily: 'GoogleSans',
                                                                                                fontSize: 13.2.sp,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                color:
                                                                                                    selectedTimePerDay[e] ==
                                                                                                        time
                                                                                                    ? AppColors.white
                                                                                                    : AppColors.app_green,
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              width: 6.w,
                                                                                            ),
                                                                                            GestureDetector(
                                                                                              onTap: () {
                                                                                                model.removeTimeForDay(
                                                                                                  e,
                                                                                                  time,
                                                                                                  setModalState!,
                                                                                                );
                                                                                              },
                                                                                              child: SvgPicture.asset(
                                                                                                AppImage.x,
                                                                                                color:
                                                                                                    selectedTimePerDay[e] ==
                                                                                                        time
                                                                                                    ? AppColors.white
                                                                                                    : AppColors.app_green,
                                                                                                height: 16.20.h,
                                                                                                width: 16.w,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      : SizedBox.shrink(),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      TextView(
                                                        text: 'Time',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: -12.10,
                                                        child: TextView(
                                                          text: '*',
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 14.h),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            formattedSelectedTimeAndPeriod =
                                                                '--:--';
                                                            model.globalTimeIndex =
                                                                null;
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.fromLTRB(
                                                                  16.w,
                                                                  8.0.w,
                                                                  16.0.w,
                                                                  8.0.w,
                                                                ),
                                                            width:
                                                                double.infinity,
                                                            height: 50.h,
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10.r,
                                                                  ),
                                                              border: Border.all(
                                                                color: AppColors
                                                                    .infoGrey1,
                                                              ),
                                                              color: AppColors
                                                                  .white,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                TextView(
                                                                  text:
                                                                      getTimeFreq(),
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed: () {
                                                                    selectTimeFreq(
                                                                      context:
                                                                          context,
                                                                      model:
                                                                          model,
                                                                    );
                                                                    setModalState!(
                                                                      () {},
                                                                    );
                                                                    model
                                                                        .notifyListeners();
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .access_time_rounded,
                                                                    color: AppColors
                                                                        .fineGrey,
                                                                    size: 20.sp,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 4.0.w),
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (model
                                                                      .medDailyInTakenController
                                                                      .text !=
                                                                  '' &&
                                                              model
                                                                      .formattedSelectedTimeAndPeriodList!
                                                                      .length <
                                                                  int.parse(
                                                                    model
                                                                        .medDailyInTakenController
                                                                        .text,
                                                                  )) {
                                                            if (model
                                                                .formattedSelectedTimeAndPeriodList!
                                                                .contains(
                                                                  formattedSelectedTimeAndPeriod,
                                                                )) {
                                                              formattedSelectedTimeAndPeriod =
                                                                  '--:--';
                                                              model.globalTimeIndex =
                                                                  null;
                                                            } else {
                                                              model
                                                                  .formattedSelectedTimeAndPeriodList!
                                                                  .add(
                                                                    formattedSelectedTimeAndPeriod!,
                                                                  );
                                                            }
                                                          } else {}
                                                          setModalState!(() {});
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                16.w,
                                                                8.0.w,
                                                                16.0.w,
                                                                8.0.w,
                                                              ),
                                                          width: 62,
                                                          height: 50.h,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10.r,
                                                                ),
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .infoGrey1,
                                                            ),
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          child: Icon(
                                                            Icons.add,
                                                            color: AppColors
                                                                .fineGrey,
                                                            size: 20.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 24.0.h),
                                                  model
                                                          .formattedSelectedTimeAndPeriodList!
                                                          .isNotEmpty
                                                      ? Wrap(
                                                          spacing: 10.0,
                                                          runSpacing: 10.0,
                                                          children: [
                                                            ...model.formattedSelectedTimeAndPeriodList!.asMap().entries.map((
                                                              entry,
                                                            ) {
                                                              final index = entry
                                                                  .key; // ✅ index
                                                              final value =
                                                                  entry.value;
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  formattedSelectedTimeAndPeriod =
                                                                      value;
                                                                  model.formattedSelectedTimeAndPeriod =
                                                                      value;
                                                                  model.globalTimeIndex =
                                                                      index;
                                                                  setModalState!(
                                                                    () {},
                                                                  );
                                                                  model
                                                                      .notifyListeners();
                                                                },
                                                                child: Container(
                                                                  width: 104.w,
                                                                  padding: EdgeInsets.symmetric(
                                                                    vertical:
                                                                        4.w,
                                                                    horizontal:
                                                                        10.w,
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          22.r,
                                                                        ),
                                                                    border: Border.all(
                                                                      color:
                                                                          formattedSelectedTimeAndPeriod ==
                                                                              value
                                                                          ? AppColors.transparent
                                                                          : AppColors.app_green,
                                                                    ),
                                                                    color:
                                                                        formattedSelectedTimeAndPeriod ==
                                                                            value
                                                                        ? AppColors
                                                                              .app_green
                                                                        : AppColors
                                                                              .white,
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      TextView(
                                                                        text:
                                                                            value,
                                                                        textStyle: TextStyle(
                                                                          fontFamily:
                                                                              'GoogleSans',
                                                                          fontSize:
                                                                              13.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              formattedSelectedTimeAndPeriod ==
                                                                                  value
                                                                              ? AppColors.white
                                                                              : AppColors.app_green,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            6.w,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap: () {
                                                                          model.formattedSelectedTimeAndPeriodList!.remove(
                                                                            value,
                                                                          );
                                                                          setModalState!(
                                                                            () {},
                                                                          );
                                                                          model
                                                                              .notifyListeners();
                                                                        },
                                                                        child: SvgPicture.asset(
                                                                          AppImage
                                                                              .x,
                                                                          color:
                                                                              formattedSelectedTimeAndPeriod ==
                                                                                  value
                                                                              ? AppColors.white
                                                                              : AppColors.app_green,
                                                                          height:
                                                                              16.20.h,
                                                                          width:
                                                                              16.w,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                          ],
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),

                                        SizedBox(height: 20.h),
                                        TextFormWidget(
                                          hint: 'Notes & Instructions',
                                          hintWeight: FontWeight.w400,
                                          hintColor: AppColors.reminder,
                                          hintSize: Platform.isAndroid
                                              ? 14.sp
                                              : 12.sp,
                                          borderColor: AppColors.infoGrey1,
                                          label:
                                              'e.g. Take with food, avoid grapefruit juice',
                                          labelStyle: TextStyle(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.infoGrey,
                                            fontFamily: 'Arial',
                                          ),
                                          isShowHint: true,
                                          borderTopLeft: 10.r,
                                          borderTopRight: 10.r,
                                          borderBottomLeft: 10.r,
                                          borderBottomRight: 10.r,
                                          controller: model.noteController,
                                          fillColor: AppColors.white,
                                          isFilled:
                                              true, // Minimum number of lines visible
                                          maxline:
                                              3, // Maximum number of lines visible before scrolling
                                          keyboardType: TextInputType.multiline,
                                          validator:
                                              AppValidator.validateString(),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          style: TextStyle(
                                            fontSize: 16.20.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'GoogleSans',
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        TextView(
                                          text:
                                              'These notes will be included in notification messages',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 12.4.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(height: 24.0.h),
                        TextView(
                          text: 'NOTIFICATION CHANNELSmmm',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.80.sp,
                            color: AppColors.deep,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Divider(color: AppColors.grey),
                        SizedBox(height: 8.2.h),
                        ...List.generate(channels.length, (index) {
                          return chooseNotChannelWidget(
                            context,
                            svgIcon: channels[index].notificationIcon!,
                            text: channels[index].notification!,
                            isTapped: selectedIndexes.contains(
                              index,
                            ), // ✅ reflect state
                            onTap: () {
                              if (selectedIndexes.contains(index)) {
                                // unselect
                                selectedIndexes.remove(index);
                                if (!selectedIndexes.contains(0) &&
                                    !selectedIndexes.contains(1)) {
                                  addedEmailReminderList.clear();
                                  isTappedEmailAdded = false;
                                  model.notifyListeners();
                                }
                                if (!selectedIndexes.contains(2) &&
                                    !selectedIndexes.contains(3) &&
                                    !selectedIndexes.contains(4)) {
                                  addedPhoneReminderList.clear();
                                  isTappedPhoneAdded = false;
                                  model.notifyListeners();
                                }
                              } else {
                                // select
                                selectedIndexes.add(index);
                                // ✅ Show specific dialogs
                                if (index == 0 || index == 1) {
                                  // Email
                                  // showEmailDialog(context);
                                  isTappedEmailAdded = true;
                                  model.notifyListeners();
                                } else if ([2, 3, 4].contains(index)) {
                                  // Phone-related channels

                                  // showPhoneDialog(context);
                                  isTappedPhoneAdded = true;
                                  isPhoneValid = false;
                                  model.notifyListeners();
                                } else {
                                  isTappedEmailAdded = false;
                                  isTappedPhoneAdded = false;
                                  model.notifyListeners();
                                }
                              } // ✅ update selection
                              buildChannelList(selectedIndexes);
                              model.notifyListeners();
                            },
                          );
                        }),
                        SizedBox(height: 12.h),

                        isTappedEmailAdded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: addedEmailReminderList.isEmpty
                                            ? AppColors.red
                                            : AppColors.infoGrey1,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.infoGrey1,
                                            ),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          addedEmailReminderList
                                                              .isEmpty
                                                          ? AppColors.red
                                                          : AppColors.deep,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      TextView(
                                                        text:
                                                            'Emails available',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.8.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .fineGrey,
                                                        ),
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              const Color.fromARGB(
                                                                255,
                                                                223,
                                                                233,
                                                                247,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12.r,
                                                              ),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primary
                                                                .withOpacity(
                                                                  .4,
                                                                ),
                                                          ),
                                                        ),
                                                        child: TextView(
                                                          text:
                                                              '${emailReminderList.length}',
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 11.8.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .primary,
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
                                                      model.notifyListeners();
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
                                                        showEmailDialog(
                                                          context,
                                                          model: model,
                                                        ),
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
                                          padding: EdgeInsets.only(
                                            left: 12.w,
                                            right: 20.w,
                                            top: 10.w,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (addedEmailReminderList
                                                      .contains(
                                                        model
                                                            .emailController
                                                            .text,
                                                      )) {
                                                    addedEmailReminderList
                                                        .remove(
                                                          model
                                                              .emailController
                                                              .text,
                                                        );
                                                  } else {
                                                    addedEmailReminderList
                                                        .clear();
                                                    addedEmailReminderList.add(
                                                      model
                                                          .emailController
                                                          .text,
                                                    );
                                                  }
                                                  setModalState!(() {});
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                  padding:
                                                      addedEmailReminderList
                                                          .contains(
                                                            model
                                                                .emailController
                                                                .text,
                                                          )
                                                      ? EdgeInsets.all(4.0.w)
                                                      : EdgeInsets.all(4.0.w),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6.r,
                                                        ),
                                                    color:
                                                        addedEmailReminderList
                                                            .contains(
                                                              model
                                                                  .emailController
                                                                  .text,
                                                            )
                                                        ? AppColors.primary
                                                        : AppColors.transparent,
                                                    border: Border.all(
                                                      color:
                                                          addedEmailReminderList
                                                              .contains(
                                                                model
                                                                    .emailController
                                                                    .text,
                                                              )
                                                          ? AppColors
                                                                .transparent
                                                          : AppColors.infoGrey,
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
                                                text:
                                                    model.emailController.text,

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
                                                    padding: EdgeInsets.all(
                                                      1.2.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.app_green,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                        SizedBox(height: 15.20.h),
                                        ...emailReminderList.asMap().entries.map((
                                          entry,
                                        ) {
                                          final index = entry.key;
                                          final o = entry.value;
                                          final isLast =
                                              index ==
                                              emailReminderList.length - 1;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                        if (addedEmailReminderList
                                                            .contains(o)) {
                                                          addedEmailReminderList
                                                              .remove(o);
                                                        } else {
                                                          addedEmailReminderList
                                                              .add(o);
                                                        }
                                                        setModalState!(() {});
                                                        model.notifyListeners();
                                                      },
                                                      child: Container(
                                                        padding:
                                                            addedEmailReminderList
                                                                .contains(o)
                                                            ? EdgeInsets.all(
                                                                4.0.w,
                                                              )
                                                            : EdgeInsets.all(
                                                                10.w,
                                                              ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                6.r,
                                                              ),
                                                          color:
                                                              addedEmailReminderList
                                                                  .contains(o)
                                                              ? AppColors
                                                                    .primary
                                                              : AppColors
                                                                    .transparent,
                                                          border: Border.all(
                                                            color:
                                                                addedEmailReminderList
                                                                    .contains(o)
                                                                ? AppColors
                                                                      .transparent
                                                                : AppColors
                                                                      .infoGrey,
                                                            width: .78,
                                                          ),
                                                        ),
                                                        child:
                                                            addedEmailReminderList
                                                                .contains(o)
                                                            ? Icon(
                                                                Icons.check,
                                                                size: 12.sp,
                                                                color: AppColors
                                                                    .white,
                                                              )
                                                            : SizedBox.shrink(),
                                                      ),
                                                    ),
                                                    SizedBox(width: 9.10.w),
                                                    SizedBox(
                                                      width: 220.w,
                                                      child: TextView(
                                                        text: o,
                                                        maxLines: 1,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .reminder,
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
                                                              model: model,
                                                            );
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                                AppImage
                                                                    .edit_pen,
                                                                height: 22.0.h,
                                                                width: 22.0.w,
                                                              ),
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        GestureDetector(
                                                          onTap: () {
                                                            emailReminderList
                                                                .removeAt(
                                                                  index,
                                                                );
                                                            addedEmailReminderList
                                                                .remove(o);
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
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
                                                Divider(
                                                  color: AppColors.infoGrey1,
                                                ),
                                              SizedBox(height: 5.10.h),
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.0.h),
                                  addedEmailReminderList.isEmpty
                                      ? TextView(
                                          text: 'Atleast one email is required',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.80.sp,
                                            color: AppColors.red,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 20.h),
                        isTappedPhoneAdded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: addedPhoneReminderList.isEmpty
                                            ? AppColors.red
                                            : AppColors.infoGrey1,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.infoGrey1,
                                            ),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          addedPhoneReminderList
                                                              .isEmpty
                                                          ? AppColors.red
                                                          : AppColors.deep,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      TextView(
                                                        text:
                                                            'Numbers available',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 15.8.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .fineGrey,
                                                        ),
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              const Color.fromARGB(
                                                                255,
                                                                223,
                                                                233,
                                                                247,
                                                              ),

                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12.r,
                                                              ),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primary
                                                                .withOpacity(
                                                                  .4,
                                                                ),
                                                          ),
                                                        ),
                                                        child: TextView(
                                                          text:
                                                              '${phoneReminderList.length + 1}',
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 11.8.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .primary,
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
                                                      model.notifyListeners();
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
                                                      showPhoneDialog(
                                                        context,
                                                        model: model,
                                                      );
                                                      isPhoneValid = false;
                                                      model.notifyListeners();
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
                                          padding: EdgeInsets.only(
                                            left: 12.w,
                                            right: 20.w,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (addedPhoneReminderList.contains(
                                                    returnPhoneNoStructureWith234Rep(
                                                      model
                                                          .phoneNumberController
                                                          .text,
                                                    ),
                                                  )) {
                                                    addedPhoneReminderList.remove(
                                                      returnPhoneNoStructureWith234Rep(
                                                        model
                                                            .phoneNumberController
                                                            .text,
                                                      ),
                                                    );
                                                  } else {
                                                    addedPhoneReminderList
                                                        .clear();
                                                    addedPhoneReminderList.add(
                                                      returnPhoneNoStructureWith234Rep(
                                                        model
                                                            .phoneNumberController
                                                            .text,
                                                      ),
                                                    );
                                                  }
                                                  setModalState!(() {});
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                  padding:
                                                      addedPhoneReminderList.contains(
                                                        returnPhoneNoStructureWith234Rep(
                                                          model
                                                              .phoneNumberController
                                                              .text,
                                                        ),
                                                      )
                                                      ? EdgeInsets.all(4.0.w)
                                                      : EdgeInsets.all(4.w),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6.r,
                                                        ),
                                                    color:
                                                        addedPhoneReminderList.contains(
                                                          returnPhoneNoStructureWith234Rep(
                                                            model
                                                                .phoneNumberController
                                                                .text,
                                                          ),
                                                        )
                                                        ? AppColors.primary
                                                        : AppColors.transparent,
                                                    border: Border.all(
                                                      color:
                                                          addedPhoneReminderList
                                                              .contains(
                                                                returnPhoneNoStructureWith234Rep(
                                                                  model
                                                                      .phoneNumberController
                                                                      .text,
                                                                ),
                                                              )
                                                          ? AppColors
                                                                .transparent
                                                          : AppColors.infoGrey,
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
                                                  model
                                                      .phoneNumberController
                                                      .text,
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
                                                    padding: EdgeInsets.all(
                                                      1.2.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.app_green,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                        ...phoneReminderList.asMap().entries.map((
                                          entry,
                                        ) {
                                          final index = entry.key;
                                          final o = entry.value;
                                          final isLast =
                                              index ==
                                              phoneReminderList.length - 1;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                        if (addedPhoneReminderList
                                                            .contains(
                                                              returnPhoneNoStructureWith234(
                                                                o,
                                                              ),
                                                            )) {
                                                          addedPhoneReminderList
                                                              .remove(
                                                                returnPhoneNoStructureWith234(
                                                                  o,
                                                                ),
                                                              );
                                                        } else {
                                                          addedPhoneReminderList
                                                              .add(
                                                                returnPhoneNoStructureWith234(
                                                                  o,
                                                                ),
                                                              );
                                                        }
                                                        setModalState!(() {});
                                                        model.notifyListeners();
                                                      },
                                                      child: Container(
                                                        padding:
                                                            addedPhoneReminderList
                                                                .contains(
                                                                  returnPhoneNoStructureWith234(
                                                                    o,
                                                                  ),
                                                                )
                                                            ? EdgeInsets.all(
                                                                4.0.w,
                                                              )
                                                            : EdgeInsets.all(
                                                                10.w,
                                                              ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                6.r,
                                                              ),
                                                          color:
                                                              addedPhoneReminderList
                                                                  .contains(
                                                                    returnPhoneNoStructureWith234(
                                                                      o,
                                                                    ),
                                                                  )
                                                              ? AppColors
                                                                    .primary
                                                              : AppColors
                                                                    .transparent,
                                                          border: Border.all(
                                                            color:
                                                                addedPhoneReminderList
                                                                    .contains(
                                                                      returnPhoneNoStructureWith234(
                                                                        o,
                                                                      ),
                                                                    )
                                                                ? AppColors
                                                                      .transparent
                                                                : AppColors
                                                                      .infoGrey,
                                                            width: .78,
                                                          ),
                                                        ),
                                                        child:
                                                            addedPhoneReminderList
                                                                .contains(
                                                                  returnPhoneNoStructureWith234(
                                                                    o,
                                                                  ),
                                                                )
                                                            ? Icon(
                                                                Icons.check,
                                                                size: 12.sp,
                                                                color: AppColors
                                                                    .white,
                                                              )
                                                            : SizedBox.shrink(),
                                                      ),
                                                    ),
                                                    SizedBox(width: 9.10.w),
                                                    TextView(
                                                      text: formatPhoneNumber(
                                                        o,
                                                      ),
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.reminder,
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
                                                              model: model,
                                                            );
                                                            isPhoneValid =
                                                                false;
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                                AppImage
                                                                    .edit_pen,
                                                                height: 22.0.h,
                                                                width: 22.0.w,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          width: 16.10.w,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            phoneReminderList
                                                                .removeAt(
                                                                  index,
                                                                );

                                                            addedPhoneReminderList
                                                                .remove(o);
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
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
                                                Divider(
                                                  color: AppColors.infoGrey1,
                                                ),
                                              SizedBox(height: 5.10.h),
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  addedPhoneReminderList.isEmpty
                                      ? TextView(
                                          text:
                                              'Atleast one phone number is required',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.80.sp,
                                            color: AppColors.red,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 32.20.h),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              onTapToAddAnotherReminder = true;
                              model.notifyListeners();
                              if (secondFormReminderKey.currentState != null) {
                                if (firstFormReminderKey.currentState!
                                        .validate() &&
                                    secondFormReminderKey.currentState!
                                        .validate()) {
                                  await model.addReminderToList(
                                    model: model,
                                    setModalState: setModalState,
                                    context: context,
                                  );

                                  onTapToAddAnotherReminder = true;
                                } else {
                                  AppUtils.snackbar(
                                    context,
                                    message:
                                        'Kindly input all required fields..',
                                    error: true,
                                  );
                                }
                              } else {
                                onTapToAddAnotherReminder = true;
                              }
                              model.notifyListeners();
                            },
                            child: TextView(
                              text: 'Add Another Medication',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 17.2.sp,
                                fontWeight: FontWeight.w500,
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
                          buttonText: 'Continue',
                          color: AppColors.white,
                          buttonBorderColor: AppColors.transparent,
                          isLoading: model.isLoading,
                          onPressed: () async {
                            if (secondFormReminderKey.currentState != null) {
                              if (firstFormReminderKey.currentState!
                                      .validate() &&
                                  secondFormReminderKey.currentState!
                                      .validate()) {
                                await model.addReminderToList(
                                  model: model,
                                  setModalState: setModalState,
                                  context: context,
                                );

                                if (isTappedEmailAdded &&
                                        addedEmailReminderList.isEmpty ||
                                    isTappedPhoneAdded &&
                                        addedPhoneReminderList.isEmpty) {
                                  if (isTappedEmailAdded &&
                                      addedEmailReminderList.isEmpty) {}
                                  if (isTappedPhoneAdded &&
                                      addedPhoneReminderList.isEmpty) {}
                                } else {
                                  linIndex++;
                                  addCostTotal(model);
                                }
                              }
                            } else {
                              _isLoading = true;

                              if (isTappedEmailAdded &&
                                      addedEmailReminderList.isEmpty ||
                                  isTappedPhoneAdded &&
                                      addedPhoneReminderList.isEmpty) {
                                if (isTappedEmailAdded &&
                                    addedEmailReminderList.isEmpty) {}
                                if (isTappedPhoneAdded &&
                                    addedPhoneReminderList.isEmpty) {}
                              } else {
                                linIndex++;
                                addCostTotal(model);
                              }
                              _isLoading = false;
                            }

                            setModalState!(() {});
                            model.notifyListeners();
                          },
                        ),
                        SizedBox(height: 50.h),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  secondModalFlow({
    PharmViewModel? model,
    StateSetter? setModalState,
    ScrollController? scrollController,
    BuildContext? context,
  }) {
    if (model == null || model.medicationClassList.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
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
                    onTap: () async {
                      await model.clearReminderMedsVaraibles(model);
                      model.medicationClassList.clear();
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
                      value: linIndex / 2,
                      color: AppColors.primary, // Progress bar color
                      backgroundColor:
                          Colors.grey[300], // Background track color
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                TextView(
                  text: '$linIndex/2',
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
            model.medicationClassList.length == 1
                ? SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed:
                            model.medicationClassList[model
                                    .indexOfMedicationClassList] ==
                                model.medicationClassList.first
                            ? () {}
                            : () {
                                model.indexOfMedicationClassList -= 1;
                                model.notifyListeners();
                              },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 22.sp,
                          color:
                              model.medicationClassList[model
                                      .indexOfMedicationClassList] ==
                                  model.medicationClassList.first
                              ? AppColors.primaryLight.withOpacity(.7)
                              : AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 20.h),
                      TextView(
                        text:
                            '${model.indexOfMedicationClassList + 1}/${model.medicationClassList.length}',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                        ),
                      ),
                      SizedBox(width: 20.h),
                      IconButton(
                        onPressed:
                            model.medicationClassList[model
                                    .indexOfMedicationClassList] ==
                                model.medicationClassList.last
                            ? () {}
                            : () {
                                model.indexOfMedicationClassList += 1;
                                model.notifyListeners();
                              },
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 22.sp,
                          color:
                              model.medicationClassList[model
                                      .indexOfMedicationClassList] ==
                                  model.medicationClassList.last
                              ? AppColors.primaryLight.withOpacity(.7)
                              : AppColors.primary1,
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: 20.h),
            TextView(
              text: 'PATIENTS DETAILS',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.80.sp,
                color: AppColors.deep,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            Divider(color: AppColors.grey),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 16.20.w,
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.dashboard,
                borderRadius: BorderRadius.circular(8.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Patient Name',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 4.10.h),
                  TextView(
                    text: model.fullNameController.text,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 5.10.h),
                  Divider(color: AppColors.infoGrey, thickness: .14),
                  SizedBox(height: 5.10.h),
                  TextView(
                    text: 'Phone Number',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 4.10.h),
                  TextView(
                    text: model.phoneNumberController.text,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'MEDICATION DETAILS',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.80.sp,
                color: AppColors.deep,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
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
                        '${model.medicationClassList[model.indexOfMedicationClassList].medicationName}',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
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
                    child:
                        model
                                .medicationClassList[model
                                    .indexOfMedicationClassList]
                                .medicationFile !=
                            null
                        ? Image.file(
                            model
                                .medicationClassList[model
                                    .indexOfMedicationClassList]
                                .medicationFile!,
                            errorBuilder: (context, error, stackTrace) =>
                                SizedBox.shrink(),
                          )
                        : Center(
                            child: SvgPicture.asset(
                              model
                                  .medicationClassList[model
                                      .indexOfMedicationClassList]
                                  .medicationTypeIcon!,
                              height: 100.h,
                              width: 94.60,
                            ),
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
                        model
                            .medicationClassList[model
                                .indexOfMedicationClassList]
                            .medicationTypeIcon!,
                      ),
                      SizedBox(width: 6.0.w),
                      TextView(
                        text:
                            '${model.medicationClassList[model.indexOfMedicationClassList].medicationType}',
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
                ],
              ),
            ),
            SizedBox(height: 24.h),
            TextView(
              text: 'SET SCHEDULE AND DOSAGE',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.80.sp,
                color: AppColors.deep,
                fontWeight: FontWeight.w700,
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
                        '${model.medicationClassList[indexOfMedicationClassList].dosage}',
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
                    text:
                        model
                            .medicationClassList[model
                                .indexOfMedicationClassList]
                            .isCusSchedule!
                        ? 'Per-day Schedule'
                        : 'Frequency',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 6.0.h),
                  model
                          .medicationClassList[model.indexOfMedicationClassList]
                          .isCusSchedule!
                      ? SizedBox(
                          height:
                              model
                                      .medicationClassList[model
                                          .indexOfMedicationClassList]
                                      .dosageMap
                                      .length >
                                  1
                              ? 160.h
                              : 90.h,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...model.medicationClassList[model.indexOfMedicationClassList].dosageMap.map(
                                  (e) => Container(
                                    padding: EdgeInsets.all(7.10.w),
                                    margin: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.f1),
                                      color: AppColors.white.withOpacity(.8),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    TextView(
                                                      text: 'Day ${e['day']} ',
                                                      textStyle: TextStyle(
                                                        fontFamily:
                                                            'GoogleSans',
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                    TextView(
                                                      text:
                                                          '(${DateFormat('MMM dd').format(DateTime.parse(model.medicationClassList[model.indexOfMedicationClassList].startDateIso.toString()).add(Duration(days: e['day'] - 1)))})',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.fineGrey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                SizedBox(
                                                  width: 300.h,
                                                  child: Wrap(
                                                    spacing: 3.70,
                                                    runSpacing: 6,
                                                    children: (() {
                                                      final Set<String>
                                                      uniqueTimes = {};
                                                      for (final dose
                                                          in e['doses']) {
                                                        uniqueTimes.add(
                                                          dose['time'],
                                                        );
                                                      }
                                                      return uniqueTimes.map((
                                                        time,
                                                      ) {
                                                        return Container(
                                                          width: 90.w,
                                                          margin:
                                                              EdgeInsets.only(
                                                                right: 3.10.w,
                                                              ),
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                horizontal:
                                                                    3.20.w,
                                                                vertical: 4.w,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .infoGrey1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  22,
                                                                ),
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                AppImage.timer,
                                                                color: AppColors
                                                                    .reminder,
                                                                width: 15.20.sp,
                                                              ),
                                                              SizedBox(
                                                                width: 4.10.w,
                                                              ),
                                                              TextView(
                                                                text: time,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      12.8.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColors
                                                                      .reminder,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }).toList();
                                                    })(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: showNoTimes(
                                int.parse(
                                  model
                                      .medicationClassList[model
                                          .indexOfMedicationClassList]
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
                            SizedBox(height: 6.0.h),
                            Wrap(
                              spacing: 4.10,
                              runSpacing: 6,
                              children: (() {
                                final Set<String> uniqueTimes = {};

                                for (final day
                                    in model
                                        .medicationClassList[model
                                            .indexOfMedicationClassList]
                                        .dosageMap!) {
                                  for (final dose in day['doses']) {
                                    uniqueTimes.add(dose['time']);
                                  }
                                }

                                return uniqueTimes.map((time) {
                                  return Container(
                                    width: 100.w,
                                    margin: EdgeInsets.only(right: 4.10.w),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.0.w,
                                      vertical: 6.w,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.infoGrey1,
                                      ),
                                      borderRadius: BorderRadius.circular(22),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppImage.timer,
                                          color: AppColors.reminder,
                                          width: 18.20.sp,
                                        ),
                                        SizedBox(width: 5.10.w),
                                        TextView(
                                          text: time,
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.8.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList();
                              })(),
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
                    text: 'Start Date',
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
                        '${model.medicationClassList[model.indexOfMedicationClassList].dateAndTime}',
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
                  TextView(
                    text: getReturnDurationNumberOfDays(
                      int.parse(
                        model
                            .medicationClassList[model
                                .indexOfMedicationClassList]
                            .duration!,
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
                    text: model
                        .medicationClassList[model.indexOfMedicationClassList]
                        .endDate!,
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
                    text: model
                        .medicationClassList[model.indexOfMedicationClassList]
                        .note!,
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
            model.medicationClassList.length == 1
                ? SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed:
                            model.medicationClassList[model
                                    .indexOfMedicationClassList] ==
                                model.medicationClassList.first
                            ? () {}
                            : () {
                                model.indexOfMedicationClassList -= 1;
                                model.notifyListeners();
                              },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 22.sp,
                          color:
                              model.medicationClassList[model
                                      .indexOfMedicationClassList] ==
                                  model.medicationClassList.first
                              ? AppColors.primaryLight.withOpacity(.7)
                              : AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      TextView(
                        text:
                            '${model.indexOfMedicationClassList + 1}/${model.medicationClassList.length}',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      IconButton(
                        onPressed:
                            model.medicationClassList[model
                                    .indexOfMedicationClassList] ==
                                model.medicationClassList.last
                            ? () {}
                            : () {
                                model.indexOfMedicationClassList += 1;
                                model.notifyListeners();
                              },
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 22.sp,
                          color:
                              model.medicationClassList[model
                                      .indexOfMedicationClassList] ==
                                  model.medicationClassList.last
                              ? AppColors.primaryLight.withOpacity(.7)
                              : AppColors.primary1,
                        ),
                      ),
                    ],
                  ),

            SizedBox(height: 24.20.h),
            TextView(
              text: 'NOTIFICATION CHANNELS',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.80.sp,
                color: AppColors.deep,
                fontWeight: FontWeight.w700,
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
                    text: 'Selected Channels',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 6.0.h),
                  Wrap(
                    spacing: 4.10,
                    runSpacing: 6,
                    children: [
                      ...selectedIndexes.map(
                        (e) => model.notificationChannelFlowWidgetSelection(
                          selected: e,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: addedPhoneReminderList.isEmpty ? 0.h : 6.0.h,
                  ),
                  addedPhoneReminderList.isEmpty
                      ? SizedBox.shrink()
                      : Divider(color: AppColors.infoGrey1),
                  SizedBox(
                    height: addedPhoneReminderList.isEmpty ? 0.h : 6.0.h,
                  ),
                  addedPhoneReminderList.isEmpty
                      ? SizedBox.shrink()
                      : TextView(
                          text: 'Phone numbers',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.8.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.infoGrey,
                          ),
                        ),
                  SizedBox(
                    height: addedPhoneReminderList.isEmpty ? 0.h : 6.0.h,
                  ),
                  addedPhoneReminderList.isEmpty
                      ? SizedBox.shrink()
                      : Wrap(
                          spacing: 4.10,
                          runSpacing: 6,
                          children: List.generate(
                            addedPhoneReminderList.length,
                            (index) {
                              final isLast =
                                  index == addedPhoneReminderList.length - 1;
                              final phone = addedPhoneReminderList[index];

                              return TextView(
                                text: isLast
                                    ? formatPhoneNumber(phone)
                                    : '${formatPhoneNumber(phone)}, ',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: addedEmailReminderList.isEmpty ? 0.h : 6.0.h,
                  ),
                  addedEmailReminderList.isEmpty
                      ? SizedBox.shrink()
                      : Divider(color: AppColors.infoGrey1),
                  SizedBox(
                    height: addedEmailReminderList.isEmpty ? 0.h : 6.0.h,
                  ),
                  addedEmailReminderList.isEmpty
                      ? SizedBox.shrink()
                      : TextView(
                          text: 'Email',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.8.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.infoGrey,
                          ),
                        ),
                  SizedBox(
                    height: addedEmailReminderList.isEmpty ? 0.h : 6.0.h,
                  ),
                  addedEmailReminderList.isEmpty
                      ? SizedBox.shrink()
                      : Wrap(
                          spacing: 4.10,
                          runSpacing: 6,
                          children: List.generate(
                            addedEmailReminderList.length,
                            (index) {
                              final isLast =
                                  index == addedEmailReminderList.length - 1;
                              final email = addedEmailReminderList[index];

                              return TextView(
                                text: isLast ? email : '$email, ',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              );
                            },
                          ),
                        ),
                  SizedBox(height: 6.0.h),
                ],
              ),
            ),
            SizedBox(height: 16.20.h),
            addedPhoneReminderList.isNotEmpty || emailReminderList.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.0.h),
                      TextView(
                        text: 'TOTAL SUMMARY',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 14.80.sp,
                          color: AppColors.deep,
                          fontWeight: FontWeight.w700,
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.w,
                                    horizontal: 16.0.w,
                                  ),
                                  child: Row(
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
                                        text: '${returnTotalDays(model)}',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 16.80.sp,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: AppColors.infoGrey1),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.w,
                                    horizontal: 16.0.w,
                                  ),
                                  child: Row(
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
                                        text:
                                            '${calculationForTotalReminderForEmail + calculationForTotalReminderForPhone}',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 16.80.sp,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                selectedIndexes.contains(0)
                                    ? Divider(color: AppColors.infoGrey1)
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(0)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                          horizontal: 16.0.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text:
                                                  'Email (x${returnMailTimes()} msgs)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextView(
                                              text: '₦0',
                                              textStyle: TextStyle(
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(1)
                                    ? Divider(color: AppColors.infoGrey1)
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(1)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                          horizontal: 16.0.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text:
                                                  'Push (x${returnMailTimes()} msgs)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextView(
                                              text: '₦0',
                                              textStyle: TextStyle(
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(3)
                                    ? Divider(color: AppColors.infoGrey1)
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(3)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                          horizontal: 16.0.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text:
                                                  'WhatsApp (x${returnPhoneTimes()} msgs)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  '₦${20 * returnPhoneTimes()}',
                                              textStyle: TextStyle(
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(2)
                                    ? Divider(color: AppColors.infoGrey1)
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(2)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                          horizontal: 16.0.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text:
                                                  'SMS (x${returnPhoneTimes()} msgs)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  '₦${15 * returnPhoneTimes()}',
                                              textStyle: TextStyle(
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(4)
                                    ? Divider(color: AppColors.infoGrey1)
                                    : SizedBox.shrink(),
                                selectedIndexes.contains(4)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                          horizontal: 16.0.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text:
                                                  'Phone Calls (x${returnPhoneTimes()} calls)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  '₦${50 * returnPhoneTimes()}',
                                              textStyle: TextStyle(
                                                fontSize: 16.80.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                Divider(color: AppColors.infoGrey1),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.nearDashboard,
                                  ),

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.w,
                                      horizontal: 16.0.w,
                                    ),
                                    child: Row(
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            SizedBox(height: 46.h),
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
                      model.indexOfMedicationClassList = 0;
                      model.notifyListeners();
                    },
                  ),
                ),
                SizedBox(width: 20.w),
                Flexible(
                  child: ButtonWidget(
                    border: 100.r,
                    fontSize: 14.sp,
                    buttonColor: AppColors.primary,
                    isLoading: model.isLoading,
                    buttonText: addedPhoneReminderList.isEmpty
                        ? 'Set Up'
                        : 'Proceed to Pay',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    onPressed: () {
                      if (addedPhoneReminderList.isNotEmpty) {
                        linIndex++;
                      } else {
                        model.createReminder(
                          context,
                          createReminderEntityModel:
                              CreateTenantReminderEntityModel(
                                patientDetails: PatientDetails(
                                  fullName: model.fullNameController.text,
                                  phoneNumber:
                                      returnReminderPhoneStructureWith234(
                                        model.phoneNumberController.text,
                                      ),
                                ),
                                medications: model.medicationClassList.map((m) {
                                  return Medication(
                                    medicationName: m.medicationName,
                                    scheduleType: m.isCusSchedule!
                                        ? 'CUSTOM'
                                        : 'FIXED',
                                    dosage: m.dosage,
                                    medicationType: m.medicationType!
                                        .toUpperCase(),
                                    startDateTime: m.startDateIso,
                                    endDateTime: m.endDateIso,
                                    durationInDays: int.parse(m.duration!),
                                    timesPerDay: m.isCusSchedule!
                                        ? ''
                                        : int.parse(m.timesToTake!),
                                    dailyDoseTimes: (m.dosageMap as List)
                                        .map(
                                          (
                                            dayData,
                                          ) => (dayData['doses'] as List)
                                              .map(
                                                (
                                                  dose,
                                                ) => DailyDoseTime.fromJson(
                                                  dose as Map<String, dynamic>,
                                                ),
                                              )
                                              .toList(),
                                        )
                                        .toList(),
                                    note: m.note,
                                    medicationImage: m.imageData!.url == null
                                        ? null
                                        : MedicationImage.fromJson(
                                            m.imageData!.toJson(),
                                          ),
                                  );
                                }).toList(),
                                timeZone: "Africa/Lagos",
                                notificationChannels: notificationChannel,
                                emails: emailReminderList,
                              ),
                        );
                      }

                      model.notifyListeners();
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
  }

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

  String showNoTimesMode(int number) {
    if (number == 1) {
      return 'Once Daily';
    } else if (number == 2) {
      return 'Twice Daily';
    } else if (number == 3) {
      return 'Thrice Daily';
    } else if (number == 4) {
      return 'Four Times Daily';
    }
    return 'Custom Schedule';
  }

  void copyDayOneToAll({
    StateSetter? setModalState,
    PharmViewModel? viewModel,
  }) {
    final dayOneTimes = viewModel!.timesPerDay[0];

    if (dayOneTimes == null || dayOneTimes.isEmpty) return;

    for (final day in viewModel.timesPerDay.keys) {
      if (day != 0) {
        viewModel.timesPerDay[day] = List.from(dayOneTimes);
      }
    }
    setModalState!(() {});
  }

  Widget fallbackMedicationIcon(PharmViewModel model) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: SvgPicture.asset(
        model.errorRemidnderImage(
          model.getReminderByIdModel?.data?.medication?.medicationType,
        ),
        color: AppColors.primary,
        height: 70.h,
        width: 70.w,
      ),
    );
  }

  String? sanitizeImageUrl(String? url) {
    if (url == null || url.trim().isEmpty) return null;

    // Already valid
    if (url.startsWith('http://') || url.startsWith('https://')) return url;

    // If backend returns domain only
    if (url.startsWith('www.') || url.contains('.')) {
      return 'https://$url';
    }

    // Otherwise invalid
    return null;
  }

  String notificationChannelFlowWidgetIcon(String notificationChannel) {
    if (notificationChannel.toLowerCase() == 'email') {
      return AppImage.channel_email;
    }
    if (notificationChannel.toLowerCase() == 'sms') {
      return AppImage.sms;
    }
    if (notificationChannel.toLowerCase() == 'whatsapp') {
      return AppImage.whatsapp;
    }
    if (notificationChannel.toLowerCase() == 'phone_call') {
      return AppImage.phone;
    }
    return AppImage.bell;
  }

  String notificationChannelFlowWidgetIconSelected(int select) {
    if (select == 0) {
      return AppImage.channel_email;
    }
    if (select == 2) {
      return AppImage.sms;
    }
    if (select == 3) {
      return AppImage.whatsapp;
    }
    if (select == 4) {
      return AppImage.phone;
    }
    return AppImage.bell;
  }

  String notificationChannelFormatName(String notificationChannel) {
    if (notificationChannel.toLowerCase() == 'email') {
      return 'Email';
    }
    if (notificationChannel.toLowerCase() == 'sms') {
      return 'SMS';
    }
    if (notificationChannel.toLowerCase() == 'whatsapp') {
      return 'Whatsapp';
    }
    if (notificationChannel.toLowerCase() == 'phone_call') {
      return 'Phone Call';
    }
    return 'Push';
  }

  String notificationChannelFormatNameSelected(int select) {
    if (select == 0) {
      return 'Email';
    }
    if (select == 2) {
      return 'SMS';
    }
    if (select == 3) {
      return 'Whatsapp';
    }
    if (select == 4) {
      return 'Phone Call';
    }
    return 'Push';
  }

  Widget notificationChannelFlowWidget({required String notificationType}) =>
      Container(
        width:
            notificationType.toLowerCase() == 'phone_call' ||
                notificationType.toLowerCase() == 'whatsapp'
            ? 120.w
            : 90.w,
        margin: EdgeInsets.only(right: 4.10.w),
        padding: EdgeInsets.symmetric(vertical: 4.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.infoGrey1),
          borderRadius: BorderRadius.circular(22),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              notificationChannelFlowWidgetIcon(notificationType),
              color: AppColors.infoGrey,
              width: notificationType.toLowerCase() == 'sms' ? 20 : 14.20.sp,
              height: notificationType.toLowerCase() == 'sms' ? 20 : 12.0.sp,
            ),
            SizedBox(width: 7.10.w),
            TextView(
              text: notificationChannelFormatName(notificationType),
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 13.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
          ],
        ),
      );

  Widget notificationChannelFlowWidgetSelection({required int selected}) =>
      Container(
        width: selected == 4 || selected == 3 ? 120.w : 90.w,
        margin: EdgeInsets.only(right: 4.10.w),
        padding: EdgeInsets.symmetric(vertical: 4.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.infoGrey1),
          borderRadius: BorderRadius.circular(22),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              notificationChannelFlowWidgetIconSelected(selected),
              color: AppColors.infoGrey,
              width: selected == 2
                  ? 24.0
                  : selected == 0
                  ? 14.sp
                  : 16.20.w,
              height: selected == 2
                  ? 24.0
                  : selected == 0
                  ? 12.10.sp
                  : 16.20.sp,
            ),
            SizedBox(width: 7.10.w),
            TextView(
              text: notificationChannelFormatNameSelected(selected),
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 13.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
          ],
        ),
      );

  fourthModalFlow({
    PharmViewModel? model,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
    String? id,
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
            context: context,
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
                  isLoading: model!.isLoading,
                  onPressed: onTapPaymentMeth != ''
                      ? () {
                          model.createReminderPaid(
                            context,
                            createReminderEntityModel:
                                CreateTenantReminderEntityModel(
                                  patientDetails: PatientDetails(
                                    fullName: model.fullNameController.text,
                                    phoneNumber:
                                        returnReminderPhoneStructureWith234(
                                          model.phoneNumberController.text,
                                        ),
                                    email: model.emailController.text,
                                  ),
                                  medications: model.medicationClassList.map((
                                    m,
                                  ) {
                                    return Medication(
                                      medicationName: m.medicationName,
                                      scheduleType: m.isCusSchedule!
                                          ? 'CUSTOM'
                                          : 'FIXED',
                                      dosage: m.dosage,
                                      medicationType: m.medicationType!
                                          .toUpperCase(),
                                      startDateTime: m.startDateIso,
                                      endDateTime: m.endDateIso,
                                      durationInDays: int.parse(m.duration!),
                                      timesPerDay: m.isCusSchedule!
                                          ? ''
                                          : int.parse(m.timesToTake!),
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
                                      medicationImage: m.imageData!.url == null
                                          ? null
                                          : MedicationImage.fromJson(
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
                          model.notifyListeners();
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

  void setSelectedTimeForDay(int day, String time) {
    selectedTimePerDay[day] = time;
    debugPrint('✅ saved: day $day → $time');
    notifyListeners();
  }

  Future<void> selectDateUPDATE({
    BuildContext? context,
    index,
    model,
    setModalState,
  }) async {
    final DateTime? pickedDated = await showDatePicker(
      context: context!,
      initialDate: DateTime.now(), // The date initially displayed
      firstDate: DateTime.now(), // The earliest selectable date
      lastDate: DateTime(2101), // The latest selectable date
    );

    if (pickedDated != null) {
      pickedDate = DateFormat('dd MMM, yyyy').format(pickedDated);
      model.medicationClassList[index].dateAndTime = pickedDate;
      medicationClassList[index].dateAndTime = pickedDate;
      startDateIso = DateTime.utc(
        pickedDated.year,
        pickedDated.month,
        pickedDated.day,
      ).toIso8601String();
      _calculateEndDateUpdate(
        setModalState: setModalState,
        model: model,
        index: index,
      );
    }
    setModalState!(() {});
    model.notifyListeners();
  }

  dosagePreviewWidgetContainer({
    required BuildContext context,
    required int callback,
    required Color color,
    required List<int> listOfTimes,
    required List<Map<String, dynamic>> dosageMap,
    required PharmViewModel? model,
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
                                model!.notifyListeners();
                                // locator<PharmViewModel>().notifyListeners();
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
                    model!.notifyListeners();
                    // locator<PharmViewModel>().notifyListeners();
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

  int getTotalCustomDoses(List<dynamic> dosageMap) {
    final allDoses = <dynamic>[];

    for (final dayMap in dosageMap) {
      if (dayMap['doses'] != null) {
        allDoses.addAll(dayMap['doses']);
      }
    }

    return allDoses.length;
  }

  int getTotalTimesForReminder(item) {
    if (item.isCusSchedule) {
      _getTotalTimesForReminder = getTotalCustomDoses(item.dosageMap ?? []);
      return _getTotalTimesForReminder!;
    } else {
      _getTotalTimesForReminder = int.tryParse(item.timesToTake ?? '0') ?? 0;
      return _getTotalTimesForReminder!;
    }
  }

  void addCostTotal(model) {
    costTotal = 0;
    for (final item in model.medicationClassList) {
      final days = int.tryParse(item.duration ?? '0') ?? 0;
      final times = getTotalTimesForReminder(item);

      int basePrice = 0;
      if (selectedIndexes.contains(2)) basePrice += 15;
      if (selectedIndexes.contains(3)) basePrice += 20;
      if (selectedIndexes.contains(4)) basePrice += 50;

      if (item.isCusSchedule) {
        costTotal += basePrice * times;
      } else {
        costTotal += basePrice * times * days;
      }
    }
    if (selectedIndexes.contains(2) ||
        selectedIndexes.contains(3) ||
        selectedIndexes.contains(4)) {
      costTotal = costTotal * addedPhoneReminderList.length;
    }
    calculateTotalReminders(model);
    notifyListeners();
  }

  calculateTotalReminders(model) {
    final medications = model.medicationClassList ?? [];
    calculationForTotalReminderForEmail = 0;
    calculationForTotalReminderForPhone = 0;

    // int totalReminders = 0;
    // ignore: no_leading_underscores_for_local_identifiers
    int _frequencyPerDay = 0;

    for (var med in medications) {
      final bool isCustom = med.isCusSchedule;
      final int durationInDays = int.parse(med.duration);
      final int timesPerDay = int.parse(med.timesToTake);

      int frequencyPerDay = 0;

      if (isCustom == false) {
        frequencyPerDay = timesPerDay * durationInDays;
      } else if (isCustom == true) {
        // Flatten all daily times and divide by number of days
        frequencyPerDay = (getTotalCustomDoses(med.dosageMap ?? []));
      }

      _frequencyPerDay = frequencyPerDay;

      // totalReminders += frequencyPerDay;
      if (addedEmailReminderList.isNotEmpty && selectedIndexes.contains(0) ||
          selectedIndexes.contains(1)) {
        if (selectedIndexes.contains(0) && selectedIndexes.contains(1)) {
          calculationForTotalReminderForEmail +=
              (_frequencyPerDay * 2 * addedEmailReminderList.length);
        } else {
          calculationForTotalReminderForEmail +=
              _frequencyPerDay * addedEmailReminderList.length;
        }
      }
      if (addedPhoneReminderList.isNotEmpty && selectedIndexes.contains(2) ||
          selectedIndexes.contains(3) ||
          selectedIndexes.contains(4)) {
        if (selectedIndexes.contains(2) &&
            selectedIndexes.contains(3) &&
            selectedIndexes.contains(4)) {
          calculationForTotalReminderForPhone +=
              _frequencyPerDay * 3 * addedPhoneReminderList.length;
        } else if (selectedIndexes.contains(2) && selectedIndexes.contains(3) ||
            selectedIndexes.contains(2) && selectedIndexes.contains(4) ||
            selectedIndexes.contains(3) && selectedIndexes.contains(4)) {
          calculationForTotalReminderForPhone +=
              _frequencyPerDay * 2 * addedPhoneReminderList.length;
        } else {
          calculationForTotalReminderForPhone +=
              _frequencyPerDay * addedPhoneReminderList.length;
        }
      }
    }

    notifyListeners();

    // return totalReminders;
  }

  int returnMailTimes() {
    int calEmailTimes = 0;
    if (selectedIndexes.contains(0) && selectedIndexes.contains(1)) {
      calEmailTimes += (calculationForTotalReminderForEmail / 2).toInt();
    } else {
      calEmailTimes += calculationForTotalReminderForEmail;
    }
    return calEmailTimes;
  }

  int returnPhoneTimes() {
    int calPhoneTimes = 0;
    if (selectedIndexes.contains(2) &&
        selectedIndexes.contains(3) &&
        selectedIndexes.contains(4)) {
      calPhoneTimes += (calculationForTotalReminderForPhone / 3).toInt();
    } else if (selectedIndexes.contains(2) && selectedIndexes.contains(3) ||
        selectedIndexes.contains(2) && selectedIndexes.contains(4) ||
        selectedIndexes.contains(3) && selectedIndexes.contains(4)) {
      calPhoneTimes += (calculationForTotalReminderForPhone / 2).toInt();
    } else {
      calPhoneTimes += calculationForTotalReminderForPhone;
    }
    return calPhoneTimes;
  }

  void showEmailDialog(
    BuildContext context, {
    bool isEdit = false,
    int? index,
    String? email,
    PharmViewModel? model,
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
                                if (emailReminderList.contains(
                                  emailController.text.trim(),
                                )) {
                                } else {
                                  emailReminderList.add(
                                    emailController.text.trim(),
                                  );
                                  addedEmailReminderList.add(
                                    emailController.text.trim(),
                                  );
                                }
                              } else {
                                emailReminderList[index!] =
                                    emailController.text;
                              }
                              Navigator.pop(context);
                              emailController.clear();
                            }
                            model!.notifyListeners();
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

  String implementTimeDurationWithDate({date, int? callbackIndex}) {
    String? returnDate;
    final format = DateFormat("d MMM, yyyy hh:mm a");
    final dateTime = format.parse(date);
    returnDate = DateTime.parse(
      dateTime.toString(),
    ).add(Duration(days: 0 + callbackIndex!)).toString();
    return returnDate;
  }

  // dosageAfterWidgetContainer({
  //   required BuildContext context,
  //   required int callback,
  //   required Color color,
  //   required List<int> listOfTimes,
  //   required List<Map<String, dynamic>> dosageMap,
  //   required String date,
  // }) {
  //   bool isTablet(BuildContext context) =>
  //       MediaQuery.of(context).size.shortestSide >= 600;

  //   // ✅ Ensure nested list exists for current day
  //   if (doseAfterControllers.length <= callback) {
  //     // Create empty lists until callback index exists
  //     while (doseAfterControllers.length <= callback) {
  //       doseAfterControllers.add([]);
  //     }
  //   }

  //   List<Map<String, dynamic>> doses = [];

  //   if (callback >= 0 && callback < dosageMap.length) {
  //     final item = dosageMap[callback];
  //     doses = List<Map<String, dynamic>>.from(item['doses'] ?? []);
  //   } else {
  //     logger.e(
  //       '⚠️ Invalid callback index: $callback for dosageMap length: ${dosageMap.length}',
  //     );
  //   }

  //   // Ensure enough controllers exist
  //   if (doseAfterControllers[callback].length < doses.length) {
  //     for (
  //       int i = doseAfterControllers[callback].length;
  //       i < doses.length;
  //       i++
  //     ) {
  //       doseAfterControllers[callback].add(
  //         TextEditingController(text: doses[i]['time'] ?? ''),
  //       );
  //     }
  //   } else if (doseAfterControllers[callback].length > doses.length) {
  //     // remove extra ones if needed
  //     doseAfterControllers[callback].removeRange(
  //       doses.length,
  //       doseAfterControllers[callback].length,
  //     );
  //   }

  //   // ✅ Initialize period labels too (if applicable)
  //   if (periodAfterLabels.length <= callback) {
  //     while (periodAfterLabels.length <= callback) {
  //       periodAfterLabels.add([]);
  //     }
  //   }

  //   if (periodAfterLabels[callback].length < doses.length) {
  //     for (int i = periodAfterLabels[callback].length; i < doses.length; i++) {
  //       periodAfterLabels[callback].add(doses[i]['period'] ?? '');
  //     }
  //   } else if (periodAfterLabels[callback].length > doses.length) {
  //     periodAfterLabels[callback].removeRange(
  //       doses.length,
  //       periodAfterLabels[callback].length,
  //     );
  //   }

  //   // ✅ Update controllers/labels with data from dosageMap
  //   if (callback < dosageMap.length) {
  //     final dayData = dosageMap[callback]; // e.g. { "day": 1, "doses": [...] }
  //     final doses = List<Map<String, dynamic>>.from(dayData["doses"] ?? []);

  //     for (int i = 0; i < doses.length; i++) {
  //       if (i < doseAfterControllers[callback].length) {
  //         doseAfterControllers[callback][i].text = doses[i]["time"] ?? "";
  //         periodAfterLabels[callback][i] = doses[i]["period"] ?? "";
  //       }
  //     }
  //   }

  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.only(bottom: 10.w),
  //     padding: EdgeInsets.symmetric(
  //       vertical: dosageAfterValue == callback ? 12.w : 8.w,
  //       horizontal: 14.w,
  //     ),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12),
  //       border: Border.all(color: color, width: 2),
  //     ),
  //     child: dosageAfterValue == callback
  //         ? Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               // 🔹 Header
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   TextView(
  //                     text: 'Day ${callback + 1}',
  //                     textStyle: TextStyle(
  //                       fontFamily: 'GoogleSans',
  //                       fontSize: 15.20.sp,
  //                       color: AppColors.black,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                   IconButton(
  //                     onPressed: () {
  //                       dosageAfterValue = null;
  //                       notifyListeners();
  //                     },
  //                     icon: Icon(
  //                       Icons.keyboard_arrow_up,
  //                       color: AppColors.grey1,
  //                       size: 24.sp,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 10.h),

  //               // 🔹 Render doses
  //               ...doseAfterControllers[callback].asMap().entries.map((entry) {
  //                 final i = entry.key;
  //                 return Padding(
  //                   padding: EdgeInsets.only(bottom: 10.w),
  //                   child: TextFormWidget(
  //                     hint: 'Dose ${i + 1}',
  //                     borderColor: AppColors.transparent,
  //                     borderTopLeft: 10.r,
  //                     borderTopRight: 10.r,
  //                     borderBottomLeft: 10.r,
  //                     borderBottomRight: 10.r,
  //                     label: periodAfterLabels[callback][i],
  //                     hintSize: 14.60.sp,
  //                     labelStyle: TextStyle(
  //                       fontWeight: FontWeight.w400,
  //                       fontFamily: 'Arial',
  //                       fontSize: 14.2.sp,
  //                       color: AppColors.infoGrey,
  //                     ),
  //                     fillColor: AppColors.grey,
  //                     isFilled: true,
  //                     controller: doseAfterControllers[callback][i],
  //                     suffixWidget: Padding(
  //                       padding: EdgeInsets.all(8.w),
  //                       child: GestureDetector(
  //                         onTap: () async {
  //                           final result = await selectDosageTime(
  //                             context: context,
  //                           );
  //                           if (result != null) {
  //                             doseAfterControllers[callback][i].text =
  //                                 result["time"]!;
  //                             periodAfterLabels[callback][i] =
  //                                 result["period"]!;

  //                             // ✅ Update dosageMap directly
  //                             if (callback < dosageMap.length &&
  //                                 i <
  //                                     (dosageMap[callback]['doses']?.length ??
  //                                         0)) {
  //                               dosageMap[callback]['doses'][i]['time'] =
  //                                   result["time"]!;
  //                               dosageMap[callback]['doses'][i]['period'] =
  //                                   result["period"]!; // optional
  //                               dosageMap[callback]['doses'][i]['date'] =
  //                                   implementTimeDurationWithDate(
  //                                     date: date,
  //                                     callbackIndex: callback,
  //                                   ).substring(0, 10); // optional
  //                               dosageMap[callback]['doses'][i]['isoDate'] =
  //                                   implementTimeDurationWithDate(
  //                                     date: date,
  //                                     callbackIndex: callback,
  //                                   ); // optional
  //                             }
  //                             notifyListeners();
  //                           }
  //                         },
  //                         child: TextView(
  //                           text: 'Edit',
  //                           textStyle: TextStyle(
  //                             fontFamily: 'GoogleSans',
  //                             fontSize: 13.60.sp,
  //                             color: AppColors.fineGrey,
  //                             fontWeight: FontWeight.w500,
  //                             decoration: TextDecoration.underline,
  //                             decorationColor: AppColors.fineGrey,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     validator: AppValidator.validateString(),
  //                   ),
  //                 );
  //               }),

  //               SizedBox(height: callback == 0 ? 12.0.h : 0.h),

  //               // 🔹 Apply to all days
  //               if (callback == 0)
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     TextView(
  //                       text: 'Apply to all days',
  //                       textStyle: TextStyle(
  //                         fontFamily: 'Arial',
  //                         fontSize: 16.sp,
  //                         color: AppColors.black,
  //                         fontWeight: FontWeight.w400,
  //                       ),
  //                     ),
  //                     Transform.scale(
  //                       scale: isTablet(context) ? 1.5 : 1.1,
  //                       child: Checkbox(
  //                         value: isCheckedUp,
  //                         onChanged: (value) {
  //                           if (value != null && value) {
  //                             for (
  //                               int day = 1;
  //                               day < doseAfterControllers.length;
  //                               day++
  //                             ) {
  //                               for (
  //                                 int i = 0;
  //                                 i < doseAfterControllers[0].length;
  //                                 i++
  //                               ) {
  //                                 doseAfterControllers[day][i].text =
  //                                     doseAfterControllers[0][i].text;
  //                                 periodAfterLabels[day][i] =
  //                                     periodAfterLabels[0][i];

  //                                 // ✅ Also update dosageMap (important for data persistence)
  //                                 if (day < dosageMap.length &&
  //                                     i <
  //                                         (dosageMap[day]['doses']?.length ??
  //                                             0)) {
  //                                   dosageMap[day]['doses'][i]['time'] =
  //                                       doseAfterControllers[0][i].text;
  //                                   dosageMap[day]['doses'][i]['period'] =
  //                                       periodAfterLabels[0][i];
  //                                   dosageMap[day]['doses'][i]['date'] =
  //                                       implementTimeDurationWithDate(
  //                                         date: date,
  //                                         callbackIndex: day,
  //                                       ).substring(0, 10);
  //                                   dosageMap[day]['doses'][i]['isoDate'] =
  //                                       implementTimeDurationWithDate(
  //                                         date: date,
  //                                         callbackIndex: day,
  //                                       );
  //                                 }
  //                               }
  //                             }
  //                           } else {
  //                             for (
  //                               int day = 1;
  //                               day < doseAfterControllers.length;
  //                               day++
  //                             ) {
  //                               for (
  //                                 int i = 0;
  //                                 i < doseAfterControllers[day].length;
  //                                 i++
  //                               ) {
  //                                 doseAfterControllers[day][i].clear();
  //                                 periodAfterLabels[day][i] = '';
  //                                 if (day < dosageMap.length &&
  //                                     i <
  //                                         (dosageMap[day]['doses']?.length ??
  //                                             0)) {
  //                                   dosageMap[day]['doses'][i]['time'] = '';
  //                                   dosageMap[day]['doses'][i]['period'] = '';
  //                                   dosageMap[day]['doses'][i]['date'] = '';
  //                                   dosageMap[day]['doses'][i]['isoDate'] = '';
  //                                 }
  //                               }
  //                             }
  //                           }
  //                           isCheckedUp = value ?? false;
  //                           notifyListeners();
  //                         },
  //                         activeColor: AppColors.primary,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(4),
  //                         ),
  //                         visualDensity: VisualDensity.compact,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               SizedBox(height: 12.0.h),
  //             ],
  //           )
  //         : Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               TextView(
  //                 text: 'Day ${callback + 1}',
  //                 textStyle: TextStyle(
  //                   fontFamily: 'GoogleSans',
  //                   fontSize: 15.20.sp,
  //                   color: AppColors.black,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               IconButton(
  //                 onPressed: () {
  //                   dosageAfterValue = callback;
  //                   notifyListeners();
  //                   // locator<PharmViewModel>().notifyListeners();
  //                 },
  //                 icon: Icon(
  //                   Icons.keyboard_arrow_down,
  //                   color: AppColors.grey1,
  //                   size: 24.sp,
  //                 ),
  //               ),
  //             ],
  //           ),
  //   );
  // }

  void showPhoneDialog(
    BuildContext context, {
    bool isEdit = false,
    int? index,
    String? phoneNumber,
    PharmViewModel? model,
  }) {
    TextEditingController phoneController = TextEditingController();
    if (isEdit) {
      phoneController.text = phoneNumber!.substring(4);
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
                                    final result =
                                        AppValidator.validatePhoneNew()(value);
                                    if (result != null) {
                                      isPhoneValid = true;
                                    } else {
                                      isPhoneValid = false;
                                    }
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
                                  if (phoneReminderList.contains(
                                    returnAddingPhoneNoStructureWith234(
                                      phoneController.text.trim(),
                                    ),
                                  )) {
                                  } else {
                                    phoneReminderList.add(
                                      returnAddingPhoneNoStructureWith234(
                                        phoneController.text.trim(),
                                      ),
                                    );
                                    addedPhoneReminderList.add(
                                      returnAddingPhoneNoStructureWith234(
                                        phoneController.text.trim(),
                                      ),
                                    );
                                  }
                                } else {
                                  phoneReminderList[index!] =
                                      returnAddingPhoneNoStructureWith234(
                                        phoneController.text.trim(),
                                      );
                                }
                                Navigator.pop(context);
                                phoneController.clear();
                              }
                              model!.notifyListeners();
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

  String returnReminderPhoneStructureWith234(String phoneNo) {
    if (phoneNo.substring(0).startsWith('0')) {
      phoneNo = '+234${phoneNo.substring(1)}';
    } else {
      phoneNo = '+234$phoneNo';
    }
    notifyListeners();
    return phoneNo;
  }

  String returnPhoneNoStructureWith234(String phoneNo) {
    if (phoneNo.substring(4) == '0') {
      phoneNo = phoneNo.substring(4);
    } else {
      phoneNo = phoneNo;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
    return phoneNo;
  }

  String returnPhoneNoStructureWith234Rep(String phoneNo) {
    if (phoneNo.startsWith('0')) {
      phoneNo = '+234${phoneNo.substring(1)}';
    }
    if (phoneNo.startsWith('+234')) {
      phoneNo = phoneNo;
    } else {
      phoneNo = '+234$phoneNo';
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
    return phoneNo;
  }

  String returnAddingPhoneNoStructureWith234(String phoneNo) {
    if (phoneNo.substring(0).startsWith('0')) {
      phoneNo = '+234${phoneNo.substring(1)}';
    } else {
      phoneNo = '+234$phoneNo';
    }
    notifyListeners();
    return phoneNo;
  }

  String returnPhoneNoStructure(String phoneNo) {
    if (phoneNo.substring(4, 5).contains('0')) {
      phoneNo = phoneNo.substring(5);
    }
    notifyListeners();
    return '+234$phoneNo';
  }

  void createReminder(
    context, {
    CreateTenantReminderEntityModel? createReminderEntityModel,
    PharmViewModel? model,
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
          arguments: PaymentStatusScreenArguments(
            isSuccessful: true,
            isUserType: 'pharmacy',
          ),
        );
        model?.medicationClassList.clear();
      } else {
        navigate.navigateTo(
          Routes.paymentStatusScreen,
          arguments: PaymentStatusScreenArguments(
            isSuccessful: false,
            isUserType: 'pharmacy',
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

  void initiatePayment(
    context, {
    String? reference,
    PharmViewModel? model,
  }) async {
    try {
      _isLoading = true;
      _initiatePaymentResponseModel = await runBusyFuture(
        repositoryImply.initiatePayment(reference: reference),
        throwException: true,
      );
      _isLoading = false;
      if (_initiatePaymentResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _initiatePaymentResponseModel?.message ?? '',
        );
        navigate.navigateTo(
          Routes.acceleratePaymentViewPharmacy,
          arguments: AcceleratePaymentViewPharmacyArguments(
            url: _initiatePaymentResponseModel?.data?.redirectUrl,
          ),
        );
        model?.medicationClassList.clear();
      } else {
        navigate.navigateTo(
          Routes.paymentStatusScreen,
          arguments: PaymentStatusScreenArguments(
            isSuccessful: false,
            isUserType: 'pharmacy',
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

  void createReminderPaid(
    context, {
    CreateTenantReminderEntityModel? createReminderEntityModel,
    PharmViewModel? model,
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
        initiatePayment(
          context,
          reference: _createReminderResponseModel?.data?.transactionReference,
        );
      } else {
        navigate.navigateTo(
          Routes.paymentStatusScreen,
          arguments: PaymentStatusScreenArguments(
            isSuccessful: false,
            isUserType: 'pharmacy',
          ),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    model?.notifyListeners();
  }

  Future<void> getReminder(context, {String? status, String? page}) async {
    try {
      _isLoading = true;
      if (status == 'all' || status == '' || status == null) {
        _getReminderResponseModel = await runBusyFuture(
          repositoryImply.getReminderForTenantAll(
            page: page,
            limit: 10.toString(),
          ),
          throwException: true,
        );
      } else {
        _getReminderResponseModel = await runBusyFuture(
          repositoryImply.getReminderForTenant(
            status: status,
            page: page,
            limit: 10.toString(),
          ),
          throwException: true,
        );
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getReminderById(context, {String? id}) async {
    try {
      _isLoading = true;
      _getReminderByIdModel = await runBusyFuture(
        repositoryImply.getReminderByUserId(userId: id),
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

  void getTenantReminderById(
    context, {
    String? id,
    String? limit,
    String? status,
    String? page,
  }) async {
    try {
      _isLoading = true;
      if ((status == 'all' || status == '' || status == null)) {
        _getReminderForTenantResponseModel = await runBusyFuture(
          repositoryImply.getReminderForTenantByUserIdAll(
            userId: id,
            limit: limit,
            page: page,
          ),
          throwException: true,
        );
      } else {
        _getReminderForTenantResponseModel = await runBusyFuture(
          repositoryImply.getReminderForTenantByUserId(
            userId: id,
            limit: limit,
            status: status,
            page: page,
          ),
          throwException: true,
        );
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getTodaysReminder(
    context, {
    String? period,
    String? date,
  }) async {
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
    setState,
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
      await AppUtils.snackbar(context, message: v['data']['message']);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    _isLoading = false;
    setState(() {});
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  onAddAllLoading() async {
    pageAll++;
    onLoading(pageAll);
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

  onSubAllLoading() async {
    pageAll--;
    onLoading(pageAll);
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
        if (isReminderStatus == 'all' ||
            isReminderStatus == '' ||
            isReminderStatus == null) {
          _getReminderResponseModel = await runBusyFuture(
            repositoryImply.getReminderForTenantAll(
              page: page.toString(),
              limit: 10.toString(),
            ),
            throwException: true,
          );
        } else {
          _getReminderResponseModel = await runBusyFuture(
            repositoryImply.getReminderForTenant(
              status: isReminderStatus,
              page: page.toString(),
              limit: 10.toString(),
            ),
            throwException: true,
          );
        }

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

  void uploadImageReminderUpdate({
    context,
    MultipartFile? file,
    String? id,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.uploadImageReminderUpdate(file: file, id: id),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(
          context,
          message: 'Image upload updated successfully..!',
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  String isMedTypeView(medType) {
    if (medType == 'CAPSULE') {
      return AppImage.pills;
    }
    if (medType == 'TABLET') {
      return AppImage.tablet;
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
    if (time.contains('AM') || time.contains('PM')) {
      return '';
    }
    if (time.isNotEmpty) {
      int hour = int.parse(time.split(":")[0]);
      if (hour < 12) {
        return "AM";
      } else {
        return "PM";
      }
    } else {
      return '';
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
                          await Future.delayed(Duration(milliseconds: 100));
                          // showUpdateReminderModal(context: context, data: data);
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
        );
      },
    );
  }

  void pickDrugImageUpdate({BuildContext? context, String? id}) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) {
          imageDrug = file;
          drugFilename = imageDrug!.path.split("/").last;
          uploadImageReminderUpdate(
            context: context,
            id: id,
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

  Future<void> selectDateUpdate(BuildContext context) async {
    final DateTime? pickedDated = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // The date initially displayed
      firstDate: DateTime.now(), // The earliest selectable date
      lastDate: DateTime(2101), // The latest selectable date
    );

    if (pickedDated != null) {
      pickedDate = DateFormat('dd MMM, yyyy').format(pickedDated);

      await selectTimeUpdate(context);
      startDateIso = DateTime.utc(
        pickedDated.year,
        pickedDated.month,
        pickedDated.day,
      ).toIso8601String();
    }
    notifyListeners();
  }

  Future<void> selectTimeUpdate(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // The time initially displ∏ayed
    );

    if (pickedTime != null) {
      dateTimeControllerUpdate.text =
          '${pickedDate!} ${formatTime('${pickedTime.hour}:${pickedTime.minute}')}';
    }
    notifyListeners();
  }

  chooseUpdateNotChannelWidget(
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

  dosagePreviewUpdateWidgetContainer({
    required BuildContext context,
    required int callback,
    required Color color,
    required List<int> listOfTimes,
    required List<upReminder.DailyDoseTime> dosageMap,
  }) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, PharmViewModel model, _) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: "Day ${callback + 1}",
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
                            model.notifyListeners();
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

                    // 🔹 Render each day
                    ...dosageMap.asMap().entries.map((entry) {
                      int i = entry.key;
                      upReminder.DailyDoseTime v =
                          entry.value; // {day: 1, doses: [...]}
                      bool isLast = i == dosageMap.length - 1;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 🔹 Day header
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
                                  Divider(
                                    color: AppColors.fineGrey,
                                    thickness: .4,
                                  ),
                                if (!isLast) SizedBox(height: 6.10.h),
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
                        model.notifyListeners();
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
      },
    );
  }

  getListOfNotificationChannel(data) {
    for (var pay in data.payments) {
      for (var n in pay.notificationChannelsPaidFor) {
        if (notificationChannel.contains(n)) {
        } else {
          notificationChannel.add(n);
        }
      }
    }
    selectedIndexes.clear();

    if (notificationChannel.contains('EMAIL')) {
      selectedIndexes.add(0);
    }
    if (notificationChannel.contains('PUSH')) {
      selectedIndexes.add(1);
    }
    if (notificationChannel.contains('SMS')) {
      selectedIndexes.add(2);
    }
    if (notificationChannel.contains('WHATSAPP')) {
      selectedIndexes.add(3);
    }
    if (notificationChannel.contains('PHONE_CALL')) {
      selectedIndexes.add(4);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  getReminderUpdate(data) {
    logger.d(data.toJson());
    medNameControllerUpdate.text = data!.medication!.medicationName ?? '';
    medDosageControllerUpdate.text = data.medication!.dosage ?? '';
    medDurationControllerUpdate.text = data.medication!.durationInDays!
        .toString();
    medDailyInTakenControllerUpdate.text = data.medication!.timesPerDay
        .toString();
    drugNameControllerUpdate.text = data.medication!.drugName ?? '';
    medTypeControllerUpdate.text = data.medication!.medicationType ?? '';
    medTypeResultImageUpdate = data.medication!.medicationType ?? '';
    noteControllerUpdate.text = data.medication!.note ?? '';
    endDateControllerUpdate.text = data.medication!.endDateTime.toString();
    imageReminderUpdate = data.medication!.medicationImage?.url ?? "";
    startDateIso = data.medication!.startDateTime.toString();
    notificationChannel.addAll(data.notificationChannels);
    getListOfNotificationChannel(data);
    phoneReminderList.addAll(data.phoneNumbers ?? []);
    emailReminderList.addAll(data.emails ?? []);
    dateTimeControllerUpdate.text = DateFormat(
      'dd MMM, yyyy',
    ).format(data.medication!.startDateTime!);
    // _dosageLabel = medDosageControllerUpdate.text;
    intList = List.generate(
      int.parse(medDurationControllerUpdate.text),
      (index) => index,
    );
    listOfDosage.clear();
    doseControllersUpdate.clear();
    periodLabelsUpdate.clear();

    for (
      int vIndex = 0;
      vIndex < data.medication.dailyDoseTimes.length;
      vIndex++
    ) {
      var v = data.medication.dailyDoseTimes[vIndex];

      // Create a new list of controllers for this medication
      List<TextEditingController> controllersForThisDose = [];
      List<String> labelsForDay = [];

      // Loop through each DailyDoseTime
      for (var dose in v) {
        listOfDosage.add(dose);

        // Create controller for this dose
        final controller = TextEditingController(text: '${dose.time}');
        controllersForThisDose.add(controller);
        labelsForDay.add(getPeriodLabel(getTimeOfDay(dose.time)));
      }

      // Add this sublist to the master list
      doseControllersUpdate.add(controllersForThisDose);
      periodLabelsUpdate.add(labelsForDay);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  TimeOfDay getTimeOfDay(String time) {
    try {
      // Handle AM/PM time format (e.g. "12:30 PM" or "00 AM")
      if (time.contains('AM') || time.contains('PM')) {
        final dateTime = DateFormat("hh:mm a").parse(time);
        return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
      }

      // Handle 24-hour format (e.g. "13:45")
      final parts = time.split(":");
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      debugPrint("Invalid time format: $time — $e");
      // Fallback to midnight
      return const TimeOfDay(hour: 0, minute: 0);
    }
  }

  returnNumberOfDays(days) {
    if (days > 1) {
      return 'days';
    }
    return 'day';
  }

  Future<void> loopDoseMethod() async {
    dailyDose.clear();

    // Convert startDateIso (String) to DateTime once
    DateTime currentDate = DateTime.parse(startDateIso);

    for (int day = 0; day < intList.length; day++) {
      // Create a new sublist for each day
      List<upReminder.DailyDoseTime> dailyList = [];

      for (int i = 0; i < doseControllersUpdate[day].length; i++) {
        final controller = doseControllersUpdate[day][i];

        // Add each time entry for this day
        dailyList.add(
          upReminder.DailyDoseTime(
            time: controller.text.substring(0, 5),
            date: DateFormat('yyyy-MM-dd').format(currentDate),
            isoDate: currentDate,
          ),
        );
      }

      // Add the day's list to dailyDose
      dailyDose.add(dailyList);

      // ✅ Increment the day once per outer loop iteration
      currentDate = currentDate.add(const Duration(days: 1));
    }

    logger.d('✅ DailyDoseTime list generated: $dailyDose');
    notifyListeners();
  }

  double getReminderStatusValue(
    List<List<getR.DailyDoseTime>> dailyDoseStatus,
  ) {
    // Flatten nested list
    final allDoses = dailyDoseStatus.expand((day) => day).toList();

    // Total and pending count
    totalCount = allDoses.length;
    takenCount = allDoses.where((d) => d.status == "TAKEN").length;

    // Return ratio as double (e.g. 0.8 for 4/5)
    if (totalCount == 0) return 0.0; // prevent divide-by-zero error
    return takenCount / totalCount;
  }

  void fundPaymentWallet(context) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        return ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => PharmViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, PharmViewModel model, _) {
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
                        key: formKeyFundWallet,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextView(
                              text: 'Fund Wallet',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                color: AppColors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            TextView(
                              text: 'Enter Amount',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                color: AppColors.black,
                                fontSize: 13.20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            TextFormWidget(
                              borderColor: AppColors.infoGrey1,
                              borderTopLeft: 10.r,
                              borderTopRight: 10.r,
                              borderBottomLeft: 10.r,
                              borderBottomRight: 10.r,

                              label: '',
                              hintSize: 16.60.sp,
                              controller: fundAmountController,
                              inputFormatters: [AmountFormatter()],
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              validator: AppValidator.validateAmount(
                                minAmount: 100.00,
                                maxAmount: 1000000000,
                              ),
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontSize: 14.2.sp,
                                color: AppColors.infoGrey,
                              ),
                              fillColor: AppColors.transparent,
                              isFilled: true,
                            ),

                            SizedBox(height: 35.h),
                            // 🔹 Save button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKeyFundWallet.currentState!
                                      .validate()) {
                                    model.createPayment(
                                      context,
                                      amount: fundAmountController.text
                                          .trim()
                                          .replaceAll(',', ''),
                                    );
                                  }
                                  model.notifyListeners();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: model.isLoading
                                    ? SpinKitCircle(
                                        color: AppColors.white,
                                        size: 22.sp,
                                      )
                                    : Text(
                                        "Proceed",
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
      },
    );
  }

  Future<void> createPayment(
    BuildContext context, {
    required String amount,
    String? description,
    String? paymentType,
  }) async {
    try {
      _isLoading = true;
      _createPaymentWalletModel = await runBusyFuture(
        repositoryImply.createWalletPayment(
          createPaymentWalletEntityModel: CreatePaymentWalletEntityModel(
            amount: double.parse(amount).toInt(),
            currency: "NGN",
            description: description ?? "Wallet top-up payment",
            paymentForType: paymentType ?? "WALLET_TOPUP",
            paymentForId: "wallet-topup-001",
            callbackUrl: "https://wallet.medicate.health/payments/return",
          ),
        ),
        throwException: true,
      );
      _isLoading = false;
      if (_createPaymentWalletModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _createPaymentWalletModel?.message ?? '',
        );
        initiateWalletPayment(
          reference: _createPaymentWalletModel?.data?.transactionReference,
          context: context,
        );
      } else {
        navigate.navigateTo(
          Routes.paymentStatusScreen,
          arguments: PaymentStatusScreenArguments(
            isSuccessful: false,
            isUserType: 'everyday_user',
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

  Future<void> initiateWalletPayment({
    String? reference,
    required BuildContext context,
  }) async {
    try {
      _isLoading = true;
      _initiatePaymentResponseModel = await runBusyFuture(
        repositoryImply.initiateWalletPayment(
          initiatePaymentWalletEntityModel: InitiatePaymentWalletEntityModel(
            reference: reference,
            callbackUrl: "https://wallet.medicate.health/payments/return",
          ),
        ),
        throwException: true,
      );
      _isLoading = false;
      if (_createPaymentWalletModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _initiatePaymentResponseModel?.message ?? '',
        );
        final result = await navigate.navigateTo(
          Routes.acceleratePaymentViewWallet,
          arguments: AcceleratePaymentViewWalletArguments(
            url: _initiatePaymentResponseModel?.data?.redirectUrl,
          ),
        );
        if (result == true) {
          await getWalletBalance(context);
          await getWalletTransactionHistory(context);
        }
      } else {
        AppUtils.snackbar(
          context,
          message: 'Unable to make transaction.',
          error: true,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getWalletBalance(context) async {
    try {
      _isLoading = true;
      _getWalletBalanceResponseModel = await runBusyFuture(
        repositoryImply.getWalletBalance(),
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

  Future<void> getWalletTransactionHistory(context) async {
    try {
      _isLoading = true;
      _getWalletTransactionHistoryResponseModel = await runBusyFuture(
        repositoryImply.getTransactionWallet(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
  }

  Map<String, List<Transaction>> groupTransactionsByDate(
    List<Transaction> transactions,
  ) {
    final Map<String, List<Transaction>> grouped = {};

    for (final tx in transactions) {
      final dateKey = DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.parse(tx.createdAt!)); // normalize date

      grouped.putIfAbsent(dateKey, () => []);
      grouped[dateKey]!.add(tx);
    }

    return grouped;
  }

  Future<void> payWithWalletAPI({
    String? reference,
    required BuildContext context,
    PharmViewModel? model,
  }) async {
    try {
      _isLoading = true;
      _payWithWalletResponseModel = await runBusyFuture(
        repositoryImply.payWithWallet(
          payWithWalletEntityModel: PayWithWalletEntityModel(
            transactionReference: reference,
          ),
        ),
        throwException: true,
      );
      _isLoading = false;
      if (_payWithWalletResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _payWithWalletResponseModel?.message ?? '',
        );
        medicationClassList.clear();
        await getWalletBalance(context);
        navigate.navigateTo(
          Routes.paymentStatusScreen,
          arguments: PaymentStatusScreenArguments(
            isSuccessful: true,
            isUserType: 'everyday_user',
          ),
        );
        model?.medicationClassList.clear();
      } else {
        AppUtils.snackbar(
          context,
          message: 'Unable to make transaction.',
          error: true,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
