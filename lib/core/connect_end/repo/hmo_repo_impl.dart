// ignore_for_file: strict_top_level_inference
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/contrast/hmo_contract_impl.dart';
import 'package:medicate_app/core/connect_end/model/hmo_sign_up_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_hmo_profile_entity_model/update_hmo_profile_entity_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/create_hmo_plan_entity_model/create_hmo_plan_entity_model.dart';
import '../model/create_hmo_plan_reponse_model/create_hmo_plan_reponse_model.dart';
import '../model/create_hospital_network_entity_model.dart';
import '../model/create_hospital_network_response_model/create_hospital_network_response_model.dart';
import '../model/create_user_entity_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_all_listed_plan_types_response_model/get_all_listed_plan_types_response_model.dart';
import '../model/get_created_user_response_model/get_created_user_response_model.dart';
import '../model/get_hmo_kyc_response_model/get_hmo_kyc_response_model.dart';
import '../model/get_hospital_by_id_response_model/get_hospital_by_id_response_model.dart';
import '../model/get_list_of_hospital_response_model/get_list_of_hospital_response_model.dart';
import '../model/get_listed_plan_tiers_response_model/get_listed_plan_tiers_response_model.dart';
import '../model/get_my_hmo_plan_response_model/get_my_hmo_plan_response_model.dart';
import '../model/get_plan_detail_response_model/get_plan_detail_response_model.dart';
import '../model/get_plan_hospital_network_response_model/get_plan_hospital_network_response_model.dart';
import '../model/get_roles_response_model/get_roles_response_model.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/hospital_network_entity_model.dart';
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
import '../model/update_role_entity_model.dart';
import '../model/update_third_hmo_kyc_entity_model/update_third_hmo_kyc_entity_model.dart';
import '../model/update_user_entity_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';

@lazySingleton
class HMORepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<HMOContractsImpl>();

  Future<PharmacyLoginResponseModel> signIn(
    LoginEntityModel signInEntity,
  ) async {
    final response = await _contract.login(signInEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  Future<SignUpPhamaryResponseModel> signUp(
    HmoSignUpEntityModel signUpEntity,
  ) async {
    final response = await _contract.signUp(signUpEntity);
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

  Future<GetTenantResponseModel> getTenant() async {
    final response = await _contract.getTenant();
    return response;
  }

  Future<GetHmoKycResponseModel> getHMOKyc() async {
    final response = await _contract.getHMOKyc();
    return response;
  }

  Future<dynamic> updateHMOKyc(UpdateHmoKycEntityModel updateKyc) async {
    final response = await _contract.updateHMOKyc(updateKyc);
    return response;
  }

  Future<dynamic> updateThirdHMOKyc(
    UpdateThirdHmoKycEntityModel updateKyc,
  ) async {
    final response = await _contract.updateThirdHMOKyc(updateKyc);
    return response;
  }

  Future<GetAllListedPlanTypesResponseModel> getListedPlanTypesForHMO() async {
    final response = await _contract.getListedPlanTypesForHMO();
    return response;
  }

  Future<GetListedPlanTiersResponseModel> getListedPlanTiersForHMO() async {
    final response = await _contract.getListedPlanTiersForHMO();
    return response;
  }

  Future<dynamic> updateHMO(UpdateHmoProfileEntityModel? updateHMO) async {
    final response = await _contract.updateHMO(updateHMO);
    return response;
  }

  Future<UploadImageResponseModel> uploadImage(MultipartFile file) async {
    final response = await _contract.uploadImage(file);
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

  Future<dynamic> addRole(RolesEntityModel roleEntity) async {
    final response = await _contract.addRole(roleEntity);
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

  Future<dynamic> addUser(CreateUserEntityModel createEntity) async {
    final response = await _contract.addUser(createEntity);
    return response;
  }

  Future<GetCreatedUserResponseModel> getUsers() async {
    final response = await _contract.getUsers();
    return response;
  }

  Future<dynamic> updateUser(UpdateUserEntityModel updateEntity) async {
    final response = await _contract.updateUser(updateEntity);
    return response;
  }

  Future<dynamic> deleteUser(String id) async {
    final response = await _contract.deleteUser(id);
    return response;
  }

  Future<dynamic> uploadProPicture(MultipartFile file) async {
    final response = await _contract.uploadProPicture(file);
    return response;
  }

  Future<GetListOfHospitalResponseModel> getListOfHospitals({
    String? page,
  }) async {
    final response = await _contract.getListOfHospitals(page: page);
    return response;
  }

  Future<CreateHmoPlanReponseModel> createHmoPlan({
    CreateHmoPlanEntityModel? createPlan,
  }) async {
    final response = await _contract.createHmoPlan(createPlan: createPlan);
    return response;
  }

  Future<dynamic> selectPlanType({String? id}) async {
    final response = await _contract.selectPlanType(id: id);
    return response;
  }

  Future<dynamic> deSelectPlanType({String? id}) async {
    final response = await _contract.deSelectPlanType(id: id);
    return response;
  }

  Future<CreateHospitalNetworkResponseModel> createHospitalNetwork({
    CreateHospitalNetworkEntityModel? createHospital,
  }) async {
    final response = await _contract.createHospitalNetwork(
      createHospital: createHospital,
    );
    return response;
  }

  Future<GetMyHmoPlanResponseModel> getMyHmoPlans() async {
    final response = await _contract.getMyHmoPlans();
    return response;
  }

  Future<GetHospitalByIdResponseModel> getHospitalById(
    String hospitalId,
  ) async {
    final response = await _contract.getHospitalById(hospitalId);
    return response;
  }

  Future<GetPlanHospitalNetworkResponseModel> getPlanHospitalByPlanId(
    String planId,
  ) async {
    final response = await _contract.getPlanHospitalByPlanId(planId);
    return response;
  }

  Future<GetPlanDetailResponseModel> getPlanDetails(String planId) async {
    final response = await _contract.getPlanDetails(planId);
    return response;
  }

  Future<dynamic> editHospitalNetwork({
    HospitalNetworkEntityModel? hospitalNetwork,
    String? planId,
  }) async {
    final response = await _contract.editHospitalNetwork(hospitalNetwork: hospitalNetwork,planId: planId);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.data.accessToken;
      _session.authRefreshToken = data.data.refreshToken;
      _session.usersData = data.data.toJson();
      _session.authType = 'hmo';
    }
  }
}
