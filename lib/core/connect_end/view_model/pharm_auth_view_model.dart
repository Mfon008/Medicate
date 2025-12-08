// ignore_for_file: strict_top_level_inference, use_build_context_synchronously, prefer_typing_uninitialized_variables, deprecated_member_use, unnecessary_null_comparison

// import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_entity_model/daily_dose_time.dart';
import 'package:medicate_app/core/connect_end/model/get_today_reminder_model/datum.dart';
import 'package:medicate_app/core/connect_end/model/upload_image_reminder_response_model/data.dart'
    as phImg;
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/daily_dose_time.dart'
    as getId;
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/data.dart'
    as getReminderId;
import 'package:medicate_app/core/connect_end/model/update_reminder_entity_model/payment.dart'
    as update;
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
import '../model/create_reminder_entity_model/create_reminder_entity_model.dart';
import '../model/create_reminder_entity_model/medication.dart';
import '../model/create_reminder_entity_model/medication_image.dart';
import '../model/create_reminder_entity_model/payment.dart';
import '../model/create_reminder_response_model/create_reminder_response_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_created_user_response_model/get_created_user_response_model.dart';
import '../model/get_reminder_by_id/get_reminder_by_id.dart';
import '../model/get_reminder_response_model/get_reminder_response_model.dart';
import '../model/get_reminder_response_model/reminder.dart';
import '../model/get_roles_response_model/get_roles_response_model.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/get_today_reminder_model/get_today_reminder_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/initiate_payment_response_model/initiate_payment_response_model.dart';
import '../model/login_entity_model.dart';
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
import 'package:medicate_app/core/connect_end/model/get_reminder_response_model/daily_dose_time.dart'
    as getR;
import 'package:medicate_app/core/connect_end/model/update_reminder_entity_model/daily_dose_time.dart'
    as upReminder;
import 'package:medicate_app/core/connect_end/model/get_reminder_response_model/payment.dart'
    as pyR;

String startDateIso = '';

List<MedicationClass> medicationClassList = [];

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
  GetReminderResponseModel? _getReminderResponseModel;
  GetReminderResponseModel? get getReminderResponseModel =>
      _getReminderResponseModel;

  GetReminderById? _getReminderByIdModel;
  GetReminderById? get getReminderByIdModel => _getReminderByIdModel;

  GetTodayReminderModel? _getTodaysReminderModel;
  GetTodayReminderModel? get getTodaysReminderModel => _getTodaysReminderModel;
  UpdateDosesStatusModel? _updateDosesStatusModel;
  UpdateDosesStatusModel? get updateDosesStatusModel => _updateDosesStatusModel;

  int linIndex = 1;
  int linIndexUpdate = 1;
  int indexOfMedicationClassList = 0;
  int? _duration;
  String onTapPaymentMeth = '';
  int? indexDaily;
  bool isChecked = false;
  bool onTapToAddAnotherReminder = false;
  bool isCheckedUp = false;
  int costTotal = 0;

  bool isTappedPhoneAdded = false;
  bool isTappedEmailAdded = false;
  bool _initializedUpdate = false;
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
  List<File> medicationFileUpdate = [];
  List<int> listOfTimesUpdate = [];

  List<File> medicationUpdateFile = [];
  List<String> meyTypeUpdateIcon = [];

  List<FocusNode> medNameUpdateFocusNodes = [];
  List<FocusNode> drugNameUpdateFocusNodes = [];
  List<FocusNode> descriptionUpdateFocusNodes = [];
  List<FocusNode> durationUpdateFocusNodes = [];
  List<FocusNode> timesToTakeUpdateFocusNodes = [];
  List<FocusNode> noteUpdateFocusNodes = [];
  bool isShowMoreSecondModalFlow = false;
  final List<String> channels = [
    'Email (Free)',
    'Push (Free)',
    'SMS (₦10.00)',
    'Whatsapp (₦20.00)',
    'Phone Call (₦50.00)',
  ];
  List<String> emailReminderList = [];
  List<String> addedEmailReminderList = [];
  List<String> phoneReminderList = [];
  List<String> addedPhoneReminderList = [];
  List<String> notificationChannel = [];

  int? index;
  int? totalDuration;
  int? numberOfTimes;
  String endDateIso = '';
  String _dosageLabel = '';
  String medTypeResult = '';
  String medTypeResultImage = '';
  String medTypeResultImageUpdate = '';
  String isReminderStatus = 'today';
  String timePeriod = 'morning';
  var totalCount;
  var takenCount;

  List<List<String>> periodLabels = [];
  List<List<String>> periodLabelsUpdate = [];
  List<List<String>> periodAfterLabels = [];
  List<MedType> medTypeList = [
    MedType(medType: 'Pill', medTypeImage: AppImage.pill),
    MedType(medType: 'Syrup', medTypeImage: AppImage.syrup),
    MedType(medType: 'Injection', medTypeImage: AppImage.syringe),
    MedType(medType: 'Drip', medTypeImage: AppImage.drip),
    MedType(medType: 'Ointment', medTypeImage: AppImage.ointment),
    MedType(medType: 'Inhaler', medTypeImage: AppImage.inhaler),
    MedType(medType: 'Vaccines', medTypeImage: AppImage.vaccines),
    MedType(medType: 'Others', medTypeImage: AppImage.other_meds),
  ];

  int? dosageValue;
  int? dosageAddedValue;
  int? dosageAfterValue;
  List<List<TextEditingController>> doseControllers = [];
  List<List<TextEditingController>> doseControllersUpdate = [];
  List<List<TextEditingController>> doseAfterControllers = [];

  GlobalKey<FormState> firstFormReminderKey = GlobalKey<FormState>();
  GlobalKey<FormState> firstFormReminderUpdateKey = GlobalKey<FormState>();
  GlobalKey<FormState> secondFormReminderKey = GlobalKey<FormState>();
  GlobalKey<FormState> secondFormReminderUpdateKey = GlobalKey<FormState>();

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
  String? pickedDate;
  File? imageDrug;
  String? drugFilename;
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController dateTimeControllerUpdate = TextEditingController();
  TextEditingController createAddPhoneController = TextEditingController();

  List<List<upReminder.DailyDoseTime>> dailyDose = [];

  final _pickImage = ImagePickerHandler();

  List listOfDosage = [];
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

  int pageOngoing = 1;
  int pageCompleted = 1;
  int pageToday = 1;

  bool _onTempPinTap = false;
  bool get onTempPinTap => _onTempPinTap;
  bool isTapped = false;
  bool isPhoneValid = false;
  bool isLoadNoMore = false;
  bool onTapViewSingleReminder = false;

  List<int> intList = [];

  GlobalKey<FormState> formKeyEmailReminder = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPhoneReminder = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyCreateAddPhoneReminder = GlobalKey<FormState>();

  DateFormat inputFormat = DateFormat("dd MMM, yyyy");
  DateTime? dateTimeObject;

  File? image;
  String? searchUsers = '';
  String? searchRoles = '';
  String? searchuserByPharm = '';
  String? imageReminderUpdate;
  String? filename;
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

  // Future<void> fetchStates(String country) async {
  //   final uri = Uri.parse(
  //     'https://countriesnow.space/api/v0.1/countries/states/q',
  //   ).replace(queryParameters: {'country': country});

  //   try {
  //     _isLoading = true;
  //     final response = await http.get(
  //       uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final jsonData = jsonDecode(response.body);
  //       _getStateResponseModel = GetStateResponseModel.fromJson(jsonData);
  //       _isLoading = false;
  //     } else {
  //       _isLoading = false;
  //     }
  //   } catch (e) {
  //     _isLoading = false;
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  // }

  // Future<void> fetchLga({String? country, String? state}) async {
  //   final uri = Uri.parse(
  //     'https://countriesnow.space/api/v0.1/countries/state/cities/q',
  //   ).replace(queryParameters: {'country': country, 'state': state});

  //   try {
  //     _isLoading = true;
  //     final response = await http.get(
  //       uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final jsonData = jsonDecode(response.body);
  //       _getCityResponseModel = GetCityResponseModel.fromJson(jsonData);
  //       _isLoading = false;
  //     } else {
  //       _isLoading = false;
  //     }
  //   } catch (e) {
  //     _isLoading = false;
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  // }

  // void modalBottomSheetMenuStateUser(context) {
  //   final model = this;
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true, // Enables full-screen dragging
  //     backgroundColor: Colors.white,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (builder) {
  //       return StateBottomSheet(model: model);
  //       // return Padding(
  //       //   padding: EdgeInsets.only(
  //       //     bottom: MediaQuery.of(context).viewInsets.bottom,
  //       //   ),
  //       //   child: DraggableScrollableSheet(
  //       //     expand: false,
  //       //     initialChildSize: 0.5, // 50% of screen height
  //       //     minChildSize: 0.3, // Can be dragged to 30% of screen height
  //       //     maxChildSize: 0.9, // Can be dragged to 90% of screen height
  //       //     builder: (context, scrollController) {
  //       //       return ViewModelBuilder<PharmViewModel>.reactive(
  //       //         viewModelBuilder: () => PharmViewModel(),
  //       //         onViewModelReady: (model) async {
  //       //           await model.fetchStates(countryController.text);
  //       //         },
  //       //         disposeViewModel: false,
  //       //         builder: (_, PharmViewModel model, _) {
  //       //           return SingleChildScrollView(
  //       //             controller: scrollController,
  //       //             child: Column(
  //       //               crossAxisAlignment: CrossAxisAlignment.start,
  //       //               children: [
  //       //                 SizedBox(height: 22.0.h),
  //       //                 Padding(
  //       //                   padding: EdgeInsets.all(12.w),
  //       //                   child: TextFormWidget(
  //       //                     label: 'Search state',
  //       //                     isFilled: true,
  //       //                     borderTopLeft: 10.r,
  //       //                     borderTopRight: 10.r,
  //       //                     borderBottomLeft: 10.r,
  //       //                     borderBottomRight: 10.r,
  //       //                     fillColor: AppColors.grey,
  //       //                     onChange: (p0) {
  //       //                       queryState = p0;
  //       //                       model.notifyListeners();
  //       //                     },
  //       //                     suffixIcon: Icons.search_sharp,
  //       //                     controller: stateController,
  //       //                   ),
  //       //                 ),
  //       //                 SizedBox(height: 16.h),
  //       //                 queryState == ''
  //       //                     ? model.isLoading
  //       //                           ? SpinKitFadingFour(
  //       //                               color: AppColors.primary1,
  //       //                               size: 40.sp,
  //       //                             )
  //       //                           : Column(
  //       //                               crossAxisAlignment:
  //       //                                   CrossAxisAlignment.start,
  //       //                               children: [
  //       //                                 if (model.getStateResponseModel !=
  //       //                                         null &&
  //       //                                     model
  //       //                                         .getStateResponseModel!
  //       //                                         .data!
  //       //                                         .states!
  //       //                                         .isNotEmpty)
  //       //                                   ...model
  //       //                                       .getStateResponseModel!
  //       //                                       .data!
  //       //                                       .states!
  //       //                                       .map(
  //       //                                         (e) => GestureDetector(
  //       //                                           onTap: () {
  //       //                                             stateController.text =
  //       //                                                 e.name!;
  //       //                                             Navigator.pop(context);
  //       //                                             model.notifyListeners();
  //       //                                           },
  //       //                                           child: Container(
  //       //                                             decoration: BoxDecoration(
  //       //                                               color: AppColors.white,
  //       //                                             ),
  //       //                                             padding:
  //       //                                                 EdgeInsets.symmetric(
  //       //                                                   vertical: 4.6.w,
  //       //                                                   horizontal: 20.w,
  //       //                                                 ),
  //       //                                             child: Container(
  //       //                                               padding: EdgeInsets.all(
  //       //                                                 6.w,
  //       //                                               ),
  //       //                                               decoration: BoxDecoration(
  //       //                                                 borderRadius:
  //       //                                                     BorderRadius.circular(
  //       //                                                       10,
  //       //                                                     ),
  //       //                                                 color: AppColors
  //       //                                                     .transparent,
  //       //                                               ),
  //       //                                               child: TextView(
  //       //                                                 text: '${e.name}',
  //       //                                                 textOverflow:
  //       //                                                     TextOverflow
  //       //                                                         .ellipsis,
  //       //                                                 textStyle: TextStyle(
  //       //                                                   fontWeight:
  //       //                                                       FontWeight.w400,
  //       //                                                   fontFamily: 'Arial',
  //       //                                                   fontSize: 17.2.sp,

  //       //                                                   color:
  //       //                                                       AppColors.black,
  //       //                                                 ),
  //       //                                                 fontWeight:
  //       //                                                     FontWeight.w400,
  //       //                                               ),
  //       //                                             ),
  //       //                                           ),
  //       //                                         ),
  //       //                                       ),
  //       //                               ],
  //       //                             )
  //       //                     : Column(
  //       //                         crossAxisAlignment: CrossAxisAlignment.start,
  //       //                         children: [
  //       //                           if (model.getStateResponseModel != null &&
  //       //                               model
  //       //                                   .getStateResponseModel!
  //       //                                   .data!
  //       //                                   .states!
  //       //                                   .isNotEmpty)
  //       //                             ...model
  //       //                                 .getStateResponseModel!
  //       //                                 .data!
  //       //                                 .states!
  //       //                                 .where(
  //       //                                   (o) => o.name!.toLowerCase().contains(
  //       //                                     queryState.toLowerCase(),
  //       //                                   ),
  //       //                                 )
  //       //                                 .map(
  //       //                                   (e) => GestureDetector(
  //       //                                     onTap: () {
  //       //                                       stateController.text = e.name!;
  //       //                                       Navigator.pop(context);
  //       //                                       model.notifyListeners();
  //       //                                     },
  //       //                                     child: Container(
  //       //                                       decoration: BoxDecoration(
  //       //                                         color: AppColors.white,
  //       //                                       ),
  //       //                                       padding: EdgeInsets.symmetric(
  //       //                                         vertical: 4.6.w,
  //       //                                         horizontal: 20.w,
  //       //                                       ),
  //       //                                       child: Container(
  //       //                                         padding: EdgeInsets.all(6.w),
  //       //                                         decoration: BoxDecoration(
  //       //                                           borderRadius:
  //       //                                               BorderRadius.circular(10),
  //       //                                           color: AppColors.transparent,
  //       //                                         ),
  //       //                                         child: TextView(
  //       //                                           text: '${e.name}',
  //       //                                           textOverflow:
  //       //                                               TextOverflow.ellipsis,
  //       //                                           textStyle: TextStyle(
  //       //                                             fontWeight: FontWeight.w400,
  //       //                                             fontFamily: 'Arial',
  //       //                                             fontSize: 17.2.sp,

  //       //                                             color: AppColors.black,
  //       //                                           ),
  //       //                                         ),
  //       //                                       ),
  //       //                                     ),
  //       //                                   ),
  //       //                                 ),
  //       //                         ],
  //       //                       ),
  //       //                 SizedBox(height: 14.0.h),
  //       //               ],
  //       //             ),
  //       //           );
  //       //         },
  //       //       );
  //       //     },
  //       //   ),
  //       // );
  //     },
  //   );
  // }

  // void modalBottomSheetMenuState(context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true, // Enables full-screen dragging
  //     backgroundColor: Colors.white,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (builder) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         child: DraggableScrollableSheet(
  //           expand: false,
  //           initialChildSize: 0.5, // 50% of screen height
  //           minChildSize: 0.3, // Can be dragged to 30% of screen height
  //           maxChildSize: 0.9, // Can be dragged to 90% of screen height
  //           builder: (context, scrollController) {
  //             return ViewModelBuilder<PharmViewModel>.reactive(
  //               viewModelBuilder: () => PharmViewModel(),
  //               onViewModelReady: (model) async {
  //                 await model.fetchStates(countryController.text);
  //               },
  //               disposeViewModel: false,
  //               builder: (_, PharmViewModel model, _) {
  //                 return SingleChildScrollView(
  //                   controller: scrollController,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox(height: 22.0.h),
  //                       Padding(
  //                         padding: EdgeInsets.all(12.w),
  //                         child: TextFormWidget(
  //                           label: 'Search state',
  //                           isFilled: true,
  //                           borderTopLeft: 10.r,
  //                           borderTopRight: 10.r,
  //                           borderBottomLeft: 10.r,
  //                           borderBottomRight: 10.r,
  //                           fillColor: AppColors.grey,
  //                           onChange: (p0) {
  //                             queryState = p0;
  //                             model.notifyListeners();
  //                           },
  //                           suffixIcon: Icons.search_sharp,
  //                           controller: stateController,
  //                         ),
  //                       ),
  //                       SizedBox(height: 16.h),
  //                       queryState == ''
  //                           ? model.isLoading
  //                                 ? SpinKitFadingFour(
  //                                     color: AppColors.primary1,
  //                                     size: 40.sp,
  //                                   )
  //                                 : Column(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: [
  //                                       if (model.getStateResponseModel !=
  //                                               null &&
  //                                           model
  //                                               .getStateResponseModel!
  //                                               .data!
  //                                               .states!
  //                                               .isNotEmpty)
  //                                         ...model
  //                                             .getStateResponseModel!
  //                                             .data!
  //                                             .states!
  //                                             .map(
  //                                               (e) => GestureDetector(
  //                                                 onTap: () {
  //                                                   stateController.text =
  //                                                       e.name!;
  //                                                   Navigator.pop(context);
  //                                                   model.notifyListeners();
  //                                                 },
  //                                                 child: Container(
  //                                                   decoration: BoxDecoration(
  //                                                     color: AppColors.white,
  //                                                   ),
  //                                                   padding:
  //                                                       EdgeInsets.symmetric(
  //                                                         vertical: 4.6.w,
  //                                                         horizontal: 20.w,
  //                                                       ),
  //                                                   child: Container(
  //                                                     padding: EdgeInsets.all(
  //                                                       6.w,
  //                                                     ),
  //                                                     decoration: BoxDecoration(
  //                                                       borderRadius:
  //                                                           BorderRadius.circular(
  //                                                             10,
  //                                                           ),
  //                                                       color: AppColors
  //                                                           .transparent,
  //                                                     ),
  //                                                     child: TextView(
  //                                                       text: '${e.name}',
  //                                                       textOverflow:
  //                                                           TextOverflow
  //                                                               .ellipsis,
  //                                                       textStyle: TextStyle(
  //                                                         fontWeight:
  //                                                             FontWeight.w400,
  //                                                         fontFamily: 'Arial',
  //                                                         fontSize: 17.2.sp,

  //                                                         color:
  //                                                             AppColors.black,
  //                                                       ),
  //                                                       fontWeight:
  //                                                           FontWeight.w400,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                     ],
  //                                   )
  //                           : Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 if (model.getStateResponseModel != null &&
  //                                     model
  //                                         .getStateResponseModel!
  //                                         .data!
  //                                         .states!
  //                                         .isNotEmpty)
  //                                   ...model
  //                                       .getStateResponseModel!
  //                                       .data!
  //                                       .states!
  //                                       .where(
  //                                         (o) => o.name!.toLowerCase().contains(
  //                                           queryState.toLowerCase(),
  //                                         ),
  //                                       )
  //                                       .map(
  //                                         (e) => GestureDetector(
  //                                           onTap: () {
  //                                             stateController.text = e.name!;
  //                                             Navigator.pop(context);
  //                                             model.notifyListeners();
  //                                           },
  //                                           child: Container(
  //                                             decoration: BoxDecoration(
  //                                               color: AppColors.white,
  //                                             ),
  //                                             padding: EdgeInsets.symmetric(
  //                                               vertical: 4.6.w,
  //                                               horizontal: 20.w,
  //                                             ),
  //                                             child: Container(
  //                                               padding: EdgeInsets.all(6.w),
  //                                               decoration: BoxDecoration(
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(10),
  //                                                 color: AppColors.transparent,
  //                                               ),
  //                                               child: TextView(
  //                                                 text: '${e.name}',
  //                                                 textOverflow:
  //                                                     TextOverflow.ellipsis,
  //                                                 textStyle: TextStyle(
  //                                                   fontWeight: FontWeight.w400,
  //                                                   fontFamily: 'Arial',
  //                                                   fontSize: 17.2.sp,

  //                                                   color: AppColors.black,
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                               ],
  //                             ),
  //                       SizedBox(height: 14.0.h),
  //                     ],
  //                   ),
  //                 );
  //               },
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  // void modalBottomSheetMenuLga(context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true, // Enables full-screen dragging
  //     backgroundColor: Colors.white,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (builder) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         child: DraggableScrollableSheet(
  //           expand: false,
  //           initialChildSize: 0.5, // 50% of screen height
  //           minChildSize: 0.3, // Can be dragged to 30% of screen height
  //           maxChildSize: 0.9, // Can be dragged to 90% of screen height
  //           builder: (context, scrollController) {
  //             return ViewModelBuilder<PharmViewModel>.reactive(
  //               viewModelBuilder: () => PharmViewModel(),
  //               onViewModelReady: (model) {
  //                 model.fetchLga(
  //                   country: countryController.text,
  //                   state: stateController.text,
  //                 );
  //               },
  //               disposeViewModel: false,
  //               builder: (_, PharmViewModel model, _) {
  //                 return SingleChildScrollView(
  //                   controller: scrollController,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox(height: 22.0.h),
  //                       Padding(
  //                         padding: EdgeInsets.all(12.w),
  //                         child: TextFormWidget(
  //                           label: 'Search city',
  //                           isFilled: true,
  //                           borderTopLeft: 10.r,
  //                           borderTopRight: 10.r,
  //                           borderBottomLeft: 10.r,
  //                           borderBottomRight: 10.r,
  //                           fillColor: AppColors.grey,
  //                           onChange: (p0) {
  //                             queryLga = p0;
  //                             model.notifyListeners();
  //                           },
  //                           suffixIcon: Icons.search_sharp,
  //                           controller: lgaController,
  //                         ),
  //                       ),
  //                       SizedBox(height: 16.h),
  //                       queryLga == ''
  //                           ? model.isLoading
  //                                 ? SpinKitFadingFour(
  //                                     color: AppColors.primary1,
  //                                     size: 40.sp,
  //                                   )
  //                                 : Column(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: [
  //                                       if (model.getCityResponseModel !=
  //                                               null &&
  //                                           model
  //                                               .getCityResponseModel!
  //                                               .data!
  //                                               .isNotEmpty)
  //                                         ...model.getCityResponseModel!.data!
  //                                             .map(
  //                                               (e) => GestureDetector(
  //                                                 onTap: () {
  //                                                   lgaController.text = e;
  //                                                   Navigator.pop(context);
  //                                                   model.notifyListeners();
  //                                                 },
  //                                                 child: Container(
  //                                                   decoration: BoxDecoration(
  //                                                     color: AppColors.white,
  //                                                   ),
  //                                                   padding:
  //                                                       EdgeInsets.symmetric(
  //                                                         vertical: 4.6.w,
  //                                                         horizontal: 20.w,
  //                                                       ),
  //                                                   child: Container(
  //                                                     padding: EdgeInsets.all(
  //                                                       6.w,
  //                                                     ),
  //                                                     decoration: BoxDecoration(
  //                                                       borderRadius:
  //                                                           BorderRadius.circular(
  //                                                             10,
  //                                                           ),
  //                                                       color: AppColors
  //                                                           .transparent,
  //                                                     ),
  //                                                     child: SizedBox(
  //                                                       width: 200.w,
  //                                                       child: TextView(
  //                                                         text: e,
  //                                                         textOverflow:
  //                                                             TextOverflow
  //                                                                 .ellipsis,
  //                                                         textStyle: TextStyle(
  //                                                           fontWeight:
  //                                                               FontWeight.w400,
  //                                                           fontFamily: 'Arial',
  //                                                           fontSize: 17.2.sp,

  //                                                           color:
  //                                                               AppColors.black,
  //                                                         ),
  //                                                         fontWeight:
  //                                                             FontWeight.w400,
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                     ],
  //                                   )
  //                           : Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 ...model.getCityResponseModel!.data!
  //                                     .where(
  //                                       (o) => o.toLowerCase().contains(
  //                                         queryLga.toLowerCase(),
  //                                       ),
  //                                     )
  //                                     .map(
  //                                       (e) => GestureDetector(
  //                                         onTap: () {
  //                                           lgaController.text = e;
  //                                           Navigator.pop(context);
  //                                           model.notifyListeners();
  //                                         },
  //                                         child: Container(
  //                                           decoration: BoxDecoration(
  //                                             color: AppColors.white,
  //                                           ),
  //                                           padding: EdgeInsets.symmetric(
  //                                             vertical: 4.6.w,
  //                                             horizontal: 20.w,
  //                                           ),
  //                                           child: Container(
  //                                             padding: EdgeInsets.all(6.w),
  //                                             decoration: BoxDecoration(
  //                                               borderRadius:
  //                                                   BorderRadius.circular(10),
  //                                               color: AppColors.transparent,
  //                                             ),
  //                                             child: TextView(
  //                                               text: e,
  //                                               textOverflow:
  //                                                   TextOverflow.ellipsis,
  //                                               textStyle: TextStyle(
  //                                                 fontWeight: FontWeight.w400,
  //                                                 fontFamily: 'Arial',
  //                                                 fontSize: 17.2.sp,

  //                                                 color: AppColors.black,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ),
  //                               ],
  //                             ),
  //                       SizedBox(height: 14.0.h),
  //                     ],
  //                   ),
  //                 );
  //               },
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('+234')) {
      return phoneNumber.replaceFirst('+234', '0');
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
      AppUtils.snackbar(context, message: e.toString(), error: true);
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
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
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
    state
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
            Navigator.of(context).pop(true);
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
          // uploadImageReminder(
          //   context: context,
          //   file: MultipartFile.fromBytes(
          //     formartFileImage(imageDrug).readAsBytesSync(),
          //     filename: imageDrug!.path.split("/").last,
          //   ),
          // );
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
      // _uploadImageReminderResponseModel = await runBusyFuture(
      // repositoryImply.uploadImageReminder(file!),
      // throwException: true,
      // );
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
      return 'Choose Notification Channel';
    } else if (linIndex == 4) {
      return 'Make Payment';
    }
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

  addReminderToList(PharmViewModel model) async {
    List<Map<String, dynamic>> addTimePeriod = [];
    String startDateIsoWithin = startDateIso;

    for (int day = 0; day < model.doseControllers.length; day++) {
      List<Map<String, String>> dayDoses = [];

      for (int i = 0; i < model.doseControllers[day].length; i++) {
        dayDoses.add({
          'time': model.doseControllers[day][i].text,
          'period': model.periodLabels[day][i],
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
        imageData: model.uploadImageReminderResponseModel?.data ?? phImg.Data(),
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

    if (isReminderStatus == 'all' && reminders.isNotEmpty) return true;
    if (isReminderStatus == 'ongoing' && reminders.isNotEmpty) return true;
    if (isReminderStatus == 'completed' && reminders.isNotEmpty) return true;
    if (isReminderStatus == 'today' && reminders.isNotEmpty) return true;

    return false;
  }

  void initUpdateControllers() async {
    medicationNameUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.medicationName))
        .toList();
    medNameUpdateFocusNodes.add(FocusNode());
    drugNameUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.drugName))
        .toList();
    drugNameUpdateFocusNodes.add(FocusNode());
    medTypeUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.medicationType))
        .toList();
    meyTypeUpdateIcon = medicationClassList
        .map((e) => e.medicationTypeIcon!)
        .toList();
    dosageUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.dosage))
        .toList();
    descriptionUpdateFocusNodes.add(FocusNode());
    startDateUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.dateAndTime))
        .toList();
    // update the start date iso as well when selecting date
    // update the end date iso as well when selecting date
    durationUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.duration))
        .toList();
    durationUpdateFocusNodes.add(FocusNode());
    endDateUpdateController = medicationClassList
        .map((e) => TextEditingController(text: e.endDate))
        .toList();
    listOfTimesUpdate = medicationClassList
        .expand((e) => e.listOfTimes!)
        .cast<int>()
        .toList();
    timesToTakeUpdateController = medicationClassList
        .map((e) => TextEditingController(text: e.timesToTake))
        .toList();
    timesToTakeUpdateFocusNodes.add(FocusNode());
    noteUpdateController = medicationClassList
        .map((e) => TextEditingController(text: e.note))
        .toList();
    noteUpdateFocusNodes.add(FocusNode());
    descriptionUpdateControllers = medicationClassList
        .map((e) => TextEditingController(text: e.description))
        .toList();
    medicationFileUpdate = medicationClassList
        .map((e) => e.medicationFile ?? File(''))
        .toList();
    for (var med in medicationClassList) {
      final dosageMap = med.dosageMap ?? [];

      // Map through the day-level list
      final controllersPerDay = dosageMap.map<List<TextEditingController>>((
        dayItem,
      ) {
        final doses = (dayItem['doses'] ?? []) as List;

        // Create controllers for each dose
        final doseControllers = doses.map<TextEditingController>((dose) {
          final timeValue = dose['time']?.toString() ?? '';
          print('⏰ Time found: $timeValue');
          return TextEditingController(text: timeValue);
        }).toList();

        return doseControllers;
      }).toList();

      doseAfterControllers =
          controllersPerDay; // assign per medication if you're looping
      // If you want to store for multiple meds: use a parent list like List<List<List<TextEditingController>>>>
    }

    print('✅ doseAfterControllers created: ${doseAfterControllers.length}');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
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
              return ViewModelBuilder<PharmViewModel>.reactive(
                viewModelBuilder: () => locator<PharmViewModel>(),
                onViewModelReady: (model) {},
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

  returnTotalDays() {
    if(medicationClassList.isEmpty){
      totalDuration = _getReminderByIdModel!.data!.medication!.durationInDays;
    }else{
      totalDuration = medicationClassList.fold(
        0,
            (sum, item) => sum! + int.parse(item.duration!.substring(0, 1)),
      );
    }

    return totalDuration;
  }

  int returnNumberOfTimes() {
    // numberOfTimes = int.parse(medicationClassList[0].timesToTake!);
    if(medicationClassList.isEmpty){
      numberOfTimes = _getReminderByIdModel!.data!.medication!.timesPerDay!;
    }else{
      numberOfTimes = int.parse(medicationClassList[0].timesToTake!);
    }
    return numberOfTimes!;
  }

  setNoOfTimesWithDurationUpdate(index) {
    if (medicationClassList[index].timesToTake!.isNotEmpty) {
      final timesCount =
          int.tryParse(medicationClassList[index].timesToTake.toString()) ?? 0;
      final durationCount =
          int.tryParse(
            medicationClassList[index].duration?.toString() ?? '0',
          ) ??
          0;
      // 🔹 Get the old data before rebuilding
      final oldControllers = List<List<TextEditingController>>.from(
        doseAfterControllers,
      );
      final oldPeriods = List<List<String>>.from(periodAfterLabels);
      // 🔹 Rebuild dosageMap safely (preserve where possible)
      medicationClassList[index].dosageMap = List.generate(durationCount, (
        day,
      ) {
        final oldDay = (day < medicationClassList[index].dosageMap.length)
            ? medicationClassList[index].dosageMap[day]
            : null;
        final oldDoses = oldDay != null
            ? List<Map<String, dynamic>>.from(oldDay['doses'])
            : [];
        return {
          "day": day + 1,
          "doses": List.generate(timesCount, (doseIndex) {
            if (doseIndex < oldDoses.length) {
              // preserve previous time + period if available
              return {
                "time": oldDoses[doseIndex]["time"] ?? "",
                "period": oldDoses[doseIndex]["period"] ?? "",
                "date": oldDoses[doseIndex]["date"] ?? "",
                "isoDate": oldDoses[doseIndex]["isoDate"] ?? "",
              };
            }
            // otherwise new empty slot
            return {"time": "", "period": "", "date": "", "isoDate": ""};
          }),
        };
      });

      // 🔹 Rebuild controllers but preserve existing values
      doseAfterControllers = List.generate(durationCount, (dayIndex) {
        return List.generate(timesCount, (doseIndex) {
          if (dayIndex < oldControllers.length &&
              doseIndex < oldControllers[dayIndex].length) {
            return oldControllers[dayIndex][doseIndex];
          } else {
            return TextEditingController(
              text:
                  medicationClassList[index]
                      .dosageMap[dayIndex]["doses"][doseIndex]["time"] ??
                  "",
            );
          }
        });
      });

      // 🔹 Rebuild period labels safely
      periodAfterLabels = List.generate(durationCount, (dayIndex) {
        return List.generate(timesCount, (doseIndex) {
          if (dayIndex < oldPeriods.length &&
              doseIndex < oldPeriods[dayIndex].length) {
            return oldPeriods[dayIndex][doseIndex];
          } else {
            return medicationClassList[index]
                    .dosageMap[dayIndex]["doses"][doseIndex]["period"] ??
                "";
          }
        });
      });
      notifyListeners();
    }
  }

  setModalFlow({
    PharmViewModel? model,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
  }) {
    if (linIndex == 2) {
      return firstModalFLow(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    } else if (linIndex == 3) {
      return secondModalFlow(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    } else if (linIndex == 4) {
      return thirdModalFlow(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    } else if (linIndex == 5) {
      return fourthModalFlow(
        model: model,
        context: context,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    }
    return firstUserReminderModalFLow(
      model: model,
      context: context,
      setModalState: setModalState,
      scrollController: scrollController,
    );
  }

  reminderWidget({
    context,
    isTab,
    Reminder? reminder,
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
            await model.getTodaysReminder(
              context,
              period: model.timePeriod,
              date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            );
            model.getReminder(
              context,
              status: model.isReminderStatus,
              page: model.pageOngoing.toString(),
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
                          value: linIndex / 4,
                          color: AppColors.primary, // Progress bar color
                          backgroundColor:
                              Colors.grey[300], // Background track color
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
                        text: 'John Doe',
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
                        text: '09098765412',
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
                        text: 'johndoe@gmail.com',
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
                      // genderController.text = result;
                      model.isReminderStatus = result;
                      await Future.delayed(Duration(milliseconds: 400));
                      model.getReminder(
                        context,
                        status: model.isReminderStatus,
                        page: model.pageOngoing.toString(),
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
                      model.getReminderResponseModel != null &&
                          model
                              .getReminderResponseModel!
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
                                      .getReminderResponseModel!
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
                                      .getReminderResponseModel!
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
                                      .getReminderResponseModel!
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
                                                              o.drugName ?? '',
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
                                                        .getReminderResponseModel!
                                                        .data!
                                                        .meta!
                                                        .page ==
                                                    '1'
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
                                                          .getReminderResponseModel!
                                                          .data!
                                                          .meta!
                                                          .page ==
                                                      '1'
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
                                                      'Page ${model.getReminderResponseModel!.data!.meta!.page} of ${model.getReminderResponseModel!.data!.meta!.totalPages}',
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
                                                        .getReminderResponseModel!
                                                        .data!
                                                        .meta!
                                                        .page ==
                                                    model
                                                        .getReminderResponseModel!
                                                        .data!
                                                        .meta!
                                                        .totalPages
                                                        .toString()
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
                                                          .getReminderResponseModel!
                                                          .data!
                                                          .meta!
                                                          .page ==
                                                      model
                                                          .getReminderResponseModel!
                                                          .data!
                                                          .meta!
                                                          .totalPages
                                                          .toString()
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
                                              onTap: () => model
                                                  .showCreateAddPhoneDialog(
                                                    context,
                                                  ),
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
                                          onTap: () =>
                                              model.showCreateAddPhoneDialog(
                                                context,
                                              ),
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
    initUpdateControllers();
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
                      value: linIndex / 5,
                      color: AppColors.primary, // Progress bar color
                      backgroundColor:
                          Colors.grey[300], // Background track color
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                TextView(
                  text: '$linIndex/5',
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
                          hintSize: 14.sp,
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
                          hintSize: 13.62.sp,
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
                                      child: model!.imageDrug != null
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
                                fontSize: 14.sp,
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
                          hintSize: 14.sp,
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
                          hintSize: 14.sp,
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
                                  Duration(days: _duration! - 1),
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
                          hintSize: 14.sp,
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
                                isFilled:
                                    true, // Minimum number of lines visible
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
                                              borderColor:
                                                  AppColors.transparent,
                                              borderTopLeft: 10.r,
                                              borderTopRight: 10.r,
                                              borderBottomLeft: 10.r,
                                              borderBottomRight: 10.r,
                                              hintSize: 14.sp,
                                              fillColor: AppColors.grey,
                                              isFilled: true,
                                              focusNode:
                                                  medNameUpdateFocusNodes[index],
                                              controller:
                                                  medicationNameUpdateControllers[index],
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
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                      final controller =
                                                          medicationNameUpdateControllers[index];
                                                      final focusNode =
                                                          medNameUpdateFocusNodes[index];
                                                      // Keep cursor at end
                                                      controller.selection =
                                                          TextSelection.fromPosition(
                                                            TextPosition(
                                                              offset: controller
                                                                  .text
                                                                  .length,
                                                            ),
                                                          );

                                                      // Re-request focus
                                                      focusNode.requestFocus();

                                                      // ;
                                                    });
                                                model!.notifyListeners();
                                              },
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
                                              hintSize: 14.sp,
                                              fillColor: AppColors.grey,
                                              isFilled: true,
                                              focusNode:
                                                  drugNameUpdateFocusNodes[index],
                                              controller:
                                                  drugNameUpdateControllers[index],
                                              onChange: (val) {
                                                medicationClassList[index]
                                                        .drugName =
                                                    val;
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                      final controller =
                                                          drugNameUpdateControllers[index];
                                                      final focusNode =
                                                          drugNameUpdateFocusNodes[index];
                                                      // Keep cursor at end
                                                      controller.selection =
                                                          TextSelection.fromPosition(
                                                            TextPosition(
                                                              offset: controller
                                                                  .text
                                                                  .length,
                                                            ),
                                                          );

                                                      // Re-request focus
                                                      focusNode.requestFocus();
                                                    });
                                                model!.notifyListeners();
                                              },
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
                                              borderColor:
                                                  AppColors.transparent,
                                              borderTopLeft: 10.r,
                                              borderTopRight: 10.r,
                                              borderBottomLeft: 10.r,
                                              borderBottomRight: 10.r,
                                              readOnly: true,
                                              fillColor: AppColors.grey,
                                              isFilled: true,
                                              prefixWidget:
                                                  meyTypeUpdateIcon[index]
                                                      .isNotEmpty
                                                  ? Padding(
                                                      padding: EdgeInsets.all(
                                                        10.w,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        meyTypeUpdateIcon[index],
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
                                                      medicationClassList[index]
                                                              .medicationTypeIcon =
                                                          result["icon"] ?? '';
                                                      medicationClassList[index]
                                                              .medicationType =
                                                          result["type"] ?? '';
                                                      final controller =
                                                          medTypeUpdateControllers[index];
                                                      final focusNode =
                                                          medNameUpdateFocusNodes[index]; // create a list of FocusNodes if you haven’t

                                                      controller.text =
                                                          result["type"] ?? '';
                                                      controller.selection =
                                                          TextSelection.fromPosition(
                                                            TextPosition(
                                                              offset: controller
                                                                  .text
                                                                  .length,
                                                            ),
                                                          );

                                                      // Re-request focus so user stays in the same field
                                                      focusNode.requestFocus();
                                                    });
                                                  }
                                                  model!.notifyListeners();
                                                },
                                              ),
                                              controller:
                                                  medTypeUpdateControllers[index],
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
                                              borderColor:
                                                  AppColors.transparent,
                                              borderTopLeft: 10.r,
                                              borderTopRight: 10.r,
                                              borderBottomLeft: 10.r,
                                              borderBottomRight: 10.r,
                                              fillColor: AppColors.grey,
                                              focusNode:
                                                  descriptionUpdateFocusNodes[index],
                                              isFilled: true,
                                              controller:
                                                  descriptionUpdateControllers[index],
                                              onChange: (val) {
                                                medicationClassList[index]
                                                        .description =
                                                    val;
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                      final controller =
                                                          descriptionUpdateControllers[index];
                                                      final focusNode =
                                                          descriptionUpdateFocusNodes[index];
                                                      // Keep cursor at end
                                                      controller.selection =
                                                          TextSelection.fromPosition(
                                                            TextPosition(
                                                              offset: controller
                                                                  .text
                                                                  .length,
                                                            ),
                                                          );
                                                      focusNode.requestFocus();
                                                    });
                                                model!.notifyListeners();
                                              },
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
                                                      radius: Radius.circular(
                                                        10,
                                                      ),
                                                      color:
                                                          AppColors.infoGrey1,
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
                                                              medicationFileUpdate[index] !=
                                                                  null
                                                              ? Image.file(
                                                                  medicationFileUpdate[index],
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
                                                              model!
                                                                  .notifyListeners();
                                                            },
                                                            child:
                                                                SvgPicture.asset(
                                                                  AppImage
                                                                      .delete,
                                                                  height:
                                                                      16.68.h,
                                                                  width: 15.2.w,
                                                                ),
                                                          ),
                                                          SizedBox(
                                                            width: 18.30.w,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () => model!
                                                                .pickDrugUpdateImage(
                                                                  context:
                                                                      context,
                                                                  index: index,
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
                                              borderColor:
                                                  AppColors.transparent,
                                              borderTopLeft: 10.r,
                                              borderTopRight: 10.r,
                                              borderBottomLeft: 10.r,
                                              borderBottomRight: 10.r,
                                              label:
                                                  dosageUpdateControllers[index]
                                                      .text,
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
                                                  final result =
                                                      await showMedDosageMenu(
                                                        context,
                                                      );
                                                  if (result != null) {
                                                    setModalState!(() {
                                                      medicationClassList[index]
                                                              .dosage =
                                                          result;
                                                    });
                                                  }
                                                  model!.notifyListeners();
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
                                              borderColor:
                                                  AppColors.transparent,
                                              borderTopLeft: 10.r,
                                              borderTopRight: 10.r,
                                              borderBottomLeft: 10.r,
                                              borderBottomRight: 10.r,
                                              readOnly: true,
                                              hintSize: 14.sp,
                                              fillColor: AppColors.grey,
                                              isFilled: true,
                                              controller:
                                                  startDateUpdateControllers[index],
                                              suffixWidget: Padding(
                                                padding: EdgeInsets.all(8.w),
                                                child: GestureDetector(
                                                  onTap: () =>
                                                      model!.selectDateUPDATE(
                                                        context: context,
                                                        index: index,
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
                                              hintSize: 14.sp,
                                              keyboardType:
                                                  TextInputType.number,
                                              borderColor:
                                                  AppColors.transparent,
                                              borderTopLeft: 10.r,
                                              borderTopRight: 10.r,
                                              borderBottomLeft: 10.r,
                                              borderBottomRight: 10.r,
                                              fillColor: AppColors.grey,
                                              isFilled: true,
                                              onChange: (p0) {
                                                final controller =
                                                    durationUpdateControllers[index];
                                                final focusNode =
                                                    durationUpdateFocusNodes[index];

                                                // update data model
                                                medicationClassList[index]
                                                        .duration =
                                                    p0;
                                                setNoOfTimesWithDurationUpdate(
                                                  index,
                                                );

                                                // --- recalc logic ---
                                                if (p0.trim().isNotEmpty) {
                                                  final parsed = int.tryParse(
                                                    p0.trim(),
                                                  );
                                                  if (parsed != null) {
                                                    _duration = parsed;
                                                    medicationClassList[index]
                                                            .listOfTimes =
                                                        List.generate(
                                                          _duration!,
                                                          (i) => i,
                                                        );
                                                    dateTimeObject = inputFormat
                                                        .parse(
                                                          model!.pickedDate!,
                                                        );

                                                    final localDate =
                                                        dateTimeObject!;
                                                    final utcStartDate =
                                                        DateTime.utc(
                                                          localDate.year,
                                                          localDate.month,
                                                          localDate.day,
                                                        );

                                                    // Now safely add your duration
                                                    final utcEndDate =
                                                        utcStartDate.add(
                                                          Duration(
                                                            days:
                                                                _duration! - 1,
                                                          ),
                                                        );
                                                    medicationClassList[index]
                                                        .endDate = utcEndDate
                                                        .toIso8601String();
                                                    medicationClassList[index]
                                                            .endDateIso =
                                                        DateTime.parse(
                                                          utcEndDate
                                                              .toIso8601String(),
                                                        );

                                                    // ✅ Ensure controller lists match new duration
                                                    while (doseAfterControllers
                                                            .length <
                                                        _duration!) {
                                                      doseAfterControllers.add(
                                                        [],
                                                      );
                                                    }
                                                    while (periodAfterLabels
                                                            .length <
                                                        _duration!) {
                                                      periodAfterLabels.add([]);
                                                    }

                                                    // ✅ Trim extra ones if user reduces duration
                                                    if (doseAfterControllers
                                                            .length >
                                                        _duration!) {
                                                      doseAfterControllers
                                                          .removeRange(
                                                            _duration!,
                                                            doseAfterControllers
                                                                .length,
                                                          );
                                                    }
                                                    if (periodAfterLabels
                                                            .length >
                                                        _duration!) {
                                                      periodAfterLabels
                                                          .removeRange(
                                                            _duration!,
                                                            periodAfterLabels
                                                                .length,
                                                          );
                                                    }
                                                  }
                                                } else {
                                                  medicationClassList[index]
                                                          .endDate =
                                                      '';
                                                }

                                                // --- Maintain cursor position and focus after rebuild ---
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                      controller.selection =
                                                          TextSelection.fromPosition(
                                                            TextPosition(
                                                              offset: controller
                                                                  .text
                                                                  .length,
                                                            ),
                                                          );
                                                      focusNode.requestFocus();
                                                    });

                                                model!.notifyListeners();
                                              },
                                              focusNode:
                                                  durationUpdateFocusNodes[index],
                                              controller:
                                                  durationUpdateControllers[index],
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
                                              borderColor:
                                                  AppColors.transparent,
                                              borderTopLeft: 10.r,
                                              borderTopRight: 10.r,
                                              borderBottomLeft: 10.r,
                                              borderBottomRight: 10.r,
                                              label:
                                                  endDateUpdateController[index]
                                                      .text
                                                      .isNotEmpty
                                                  ? DateFormat(
                                                      'dd MMM, yyyy',
                                                    ).format(
                                                      DateTime.parse(
                                                        endDateUpdateController[index]
                                                            .text,
                                                      ),
                                                    )
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
                                              borderColor:
                                                  AppColors.transparent,
                                              borderTopLeft: 10.r,
                                              borderTopRight: 10.r,
                                              borderBottomLeft: 10.r,
                                              borderBottomRight: 10.r,
                                              hintSize: 14.sp,
                                              fillColor: AppColors.grey,
                                              isFilled: true,
                                              readOnly: true,
                                              controller:
                                                  timesToTakeUpdateController[index],
                                              suffixWidget: IconButton(
                                                onPressed: () async {
                                                  final result =
                                                      await showDailyInTakeMenu(
                                                        context,
                                                      );
                                                  if (result != null) {
                                                    setModalState!(() {
                                                      medicationClassList[index]
                                                              .timesToTake =
                                                          result;

                                                      final timesCount =
                                                          int.tryParse(
                                                            result.toString(),
                                                          ) ??
                                                          0;
                                                      final durationCount =
                                                          int.tryParse(
                                                            medicationClassList[index]
                                                                    .duration
                                                                    ?.toString() ??
                                                                '0',
                                                          ) ??
                                                          0;

                                                      // 🔹 Get the old data before rebuilding
                                                      final oldControllers =
                                                          List<
                                                            List<
                                                              TextEditingController
                                                            >
                                                          >.from(
                                                            model!
                                                                .doseAfterControllers,
                                                          );
                                                      final oldPeriods =
                                                          List<
                                                            List<String>
                                                          >.from(
                                                            model
                                                                .periodAfterLabels,
                                                          );

                                                      // 🔹 Rebuild dosageMap safely (preserve where possible)
                                                      medicationClassList[index]
                                                          .dosageMap = List.generate(durationCount, (
                                                        day,
                                                      ) {
                                                        final oldDay =
                                                            (day <
                                                                medicationClassList[index]
                                                                    .dosageMap
                                                                    .length)
                                                            ? medicationClassList[index]
                                                                  .dosageMap[day]
                                                            : null;

                                                        final oldDoses =
                                                            oldDay != null
                                                            ? List<
                                                                Map<
                                                                  String,
                                                                  dynamic
                                                                >
                                                              >.from(
                                                                oldDay['doses'],
                                                              )
                                                            : [];

                                                        return {
                                                          "day": day + 1,
                                                          "doses": List.generate(
                                                            timesCount,
                                                            (doseIndex) {
                                                              if (doseIndex <
                                                                  oldDoses
                                                                      .length) {
                                                                // preserve previous time + period if available
                                                                return {
                                                                  "time":
                                                                      oldDoses[doseIndex]["time"] ??
                                                                      "",
                                                                  "period":
                                                                      oldDoses[doseIndex]["period"] ??
                                                                      "",
                                                                  "date":
                                                                      oldDoses[doseIndex]["date"] ??
                                                                      "",
                                                                  "isoDate":
                                                                      oldDoses[doseIndex]["isoDate"] ??
                                                                      "",
                                                                };
                                                              }
                                                              // otherwise new empty slot
                                                              return {
                                                                "time": "",
                                                                "period": "",
                                                                "date": "",
                                                                "isoDate": "",
                                                              };
                                                            },
                                                          ),
                                                        };
                                                      });

                                                      // 🔹 Rebuild controllers but preserve existing values
                                                      model
                                                          .doseAfterControllers = List.generate(durationCount, (
                                                        dayIndex,
                                                      ) {
                                                        return List.generate(timesCount, (
                                                          doseIndex,
                                                        ) {
                                                          if (dayIndex <
                                                                  oldControllers
                                                                      .length &&
                                                              doseIndex <
                                                                  oldControllers[dayIndex]
                                                                      .length) {
                                                            return oldControllers[dayIndex][doseIndex];
                                                          } else {
                                                            return TextEditingController(
                                                              text:
                                                                  medicationClassList[index]
                                                                      .dosageMap[dayIndex]["doses"][doseIndex]["time"] ??
                                                                  "",
                                                            );
                                                          }
                                                        });
                                                      });

                                                      // 🔹 Rebuild period labels safely
                                                      model
                                                          .periodAfterLabels = List.generate(
                                                        durationCount,
                                                        (dayIndex) {
                                                          return List.generate(timesCount, (
                                                            doseIndex,
                                                          ) {
                                                            if (dayIndex <
                                                                    oldPeriods
                                                                        .length &&
                                                                doseIndex <
                                                                    oldPeriods[dayIndex]
                                                                        .length) {
                                                              return oldPeriods[dayIndex][doseIndex];
                                                            } else {
                                                              return medicationClassList[index]
                                                                      .dosageMap[dayIndex]["doses"][doseIndex]["period"] ??
                                                                  "";
                                                            }
                                                          });
                                                        },
                                                      );
                                                    });

                                                    model!.notifyListeners();
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
                                            if (medicationClassList[index]
                                                    .listOfTimes!
                                                    .isNotEmpty &&
                                                medicationClassList[index]
                                                    .timesToTake!
                                                    .isNotEmpty)
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ...medicationClassList[index]
                                                      .listOfTimes!
                                                      .asMap()
                                                      .entries
                                                      .map((list) {
                                                        v = list.key;
                                                        return model!.dosageAfterWidgetContainer(
                                                          context: context,
                                                          callback: v,
                                                          color: AppColors.grey,
                                                          dosageMap:
                                                              medicationClassList[index]
                                                                  .dosageMap,
                                                          listOfTimes:
                                                              medicationClassList[index]
                                                                  .listOfTimes!,
                                                          date:
                                                              startDateUpdateControllers[index]
                                                                  .text,
                                                        );
                                                      }),
                                                  SizedBox(height: 14.0.h),
                                                  TextView(
                                                    text: 'Add Note',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.60.sp,
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
                                                      color: AppColors.infoGrey,
                                                    ),
                                                    fillColor: AppColors.grey,
                                                    isFilled:
                                                        true, // Minimum number of lines visible
                                                    maxline:
                                                        3, // Maximum number of lines visible before scrolling
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    validator:
                                                        AppValidator.validateString(),
                                                    controller:
                                                        noteUpdateController[index],
                                                    focusNode:
                                                        noteUpdateFocusNodes[index],
                                                    onChange: (val) {
                                                      medicationClassList[index]
                                                              .note =
                                                          val;
                                                      WidgetsBinding.instance.addPostFrameCallback((
                                                        _,
                                                      ) {
                                                        final controller =
                                                            noteUpdateController[index];
                                                        final focusNode =
                                                            noteUpdateFocusNodes[index];
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
                                                      model!.notifyListeners();
                                                    },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            final result =
                                                await showMedTypeMenu(context);

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
                                                        model!.imageDrug != null
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
                                                              model
                                                                  .notifyListeners();
                                                            },
                                                            child:
                                                                SvgPicture.asset(
                                                                  AppImage
                                                                      .delete,
                                                                  height:
                                                                      16.68.h,
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
                                                        onTap: () =>
                                                            model.pickDrugImage(
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
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  32,
                                                                ),
                                                            color:
                                                                AppColors.grey,
                                                          ),
                                                          child: TextView(
                                                            text: 'Upload',
                                                            textStyle:
                                                                TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      14.40.sp,
                                                                  color:
                                                                      AppColors
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
                                                await showMedDosageMenu(
                                                  context,
                                                );
                                            if (result != null) {
                                              setModalState!(() {
                                                medDosageController.text =
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

                                              dateTimeObject = inputFormat
                                                  .parse(model.pickedDate!);

                                              endDateController.text =
                                                  dateTimeObject!
                                                      .add(
                                                        Duration(
                                                          days: _duration! - 1,
                                                        ),
                                                      )
                                                      .toString();
                                            }
                                          } else {
                                            endDateController.clear();
                                          }
                                          model.notifyListeners();
                                        },

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
                                        validator:
                                            AppValidator.validateString(),
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
                                              (
                                                e,
                                              ) => model.dosageWidgetContainer(
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
                                              borderColor:
                                                  AppColors.transparent,
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
                                                  text:
                                                      'Add Another Medication',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 16.2.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.primary,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        AppColors.primary,
                                                    decorationStyle:
                                                        TextDecorationStyle
                                                            .solid,
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
                                                  await addReminderToList(
                                                    model,
                                                  );
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
                      SizedBox(height: 160.h),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  secondModalFlow({
    PharmViewModel? model,
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
                    value: linIndex / 5,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/5',
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
                  child:
                      medicationClassList[indexOfMedicationClassList]
                              .medicationFile !=
                          null
                      ? Image.file(
                          medicationClassList[indexOfMedicationClassList]
                              .medicationFile!,
                          errorBuilder: (context, error, stackTrace) =>
                              SizedBox.shrink(),
                        )
                      : SizedBox.shrink(),
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

  thirdModalFlow({
    PharmViewModel? model,
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
                    value: linIndex / 5,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/5',
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
                  if (index == 0 || index == 1) {
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
          phoneReminderList.isNotEmpty || emailReminderList.isNotEmpty
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
                                    text: '${returnNumberOfTimes()}',
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
                                    text:
                                        '${selectedIndexes.length * returnNumberOfTimes()}',
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
                                height: selectedIndexes.contains(0)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(0)
                                  ? Divider(color: AppColors.infoGrey1)
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(0)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(0)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text:
                                              'Email  (x${returnNumberOfTimes()} msgs)',
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
                                height: selectedIndexes.contains(1)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(1)
                                  ? Divider(color: AppColors.infoGrey1)
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: selectedIndexes.contains(1)
                                    ? 6.10.h
                                    : 0.h,
                              ),
                              selectedIndexes.contains(1)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text:
                                              'Push  (x${returnNumberOfTimes()} msgs)',
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
                                          text:
                                              'WhatsApp  (x${returnNumberOfTimes()} msgs)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text:
                                              '₦${20 * returnNumberOfTimes()}',
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
                                          text:
                                              'SMS  (x${returnNumberOfTimes()} msgs)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text:
                                              '₦${10 * returnNumberOfTimes()}',
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
                                          text:
                                              'Phone Calls  (x${returnNumberOfTimes()} calls)',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16.80.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextView(
                                          text:
                                              '₦${50 * returnNumberOfTimes()}',
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
                    if (phoneReminderList.isNotEmpty) {
                      linIndex++;
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
                    } else {
                      // createReminder(
                      //   context,
                      //   createReminderEntityModel: CreateReminderEntityModel(
                      //     medications: medicationClassList.map((m) {
                      //       return Medication(
                      //         medicationName: m.medicationName,
                      //         drugName: m.drugName,
                      //         dosage: m.dosage,
                      //         medicationType: m.medicationType!.toUpperCase(),
                      //         startDateTime: m.startDateIso,
                      //         endDateTime: m.endDateIso,
                      //         durationInDays: int.parse(m.duration!),
                      //         timesPerDay: int.parse(m.timesToTake!),
                      //         dailyDoseTimes: (m.dosageMap as List)
                      //             .map(
                      //               (dayData) => (dayData['doses'] as List)
                      //                   .map(
                      //                     (dose) => DailyDoseTime.fromJson(
                      //                       dose as Map<String, dynamic>,
                      //                     ),
                      //                   )
                      //                   .toList(),
                      //             )
                      //             .toList(),
                      //         note: m.note,
                      //         medicationImage: m.imageData != null
                      //             ? null
                      //             : MedicationImage.fromJson(
                      //                 m.imageData!.toJson(),
                      //               ),
                      //       );
                      //     }).toList(),
                      //     timeZone: "Africa/Lagos",
                      //     notificationChannels: notificationChannel,
                      //     emails: emailReminderList,
                      //   ),
                      // );
                    }
                    model!.notifyListeners();
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
    PharmViewModel? model,
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
                    value: linIndex / 5,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: '$linIndex/5',
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
                          createReminderPaid(
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
                                      medicationImage: m.imageData != null
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
                          model!.notifyListeners();
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

  Future<void> selectTimeUPDATE({BuildContext? context, index}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context!,
      initialTime: TimeOfDay.now(), // The time initially displayed
    );

    if (pickedTime != null) {
      medicationClassList[index].dateAndTime =
          '${pickedDate!} ${formatTime('${pickedTime.hour}:${pickedTime.minute}')}';
    }
    notifyListeners();
  }

  Future<void> selectDateUPDATE({BuildContext? context, index}) async {
    final DateTime? pickedDated = await showDatePicker(
      context: context!,
      initialDate: DateTime.now(), // The date initially displayed
      firstDate: DateTime.now(), // The earliest selectable date
      lastDate: DateTime(2101), // The latest selectable date
    );

    if (pickedDated != null) {
      pickedDate = DateFormat('dd MMM, yyyy').format(pickedDated);

      await selectTimeUPDATE(context: context, index: index);
      startDateIso = DateTime.utc(
        pickedDated.year,
        pickedDated.month,
        pickedDated.day,
      ).toIso8601String();

      if (medicationClassList[index].duration!.isNotEmpty) {
        final parsed = int.tryParse(medicationClassList[index].duration!);
        if (parsed != null) {
          _duration = parsed;
          medicationClassList[index].listOfTimes = List.generate(
            _duration!,
            (i) => i,
          );
          dateTimeObject = inputFormat.parse(pickedDate!);

          final localDate = dateTimeObject!;
          final utcStartDate = DateTime.utc(
            localDate.year,
            localDate.month,
            localDate.day,
          );

          // Now safely add your duration
          final utcEndDate = utcStartDate.add(Duration(days: _duration! - 1));
          medicationClassList[index].endDate = utcEndDate.toIso8601String();
          medicationClassList[index].endDateIso = DateTime.parse(
            utcEndDate.toIso8601String(),
          );

          // ✅ Ensure controller lists match new duration
          while (doseAfterControllers.length < _duration!) {
            doseAfterControllers.add([]);
          }
          while (periodAfterLabels.length < _duration!) {
            periodAfterLabels.add([]);
          }

          // ✅ Trim extra ones if user reduces duration
          if (doseAfterControllers.length > _duration!) {
            doseAfterControllers.removeRange(
              _duration!,
              doseAfterControllers.length,
            );
          }
          if (periodAfterLabels.length > _duration!) {
            periodAfterLabels.removeRange(_duration!, periodAfterLabels.length);
          }
        }
      }
    }
    notifyListeners();
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
                                notifyListeners();
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
                    notifyListeners();
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

  void addCostTotal() {
    costTotal = 0;
    if (selectedIndexes.contains(2)) {
      costTotal += 10 * returnNumberOfTimes();
    }
    if (selectedIndexes.contains(3)) {
      costTotal += 20 * returnNumberOfTimes();
    }
    if (selectedIndexes.contains(4)) {
      costTotal += 50 * returnNumberOfTimes();
    }
    notifyListeners();
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
                                if (emailReminderList.contains(
                                  emailController.text.trim(),
                                )) {
                                } else {
                                  emailReminderList.add(
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
                            locator<PharmViewModel>().notifyListeners();
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

  dosageAfterWidgetContainer({
    required BuildContext context,
    required int callback,
    required Color color,
    required List<int> listOfTimes,
    required List<Map<String, dynamic>> dosageMap,
    required String date,
  }) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;

    // ✅ Ensure nested list exists for current day
    if (doseAfterControllers.length <= callback) {
      // Create empty lists until callback index exists
      while (doseAfterControllers.length <= callback) {
        doseAfterControllers.add([]);
      }
    }

    List<Map<String, dynamic>> doses = [];

    if (callback >= 0 && callback < dosageMap.length) {
      final item = dosageMap[callback];
      doses = List<Map<String, dynamic>>.from(item['doses'] ?? []);
    } else {
      logger.e(
        '⚠️ Invalid callback index: $callback for dosageMap length: ${dosageMap.length}',
      );
    }

    // Ensure enough controllers exist
    if (doseAfterControllers[callback].length < doses.length) {
      for (
        int i = doseAfterControllers[callback].length;
        i < doses.length;
        i++
      ) {
        doseAfterControllers[callback].add(
          TextEditingController(text: doses[i]['time'] ?? ''),
        );
      }
    } else if (doseAfterControllers[callback].length > doses.length) {
      // remove extra ones if needed
      doseAfterControllers[callback].removeRange(
        doses.length,
        doseAfterControllers[callback].length,
      );
    }

    // ✅ Initialize period labels too (if applicable)
    if (periodAfterLabels.length <= callback) {
      while (periodAfterLabels.length <= callback) {
        periodAfterLabels.add([]);
      }
    }

    if (periodAfterLabels[callback].length < doses.length) {
      for (int i = periodAfterLabels[callback].length; i < doses.length; i++) {
        periodAfterLabels[callback].add(doses[i]['period'] ?? '');
      }
    } else if (periodAfterLabels[callback].length > doses.length) {
      periodAfterLabels[callback].removeRange(
        doses.length,
        periodAfterLabels[callback].length,
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
                            final result = await selectDosageTime(
                              context: context,
                            );
                            if (result != null) {
                              doseAfterControllers[callback][i].text =
                                  result["time"]!;
                              periodAfterLabels[callback][i] =
                                  result["period"]!;

                              // ✅ Update dosageMap directly
                              if (callback < dosageMap.length &&
                                  i <
                                      (dosageMap[callback]['doses']?.length ??
                                          0)) {
                                dosageMap[callback]['doses'][i]['time'] =
                                    result["time"]!;
                                dosageMap[callback]['doses'][i]['period'] =
                                    result["period"]!; // optional
                                dosageMap[callback]['doses'][i]['date'] =
                                    implementTimeDurationWithDate(
                                      date: date,
                                      callbackIndex: callback,
                                    ).substring(0, 10); // optional
                                dosageMap[callback]['doses'][i]['isoDate'] =
                                    implementTimeDurationWithDate(
                                      date: date,
                                      callbackIndex: callback,
                                    ); // optional
                              }
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
                          value: isCheckedUp,
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

                                  // ✅ Also update dosageMap (important for data persistence)
                                  if (day < dosageMap.length &&
                                      i <
                                          (dosageMap[day]['doses']?.length ??
                                              0)) {
                                    dosageMap[day]['doses'][i]['time'] =
                                        doseAfterControllers[0][i].text;
                                    dosageMap[day]['doses'][i]['period'] =
                                        periodAfterLabels[0][i];
                                    dosageMap[day]['doses'][i]['date'] =
                                        implementTimeDurationWithDate(
                                          date: date,
                                          callbackIndex: day,
                                        ).substring(0, 10);
                                    dosageMap[day]['doses'][i]['isoDate'] =
                                        implementTimeDurationWithDate(
                                          date: date,
                                          callbackIndex: day,
                                        );
                                  }
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
                                  if (day < dosageMap.length &&
                                      i <
                                          (dosageMap[day]['doses']?.length ??
                                              0)) {
                                    dosageMap[day]['doses'][i]['time'] = '';
                                    dosageMap[day]['doses'][i]['period'] = '';
                                    dosageMap[day]['doses'][i]['date'] = '';
                                    dosageMap[day]['doses'][i]['isoDate'] = '';
                                  }
                                }
                              }
                            }
                            isCheckedUp = value ?? false;
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
                                  if (phoneReminderList.contains(
                                    '+234${phoneController.text.trim()}',
                                  )) {
                                  } else {
                                    phoneReminderList.add(
                                      '+234${phoneController.text.trim()}',
                                    );
                                  }
                                } else {
                                  phoneReminderList[index!] =
                                      '+234${phoneController.text.trim()}';
                                }
                                Navigator.pop(context);
                                phoneController.clear();
                              }
                              print('phoneReminderList:::$phoneReminderList');
                              locator<PharmViewModel>().notifyListeners();
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

  void showCreateAddPhoneDialog(BuildContext context, {String? phoneNumber}) {
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
                    key: formKeyCreateAddPhoneReminder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextView(
                          text: 'What’s the patients phone number?',
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
                                  controller: createAddPhoneController,
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
                            onPressed: () async {
                              if (formKeyCreateAddPhoneReminder.currentState!
                                  .validate()) {
                                // Navigator.pop(context);
                                // await Future.delayed(Duration(seconds: 2));
                                showReminderModal(context);
                              }
                              print('phoneReminderList:::$phoneReminderList');
                              locator<PharmViewModel>().notifyListeners();
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
    locator<PharmViewModel>().notifyListeners();
  }

  void initiatePayment(context, {String? reference}) async {
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
        medicationClassList.clear();
        doseControllers.clear();
        periodLabels.clear();
        navigate.navigateTo(
          Routes.acceleratePaymentView,
          arguments: AcceleratePaymentViewArguments(
            url: _initiatePaymentResponseModel?.data?.redirectUrl,
          ),
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
    locator<PharmViewModel>().notifyListeners();
  }

  void createReminderPaid(
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
        initiatePayment(
          context,
          reference: _createReminderResponseModel?.data?.transactionReference,
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
    locator<PharmViewModel>().notifyListeners();
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
    print('time::::$time');
    if(time.contains('AM')||time.contains('PM')){
      return '';
    }
    if (time.isNotEmpty) {
      int hour = int.parse(time.split(":")[0]);
      if (hour < 12) {
        return "AM";
      } else {
        return "PM";
      }
    }
    else{
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
    print('print the data:::::${data?.medication?.dailyDoseTimes?[0][0].toJson()}');
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
                          showUpdateReminderModal(context: context, data: data);
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
      print('After time select → startDateIso: $startDateIso');
      print('iso$startDateIso');
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

  setModalFlowUpdate({
    PharmViewModel? model,
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
        updateReminderEntityModel: UpdateReminderEntityModel(
          startDateTime: DateFormat(
            'dd MMM, yyyy',
          ).parse(dateTimeControllerUpdate.text),
          endDateTime: DateTime.parse(endDateControllerUpdate.text),
          durationInDays: int.parse(medDurationControllerUpdate.text),
          timesPerDay: int.parse(medDailyInTakenControllerUpdate.text),
          dailyDoseTimes: dailyDose,
          dosage: _dosageLabel,
          medicationImage: null,
          emails: emailReminderList,
          phoneNumbers: phoneReminderList,
          notificationChannels: notificationChannel,
        ),
      );
    } else if (linIndexUpdate == 3) {
      return thirdModalFlowUpdate(
        model: model,
        context: context,
        data: data,
        setModalState: setModalState,
        scrollController: scrollController,
      );
    } else if (linIndexUpdate == 4) {
      return fourthModalFlowUpdate(
        model: model,
        context: context,
        data: data,
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
    PharmViewModel? model,
    getReminderId.Data? data,
    BuildContext? context,
    StateSetter? setModalState,
    ScrollController? scrollController,
  }) {
    if (!_initializedUpdate) {
      getReminderUpdate(data);
      _initializedUpdate = true;
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
                      value: linIndexUpdate / 3,
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
                    hintSize: 14.42.sp,
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
                    hintSize: 14.42.sp,
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
                  // SizedBox(height: 16.h),
                  // TextView(
                  //   text: 'Description',
                  //   textStyle: TextStyle(
                  //     fontFamily: 'Arial',
                  //     fontSize: 14.sp,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  // SizedBox(height: 10.h),
                  // TextFormWidget(
                  //   borderColor: AppColors.transparent,
                  //   borderTopLeft: 10.r,
                  //   borderTopRight: 10.r,
                  //   borderBottomLeft: 10.r,
                  //   borderBottomRight: 10.r,
                  //   fillColor: AppColors.grey,
                  //   isFilled: true,
                  //   controller: descriptionControllerUpdate,
                  //   validator: AppValidator.validateString(),
                  //   style: TextStyle(
                  //     fontSize: 16.20.sp,
                  //     fontWeight: FontWeight.w400,
                  //     fontFamily: 'GoogleSans',
                  //   ),
                  // ),
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
                                        onTap: () => model.pickDrugImageUpdate(
                                          context: context,
                                          id: data!.medication!.id,
                                        ),
                                        child: SvgPicture.asset(
                                          AppImage.upload,
                                          height: 17.0.h,
                                          width: 16.68.w,
                                        ),
                                      ),
                                    ],
                                  )
                                : GestureDetector(
                                    onTap: () => model.pickDrugImageUpdate(
                                      context: context,
                                      id: data!.medication!.id,
                                    ),
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
                    label: _dosageLabel,
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
                            _dosageLabel = medDosageControllerUpdate.text;
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
                    hintSize: 14.42.sp,
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: dateTimeControllerUpdate,
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: GestureDetector(
                        onTap: () => selectDateUpdate(context),
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
                    hintSize: 14.42.sp,
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: medDurationControllerUpdate,
                    onChange: (p0) {
                      if (p0 != null && p0.trim().isNotEmpty) {
                        final parsed = int.tryParse(p0.trim());
                        if (parsed != null) {
                          _duration = parsed;
                          intList = List.generate(_duration!, (index) => index);
                          dateTimeObject = inputFormat.parse(
                            model.pickedDate ?? dateTimeControllerUpdate.text,
                          );
                          final localDate = dateTimeObject!;
                          final utcStartDate = DateTime.utc(
                            localDate.year,
                            localDate.month,
                            localDate.day,
                          );

                          // Now safely add your duration
                          final utcEndDate = utcStartDate.add(
                            Duration(
                              days: _duration != null
                                  ? _duration! - 1
                                  : int.parse(
                                          medDurationControllerUpdate.text,
                                        ) -
                                        1,
                            ),
                          );

                          // Display or store
                          endDateControllerUpdate.text = utcEndDate
                              .toIso8601String();
                          endDateIso = utcEndDate.toIso8601String();
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
                    hintSize: 14.42.sp,
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
                            model.notifyListeners();
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
                          (e) => updateDosageWidgetContainer(
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
                              await loopDoseMethod();
                              linIndexUpdate++;
                              logger.d(doseControllersUpdate);
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

  void showUpdateDoseDialog(BuildContext context, {Datum? o}) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        return ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => PharmViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          onDispose: (viewModel) {},
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

  updateDosageWidgetContainer({
    required BuildContext context,
    required int callback,
    required List<int> listOfTimes,
  }) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;

    // ✅ Only ensure size without overwriting
    if (doseControllersUpdate.length <= callback) {
      doseControllersUpdate.add(
        List.generate(listOfTimes.length, (_) => TextEditingController()),
      );
      periodLabelsUpdate.add(List.generate(listOfTimes.length, (_) => ''));
    }

    // Resize the specific day's list
    final currentControllers = doseControllersUpdate[callback];
    final currentLabels = periodLabelsUpdate[callback];

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
                        model.notifyListeners();
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
                  print('print I $i and E $e');
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.w),
                    child: TextFormDoseWidget(
                      hint: 'Dose ${e + 1}',
                      borderColor: AppColors.transparent,
                      label: periodLabelsUpdate.isEmpty
                          ? ''
                          : periodLabelsUpdate[callback][i],
                      hintSize: 13.40.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      readOnly: true,
                      controller: TextEditingController(
                        text: doseControllersUpdate.isEmpty?'':
                            '${doseControllersUpdate[callback][i].text} ${checkTimePeriod(doseControllersUpdate[callback][i].text)}',
                      ),
                      suffixWidget: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await selectDosageTime(
                              context: context,
                            );

                            if (result != null) {
                              doseControllersUpdate[callback][i].clear();
                              // 👉 Update the controller for this dose
                              doseControllersUpdate[callback][i].text =
                                  result["time"]!;
                              // 👉 Update period label for this dose
                              periodLabelsUpdate[callback][i] =
                                  result["period"]!;
                             print('result here::::$result');
                            }
                            model.notifyListeners();
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
                                day < doseControllersUpdate.length;
                                day++
                              ) {
                                for (
                                  int i = 0;
                                  i < doseControllersUpdate[0].length;
                                  i++
                                ) {
                                  // Copy text
                                  doseControllersUpdate[day][i].text =
                                      doseControllersUpdate[0][i].text;
                                  // Copy period
                                  periodLabelsUpdate[day][i] =
                                      periodLabelsUpdate[0][i];
                                }
                              }
                            } else {
                              for (
                                int day = 1;
                                day < doseControllersUpdate.length;
                                day++
                              ) {
                                for (
                                  int i = 0;
                                  i < doseControllersUpdate[day].length;
                                  i++
                                ) {
                                  doseControllersUpdate[day][i]
                                      .clear(); // clear controller text
                                  periodLabelsUpdate[day][i] =
                                      ''; // reset label
                                }
                              }
                            }
                            isChecked = value ?? false;
                            model.notifyListeners();
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
                    model.notifyListeners();
                    print('print enter $dosageValue and $callback');
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.grey1,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
    );});
  }

  secondModalFlowUpdate({
    PharmViewModel? model,
    StateSetter? setModalState,
    ScrollController? scrollController,
    BuildContext? context,
    UpdateReminderEntityModel? updateReminderEntityModel,
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
                    value: linIndexUpdate / 3,
                    color: AppColors.primary, // Progress bar color
                    backgroundColor: Colors.grey[300], // Background track color
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
                  text: medNameControllerUpdate.text,
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
                  text: drugNameControllerUpdate.text,
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
                  child: imageReminderUpdate == ''
                      ? Padding(
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset(
                            color: AppColors.primary,
                            model!.errorRemidnderImage(
                              medTypeControllerUpdate.text,
                            ),
                            height: 70.h,
                            width: 70.w,
                          ),
                        )
                      : Image.network(
                          imageReminderUpdate!,
                          errorBuilder: (context, error, stackTrace) => Padding(
                            padding: EdgeInsets.all(8.w),
                            child: SvgPicture.asset(
                              color: AppColors.primary,
                              model!.errorRemidnderImage(
                                medTypeControllerUpdate.text,
                              ),
                              height: 70.h,
                              width: 70.w,
                            ),
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
                      isMedTypeView(medTypeControllerUpdate.text),
                    ),
                    SizedBox(width: 6.0.w),
                    TextView(
                      text: medTypeControllerUpdate.text,
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
                  text: _dosageLabel,
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
                  text: DateFormat(
                    'dd MMM, yyyy',
                  ).format(updateReminderEntityModel!.startDateTime!),
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
                          '${updateReminderEntityModel.durationInDays.toString()} ${returnNumberOfDays(updateReminderEntityModel.durationInDays)}',
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
                          ...updateReminderEntityModel.dailyDoseTimes!
                              .asMap()
                              .entries
                              .map((entry) {
                                final i = entry.key; // 0, 1, 2
                                final v = entry.value; // {day: x, doses: [...]}

                                return dosagePreviewUpdateWidgetContainer(
                                  context: context,
                                  callback: i, // ✅ now an index (int)
                                  color: AppColors.grey,
                                  listOfTimes: List.generate(
                                    int.parse(
                                      medDailyInTakenControllerUpdate.text,
                                    ),
                                    (index) => index,
                                  ),
                                  dosageMap: v,
                                  // ✅ wrap v in a list so widget only sees one day
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
                      updateReminderEntityModel.endDateTime.toString(),
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
                  text: showNoTimes(updateReminderEntityModel.timesPerDay),
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
                  text: noteControllerUpdate.text,
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
                    linIndexUpdate--;
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
                    linIndexUpdate++;
                    model!.notifyListeners();
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
    PharmViewModel? model,
    StateSetter? setModalState,
    ScrollController? scrollController,
    BuildContext? context,
    getReminderId.Data? data,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addCostTotal();
      setModalState!((){});// ✔ SAFE — executes AFTER build finishes
    });
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
                  width: MediaQuery
                      .of(context!)
                      .size
                      .width * .82,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ), // Adjust radius as needed
                    child: LinearProgressIndicator(
                      minHeight: 4.0, // Adjust height as needed
                      value: linIndexUpdate / 3,
                      color: AppColors.primary, // Progress bar color
                      backgroundColor: Colors
                          .grey[300], // Background track color
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
            SizedBox(height: 32.h),
            ...List.generate(channels.length, (index) {
              return chooseUpdateNotChannelWidget(
                context,
                text: channels[index],
                isTapped: selectedIndexes.contains(index), // ✅ reflect state
                onTap: () {
                  if (selectedIndexes.contains(index)) {
                    // unselect
                    // selectedIndexes.remove(index);
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
                  ...emailReminderList
                      .asMap()
                      .entries
                      .map((entry) {
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

                  ...phoneReminderList
                      .asMap()
                      .entries
                      .map((entry) {
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
            phoneReminderList.isNotEmpty || emailReminderList.isNotEmpty
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
                                text: '${returnNumberOfTimes()}',
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
                                text:
                                '${selectedIndexes.length *
                                    returnNumberOfTimes()}',
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
                            height: selectedIndexes.contains(0)
                                ? 6.10.h
                                : 0.h,
                          ),
                          selectedIndexes.contains(0)
                              ? Divider(color: AppColors.infoGrey1)
                              : SizedBox.shrink(),
                          SizedBox(
                            height: selectedIndexes.contains(0)
                                ? 6.10.h
                                : 0.h,
                          ),
                          selectedIndexes.contains(0)
                              ? Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text:
                                'Email  (x${returnNumberOfTimes()} msgs)',
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
                            height: selectedIndexes.contains(1)
                                ? 6.10.h
                                : 0.h,
                          ),
                          selectedIndexes.contains(1)
                              ? Divider(color: AppColors.infoGrey1)
                              : SizedBox.shrink(),
                          SizedBox(
                            height: selectedIndexes.contains(1)
                                ? 6.10.h
                                : 0.h,
                          ),
                          selectedIndexes.contains(1)
                              ? Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text:
                                'Push  (x${returnNumberOfTimes()} msgs)',
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
                                text:
                                'WhatsApp  (x${returnNumberOfTimes()} msgs)',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.80.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextView(
                                text:
                                '₦${20 * returnNumberOfTimes()}',
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
                                text:
                                'SMS  (x${returnNumberOfTimes()} msgs)',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.80.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextView(
                                text:
                                '₦${10 * returnNumberOfTimes()}',
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
                                text:
                                'Phone Calls  (x${returnNumberOfTimes()} calls)',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.80.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextView(
                                text:
                                '₦${50 * returnNumberOfTimes()}',
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

            model!.isLoading
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
                      linIndexUpdate--;
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
                    buttonText: 'Make Payment',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    onPressed: () {
                      updateReminder(
                        context,
                        reminderId: data!.id!,
                        setState: setModalState,
                        updateReminder: UpdateReminderEntityModel(
                          startDateTime: DateFormat(
                            'dd MMM, yyyy',
                          ).parse(dateTimeControllerUpdate.text),
                          endDateTime: DateTime.parse(
                            endDateControllerUpdate.text,
                          ),
                          durationInDays: int.parse(
                            medDurationControllerUpdate.text,
                          ),
                          timesPerDay: int.parse(
                            medDailyInTakenControllerUpdate.text,
                          ),
                          dailyDoseTimes: dailyDose,
                          dosage: _dosageLabel,
                          medicationImage: null,
                          emails: emailReminderList,
                          notificationChannels: notificationChannel,
                        ),
                      );

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

    fourthModalFlowUpdate({
      PharmViewModel? model,
      BuildContext? context,
      StateSetter? setModalState,
      getReminderId.Data? data,
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
                      value: linIndexUpdate / 4,
                      color: AppColors.primary, // Progress bar color
                      backgroundColor: Colors.grey[300], // Background track color
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                TextView(
                  text: '$linIndexUpdate/4',
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
                      linIndexUpdate--;
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
                      updateReminder(
                        context,
                        reminderId: data!.id!,
                        setState: setModalState,
                        updateReminder: UpdateReminderEntityModel(
                          startDateTime: DateFormat(
                            'dd MMM, yyyy',
                          ).parse(dateTimeControllerUpdate.text),
                          endDateTime: DateTime.parse(
                            endDateControllerUpdate.text,
                          ),
                          durationInDays: int.parse(
                            medDurationControllerUpdate.text,
                          ),
                          timesPerDay: int.parse(
                            medDailyInTakenControllerUpdate.text,
                          ),
                          dailyDoseTimes: dailyDose,
                          dosage: _dosageLabel,
                          medicationImage: null,
                          emails: emailReminderList,
                          phoneNumbers: phoneReminderList,
                          notificationChannels: notificationChannel,
                          payment: update.Payment(
                            amount: costTotal,
                            currency: 'NGN',
                          ),
                        ),
                      );
                      model!.notifyListeners();
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
                                Divider(color: AppColors.fineGrey, thickness: .4),
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
            );});
    }

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
                return ViewModelBuilder<PharmViewModel>.reactive(
                  viewModelBuilder: () => locator<PharmViewModel>(),
                  onViewModelReady: (model) {},
                  disposeViewModel: false,
                  onDispose: (viewModel) {},
                  builder: (_, PharmViewModel model, _) {
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
      imageReminderUpdate = data.medication!.medicationImage?.url ?? "";
      startDateIso = data.medication!.startDateTime.toString();
      notificationChannel.addAll(data.notificationChannels);
      getListOfNotificationChannel(data);
      phoneReminderList.addAll(data.phoneNumbers ?? []);
      emailReminderList.addAll(data.emails ?? []);
      dateTimeControllerUpdate.text = DateFormat(
        'dd MMM, yyyy',
      ).format(data.medication!.startDateTime!);
      _dosageLabel = medDosageControllerUpdate.text;
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
  }

