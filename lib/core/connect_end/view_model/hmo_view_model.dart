// ignore_for_file: use_build_context_synchronously, strict_top_level_inference, prefer_typing_uninitialized_variables, deprecated_member_use, unrelated_type_equality_checks, non_constant_identifier_names, collection_methods_unrelated_type
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
import 'package:medicate_app/core/connect_end/model/create_hospital_network_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/create_hospital_network_response_model/create_hospital_network_response_model.dart';
import 'package:medicate_app/core/connect_end/model/create_plan_tier_entity_model/create_plan_tier_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/get_hospital_by_id_response_model/get_hospital_by_id_response_model.dart';
import 'package:medicate_app/core/connect_end/model/hmo_sign_up_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/hospital_network_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_hmo_profile_entity_model/update_hmo_profile_entity_model.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/dashboard/profile/hmo/hmo_plan_teir_class.dart';
import '../../../ui/widget/button.dart';
import '../../../ui/widget/delete_role_modal_widget.dart';
import '../../../ui/widget/hmo_add_role_modal_widget.dart';
import '../../../ui/widget/hmo_add_user_modal_widget.dart';
import '../../../ui/widget/hmo_deactivate_user_modal_widget.dart';
import '../../../ui/widget/info_item_widget.dart';
import '../../../ui/widget/kyc_url_view.dart';
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
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/create_hmo_plan_entity_model/create_hmo_plan_entity_model.dart';
import '../model/create_hmo_plan_reponse_model/create_hmo_plan_reponse_model.dart';
import '../model/create_user_entity_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_all_listed_plan_types_response_model/get_all_listed_plan_types_response_model.dart';
import '../model/get_created_user_response_model/get_created_user_response_model.dart';
import '../model/get_created_user_response_model/staff.dart';
import '../model/get_hmo_kyc_response_model/get_hmo_kyc_response_model.dart';
import '../model/get_list_of_hospital_response_model/get_list_of_hospital_response_model.dart';
import '../model/get_list_of_hospital_response_model/hospital.dart';
import '../model/get_listed_plan_tiers_response_model/get_listed_plan_tiers_response_model.dart';
import '../model/get_listed_plan_tiers_response_model/plan_tier.dart';
import '../model/get_my_hmo_plan_response_model/get_my_hmo_plan_response_model.dart';
import '../model/get_pharmacy_kyc_response_model/kyc_document.dart';
import '../model/get_plan_detail_response_model/get_plan_detail_response_model.dart';
import '../model/get_plan_hospital_network_response_model/get_plan_hospital_network_response_model.dart';
import '../model/get_roles_response_model/get_roles_response_model.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/roles_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import '../model/update_hmo_kyc_entity_model/update_hmo_kyc_entity_model.dart';
import '../model/update_hmo_plan_entity_model/update_hmo_plan_entity_model.dart';
import '../model/update_hmo_profile_entity_model/logo.dart';
import '../model/update_pharmacy_kyc_entity_model/document.dart';
import '../model/update_plan_tiers_entity_model.dart';
import '../model/update_role_entity_model.dart';
import '../model/update_third_hmo_kyc_entity_model/application_form.dart';
import '../model/update_third_hmo_kyc_entity_model/list_of_hospitals.dart';
import '../model/update_third_hmo_kyc_entity_model/schedule_of_plans.dart';
import '../model/update_third_hmo_kyc_entity_model/update_third_hmo_kyc_entity_model.dart';
import '../model/update_user_entity_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';
import '../repo/hmo_repo_impl.dart';
import 'package:medicate_app/core/connect_end/model/get_my_hmo_plan_response_model/plan.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_kyc_entity_model/file.dart'
    as ph;
import 'package:medicate_app/core/connect_end/model/update_hmo_kyc_entity_model/logo.dart'
    as lg;
import 'package:medicate_app/core/connect_end/model/update_hmo_kyc_entity_model/cac_certificate.dart'
    as cc;
import 'package:medicate_app/core/connect_end/model/update_hmo_kyc_entity_model/hmo_accreditation.dart'
    as ac;
import 'package:medicate_app/core/connect_end/model/update_hmo_kyc_entity_model/tax_id_certificate.dart'
    as tx;
import 'package:medicate_app/core/connect_end/model/update_pharmacy_kyc_entity_model/file.dart'
    as fl;

// String startDateIso = '';

class HMOViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('HMOViewModel');

  final repositoryImply = HMORepoImpl();

  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingHospital = false;
  bool get isLoadingHospital => _isLoadingHospital;
  bool get isLoadingAppForm => _isLoadingAppForm;
  bool _isLoadingAppForm = false;
  bool get isLoadingAss => _isLoadingAss;
  bool _isLoadingAss = false;
  bool get isLoadingPlan => _isLoadingPlan;
  bool _isLoadingPlan = false;
  bool get isLoadingLogo => _isLoadingLogo;
  bool _isLoadingLogo = false;
  bool _isLoadingCAC = false;
  bool get isLoadingCAC => _isLoadingCAC;
  bool _isLoadingTIN = false;
  bool get isLoadingTIN => _isLoadingTIN;
  bool _isLoadingLicense = false;
  bool get isLoadingLicense => _isLoadingLicense;

  bool _onTempPinTap = false;
  bool get onTempPinTap => _onTempPinTap;
  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;
  String? pinInput;
  int _start = 60;

  String querySignUpCountry = '';
  String errorUser = '';

  List<Staff> checkOwnerRole = [];
  var vdelete;
  var vdeactivate;
  String vdeleteErrorMessage = '';
  String vdeactivateErrorMessage = '';
  List<Document> kycDocumentsList = [];

  List<String> hospitalType = [
    "Teaching",
    "General",
    "Private",
    "Specialist",
    "Clinic",
    "Government",
  ];

  List<TextEditingController> featureListController = [TextEditingController()];
  List<PlanTierListType> planTierListType = [PlanTierListType()];

  File? imageAppForm;
  String? filenameAppForm;
  File? imagePlan;
  String? filenamePlan;
  File? imageAss;
  String? filenameAss;
  File? imageLogo;
  String? filenameLogo;
  File? imageCAC;
  String? filenameCAC;
  File? imageTIN;
  String? filenameTIN;
  File? imageNHISLicense;
  String? filenameNHISLicense;
  String searchRoles = '';
  String searchUsers = '';

  String? pickedDate;
  TextEditingController dateTimeController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController resAddressController = TextEditingController();
  TextEditingController filterStateController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();

  UploadImageResponseModel? _uploadImageResponseModel;
  UploadImageResponseModel? get uploadImageResponseModel =>
      _uploadImageResponseModel;
  VerifyPharmacyOtpModel? _verifyPharmOtpRespnseModel;
  VerifyPharmacyOtpModel? get verifyPharmOtpRespnseModel =>
      _verifyPharmOtpRespnseModel;
  SignUpPhamaryResponseModel? _signUpPhamaryResponseModel;
  SignUpPhamaryResponseModel? get signUpPhamaryResponseModel =>
      _signUpPhamaryResponseModel;

  UploadImageResponseModel? _uploadImageResponseModelAppForm;
  UploadImageResponseModel? get uploadImageResponseModelAppForm =>
      _uploadImageResponseModelAppForm;
  UploadImageResponseModel? _uploadImageResponseModelAss;
  UploadImageResponseModel? get uploadImageResponseModeAss =>
      _uploadImageResponseModelAss;
  UploadImageResponseModel? _uploadImageResponseModelPlan;
  UploadImageResponseModel? get uploadImageResponseModelPlan =>
      _uploadImageResponseModelPlan;
  UploadImageResponseModel? _uploadImageResponseModelNHISLicense;
  UploadImageResponseModel? get uploadImageResponseModelNHISLicense =>
      _uploadImageResponseModelNHISLicense;

  PharmacyLoginResponseModel? _loginPharmacyResponseModel;
  PharmacyLoginResponseModel? get loginPharmacyResponseModel =>
      _loginPharmacyResponseModel;
  GetTenantResponseModel? _getTetantResponseModel;
  GetTenantResponseModel? get getTetantResponseModel => _getTetantResponseModel;
  GetUserDetailsResponseModel? _getUserDetailsResponseModel;
  GetUserDetailsResponseModel? get getUserDetailsResponseModel =>
      _getUserDetailsResponseModel;

  GetCreatedUserResponseModel? _getCreatedUserResponseModel;
  GetCreatedUserResponseModel? get getCreatedUserResponseModel =>
      _getCreatedUserResponseModel;

  GetAllListedPlanTypesResponseModel? _getAllListedPlanTypesResponseModel;
  GetAllListedPlanTypesResponseModel? get getAllListedPlanTypesResponseModel =>
      _getAllListedPlanTypesResponseModel;
  GetListOfHospitalResponseModel? _getAllOfHospitalsResponseModel;
  GetListOfHospitalResponseModel? get getAllOfHospitalsResponseModel =>
      _getAllOfHospitalsResponseModel;
  GetListedPlanTiersResponseModel? _getAllListedPlanTiersResponseModel;
  GetListedPlanTiersResponseModel? get getAllListedPlanTiersResponseModel =>
      _getAllListedPlanTiersResponseModel;
  GetRolesResponseModel? _getRolesResponseModel;
  GetRolesResponseModel? get getRolesResponseModel => _getRolesResponseModel;
  GetHmoKycResponseModel? get getHmoKycResponseModel => _getHmoKycResponseModel;
  GetHmoKycResponseModel? _getHmoKycResponseModel;
  SetPinPharmResponseModel? _setPinPharmResponseModel;
  SetPinPharmResponseModel? get setPinPharmResponseModel =>
      _setPinPharmResponseModel;
  ForgotPasswordResponseModel? _forgotPasswordResponseModel;
  ForgotPasswordResponseModel? get forgotPasswordResponseModel =>
      _forgotPasswordResponseModel;

  List<Hospital>? getAllHospitalPage = [];
  ResendOtpResponseModel? _resendOtpResponseModel;
  ResendOtpResponseModel? get resendOtpResponseModel => _resendOtpResponseModel;
  VerifyPassOtpRespnseModel? _verifyPassOtpRespnseModel;
  VerifyPassOtpRespnseModel? get verifyPassOtpRespnseModel =>
      _verifyPassOtpRespnseModel;
  UploadImageResponseModel? _uploadImageResponseModelLogo;
  UploadImageResponseModel? get uploadImageResponseModelLogo =>
      _uploadImageResponseModelLogo;
  UploadImageResponseModel? _uploadImageResponseModelCAC;
  UploadImageResponseModel? get uploadImageResponseModelCAC =>
      _uploadImageResponseModelCAC;
  UploadImageResponseModel? _uploadImageResponseModelTIN;
  UploadImageResponseModel? get uploadImageResponseModelTIN =>
      _uploadImageResponseModelTIN;
  CreateHmoPlanReponseModel? _createHmoPlanReponseModel;
  CreateHmoPlanReponseModel? get createHmoPlanReponseModel =>
      _createHmoPlanReponseModel;
  CreateHospitalNetworkResponseModel? _createHospitalNetworkResponseModel;
  CreateHospitalNetworkResponseModel? get createHospitalNetworkResponseModel =>
      _createHospitalNetworkResponseModel;
  GetMyHmoPlanResponseModel? _getMyHmoPlanResponseModel;
  GetMyHmoPlanResponseModel? getMyHmoPlanResponseModelList;
  GetMyHmoPlanResponseModel? get getMyHmoPlanResponseModel =>
      _getMyHmoPlanResponseModel;
  GetHospitalByIdResponseModel? _getHospitalByIdResponseModel;
  GetHospitalByIdResponseModel? get getHospitalByIdResponseModel =>
      _getHospitalByIdResponseModel;
  GetPlanHospitalNetworkResponseModel? _getPlanHospitalNetworkResponseModel;
  GetPlanHospitalNetworkResponseModel?
  get getPlanHospitalNetworkResponseModel =>
      _getPlanHospitalNetworkResponseModel;
  GetPlanDetailResponseModel? _getPlanDetailResponseModel;
  GetPlanDetailResponseModel? get getPlanDetailResponseModel =>
      _getPlanDetailResponseModel;

  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateVerify = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateVerifyChange = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidate2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateAddRole = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateAddUser = GlobalKey<FormState>();
  GlobalKey<FormState> kycFormKey = GlobalKey<FormState>();

  TextEditingController countryController = TextEditingController();
  TextEditingController rolenameController = TextEditingController();
  TextEditingController roleDescriptionController = TextEditingController();

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userGenderController = TextEditingController();
  TextEditingController userPinController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  String? userRoleControllerId;

  List<TextEditingController> benefitController = [TextEditingController()];
  List<TextEditingController> limitController = [TextEditingController()];
  TextEditingController planTypeController = TextEditingController();
  TextEditingController renewalPriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController maxDependentsController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController planTierController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  HMOViewModel({this.context});

  bool isOnToggleTempPinTap() {
    _onTempPinTap = !_onTempPinTap;
    notifyListeners();
    return _onTempPinTap;
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

  int levelKyc = 1;
  bool firstLevelKyc = false;
  bool secondLevelKyc = false;
  bool thirdLevelKyc = false;

  String? logoStatus;
  String? cacStatus;
  String? licenseStatus;
  String? tinStatus;
  String? formStatus;
  String? planStatus;
  String? assStatus;
  KycDocument? docKycLogo;
  KycDocument? docKycCac;
  KycDocument? docKycLicense;
  KycDocument? docKycTin;
  KycDocument? docKycForm;
  KycDocument? docKycPlan;
  KycDocument? docKycAss;

  int page = 1;

  PlanTier? planTiers;

  String searchHospitalName = '';

  String searchHmoPlanName = '';

  String filterPlanTypes = 'All';

  String filterPlanTiers = 'All';
  final groupedPlans = <String, List<Plan>>{};

  String searchedPlansTiers = '';

  groupByPlanType(context, HMOViewModel model, String selectedType) async {
    filterPlanTypes = selectedType;
    await getMyPlan(context);

    /// Always use original data source
    final allPlans = _getMyHmoPlanResponseModel?.data?.plans ?? [];

    /// Search filter
    if (filterPlanTypes != '') {
      final searchedPlans = allPlans.where((plan) {
        return (plan.planName ?? '').toLowerCase().contains(
          model.searchHmoPlanName.toLowerCase(),
        );
      }).toList();

      /// If ALL selected
      if (filterPlanTypes == 'All') {
        model.getMyHmoPlanResponseModelList?.data?.plans = searchedPlans;
        model.notifyListeners();
        return;
      }

      /// Filter by plan type
      final filteredByType = searchedPlans.where((plan) {
        return (plan.planType ?? '') == filterPlanTypes;
      }).toList();

      model.getMyHmoPlanResponseModelList?.data?.plans = filteredByType;
    } else {
      final searchedPlans = allPlans;

      /// If ALL selected
      if (filterPlanTypes == 'All') {
        model.getMyHmoPlanResponseModelList?.data?.plans = searchedPlans;
        model.notifyListeners();
        return;
      }

      /// Filter by plan type
      final filteredByType = searchedPlans.where((plan) {
        return (plan.planType ?? '') == filterPlanTypes;
      }).toList();

      model.getMyHmoPlanResponseModelList?.data?.plans = filteredByType;
    }
    model.notifyListeners();
  }

  groupByPlanTiers(context, HMOViewModel model, String selectedTier) async {
    filterPlanTiers = selectedTier;
    await getMyPlan(context);

    /// Always use original data source
    final allPlans = _getMyHmoPlanResponseModel?.data?.plans ?? [];

    /// Search filter
    if (filterPlanTiers != '') {
      final searchedPlansTiers = allPlans.where((plan) {
        return (plan.planName ?? '').toLowerCase().contains(
          model.searchHmoPlanName.toLowerCase(),
        );
      }).toList();

      /// If ALL selected
      if (filterPlanTiers == 'All') {
        model.getMyHmoPlanResponseModelList?.data?.plans = searchedPlansTiers;
        model.notifyListeners();
        return;
      }

      /// Filter by plan type
      final filteredByTier = searchedPlansTiers.where((plan) {
        return (plan.planTier ?? '') == filterPlanTiers;
      }).toList();

      model.getMyHmoPlanResponseModelList?.data?.plans = filteredByTier;
    } else {
      final searchedPlans = allPlans;

      /// If ALL selected
      if (filterPlanTiers == 'All') {
        model.getMyHmoPlanResponseModelList?.data?.plans = searchedPlans;
        model.notifyListeners();
        return;
      }

      /// Filter by plan type
      final filteredByTiers = searchedPlans.where((plan) {
        return (plan.planType ?? '') == filterPlanTypes;
      }).toList();

      model.getMyHmoPlanResponseModelList?.data?.plans = filteredByTiers;
    }
    model.notifyListeners();
  }

  Future<void> showColorPickerDialog({
    BuildContext? context,
    model,
    planIndex,
  }) async {
    final List<Map<String, Color>> colorPairs = [
      {"primary": Color(0XFFFF4B4B), "secondary": Color(0XFFFDE8E8)},
      {"primary": Color(0XFF2D9CFF), "secondary": Color(0XFFE4F2FF)},
      {"primary": Color(0XFF9B51E0), "secondary": Color(0XFFF1E6FF)},
      {"primary": Color(0XFF4F8F62), "secondary": Color(0XFFDCEEE2)},
      {"primary": Color(0XFFE9B63D), "secondary": Color(0XFFF8EDCF)},
      {"primary": Color(0XFF11B5D8), "secondary": Color(0XFFD9F4FA)},
    ];

    showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: colorPairs.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 18.h),
                    child: GestureDetector(
                      onTap: () {
                        model
                                .planTierListType[planIndex!]
                                .colorControllerPrimary =
                            e['primary'];

                        model
                                .planTierListType[planIndex]
                                .colorControllerSecondary =
                            e['secondary'];
                        model.notifyListeners();
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          /// PRIMARY COLOR
                          Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: e["primary"],
                            ),
                          ),
                          SizedBox(width: 12.w),

                          /// SECONDARY COLOR
                          Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: e["secondary"],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  String getDurationAmount(duration) {
    if (duration > 1) {
      return '$duration Months';
    }
    return '$duration Month';
  }

  Future<void> showUpdateMedicationDialog({
    BuildContext? context,
    int? planIndex,
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
                    color: AppColors.appRed.withOpacity(.09),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appRed,
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
                  text: "Are you sure?",
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.bblack,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: "This action will delete this plan tier.",
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
                          planTierListType.removeAt(planIndex!);
                          notifyListeners();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appRed,
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
                          text: "Yes, Delete",
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

  Future<void> showDeleteHMOPlanDialog({
    BuildContext? context,
    String? planId,
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
                    color: AppColors.appRed.withOpacity(.09),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appRed,
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
                  text: "Are you sure?",
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.bblack,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: "This action will delete this hmo plan.",
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
                          deleteHMOPlan(context, planId: planId);
                          notifyListeners();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appRed,
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
                          text: "Yes, Delete",
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

  Future<void> deletePlanTierDialog({
    BuildContext? context,
    String? planTierId,
  }) async {
    return showDialog(
      context: context!,
      barrierDismissible: false, // Prevent dismiss when tapping outside
      builder: (_) {
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
                    color: AppColors.appRed.withOpacity(.09),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appRed,
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
                  text: "Are you sure?",
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.bblack,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: "This action will delete this plan tier.",
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
                          deletePlanTier(context, planTierId: planTierId!);
                          notifyListeners();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appRed,
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
                          text: "Yes, Delete",
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

  String tiersSvgImage(String planTier) {
    if (planTier == 'Pearl') {
      return AppImage.pearl;
    }
    if (planTier == 'Diamond') {
      return AppImage.diamond;
    }
    if (planTier == 'Gold') {
      return AppImage.gold;
    }

    return AppImage.star;
  }

  Color tiersColor(String planTier) {
    if (planTier == 'Pearl') {
      return AppColors.lightBlue;
    }

    if (planTier == 'Diamond') {
      return AppColors.purple;
    }
    if (planTier == 'Gold') {
      return AppColors.gold;
    }

    return AppColors.appRed;
  }

  Color tiersSpeColor(String planTier) {
    if (planTier == 'Pearl') {
      return AppColors.lightBlue;
    }

    if (planTier == 'Diamond') {
      return AppColors.purple;
    }
    if (planTier == 'Gold') {
      return AppColors.blendedGold;
    }

    return AppColors.appRed;
  }

  Color tiersBorderColor(String planTier) {
    if (planTier == 'Pearl') {
      return AppColors.faintedBlue;
    }

    if (planTier == 'Diamond') {
      return AppColors.faintedPurple;
    }
    if (planTier == 'Gold') {
      return AppColors.faintedGold;
    }

    return AppColors.faintedRed;
  }

  String returnPhoneNoStructureAdd234After(String phoneNo) {
    if (phoneNo.startsWith('+234')) {
      phoneNo = phoneNo;
    } else if (phoneNo.startsWith('0')) {
      phoneNo = '+234${phoneNo.substring(1)}';
    } else {
      phoneNo = '+234$phoneNo';
    }
    notifyListeners();
    return phoneNo;
  }

  String returnPhoneNoStructure(String phoneNo) {
    if (phoneNo.substring(0, 1).contains('0')) {
      phoneNo = phoneNo.substring(1);
    }
    notifyListeners();
    return phoneNo;
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
          updateHMO(
            context,
            update: UpdateHmoProfileEntityModel(
              logo: Logo(
                width: _uploadImageResponseModel!.data!.width,
                height: _uploadImageResponseModel!.data!.height,
                format: _uploadImageResponseModel!.data!.format,
                url: _uploadImageResponseModel!.data!.url!,
                mimeType: _uploadImageResponseModel!.data!.mimeType,
                size: _uploadImageResponseModel!.data!.size,
              ),
              bankDetails: [],
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
              return ViewModelBuilder<HMOViewModel>.reactive(
                viewModelBuilder: () => HMOViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, HMOViewModel model, _) {
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
                                            ..onTap = () => model.resendOtpHMO(
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
                                              Routes.hMOChangePhoneNumber,
                                              arguments:
                                                  HMOChangePhoneNumberArguments(
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
                                      verifyOtpHMO(
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
              return ViewModelBuilder<HMOViewModel>.reactive(
                viewModelBuilder: () => HMOViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, HMOViewModel model, _) {
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
                                            ..onTap = () => model.resendOtpHMO(
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
              return ViewModelBuilder<HMOViewModel>.reactive(
                viewModelBuilder: () => HMOViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, HMOViewModel model, _) {
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
                                            ..onTap = () => model.resendOtpHMO(
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
                                              Routes.hMOChangePhoneNumber,
                                              arguments:
                                                  HMOChangePhoneNumberArguments(
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

  void signUpHMO(context, {HmoSignUpEntityModel? signUpEntity}) async {
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
          name: signUpEntity.hmoName,
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
              return ViewModelBuilder<HMOViewModel>.reactive(
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

  void signInHMO(context, {LoginEntityModel? signInEntity}) async {
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
        navigate.navigateTo(Routes.hMODashboard);
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
      AppUtils.snackbar(context, message: 'Please try again..', error: true);
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
      AppUtils.snackbar(context, message: 'Please try again.', error: true);
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

  Future<void> deletePlanTier(
    BuildContext context, {
    String? planTierId,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.deletePlanTier(planTierId!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 200) {
        await AppUtils.snackbar(context, message: v['message']);
        getListedPlanTiersForHMO(context);
      } else {
        AppUtils.snackbar(context, message: v['message'], error: true);
      }
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

  Future<void> getHMOKyc(context) async {
    try {
      _isLoading = true;
      _getHmoKycResponseModel = await runBusyFuture(
        repositoryImply.getHMOKyc(),
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

  void updateHMOKyc(context, {UpdateHmoKycEntityModel? updateKyc}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateHMOKyc(updateKyc!),
        throwException: true,
      );
      if (v['statusCode'] == 201) {
        AppUtils.snackbar(context, message: v['message']);
        getHMOKyc(context);
        kycDocumentsList.clear();
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

  void updateThirdHMOKyc(
    context, {
    UpdateThirdHmoKycEntityModel? updateKyc,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateThirdHMOKyc(updateKyc!),
        throwException: true,
      );
      if (v['statusCode'] == 201) {
        AppUtils.snackbar(context, message: v['message']);
        getHMOKyc(context);
        kycDocumentsList.clear();
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

  Future<void> getListedPlanTypesForHMO(context) async {
    try {
      _isLoading = true;
      _getAllListedPlanTypesResponseModel = await runBusyFuture(
        repositoryImply.getListedPlanTypesForHMO(),
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

  Future<void> getListedPlanTiersForHMO(context) async {
    try {
      _isLoading = true;
      _getAllListedPlanTiersResponseModel = await runBusyFuture(
        repositoryImply.getListedPlanTiersForHMO(),
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

  Future<void> getListOfHospital(context) async {
    try {
      _isLoading = true;
      _getAllOfHospitalsResponseModel = await runBusyFuture(
        repositoryImply.getListOfHospitals(page: page.toString()),
        throwException: true,
      );
      getAllHospitalPage!.addAll(
        _getAllOfHospitalsResponseModel!.data!.hospitals!,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> createHospitalNetwork({
    context,
    CreateHospitalNetworkEntityModel? createHospital,
  }) async {
    try {
      _isLoading = true;
      _createHospitalNetworkResponseModel = await runBusyFuture(
        repositoryImply.createHospitalNetwork(createHospital: createHospital),
        throwException: true,
      );
      if (_createHospitalNetworkResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _createHospitalNetworkResponseModel?.message ?? '',
        );
        navigate.navigateTo(
          Routes.hMODashboard,
          arguments: HMODashboardArguments(index: 1),
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

  Future<void> getHospitalNetworkById({context, String? hospitalId}) async {
    try {
      _isLoadingHospital = true;
      _getHospitalByIdResponseModel = await runBusyFuture(
        repositoryImply.getHospitalById(hospitalId!),
        throwException: true,
      );
      _isLoadingHospital = false;
    } catch (e) {
      _isLoadingHospital = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getPlanHospitalNetworkByPlanId({context, String? planId}) async {
    try {
      _isLoadingHospital = true;
      _getPlanHospitalNetworkResponseModel = await runBusyFuture(
        repositoryImply.getPlanHospitalByPlanId(planId!),
        throwException: true,
      );
      _isLoadingHospital = false;
    } catch (e) {
      _isLoadingHospital = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getPlanDetail({context, String? planId}) async {
    try {
      _isLoadingHospital = true;
      _getPlanDetailResponseModel = await runBusyFuture(
        repositoryImply.getPlanDetails(planId!),
        throwException: true,
      );
      _isLoadingHospital = false;
    } catch (e) {
      _isLoadingHospital = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> createHmoPlan({
    context,
    CreateHmoPlanEntityModel? createPlan,
  }) async {
    try {
      _isLoading = true;
      _createHmoPlanReponseModel = await runBusyFuture(
        repositoryImply.createHmoPlan(createPlan: createPlan),
        throwException: true,
      );
      if (_createHmoPlanReponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _createHmoPlanReponseModel?.message ?? '',
        );
        navigate.back(result: true);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> createHmoPlanTiers({
    context,
    CreatePlanTierEntityModel? createPlanTier,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.createPlanTier(createPlanTier!),
        throwException: true,
      );
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message'] ?? '');
        navigate.back(result: true);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateHmoPlanTiers({
    context,
    UpdatePlanTiersEntityModel? updatePlanTier,
    String? planTierId,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updatePlanTier(updatePlanTier!, planTierId!),
        throwException: true,
      );
      if (v['statusCode'] == 200) {
        await AppUtils.snackbar(context, message: v['message'] ?? '');
        navigate.back(result: true);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateHmoPlan({
    context,
    UpdateHmoPlanEntityModel? updatePlan,
    String? planId,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateHmoPlan(updatePlan: updatePlan, planId: planId),
        throwException: true,
      );
      if (v['statusCode'] == 200) {
        await AppUtils.snackbar(context, message: v['message'] ?? '');
        navigate.back(result: true);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> editHmoPlan({
    context,
    CreateHmoPlanEntityModel? createPlan,
  }) async {
    try {
      _isLoading = true;
      _createHmoPlanReponseModel = await runBusyFuture(
        repositoryImply.createHmoPlan(createPlan: createPlan),
        throwException: true,
      );
      if (_createHmoPlanReponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _createHmoPlanReponseModel?.message ?? '',
        );
        navigate.navigateTo(
          Routes.hMODashboard,
          arguments: HMODashboardArguments(index: 1),
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

  Future<void> editHospitalNetwork({
    context,
    HospitalNetworkEntityModel? hospitalNetwork,
    String? planId,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.editHospitalNetwork(
          hospitalNetwork: hospitalNetwork,
          planId: planId,
        ),
        throwException: true,
      );
      if (v['statusCode'] == 200) {
        _isLoading = false;
        await AppUtils.snackbar(context, message: v['message'] ?? '');
        navigate.back();
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> editHospital({
    context,
    CreateHospitalNetworkEntityModel? editHospital,
    String? hospitalId,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.editHospital(
          editHospital: editHospital,
          hospitalId: hospitalId,
        ),
        throwException: true,
      );
      if (v['statusCode'] == 200) {
        _isLoading = false;
        await AppUtils.snackbar(context, message: v['message'] ?? '');
        navigate.back();
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getPlanHospitalNetwork(List<String>? hospitalNetworkIds) async {
    if (hospitalNetworkIds!.isNotEmpty) {}
    notifyListeners();
  }

  Future<void> getMyPlan(context) async {
    try {
      _isLoading = true;
      _getMyHmoPlanResponseModel = await runBusyFuture(
        repositoryImply.getMyHmoPlans(),
        throwException: true,
      );
      getMyHmoPlanResponseModelList = _getMyHmoPlanResponseModel;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<dynamic> deleteHMOPlan(context, {String? planId}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.deleteHMOPlan(planId!),
        throwException: true,
      );
      AppUtils.snackbar(context, message: v['message']);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> selectPlanType({context, String? id}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.selectPlanType(id: id),
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

  Future<void> deSelectPlanType({context, String? id}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.deSelectPlanType(id: id),
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

  Future<void> updateHMO(context, {UpdateHmoProfileEntityModel? update}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateHMO(update),
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

  void changeNumberHMO(context, {String? phone, String? id}) async {
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

  void verifyOtpHMO(context, {VerifyPhoneEntityModel? verifyEntity}) async {
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

        navigate.navigateTo(Routes.hMOSetupPinScreen);
      }

      _isLoading = false;
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
          Routes.hMOChangePhoneNumber,
          arguments: HMOChangePhoneNumberArguments(id: v['data']['resetToken']),
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

        navigate.navigateTo(Routes.hMOLoginScreen);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void sendOtpHMO(context, {String? phone}) async {
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

  void setPinHMO(context, {SetPinEntityModel? setPinEntityModel}) async {
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
        navigate.navigateTo(Routes.hMODashboard);

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

  void resendOtpHMO(context, {ResendOtpEntityModel? resendotp}) async {
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

  void resetPinHMO(
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
        navigate.navigateTo(Routes.hMOResetSuccessScreen);
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

  void forgotPasswordHMO(
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
        return ViewModelBuilder<HMOViewModel>.reactive(
          viewModelBuilder: () => locator<HMOViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, HMOViewModel model, _) {
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
                                      ..onTap = () => model.resendOtpHMO(
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
                                        Routes.hMOChangePhoneNumber,
                                        arguments:
                                            HMOChangePhoneNumberArguments(
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
                                verifyForgotPasswordHMO(
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

  void verifyForgotPasswordHMO(
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
          Routes.hMOResetPinScreen,
          arguments: HMOResetPinScreenArguments(
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
        return HMOAddRoleModalWidget(
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
        return HMOAddUserModalWidget(
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
        return HMODeactivateUserModalWidget(
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

  // Future<void> selectTime(BuildContext context) async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(), // The time initially displayed
  //   );

  //   if (pickedTime != null) {
  //     dateTimeController.text =
  //         '${pickedDate!} ${formatTime('${pickedTime.hour}:${pickedTime.minute}')}';
  //   }
  //   notifyListeners();
  // }

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? pickedDated = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(), // The date initially displayed
  //     firstDate: DateTime.now(), // The earliest selectable date
  //     lastDate: DateTime(2101), // The latest selectable date
  //   );

  //   if (pickedDated != null) {
  //     pickedDate = DateFormat('dd MMM, yyyy').format(pickedDated);

  //     await selectTime(context);
  //     startDateIso = DateTime.utc(
  //       pickedDated.year,
  //       pickedDated.month,
  //       pickedDated.day,
  //     ).toIso8601String();
  //   }
  //   notifyListeners();
  // }

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

  void pickImageLogo(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageLogo = file;
          filenameLogo = imageLogo!.path.split("/").last;
          _isLoadingLogo = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageLogo).readAsBytesSync(),
              filename: imageLogo!.path.split("/").last,
            ),
          );
          _isLoadingLogo = _isLoading;
          _uploadImageResponseModelLogo = _uploadImageResponseModel;
          kycDocumentsList.add(
            Document(
              documentType: 'HMO_LOGO',
              file: ph.File(
                width: _uploadImageResponseModelLogo!.data!.width,
                height: _uploadImageResponseModelLogo!.data!.height,
                format: _uploadImageResponseModelLogo!.data!.format,
                url: _uploadImageResponseModelLogo!.data!.url!,
                mimeType: _uploadImageResponseModelLogo!.data!.mimeType,
                size: _uploadImageResponseModelLogo!.data!.size,
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
              documentType: 'CAC_REGISTRATION_CERTIFICATE',
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

  void pickImageNHISLicense(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageNHISLicense = file;
          filenameNHISLicense = imageNHISLicense!.path.split("/").last;
          _isLoadingLicense = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageNHISLicense).readAsBytesSync(),
              filename: imageNHISLicense!.path.split("/").last,
            ),
          );
          _isLoadingLicense = _isLoading;
          _uploadImageResponseModelNHISLicense = _uploadImageResponseModel;

          kycDocumentsList.add(
            Document(
              documentType: 'NHIS_LICENSE',
              file: ph.File(
                width: _uploadImageResponseModelNHISLicense!.data!.width,
                height: _uploadImageResponseModelNHISLicense!.data!.height,
                format: _uploadImageResponseModelNHISLicense!.data!.format,
                url: _uploadImageResponseModelNHISLicense!.data!.url!,
                mimeType: _uploadImageResponseModelNHISLicense!.data!.mimeType,
                size: _uploadImageResponseModelNHISLicense!.data!.size,
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

  void pickImageAppForm(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageAppForm = file;
          filenameAppForm = imageAppForm!.path.split("/").last;
          _isLoadingAppForm = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageAppForm).readAsBytesSync(),
              filename: imageAppForm!.path.split("/").last,
            ),
          );
          _isLoadingAppForm = _isLoading;
          _uploadImageResponseModelAppForm = _uploadImageResponseModel;
          kycDocumentsList.add(
            Document(
              documentType: 'APPLICATION_FORM',
              file: ph.File(
                width: _uploadImageResponseModelAppForm!.data!.width,
                height: _uploadImageResponseModelAppForm!.data!.height,
                format: _uploadImageResponseModelAppForm!.data!.format,
                url: _uploadImageResponseModelAppForm!.data!.url!,
                mimeType: _uploadImageResponseModelAppForm!.data!.mimeType,
                size: _uploadImageResponseModelAppForm!.data!.size,
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

  void pickImagePlan(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imagePlan = file;
          filenamePlan = imagePlan!.path.split("/").last;
          _isLoadingPlan = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imagePlan).readAsBytesSync(),
              filename: imagePlan!.path.split("/").last,
            ),
          );
          _isLoadingPlan = _isLoading;
          _uploadImageResponseModelPlan = _uploadImageResponseModel;
          _uploadImageResponseModel = null;
          kycDocumentsList.add(
            Document(
              documentType: 'AVAILABLE_PLAN',
              file: ph.File(
                width: _uploadImageResponseModelPlan!.data!.width,
                height: _uploadImageResponseModelPlan!.data!.height,
                format: _uploadImageResponseModelPlan!.data!.format,
                url: _uploadImageResponseModelPlan!.data!.url!,
                mimeType: _uploadImageResponseModelPlan!.data!.mimeType,
                size: _uploadImageResponseModelPlan!.data!.size,
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

  void pickImageAss(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageAss = file;
          filenameAss = imageAss!.path.split("/").last;
          _isLoadingAss = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageAss).readAsBytesSync(),
              filename: imageAss!.path.split("/").last,
            ),
          );
          _isLoadingAss = _isLoading;
          _uploadImageResponseModelAss = _uploadImageResponseModel;

          kycDocumentsList.add(
            Document(
              documentType: 'ASSOCIATED_CLINIC',
              file: ph.File(
                width: _uploadImageResponseModelAss!.data!.width,
                height: _uploadImageResponseModelAss!.data!.height,
                format: _uploadImageResponseModelAss!.data!.format,
                url: _uploadImageResponseModelAss!.data!.url!,
                mimeType: _uploadImageResponseModelAss!.data!.mimeType,
                size: _uploadImageResponseModelAss!.data!.size,
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

  String getKycStatus(kyc) {
    if (kyc == 'UNDER_REVIEW') {
      return 'Your KYC is submitted and under\nreview. We’ll notify you once it’s\nverified.';
    }
    if (kyc == 'APPROVED') {
      return 'Your KYC has been successfully\nverified. You can now access all\nservices.';
    }
    if (kyc == 'REJECTED') {
      return 'Your KYC couldn’t be verified.\nPlease review your details and\nresubmit the required documents';
    }
    return 'Kindly upload and submit KYC for\nverification to obtain full access to\nplatform features.';
  }

  bool getHmoIsActiveStatus(model) {
    if (model.getHmoKycResponseModel != null &&
        model.getHmoKycResponseModel!.data!.kycLevels!.isNotEmpty) {
      return model.getKycStatusBoolSecond(
        kyc1: model.getHmoKycResponseModel?.data?.kycLevels?[0].status ?? '',
        kyc2: model.getHmoKycResponseModel?.data?.kycLevels?[1].status ?? '',
        kyc3: model.getHmoKycResponseModel?.data?.kycLevels?[2].status ?? '',
      );
    }
    return true;
  }

  // hmoKycStatus() {
  //   if (getHmoKycResponseModel!.data != {} &&
  //       getHmoKycResponseModel!.data!.kycDocuments != null &&
  //       getHmoKycResponseModel!.data!.kycDocuments!.isNotEmpty &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.any((doc) {
  //         docKycLogo = doc;
  //         return doc.documentType == 'HMOLOGO';
  //       })) {
  //     logoStatus = docKycLogo!.status!;
  //   }
  //   if (getPharmacyKycResponseModel!.data != {} &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.isNotEmpty &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.any((doc) {
  //         docKycCac = doc;
  //         return doc.documentType == 'CACREGISTRATIONCERTIFICATE';
  //       })) {
  //     cacStatus = docKycCac!.status!;
  //   }
  //   if (getPharmacyKycResponseModel != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.isNotEmpty &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.any((doc) {
  //         docKycLicense = doc;
  //         return doc.documentType == 'NHISLICENSE';
  //       })) {
  //     licenseStatus = docKycLicense!.status!;
  //   }
  //   if (getPharmacyKycResponseModel != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.isNotEmpty &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.any((doc) {
  //         docKycTin = doc;
  //         return doc.documentType == 'TAXIDENTIFICATIONNUMBER';
  //       })) {
  //     tinStatus = docKycTin!.status!;
  //   }
  //   if (getPharmacyKycResponseModel != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.isNotEmpty &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.any((doc) {
  //         docKycForm = doc;
  //         return doc.documentType == 'APPLICATION_FORM';
  //       })) {
  //     formStatus = docKycForm!.status!;
  //   }
  //   if (getPharmacyKycResponseModel != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.isNotEmpty &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.any((doc) {
  //         docKycPlan = doc;
  //         return doc.documentType == 'AVAILABLE_PLAN';
  //       })) {
  //     planStatus = docKycPlan!.status!;
  //   }
  //   if (getPharmacyKycResponseModel != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments != null &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.isNotEmpty &&
  //       getPharmacyKycResponseModel!.data!.kycDocuments!.any((doc) {
  //         docKycAss = doc;
  //         return doc.documentType == 'ASSOCIATED_CLINIC';
  //       })) {
  //     assStatus = docKycAss!.status!;
  //     // }
  //   }
  //   notifyListeners();
  // }

  Color getKycStatusColor(kyc) {
    if (kyc == 'UNDER_REVIEW') {
      return AppColors.fadedyellow;
    }
    if (kyc == 'APPROVED') {
      return AppColors.app_green_light;
    }
    if (kyc == 'REJECTED') {
      return AppColors.faintedRed;
    }
    return AppColors.fadedyellow;
  }

  dynamic getKycStatusIcon(kyc) {
    if (kyc == 'UNDER_REVIEW') {
      return SvgPicture.asset(AppImage.info);
    }
    if (kyc == 'APPROVED') {
      return Container(
        padding: EdgeInsets.all(3.4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.app_green,
        ),
        child: Icon(Icons.check, color: AppColors.white, size: 10.sp),
      );
    }
    if (kyc == 'REJECTED') {
      return Icon(Icons.cancel, color: AppColors.appRed, size: 20.sp);
    }
    return SvgPicture.asset(AppImage.info);
  }

  bool getKycStatusBool(kyc) {
    if (kyc == 'UNDER_REVIEW') {
      return true;
    }
    if (kyc == 'APPROVED') {
      return true;
    }
    return false;
  }

  // String getKycStatusSecond({form, plans, ass}) {
  //   if (form == 'PENDING' || plans == 'PENDING' || ass == 'PENDING') {
  //     return 'Your KYC is submitted and under\nreview. We’ll notify you once it’s\nverified.';
  //   }
  //   if (ass == 'APPROVED' && form == 'APPROVED' && plans == 'APPROVED') {
  //     return 'Your KYC has been successfully\nverified. You can now access all\nservices.';
  //   }
  //   return 'Kindly upload and submit KYC for\nverification to obtain full access to\nplatform features.';
  // }

  // Color getKycStatusColorSecond({form, plans, ass}) {
  //   if (form == 'PENDING' || ass == 'PENDING' || plans == 'PENDING') {
  //     return AppColors.fadedyellow;
  //   }
  //   if (ass == 'APPROVED' && plans == 'APPROVED' && form == 'APPROVE') {
  //     return AppColors.app_green_light;
  //   }
  //   return AppColors.fadedyellow;
  // }

  bool getKycStatusBoolSecond({kyc1, kyc2, kyc3}) {
    if (kyc1 == 'UNDER_REVIEW' ||
        kyc2 == 'UNDER_REVIEW' ||
        kyc3 == 'UNDER_REVIEW') {
      return true;
    }
    if (kyc1 == 'APPROVED' && kyc2 == 'APPROVED' && kyc3 == 'APPROVED') {
      return false;
    }
    return false;
  }

  kycLevelWidget({String? level, Function()? onTap, BuildContext? contxt}) =>
      GestureDetector(
        onTap: onTap,
        child: int.parse(level!) == levelKyc
            ? KycWidget(level: level, contxxt: contxt)
            : Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 16.w),
                margin: EdgeInsets.only(bottom: 16.0.w),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Level $level',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15.6.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                    int.parse(level) == 1
                        ? Container(
                            padding: EdgeInsets.all(3.4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.app_green,
                            ),
                            child: Icon(
                              Icons.check,
                              color: AppColors.white,
                              size: 10.sp,
                            ),
                          )
                        : Icon(
                            int.parse(level) == levelKyc
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            size: 21.0.sp,
                            color: AppColors.reminder,
                          ),
                  ],
                ),
              ),
      );

  KycWidget({String? level, BuildContext? contxxt}) => Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 16.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.grey),
      boxShadow: [
        BoxShadow(
          color: AppColors.grey,
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    clipBehavior: Clip.antiAlias, // VERY IMPORTANT
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            levelKyc = 0;
            notifyListeners();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.w),
            color: Color(0xFFF5F6F8), // light grey header
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Level $level',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 15.6.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.reminder,
                  ),
                ),
                int.parse(level!) == 1
                    ? Container(
                        padding: EdgeInsets.all(3.4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.app_green,
                        ),
                        child: Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 10.sp,
                        ),
                      )
                    : Icon(
                        int.parse(level) == levelKyc
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 21.0.sp,
                        color: AppColors.reminder,
                      ),
              ],
            ),
          ),
        ),
        // 🔹 BODY
        levelKyc == 1
            ? Padding(
                padding: EdgeInsets.all(16.4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoItem(
                      title: "Phone Number",
                      value: SharedPreferencesService
                          .instance
                          .usersData['user']['phone']
                          .toString()
                          .substring(4),
                    ),
                    InfoItem(
                      title: "HMO Name",
                      value: getTetantResponseModel?.data?.name ?? '',
                    ),
                    InfoItem(
                      title: "Business Address",
                      value:
                          getTetantResponseModel?.data?.businessAddress ?? '',
                    ),
                    InfoItem(
                      title: "Business email",
                      value: getTetantResponseModel?.data?.businessEmail ?? '',
                    ),
                    InfoItem(
                      title: "First Name (Contact Person)",
                      value:
                          getTetantResponseModel
                              ?.data
                              ?.contactPersonFirstName ??
                          '',
                    ),
                    InfoItem(
                      title: "Last Name (Contact Person)",
                      value:
                          getTetantResponseModel?.data?.contactPersonLastName ??
                          '',
                    ),
                    InfoItem(
                      title: "Designation",
                      value:
                          getTetantResponseModel
                              ?.data
                              ?.contactPersonDesignation ??
                          '',
                    ),
                  ],
                ),
              )
            : levelKyc == 2
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.8.w,
                  vertical: 12.6.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.w,
                        horizontal: 14.62.w,
                      ),
                      decoration: BoxDecoration(
                        color:
                            getHmoKycResponseModel!.data!.kycLevels!.isNotEmpty
                            ? getKycStatusColor(
                                getHmoKycResponseModel!
                                    .data!
                                    .kycLevels![1]
                                    .status,
                              )
                            : AppColors.fadedyellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          getHmoKycResponseModel!.data!.kycLevels!.isNotEmpty
                              ? getKycStatusIcon(
                                  getHmoKycResponseModel!
                                      .data!
                                      .kycLevels![1]
                                      .status,
                                )
                              : SvgPicture.asset(AppImage.info),
                          SizedBox(width: 10.w),
                          SizedBox(
                            width: 200.w,
                            child: TextView(
                              text:
                                  getHmoKycResponseModel!
                                      .data!
                                      .kycLevels!
                                      .isNotEmpty
                                  ? getKycStatus(
                                      getHmoKycResponseModel!
                                          .data!
                                          .kycLevels![1]
                                          .status,
                                    )
                                  : 'Kindly upload and submit KYC for\nverification to obtain full access to\nplatform features.',
                              maxLines: 4,
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 12.42.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        TextView(
                          text: 'Logo (Profile Picture)',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 13.2.sp,
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
                    SizedBox(height: 10.20.h),
                    getHmoKycResponseModel!.data!.logo != null
                        ? Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.tintColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.kyc_file),
                                SizedBox(width: 14.20.w),
                                SizedBox(
                                  width: 160.w,
                                  child: TextView(
                                    text: 'HMO LOGO.jpg',
                                    textOverflow: TextOverflow.ellipsis,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    contxxt!,
                                    MaterialPageRoute(
                                      builder: (_) => ImageWebViewScreen(
                                        imageUrl:
                                            getHmoKycResponseModel
                                                ?.data
                                                ?.logo
                                                ?.url ??
                                            '',
                                      ),
                                    ),
                                  ),
                                  child: SvgPicture.asset(AppImage.kyc_eye),
                                ),
                              ],
                            ),
                          )
                        : _isLoadingLogo
                        ? Center(
                            child: SpinKitCircle(
                              color: AppColors.infoGrey,
                              size: 32.40.sp,
                            ),
                          )
                        : filenameLogo != null
                        ? Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.tintColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.kyc_file),
                                SizedBox(width: 14.20.w),
                                SizedBox(
                                  width: 160.w,
                                  child: TextView(
                                    text: "${filenameLogo ?? ""}.jpg",
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    pickImageLogo(contxxt!);
                                    notifyListeners();
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.upload_arr_up,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                GestureDetector(
                                  onTap: () {
                                    filenameLogo = null;
                                    imageLogo = null;
                                    notifyListeners();
                                  },
                                  child: SvgPicture.asset(AppImage.delete),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [10, 10],
                                strokeWidth: .94,
                                radius: Radius.circular(10),
                                color: AppColors.primary,
                              ),
                              child: GestureDetector(
                                onTap: () => pickImageLogo(contxxt!),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 14.20.w,
                                    horizontal: 12.0.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AppImage.upload_doc),
                                      SizedBox(width: 10.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Upload Document',
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                          TextView(
                                            text:
                                                'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 12.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 20.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        TextView(
                          text: 'CAC Registration Certificate (Nigeria)',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 13.2.sp,
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
                    SizedBox(height: 10.20.h),
                    getHmoKycResponseModel!.data!.cacCertificate != null
                        ? Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.tintColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.kyc_file),
                                SizedBox(width: 14.20.w),
                                SizedBox(
                                  width: 160.w,
                                  child: TextView(
                                    text: 'CAC REGISTRATION CERTIFICATE.jpg',
                                    textOverflow: TextOverflow.ellipsis,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    contxxt!,
                                    MaterialPageRoute(
                                      builder: (_) => ImageWebViewScreen(
                                        imageUrl:
                                            getHmoKycResponseModel!
                                                .data!
                                                .logo
                                                ?.url ??
                                            '',
                                      ),
                                    ),
                                  ),
                                  child: SvgPicture.asset(AppImage.kyc_eye),
                                ),
                              ],
                            ),
                          )
                        : isLoadingCAC
                        ? Center(
                            child: SpinKitCircle(
                              color: AppColors.infoGrey,
                              size: 32.40.sp,
                            ),
                          )
                        : filenameCAC != null
                        ? Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.tintColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.kyc_file),
                                SizedBox(width: 14.20.w),
                                SizedBox(
                                  width: 160.w,
                                  child: TextView(
                                    text: "${filenameCAC ?? ""}.jpg",
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    pickImageCAC(contxxt!);
                                    notifyListeners();
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.upload_arr_up,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                GestureDetector(
                                  onTap: () {
                                    filenameCAC = null;
                                    imageCAC = null;
                                    notifyListeners();
                                  },
                                  child: SvgPicture.asset(AppImage.delete),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [10, 10],
                                strokeWidth: .94,
                                radius: Radius.circular(10),
                                color: AppColors.primary,
                              ),
                              child: GestureDetector(
                                onTap: () => pickImageCAC(contxxt!),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 14.20.w,
                                    horizontal: 12.0.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AppImage.upload_doc),
                                      SizedBox(width: 10.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Upload Document',
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                          TextView(
                                            text:
                                                'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 12.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 20.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          width: 250.w,
                          child: TextView(
                            text:
                                'HMO accreditation certificate from NHIS (National Health Insurance Scheme)',
                            maxLines: 2,
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 13.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
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
                    SizedBox(height: 10.20.h),
                    getHmoKycResponseModel!.data!.hmoAccreditation != null
                        ? Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.tintColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.kyc_file),
                                SizedBox(width: 14.20.w),
                                TextView(
                                  text: 'NHIS LICENSE.jpg',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 13.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    contxxt!,
                                    MaterialPageRoute(
                                      builder: (_) => ImageWebViewScreen(
                                        imageUrl:
                                            getHmoKycResponseModel!
                                                .data!
                                                .listOfHospitals
                                                ?.url ??
                                            '',
                                      ),
                                    ),
                                  ),
                                  child: SvgPicture.asset(AppImage.kyc_eye),
                                ),
                              ],
                            ),
                          )
                        : isLoadingLicense
                        ? Center(
                            child: SpinKitCircle(
                              color: AppColors.infoGrey,
                              size: 32.40.sp,
                            ),
                          )
                        : filenameNHISLicense != null
                        ? Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.tintColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.kyc_file),
                                SizedBox(width: 14.20.w),
                                SizedBox(
                                  width: 120.w,
                                  child: TextView(
                                    text: "${filenameNHISLicense ?? ""}.jpg",
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    pickImageNHISLicense(contxxt!);
                                    notifyListeners();
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.upload_arr_up,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                GestureDetector(
                                  onTap: () {
                                    filenameNHISLicense = null;
                                    imageNHISLicense = null;
                                    notifyListeners();
                                  },
                                  child: SvgPicture.asset(AppImage.delete),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [10, 10],
                                strokeWidth: .94,
                                radius: Radius.circular(10),
                                color: AppColors.primary,
                              ),
                              child: GestureDetector(
                                onTap: () => pickImageNHISLicense(contxxt!),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 14.20.w,
                                    horizontal: 12.0.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AppImage.upload_doc),
                                      SizedBox(width: 10.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Upload Document',
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                          TextView(
                                            text:
                                                'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 20.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        TextView(
                          text: 'Tax identification number',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
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
                    SizedBox(height: 10.20.h),
                    getHmoKycResponseModel!.data!.taxIdCertificate != null
                        ? Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.tintColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.kyc_file),
                                SizedBox(width: 14.20.w),
                                SizedBox(
                                  width: 160.w,
                                  child: TextView(
                                    text: 'TAX IDENTIFICATION NUMBER.jpg',

                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    contxxt!,
                                    MaterialPageRoute(
                                      builder: (_) => ImageWebViewScreen(
                                        imageUrl:
                                            getHmoKycResponseModel!
                                                .data!
                                                .taxIdCertificate
                                                ?.url ??
                                            '',
                                      ),
                                    ),
                                  ),
                                  child: SvgPicture.asset(AppImage.kyc_eye),
                                ),
                              ],
                            ),
                          )
                        : isLoadingTIN
                        ? Center(
                            child: SpinKitCircle(
                              color: AppColors.infoGrey,
                              size: 32.40.sp,
                            ),
                          )
                        : filenameTIN != null
                        ? Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.tintColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.kyc_file),
                                SizedBox(width: 14.20.w),
                                SizedBox(
                                  width: 160.w,
                                  child: TextView(
                                    text: "${filenameTIN ?? ""}.jpg",
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    pickImageTIN(contxxt!);
                                    notifyListeners();
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.upload_arr_up,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                GestureDetector(
                                  onTap: () {
                                    filenameTIN = null;
                                    imageTIN = null;
                                    notifyListeners();
                                  },
                                  child: SvgPicture.asset(AppImage.delete),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [10, 10],
                                strokeWidth: .94,
                                radius: Radius.circular(10),
                                color: AppColors.primary,
                              ),
                              child: GestureDetector(
                                onTap: () => pickImageTIN(contxxt!),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 14.20.w,
                                    horizontal: 12.0.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AppImage.upload_doc),
                                      SizedBox(width: 10.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Upload Document',
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                          TextView(
                                            text:
                                                'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 30.h),
                    ButtonWidget(
                      border: 100.r,
                      buttonColor:
                          imageLogo == null &&
                                  imageCAC == null &&
                                  imageNHISLicense == null &&
                                  imageTIN == null ||
                              getHmoKycResponseModel!
                                      .data!
                                      .kycLevels!
                                      .isNotEmpty &&
                                  getKycStatusBool(
                                        getHmoKycResponseModel!
                                            .data!
                                            .kycLevels![1]
                                            .status,
                                      ) ==
                                      true
                          ? AppColors.infoGrey
                          : AppColors.primary,
                      fontSize: 16.sp,
                      buttonText: 'Submit for Verification',
                      color: AppColors.white,
                      isLoading: isLoading,
                      buttonBorderColor: AppColors.transparent,
                      onPressed:
                          getHmoKycResponseModel!.data!.kycLevels!.isNotEmpty
                          ? getKycStatusBool(
                                          getHmoKycResponseModel!
                                              .data!
                                              .kycLevels![1]
                                              .status,
                                        ) ==
                                        false &&
                                    imageLogo != null &&
                                    imageCAC != null &&
                                    imageNHISLicense != null &&
                                    imageTIN != null
                                ? () {
                                    if (imageLogo != null &&
                                        imageCAC != null &&
                                        imageNHISLicense != null &&
                                        imageTIN != null) {
                                      updateHMOKyc(
                                        contxxt,
                                        updateKyc: UpdateHmoKycEntityModel(
                                          logo: lg.Logo.fromJson(
                                            fl.File.fromJson(
                                              kycDocumentsList[0].file!
                                                  .toJson(),
                                            ).toJson(),
                                          ),
                                          cacCertificate:
                                              cc.CacCertificate.fromJson(
                                                fl.File.fromJson(
                                                  kycDocumentsList[1].file!
                                                      .toJson(),
                                                ).toJson(),
                                              ),
                                          hmoAccreditation:
                                              ac.HmoAccreditation.fromJson(
                                                fl.File.fromJson(
                                                  kycDocumentsList[2].file!
                                                      .toJson(),
                                                ).toJson(),
                                              ),
                                          taxIdCertificate:
                                              tx.TaxIdCertificate.fromJson(
                                                fl.File.fromJson(
                                                  kycDocumentsList[3].file!
                                                      .toJson(),
                                                ).toJson(),
                                              ),
                                        ),
                                      );
                                    } else {
                                      AppUtils.snackbar(
                                        context,
                                        message:
                                            'Kindly select and upload all documents. ',
                                        error: true,
                                      );
                                    }
                                  }
                                : () {}
                          : () {
                              if (imageLogo != null &&
                                  imageCAC != null &&
                                  imageNHISLicense != null &&
                                  imageTIN != null) {
                                updateHMOKyc(
                                  contxxt,
                                  updateKyc: UpdateHmoKycEntityModel(
                                    logo: lg.Logo.fromJson(
                                      fl.File.fromJson(
                                        kycDocumentsList[0].file!.toJson(),
                                      ).toJson(),
                                    ),
                                    cacCertificate: cc.CacCertificate.fromJson(
                                      fl.File.fromJson(
                                        kycDocumentsList[1].file!.toJson(),
                                      ).toJson(),
                                    ),
                                    hmoAccreditation:
                                        ac.HmoAccreditation.fromJson(
                                          fl.File.fromJson(
                                            kycDocumentsList[2].file!.toJson(),
                                          ).toJson(),
                                        ),
                                    taxIdCertificate:
                                        tx.TaxIdCertificate.fromJson(
                                          fl.File.fromJson(
                                            kycDocumentsList[3].file!.toJson(),
                                          ).toJson(),
                                        ),
                                  ),
                                );
                              } else {
                                AppUtils.snackbar(
                                  context,
                                  message:
                                      'Kindly select and upload all documents. ',
                                  error: true,
                                );
                              }
                            },
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              )
            : levelKyc == 3
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.8.w,
                  vertical: 12.6.w,
                ),
                child: Form(
                  key: kycFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.w,
                          horizontal: 14.62.w,
                        ),
                        decoration: BoxDecoration(
                          color:
                              getHmoKycResponseModel!
                                  .data!
                                  .kycLevels!
                                  .isNotEmpty
                              ? getKycStatusColor(
                                  getHmoKycResponseModel!
                                      .data!
                                      .kycLevels![2]
                                      .status,
                                )
                              : AppColors.fadedyellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            getHmoKycResponseModel!.data!.kycLevels!.isNotEmpty
                                ? getKycStatusIcon(
                                    getHmoKycResponseModel!
                                        .data!
                                        .kycLevels![2]
                                        .status,
                                  )
                                : SvgPicture.asset(AppImage.info),
                            SizedBox(width: 10.w),
                            SizedBox(
                              width: 200.w,
                              child: TextView(
                                text:
                                    getHmoKycResponseModel!
                                        .data!
                                        .kycLevels!
                                        .isNotEmpty
                                    ? getKycStatus(
                                        getHmoKycResponseModel!
                                            .data!
                                            .kycLevels![2]
                                            .status,
                                      )
                                    : 'Kindly upload and submit KYC for\nverification to obtain full access to\nplatform features.',
                                maxLines: 4,
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 12.42.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextView(
                        text: 'Bank Information',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Divider(color: const Color.fromARGB(255, 227, 227, 228)),
                      SizedBox(height: 6.h),
                      getHmoKycResponseModel!.data != null &&
                              getHmoKycResponseModel!
                                  .data!
                                  .bankDetails!
                                  .isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InfoItem(
                                  title: "Bank Name",
                                  value:
                                      getHmoKycResponseModel!
                                          .data!
                                          .bankDetails![0]
                                          .bankName ??
                                      '',
                                ),
                                InfoItem(
                                  title: "Account Number",
                                  value:
                                      getHmoKycResponseModel!
                                          .data!
                                          .bankDetails![0]
                                          .accountNumber ??
                                      '',
                                ),
                                InfoItem(
                                  title: "Account Name",
                                  value:
                                      getHmoKycResponseModel!
                                          .data!
                                          .bankDetails![0]
                                          .accountName ??
                                      '',
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormWidget(
                                  hint: 'Bank Name',
                                  hintSize: 14,
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  keyboardType: TextInputType.text,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  controller: bankNameController,
                                  validator: AppValidator.validateString(),
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Account Number',
                                  hintSize: 14,
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  label: 'Enter account number',
                                  keyboardType: TextInputType.number,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  controller: accountNumberController,
                                  validator: AppValidator.validateString(),
                                  // ),
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  hint: 'Account Name',
                                  hintSize: 14,
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  label: 'Enter account name',
                                  keyboardType: TextInputType.name,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  controller: accountNameController,
                                  validator: AppValidator.validateString(),
                                  // ),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                      TextView(
                        text: 'Process Documents',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Divider(color: const Color.fromARGB(255, 227, 227, 228)),
                      SizedBox(height: 12.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'Application Form',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 13.2.sp,
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
                      SizedBox(height: 10.20.h),
                      getHmoKycResponseModel!.data!.applicationForm != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 160.w,
                                    child: TextView(
                                      text: 'APPLICATION FORM.jpg',
                                      textOverflow: TextOverflow.ellipsis,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      contxxt!,
                                      MaterialPageRoute(
                                        builder: (_) => ImageWebViewScreen(
                                          imageUrl:
                                              getHmoKycResponseModel!
                                                  .data!
                                                  .applicationForm
                                                  ?.url ??
                                              '',
                                        ),
                                      ),
                                    ),
                                    child: SvgPicture.asset(AppImage.kyc_eye),
                                  ),
                                ],
                              ),
                            )
                          : _isLoadingAppForm
                          ? Center(
                              child: SpinKitCircle(
                                color: AppColors.infoGrey,
                                size: 32.40.sp,
                              ),
                            )
                          : filenameAppForm != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 160.w,
                                    child: TextView(
                                      text: "${filenameAppForm ?? ""}.jpg",
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      pickImageAppForm(contxxt!);
                                      notifyListeners();
                                    },
                                    child: SvgPicture.asset(
                                      AppImage.upload_arr_up,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  GestureDetector(
                                    onTap: () {
                                      filenameAppForm = null;
                                      imageAppForm = null;
                                      notifyListeners();
                                    },
                                    child: SvgPicture.asset(AppImage.delete),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  dashPattern: [10, 10],
                                  strokeWidth: .94,
                                  radius: Radius.circular(10),
                                  color: AppColors.primary,
                                ),
                                child: GestureDetector(
                                  onTap: () => pickImageAppForm(contxxt!),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.20.w,
                                      horizontal: 12.0.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(AppImage.upload_doc),
                                        SizedBox(width: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextView(
                                              text: 'Upload Document',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 14.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                            SizedBox(height: 2.0.h),
                                            TextView(
                                              text:
                                                  'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 12.6.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.fineGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(height: 20.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'Schedule of available plans ',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 13.2.sp,
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
                      SizedBox(height: 10.20.h),
                      getHmoKycResponseModel!.data!.scheduleOfPlans != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 160.w,
                                    child: TextView(
                                      text: 'AVAILABLE PLAN.jpg',
                                      textOverflow: TextOverflow.ellipsis,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      contxxt!,
                                      MaterialPageRoute(
                                        builder: (_) => ImageWebViewScreen(
                                          imageUrl:
                                              getHmoKycResponseModel!
                                                  .data!
                                                  .scheduleOfPlans
                                                  ?.url ??
                                              '',
                                        ),
                                      ),
                                    ),
                                    child: SvgPicture.asset(AppImage.kyc_eye),
                                  ),
                                ],
                              ),
                            )
                          : isLoadingPlan
                          ? Center(
                              child: SpinKitCircle(
                                color: AppColors.infoGrey,
                                size: 32.40.sp,
                              ),
                            )
                          : filenamePlan != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 160.w,
                                    child: TextView(
                                      text: "${filenamePlan ?? ""}.jpg",
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      pickImagePlan(contxxt!);
                                      notifyListeners();
                                    },
                                    child: SvgPicture.asset(
                                      AppImage.upload_arr_up,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  GestureDetector(
                                    onTap: () {
                                      filenamePlan = null;
                                      imagePlan = null;
                                      notifyListeners();
                                    },
                                    child: SvgPicture.asset(AppImage.delete),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  dashPattern: [10, 10],
                                  strokeWidth: .94,
                                  radius: Radius.circular(10),
                                  color: AppColors.primary,
                                ),
                                child: GestureDetector(
                                  onTap: () => pickImagePlan(contxxt!),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.20.w,
                                      horizontal: 12.0.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(AppImage.upload_doc),
                                        SizedBox(width: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextView(
                                              text: 'Upload Document',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 14.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                            SizedBox(height: 2.0.h),
                                            TextView(
                                              text:
                                                  'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 12.6.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.fineGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(height: 20.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: 220.w,
                            child: TextView(
                              text: 'List of associated clinics/hospitals ',
                              maxLines: 2,
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.reminder,
                              ),
                            ),
                          ),
                          Positioned(
                            right: -0.10,
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
                      SizedBox(height: 10.20.h),
                      getHmoKycResponseModel!.data!.listOfHospitals != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  TextView(
                                    text: 'ASSOCIATED CLINIC.jpg',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      contxxt!,
                                      MaterialPageRoute(
                                        builder: (_) => ImageWebViewScreen(
                                          imageUrl:
                                              getHmoKycResponseModel!
                                                  .data!
                                                  .listOfHospitals
                                                  ?.url ??
                                              '',
                                        ),
                                      ),
                                    ),
                                    child: SvgPicture.asset(AppImage.kyc_eye),
                                  ),
                                ],
                              ),
                            )
                          : isLoadingAss
                          ? Center(
                              child: SpinKitCircle(
                                color: AppColors.infoGrey,
                                size: 32.40.sp,
                              ),
                            )
                          : filenameAss != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 120.w,
                                    child: TextView(
                                      text: "${filenameAss ?? ""}.jpg",
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      pickImageAss(contxxt!);
                                      notifyListeners();
                                    },
                                    child: SvgPicture.asset(
                                      AppImage.upload_arr_up,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  GestureDetector(
                                    onTap: () {
                                      filenameAss = null;
                                      imageAss = null;
                                      notifyListeners();
                                    },
                                    child: SvgPicture.asset(AppImage.delete),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  dashPattern: [10, 10],
                                  strokeWidth: .94,
                                  radius: Radius.circular(10),
                                  color: AppColors.primary,
                                ),
                                child: GestureDetector(
                                  onTap: () => pickImageAss(contxxt!),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.20.w,
                                      horizontal: 12.0.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(AppImage.upload_doc),
                                        SizedBox(width: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextView(
                                              text: 'Upload Document',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 14.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                            SizedBox(height: 2.0.h),
                                            TextView(
                                              text:
                                                  'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 13.6.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.fineGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(height: 30.h),
                      ButtonWidget(
                        border: 100.r,
                        buttonColor:
                            getHmoKycResponseModel!.data!.kycLevels!.isNotEmpty
                            ? getKycStatusBool(
                                            getHmoKycResponseModel!
                                                .data!
                                                .kycLevels![2]
                                                .status,
                                          ) ==
                                          true ||
                                      imageAppForm == null &&
                                          imagePlan == null &&
                                          imageAss == null
                                  ? AppColors.infoGrey
                                  : AppColors.primary
                            : AppColors.infoGrey,
                        fontSize: 16.sp,
                        buttonText: 'Submit for Verification',
                        color: AppColors.white,
                        isLoading: isLoading,
                        buttonBorderColor: AppColors.transparent,
                        onPressed:
                            getHmoKycResponseModel!.data!.kycLevels!.isNotEmpty
                            ? getKycStatusBool(
                                            getHmoKycResponseModel!
                                                .data!
                                                .kycLevels![2]
                                                .status,
                                          ) ==
                                          false &&
                                      imageAppForm != null &&
                                      imagePlan != null &&
                                      imageAss != null
                                  ? () async {
                                      if (kycFormKey.currentState!.validate() &&
                                          imageAppForm != null &&
                                          imageAss != null &&
                                          imagePlan != null) {
                                        updateThirdHMOKyc(
                                          contxxt,
                                          updateKyc:
                                              UpdateThirdHmoKycEntityModel(
                                                bankName: bankNameController
                                                    .text
                                                    .trim(),
                                                accountName:
                                                    accountNameController.text,
                                                accountNumber:
                                                    accountNumberController
                                                        .text,
                                                applicationForm:
                                                    ApplicationForm.fromJson(
                                                      fl.File.fromJson(
                                                        kycDocumentsList[0]
                                                            .file!
                                                            .toJson(),
                                                      ).toJson(),
                                                    ),
                                                scheduleOfPlans:
                                                    ScheduleOfPlans.fromJson(
                                                      fl.File.fromJson(
                                                        kycDocumentsList[1]
                                                            .file!
                                                            .toJson(),
                                                      ).toJson(),
                                                    ),
                                                listOfHospitals:
                                                    ListOfHospitals.fromJson(
                                                      fl.File.fromJson(
                                                        kycDocumentsList[2]
                                                            .file!
                                                            .toJson(),
                                                      ).toJson(),
                                                    ),
                                              ),
                                        );

                                        // await updateHMO(
                                        //   contxxt,
                                        //   update: UpdateHmoProfileEntityModel(
                                        //     logo: null,
                                        //     name:
                                        //         getTetantResponseModel!.data!.name ??
                                        //         '',
                                        //     businessAddress:
                                        //         getTetantResponseModel
                                        //             ?.data
                                        //             ?.businessAddress ??
                                        //         '',
                                        //     businessEmail:
                                        //         getTetantResponseModel
                                        //             ?.data
                                        //             ?.businessEmail ??
                                        //         "",
                                        //     country:
                                        //         getTetantResponseModel
                                        //             ?.data
                                        //             ?.country ??
                                        //         '',
                                        //     state:
                                        //         getTetantResponseModel?.data?.state ??
                                        //         "",
                                        //     lga:
                                        //         getTetantResponseModel?.data?.lga ??
                                        //         '',
                                        //     contactPersonFirstName:
                                        //         getTetantResponseModel
                                        //             ?.data
                                        //             ?.contactPersonFirstName ??
                                        //         '',
                                        //     contactPersonLastName:
                                        //         getTetantResponseModel
                                        //             ?.data
                                        //             ?.contactPersonLastName ??
                                        //         '',
                                        //     contactPersonDesignation:
                                        //         getTetantResponseModel
                                        //             ?.data
                                        //             ?.contactPersonDesignation ??
                                        //         '',
                                        //     bankDetails: [
                                        //       BankDetail(
                                        //         bankName: bankNameController.text
                                        //             .trim(),
                                        //         accountName: accountNameController
                                        //             .text
                                        //             .trim(),
                                        //         accountNumber: accountNumberController
                                        //             .text
                                        //             .trim(),
                                        //       ),
                                        //     ],
                                        //   ),updateThirdHMOKyc
                                        // );
                                        // // updateHMOKyc(
                                        //   contxxt,
                                        //   updateKyc: UpdatePharmacyKycEntityModel(
                                        //     documents: kycDocumentsList,
                                        //   ),
                                        // );
                                      } else {
                                        AppUtils.snackbar(
                                          context,
                                          message:
                                              'Kindly select and upload all documents and bank information.',
                                          error: true,
                                        );
                                      }
                                    }
                                  : () {}
                            : () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    ),
  );
}
