import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_business_owner_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_provider_practitioner_entity_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contrast/healthcare_contract_impl.dart';
import '../model/create_user_entity_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_created_user_response_model/get_created_user_response_model.dart';
import '../model/get_pharmacy_kyc_response_model/get_pharmacy_kyc_response_model.dart';
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
import '../model/update_business_owner_profile_entity_model/update_business_owner_profile_entity_model.dart';
import '../model/update_business_owner_profile_response_model/update_business_owner_profile_response_model.dart';
import '../model/update_pharmacy_kyc_entity_model/update_pharmacy_kyc_entity_model.dart';
import '../model/update_practitioner_profile_entity_model/update_practitioner_profile_entity_model.dart';
import '../model/update_role_entity_model.dart';
import '../model/update_user_entity_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';

@lazySingleton
class HealthcareRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<HealthcareContractsImpl>();

  Future<PharmacyLoginResponseModel> signIn(
    LoginEntityModel signInEntity,
  ) async {
    final response = await _contract.login(signInEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  Future<SignUpPhamaryResponseModel> signUpBusinessOwner(
    SignUpHealthcareBusinessOwnerEntityModel signUpEntity,
  ) async {
    final response = await _contract.signUpBusinessOwner(signUpEntity);
    _session.isSignUp = true;
    return response;
  }

  Future<SignUpPhamaryResponseModel> signUpPractitioner(
    SignUpHealthcareProviderPractitionerEntityModel signUpEntity,
  ) async {
    final response = await _contract.signUpPractitioner(signUpEntity);
    _session.isSignUp = true;
    return response;
  }

  Future<ResendOtpResponseModel> resendOtp(
    ResendOtpEntityModel resendOtpEntity,
  ) async {
    final response = await _contract.resendOtp(resendOtpEntity);
    return response;
  }

  Future<VerifyPharmacyOtpModel> verifyPhoneOtp(
    VerifyPhoneEntityModel verifyPhoneOtp,
  ) async {
    final response = await _contract.verifyPhoneOtp(verifyPhoneOtp);
    _chache(response);
    return response;
  }

  Future<ForgotPasswordResponseModel> forgotPasword(
    ResendOtpEntityModel forgotPassword,
  ) async {
    final response = await _contract.forgotPasword(forgotPassword);
    return response;
  }

  Future<VerifyPassOtpRespnseModel> verifyForgotPassword(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async {
    final response = await _contract.verifyForgotPassword(verifyPhoneEntity);
    return response;
  }

  Future<dynamic> resetPin({
    ResetPasswordEntityModel? resetPasswordEntity,
    String? resetToken,
  }) async {
    final response = await _contract.resetPin(
      resetPasswordEntity: resetPasswordEntity,
      resetToken: resetToken,
    );
    return response;
  }

  Future<dynamic> changePhoneNo({String? changePhoneNo, String? id}) async {
    final response = await _contract.changePhoneNo(
      changePhoneNo: changePhoneNo,
      id: id,
    );
    return response;
  }

  Future<dynamic> refreshToken() async {
    final response = await _contract.refreshToken();
    return response;
  }

  Future<dynamic> sendOtp(String phone) async {
    final response = await _contract.sendOtp(phone);
    return response;
  }

  Future<dynamic> verifyChangePhoneOtp(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async {
    final response = await _contract.verifyChangePhoneOtp(verifyPhoneEntity);
    return response;
  }

  Future<dynamic> verifyChangePhoneOtpChange(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async {
    final response = await _contract.verifyChangePhoneOtpChange(
      verifyPhoneEntity,
    );
    return response;
  }

  Future<GetUserDetailsResponseModel> getUserDetails(String phoneNo) async {
    final response = await _contract.getUserDetails(phoneNo);
    return response;
  }

  Future<SetPinPharmResponseModel> setPin(
    SetPinEntityModel setPinEntity,
  ) async {
    final response = await _contract.setPin(setPinEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  Future<GetTenantResponseModel> getTenant() async {
    final response = await _contract.getTenant();
    return response;
  }

  Future<dynamic> addRole(RolesEntityModel roleEntity) async {
    final response = await _contract.addRole(roleEntity);
    return response;
  }

  Future<UploadImageResponseModel> uploadImage(MultipartFile file) async {
    final response = await _contract.uploadImage(file);
    return response;
  }

  Future<GetRolesResponseModel> getRoles() async {
    final response = await _contract.getRoles();
    return response;
  }

  Future<dynamic> updateRoles(UpdateRoleEntityModel updateRole) async {
    final response = await _contract.updateRoles(updateRole);
    return response;
  }

  Future<dynamic> deleteRole(String roleId) async {
    final response = await _contract.deleteRole(roleId);
    return response;
  }

  Future<UpdateBusinessOwnerProfileResponseModel> updateHealthCareBusinessOwner(
    UpdateBusinessOwnerProfileEntityModel? updateBusinessOwner,
  ) async {
    final response = await _contract.updateHealthCareBusinessOwner(
      updateBusinessOwner,
    );
    return response;
  }

  Future<dynamic> updateHealthCarePractitioner(
    UpdatePractitionerProfileEntityModel? updatePractitioner,
  ) async {
    final response = await _contract.updateHealthCarePractitioner(
      updatePractitioner,
    );
    return response;
  }

  Future<GetPharmacyKycResponseModel> getHealthCareKyc() async {
    final response = await _contract.getHealthCareKyc();
    return response;
  }

  Future<dynamic> updateHealthCareKyc(
    UpdatePharmacyKycEntityModel updateKyc,
  ) async {
    final response = await _contract.updateHealthCareKyc(updateKyc);
    return response;
  }

  Future<dynamic> addUser(CreateUserEntityModel createEntity) async {
    final response = await _contract.addDoctor(createEntity);
    return response;
  }

  Future<GetCreatedUserResponseModel> getDoctors() async {
    final response = await _contract.getDoctors();
    return response;
  }

  Future<dynamic> updateDoctor(UpdateUserEntityModel updateEntity) async {
    final response = await _contract.updateDoctor(updateEntity);
    return response;
  }

  Future<dynamic> deleteDoctor(String id) async {
    final response = await _contract.deleteDoctor(id);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.data.accessToken;
      _session.authRefreshToken = data.data.refreshToken;
      _session.usersData = data.data.toJson();
      _session.authType = 'healthcare';
    }
  }
}
