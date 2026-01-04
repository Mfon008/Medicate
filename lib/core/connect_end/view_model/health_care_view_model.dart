// ignore_for_file: strict_top_level_inference, prefer_typing_uninitialized_variables
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/connect_end/model/roles_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_business_owner_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_provider_practitioner_entity_model.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/widget/add_doctors_modal_widget.dart';
import '../../../ui/widget/add_education_experience.dart';
import '../../../ui/widget/add_role_modal_health_care_widget.dart';
import '../../../ui/widget/button.dart';
import '../../../ui/widget/delete_role_modal_widget.dart';
import '../../../ui/widget/health_care_deactivate_user_modal_widget.dart';
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
import '../model/change_phone_no_response_model/change_phone_no_response_model.dart';
import '../model/create_user_entity_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_created_user_response_model/get_created_user_response_model.dart';
import '../model/get_created_user_response_model/staff.dart';
import '../model/get_pharmacy_kyc_response_model/get_pharmacy_kyc_response_model.dart';
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
import '../model/update_business_owner_profile_entity_model/update_business_owner_profile_entity_model.dart';
import '../model/update_business_owner_profile_entity_model/upload_means_of_id.dart';
import '../model/update_business_owner_profile_response_model/update_business_owner_profile_response_model.dart';
import '../model/update_pharmacy_kyc_entity_model/document.dart';
import '../model/update_pharmacy_kyc_entity_model/update_pharmacy_kyc_entity_model.dart';
import '../model/update_practitioner_profile_entity_model/educational_experience.dart';
import '../model/update_practitioner_profile_entity_model/means_of_id.dart';
import '../model/update_practitioner_profile_entity_model/update_practitioner_profile_entity_model.dart';
import '../model/update_role_entity_model.dart';
import '../model/update_user_entity_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';
import '../repo/healthcare_repo_impl.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_kyc_entity_model/file.dart'
    as ph;
import 'package:medicate_app/core/connect_end/model/update_practitioner_profile_entity_model/means_of_id.dart'
    as md;
import 'package:medicate_app/core/connect_end/model/update_practitioner_profile_entity_model/logo.dart'
    as pkPra;
import 'package:medicate_app/core/connect_end/model/update_business_owner_profile_entity_model/logo.dart'
    as pkBus;
import 'package:medicate_app/core/connect_end/model/get_tenant_response_model/educational_experience/educational_experience.dart'
    as getTEx;

class HealthCareViewModel extends BaseViewModel {
  String? pinInput;
  final session = locator<SharedPreferencesService>();

  final logger = getLogger('HealthcareViewModel');

  String errorUser = '';
  String vdeactivateErrorMessage = '';

  String? searchDoctors = '';
  var vdeactivate;

  final repositoryImply = HealthcareRepoImpl();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingMeansId = false;
  bool get isLoadingMeansId => _isLoadingMeansId;
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
  UpdateBusinessOwnerProfileResponseModel?
  _updateBusinessOwnerProfileResponseModel;
  UpdateBusinessOwnerProfileResponseModel?
  get updateBusinessOwnerProfileResponseModel =>
      _updateBusinessOwnerProfileResponseModel;

  UploadImageResponseModel? _uploadImageResponseModel;
  UploadImageResponseModel? get uploadImageResponseModel =>
      _uploadImageResponseModel;
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
  GetPharmacyKycResponseModel? get getPharmacyKycResponseModel =>
      _getPharmacyKycResponseModel;
  GetPharmacyKycResponseModel? _getPharmacyKycResponseModel;

  GetRolesResponseModel? _getRolesResponseModel;
  GetRolesResponseModel? get getRolesResponseModel => _getRolesResponseModel;
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
  GetCreatedUserResponseModel? _getCreatedUserResponseModel;
  GetCreatedUserResponseModel? get getCreatedUserResponseModel =>
      _getCreatedUserResponseModel;

  File? imageCAC;
  String? filenameCAC;
  File? imageTIN;
  String? filenameTIN;
  File? imagePharmLicense;
  String? filenamePharmLicense;
  List<Document> kycDocumentsList = [];
  List<Staff> checkOwnerRole = [];

  bool _onTempPinTap = false;
  bool get onTempPinTap => _onTempPinTap;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController doctorsPhoneController = TextEditingController();
  TextEditingController doctorsLicenseNoController = TextEditingController();
  TextEditingController doctorsEmailController = TextEditingController();
  TextEditingController doctorsGenderController = TextEditingController();
  TextEditingController doctorsAddressController = TextEditingController();
  TextEditingController doctorsRoleController = TextEditingController();
  TextEditingController doctorPinController = TextEditingController();
  String? doctorsRoleControllerId;

  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  TextEditingController meansIdController = TextEditingController();

  TextEditingController schoolController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController startYearController = TextEditingController();
  TextEditingController startMonthController = TextEditingController();
  TextEditingController endMonthController = TextEditingController();
  TextEditingController endYearController = TextEditingController();

  TextEditingController rolenameController = TextEditingController();
  TextEditingController roleDescriptionController = TextEditingController();

  List<String> selectService = [];
  List<String> selectServicePractitioner = [];

  List<UploadMeansOfId> authDocumentsList = [];
  List<MeansOfId> pracAuthDocumentsList = [];

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

  bool _isLoadingCAC = false;
  bool get isLoadingCAC => _isLoadingCAC;
  bool _isLoadingLicense = false;
  bool get isLoadingLicense => _isLoadingLicense;
  bool _isLoadingTIN = false;
  bool get isLoadingTIN => _isLoadingTIN;

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
  GlobalKey<FormState> formKeyValidateAddExperience = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateAddRole = GlobalKey<FormState>();

  GlobalKey<FormState> formKeyValidateAddDoctor = GlobalKey<FormState>();

  List<String> areaExpertise = [
    'General Practitioners (GPs) & Family\nMedicine',
    'Gynecology',
    'Pediatrics',
  ];

  List<String> addAreaExpertise = [];
  List<String> addAreaExpertiseDoctor = [];
  List<String> addAreaExpertiseDoctorShow = [];

  final _pickImage = ImagePickerHandler();
  File? imageMeansId;
  String? filenameMeansId;
  int _start = 60;

  File? image;
  String? filename;

  var vdelete;
  String vdeleteErrorMessage = '';
  List<EducationalExperience> educationalExperienceList = [];


  bool isOnToggleTempPinTap() {
    _onTempPinTap = !_onTempPinTap;
    notifyListeners();
    return _onTempPinTap;
  }

  EducationalExperience convertEducationalExperience(
    getTEx.EducationalExperience tenantExp,
  ) {
    return EducationalExperience(
      school: tenantExp.school,
      degree: tenantExp.degree,
      startMonth: tenantExp.startMonth,
      startYear: tenantExp.startYear,
      endMonth: tenantExp.endMonth,
      endYear: tenantExp.endYear,
      // map other fields...
    );
  }

  List<String> monthList = [
    'January',
    'February',
    'March',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  List yearList = List.generate(
    DateTime.now().year - 1900 + 1,
    (index) => '${1900 + index}',
  );

  addSpecialtyFormat(specialty) {
    if (specialty == 'General Practitioners (GPs) & Family\nMedicine') {
      addAreaExpertiseDoctor.add('GENERAL_PRACTITIONERS_AND_FAMILY_MEDICINE');
      addAreaExpertiseDoctorShow.add(
        'General Practitioners (GPs) & Family\nMedicine',
      );
    }
    if (specialty == 'Gynecology') {
      addAreaExpertiseDoctor.add('GYNECOLOGY');
      addAreaExpertiseDoctorShow.add('Gynecology');
    }
    if (specialty == 'Pediatrics') {
      addAreaExpertiseDoctor.add('PEDIATRICS');
      addAreaExpertiseDoctorShow.add('Pediatrics');
    }
    notifyListeners();
  }

  removeSpecialtyFormat(specialty) {
    if (specialty == 'General Practitioners (GPs) & Family\nMedicine') {
      addAreaExpertiseDoctor.remove(
        'GENERAL_PRACTITIONERS_AND_FAMILY_MEDICINE',
      );
      addAreaExpertiseDoctorShow.remove(
        'General Practitioners (GPs) & Family\nMedicine',
      );
    }
    if (specialty == 'Gynecology') {
      addAreaExpertiseDoctor.remove('GYNECOLOGY');
      addAreaExpertiseDoctorShow.remove('Gynecology');
    }
    if (specialty == 'Pediatrics') {
      addAreaExpertiseDoctor.remove('PEDIATRICS');
      addAreaExpertiseDoctorShow.remove('Pediatrics');
    }
    notifyListeners();
  }

  String getMeansOFIDApp(id) {
    if (id == "NATIONAL_ID") {
      return 'National ID';
    }
    if (id == "DRIVERS_LICENSE") {
      return 'Driver’s License';
    }
    if (id == "INTERNATIONAL_PASSPORT") {
      return 'International Passport';
    }
    if (id == "CITIZENSHIP_CARD") {
      return 'Citizenship Card';
    }
    if (id == "BIOMETRIC_RESIDENCE_PERMIT") {
      return 'Biometric Residence Permit (BRP)';
    }
    if (id == "STATE_ID_CARD") {
      return 'State ID Card';
    }
    if (id == "GREEN_CARD") {
      return 'Green Card/Resident Card';
    }
    if (id == "VOTER ID CARD") {
      return 'Voter ID Card';
    }
    if (id == "ASYLUM_SEEKER_ID") {
      return 'Asylum Seeker ID';
    }
    if (id == "ALIEN_ID_CARD") {
      return 'Alien ID Card';
    }
    return '';
  }

  String getMeansOFIDAppReverse(id) {
    if (id == "National ID") {
      return 'NATIONAL_ID';
    }
    if (id == "Driver’s License") {
      return 'DRIVERS_LICENSE';
    }
    if (id == "International Passport") {
      return 'INTERNATIONAL_PASSPORT';
    }
    if (id == "Citizenship Card") {
      return 'CITIZENSHIP_CARD';
    }
    if (id == "Biometric Residence Permit (BRP)") {
      return 'BIOMETRIC_RESIDENCE_PERMIT';
    }
    if (id == "State ID Card") {
      return 'STATE_ID_CARD';
    }
    if (id == "Green Card/Resident Card") {
      return 'GREEN_CARD';
    }
    if (id == "Voter ID Card") {
      return 'VOTER ID CARD';
    }
    if (id == "Asylum Seeker ID") {
      return 'ASYLUM_SEEKER_ID';
    }
    if (id == "Alien ID Card") {
      return 'ALIEN_ID_CARD';
    }
    return '';
  }

  bool isUpperCase(String text) {
    return text == text.toUpperCase();
  }

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
    'Alien ID Card',
  ];

  bool returnBool() {
    if (_getTetantResponseModel == null ||
        _getTetantResponseModel!.data!.bankDetails == null) {
      return true;
    }
    return false;
  }

  void pickImagePractitioner(BuildContext context) {
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
          updateHealthCarePractitioner(
            context,
            updatePractitioner: UpdatePractitionerProfileEntityModel(
              logo: pkPra.Logo(
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

  void pickImageBusinessOwner(BuildContext context) {
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
          updateHealthCareBusinessOwner(
            context,
            updateBusinessOwner: UpdateBusinessOwnerProfileEntityModel(
              logo: pkBus.Logo(
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
          authDocumentsList.add(
            UploadMeansOfId(
              width: _uploadImageResponseModelMeansID!.data!.width,
              height: _uploadImageResponseModelMeansID!.data!.height,
              format: _uploadImageResponseModelMeansID!.data!.format,
              url: _uploadImageResponseModelMeansID!.data!.url!,
              mimeType: _uploadImageResponseModelMeansID!.data!.mimeType,
              size: _uploadImageResponseModelMeansID!.data!.size,
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

  void pickImageMeansIdPractitioner(BuildContext context) {
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
          pracAuthDocumentsList.add(
            md.MeansOfId(
              width: _uploadImageResponseModelMeansID!.data!.width,
              height: _uploadImageResponseModelMeansID!.data!.height,
              format: _uploadImageResponseModelMeansID!.data!.format,
              url: _uploadImageResponseModelMeansID!.data!.url!,
              mimeType: _uploadImageResponseModelMeansID!.data!.mimeType,
              size: _uploadImageResponseModelMeansID!.data!.size,
            ),
          );
          //
          _uploadImageResponseModel = null;
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

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
          Routes.healthCareChangePhoneNumber,
          arguments: HealthCareChangePhoneNumberArguments(
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

        navigate.navigateTo(Routes.healthCareLoginScreen);
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
        return AddRoleModalHealthCareWidget(
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.skyBlue,
          duration: Duration(milliseconds: 500),
          content: TextView(
            text: 'Selected: ${result.capitalizeWords()}',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightBlue,
            ),
          ),
        ),
      );
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

  Future<EducationalExperience?> modalBottomSheetMenuAddEducationExperience({
    context,
    bool isEdit = false,
    EducationalExperience? educationalExperience,
  }) {
    return showModalBottomSheet<EducationalExperience>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return AddEducationExperienceModalWidget(
          educationalExperience: educationalExperience,
          isEdit: isEdit,
          parentContext: context,
        );
      },
    );
  }

  void addExperience(EducationalExperience experience) {
    educationalExperienceList.add(experience);
    notifyListeners();
  }

  void updateExperience(int index, EducationalExperience experience) {
    educationalExperienceList[index] = experience;
    notifyListeners();
  }

  void removeExperience(EducationalExperience experience) {
    educationalExperienceList.remove(experience);
    notifyListeners();
  }

  void updateHealthCareBusinessOwner(
    context, {
    UpdateBusinessOwnerProfileEntityModel? updateBusinessOwner,
  }) async {
    try {
      _isLoading = true;
      _updateBusinessOwnerProfileResponseModel = await runBusyFuture(
        repositoryImply.updateHealthCareBusinessOwner(updateBusinessOwner),
        throwException: true,
      );
      _isLoading = false;
      AppUtils.snackbar(
        context,
        message: _updateBusinessOwnerProfileResponseModel?.message ?? '',
      );
      getTenant(context);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void updateHealthCarePractitioner(
    context, {
    UpdatePractitionerProfileEntityModel? updatePractitioner,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateHealthCarePractitioner(updatePractitioner),
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

  Future<void> getHealthCareKyc(context) async {
    try {
      _isLoading = true;
      _getPharmacyKycResponseModel = await runBusyFuture(
        repositoryImply.getHealthCareKyc(),
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

  void updateHealthCareKyc(
    context, {
    UpdatePharmacyKycEntityModel? updateKyc,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateHealthCareKyc(updateKyc!),
        throwException: true,
      );
      if (v['statusCode'] == 200) {
        AppUtils.snackbar(context, message: v['message']);
        getHealthCareKyc(context);
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

  Color getKycStatusColor({cac, license, tin}) {
    if (cac == 'PENDING' || license == 'PENDING' || tin == 'PENDING') {
      return AppColors.fadedyellow;
    }
    if (cac == 'APPROVED' && license == 'APPROVED' && tin == 'APPROVED') {
      return AppColors.app_green_light;
    }
    return AppColors.fadedyellow;
  }

  bool getKycStatusBool({cac, license, tin}) {
    if (cac == 'PENDING' || license == 'PENDING' || tin == 'PENDING') {
      return true;
    }
    if (cac == 'APPROVED' && license == 'APPROVED' && tin == 'APPROVED') {
      return true;
    }
    return false;
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

  Future<void> addDoctors(
    context, {
    CreateUserEntityModel? createEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.addUser(createEntity!),
        throwException: true,
      );
      _isLoading = false;

      await AppUtils.snackbar(context, message: v['message']);
      firstNameController.clear();
      lastNameController.clear();
      doctorsPhoneController.clear();
      doctorsEmailController.clear();
      doctorsGenderController.clear();
      doctorsRoleController.clear();
      doctorsLicenseNoController.clear();
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getDoctors(context) async {
    try {
      _isLoading = true;
      _getCreatedUserResponseModel = await runBusyFuture(
        repositoryImply.getDoctors(),
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

  bool checkIfOnlyRoleIsOwner() {
    checkOwnerRole = getCreatedUserResponseModel!.data!.staff!;
    String searchValue = "OWNER";

    if (checkOwnerRole.every((item) => item.role!.name == searchValue)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateDoctor(
    context, {
    UpdateUserEntityModel? updateUser,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateDoctor(updateUser!),
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

  Future<void> deactivateUser(context, {String? id}) async {
    try {
      _isLoading = true;
      vdeactivate = await runBusyFuture(
        repositoryImply.deleteDoctor(id!),
        throwException: true,
      );

      _isLoading = false;
      await AppUtils.snackbar(context, message: vdeactivate['message']);
      Navigator.pop(context);
      getDoctors(context);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      vdeactivateErrorMessage = e.toString();
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<bool?> modalBottomSheetMenuAddDoctors({
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
    licenseNo,
    specialty,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return AddDoctorsModalWidget(
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
          licenseNo: licenseNo,
          specialty: specialty,
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
        return HealthCareDeactivateUserModalWidget(
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
}
