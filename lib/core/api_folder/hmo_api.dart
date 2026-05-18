import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/create_hmo_plan_entity_model/create_hmo_plan_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/create_hmo_plan_reponse_model/create_hmo_plan_reponse_model.dart';
import 'package:medicate_app/core/connect_end/model/create_hospital_network_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/create_hospital_network_response_model/create_hospital_network_response_model.dart';
import 'package:medicate_app/core/connect_end/model/create_plan_tier_entity_model/create_plan_tier_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/get_hospital_by_id_response_model/get_hospital_by_id_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_list_of_hospital_response_model/get_list_of_hospital_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_my_hmo_plan_response_model/get_my_hmo_plan_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_plan_detail_response_model/get_plan_detail_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_plan_hospital_network_response_model/get_plan_hospital_network_response_model.dart';
import 'package:medicate_app/core/connect_end/model/hmo_sign_up_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_hmo_profile_entity_model/update_hmo_profile_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_plan_tiers_entity_model.dart';
import '../connect_end/model/create_user_entity_model.dart';
import '../connect_end/model/forgot_password_response_model/forgot_password_response_model.dart';
import '../connect_end/model/get_all_listed_plan_types_response_model/get_all_listed_plan_types_response_model.dart';
import '../connect_end/model/get_created_user_response_model/get_created_user_response_model.dart';
import '../connect_end/model/get_hmo_kyc_response_model/get_hmo_kyc_response_model.dart';
import '../connect_end/model/get_listed_plan_tiers_response_model/get_listed_plan_tiers_response_model.dart';
import '../connect_end/model/get_roles_response_model/get_roles_response_model.dart';
import '../connect_end/model/get_tenant_response_model/get_tenant_response_model.dart';
import '../connect_end/model/get_user_details_response_model/get_user_details_response_model.dart';
import '../connect_end/model/hospital_network_entity_model.dart';
import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../connect_end/model/resend_otp_entity_model.dart';
import '../connect_end/model/resend_otp_response_model/resend_otp_response_model.dart';
import '../connect_end/model/reset_password_entity_model.dart';
import '../connect_end/model/roles_entity_model.dart';
import '../connect_end/model/set_pin_entity_model.dart';
import '../connect_end/model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../connect_end/model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import '../connect_end/model/update_hmo_kyc_entity_model/update_hmo_kyc_entity_model.dart';
import '../connect_end/model/update_hmo_plan_entity_model/update_hmo_plan_entity_model.dart';
import '../connect_end/model/update_role_entity_model.dart';
import '../connect_end/model/update_third_hmo_kyc_entity_model/update_third_hmo_kyc_entity_model.dart';
import '../connect_end/model/update_user_entity_model.dart';
import '../connect_end/model/upload_image_response_model/upload_image_response_model.dart';
import '../connect_end/model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../connect_end/model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../connect_end/model/verify_phone_entity_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/manager/shared_preference.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class HMOApi {
  final _service = locator<NetworkService>();
  // final _servicesupport = locator<sup.SupportNetworkService>();
  final logger = getLogger('HMO Api');
  final session = locator<SharedPreferencesService>();

  Future<PharmacyLoginResponseModel> signIn(
    LoginEntityModel signInEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.sign_in,
        RequestMethod.post,
        data: signInEntity.toJson(),
      );
      logger.d(response.data);
      return PharmacyLoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SignUpPhamaryResponseModel> signUp(
    HmoSignUpEntityModel signUpEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.sign_up_hmo,
        RequestMethod.post,
        data: signUpEntity.toJson(),
      );
      logger.d(response.data);
      return SignUpPhamaryResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<ResendOtpResponseModel> resendOtp(
    ResendOtpEntityModel resendOtpEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.resend_otp,
        RequestMethod.post,
        data: resendOtpEntity.toJson(),
      );
      logger.d(response.data);
      return ResendOtpResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<VerifyPharmacyOtpModel> verifyPhoneOtp(
    VerifyPhoneEntityModel verifyPhoneOtp,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.verify_phone_otp,
        RequestMethod.post,
        data: verifyPhoneOtp.toJson(),
      );
      logger.d(response.data);
      return VerifyPharmacyOtpModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<ForgotPasswordResponseModel> forgotPasword(
    ResendOtpEntityModel forgotPassword,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.forgot_pin,
        RequestMethod.post,
        data: forgotPassword.toJson(),
      );
      logger.d(response.data);
      return ForgotPasswordResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<VerifyPassOtpRespnseModel> verifyForgotPassword(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.verify_otp,
        RequestMethod.post,
        data: verifyPhoneEntity.toJson(),
      );
      logger.d(response.data);
      return VerifyPassOtpRespnseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> resetPin({
    ResetPasswordEntityModel? resetPasswordEntity,
    String? resetToken,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.reset_password,
        RequestMethod.post,
        data: resetPasswordEntity?.toJson(),
        options: Options(headers: {"x-reset-token": "$resetToken"}),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> changePhoneNo({String? phone, String? id}) async {
    try {
      final response = await _service.call(
        UrlConfig.change_number_pharmacy,
        RequestMethod.patch,
        data: {"newPhoneNumber": phone},
        options: Options(
          headers: {
            "Authorization": "Bearer ${session.authToken}",
            "x-reset-token": "$id",
          },
        ),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SetPinPharmResponseModel> setPin(
    SetPinEntityModel setPinEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.set_pin,
        RequestMethod.post,
        data: setPinEntity.toJson(),
      );
      logger.d(response.data);
      return SetPinPharmResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> sendOtp(String phone) async {
    try {
      final response = await _service.call(
        UrlConfig.send_otp,
        RequestMethod.post,
        data: {'phone': phone},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> verifyChangePhoneOtp(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.verify_otp,
        RequestMethod.post,
        data: verifyPhoneEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> verifyChangePhoneOtpChange(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.verify_change_phone_otp,
        RequestMethod.post,
        data: verifyPhoneEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> refreshToken() async {
    try {
      final response = await _service.call(
        UrlConfig.refresh_token,
        RequestMethod.post,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetUserDetailsResponseModel> getUserDetails(String phoneNo) async {
    try {
      final response = await _service.call(
        '${UrlConfig.user_detail}/$phoneNo',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetUserDetailsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetTenantResponseModel> getTenant() async {
    try {
      final response = await _service.call(
        UrlConfig.get_tenant,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetTenantResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetHmoKycResponseModel> getHMOKyc() async {
    try {
      final response = await _service.call(
        UrlConfig.get_hmo_kyc,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetHmoKycResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateHMOKyc(UpdateHmoKycEntityModel updateKyc) async {
    try {
      final response = await _service.call(
        UrlConfig.update_hmo_kyc_two,
        RequestMethod.post,
        data: updateKyc.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateThirdHMOKyc(
    UpdateThirdHmoKycEntityModel updateKyc,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.update_third_hmo_kyc_two,
        RequestMethod.post,
        data: updateKyc.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllListedPlanTypesResponseModel> getListedPlanTypesForHMO() async {
    try {
      final response = await _service.call(
        UrlConfig.listed_plan_types_hmo,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetAllListedPlanTypesResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetListedPlanTiersResponseModel> getListedPlanTiersForHMO() async {
    try {
      final response = await _service.call(
        UrlConfig.listed_plan_tiers_hmo,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetListedPlanTiersResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateHMO(UpdateHmoProfileEntityModel? updateHMO) async {
    try {
      final response = await _service.call(
        UrlConfig.update_hmo_profile,
        RequestMethod.patch,
        data: updateHMO!.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<UploadImageResponseModel> uploadImage(MultipartFile file) async {
    try {
      final response = await _service.call(
        UrlConfig.uplaod_image,
        RequestMethod.upload,
        formData: FormData.fromMap({'file': file}),
      );
      logger.d(response.data);
      return UploadImageResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> addRole(RolesEntityModel roleEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.create_role,
        RequestMethod.post,
        data: roleEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetRolesResponseModel> getRoles() async {
    try {
      final response = await _service.call(
        UrlConfig.get_role,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetRolesResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateRoles(UpdateRoleEntityModel updateRole) async {
    try {
      final response = await _service.call(
        UrlConfig.update_role,
        RequestMethod.patch,
        data: updateRole.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deleteRole(String roleId) async {
    try {
      final response = await _service.call(
        UrlConfig.delete_role,
        RequestMethod.delete,
        data: {'roleId': roleId},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> addUser(CreateUserEntityModel createEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.create_user,
        RequestMethod.post,
        data: createEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetCreatedUserResponseModel> getUser() async {
    try {
      final response = await _service.call(
        UrlConfig.get_user,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetCreatedUserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateUser(UpdateUserEntityModel createUser) async {
    try {
      final response = await _service.call(
        UrlConfig.update_user,
        RequestMethod.patch,
        data: createUser.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deleteUser(String roleId) async {
    try {
      final response = await _service.call(
        UrlConfig.delete_user,
        RequestMethod.patch,
        data: {'membershipId': roleId},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deletePlanTier(String planTierId) async {
    try {
      final response = await _service.call(
        '${UrlConfig.hmo_plan_teirs}/$planTierId',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> uploadProPicture(MultipartFile file) async {
    try {
      final response = await _service.call(
        UrlConfig.upload_pro_picture,
        RequestMethod.patch,
        data: FormData.fromMap({'file': file}),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetListOfHospitalResponseModel> getListOfHospitals({
    String? page,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.get_hospital_by_id,
        RequestMethod.getParams,
        queryParams: {'page': page, 'limit': '10'},
      );
      logger.d(response.data);
      return GetListOfHospitalResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<CreateHospitalNetworkResponseModel> createHospitalNetwork({
    CreateHospitalNetworkEntityModel? createHospital,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.get_hospital_by_id,
        RequestMethod.post,
        data: createHospital?.toJson(),
      );
      logger.d(response.data);
      return CreateHospitalNetworkResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> editHospital({
    CreateHospitalNetworkEntityModel? editHospital,
    String? hospitalId,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_hospital_by_id}/$hospitalId',
        RequestMethod.patch,
        data: editHospital?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<CreateHmoPlanReponseModel> createHmoPlan({
    CreateHmoPlanEntityModel? createPlan,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.get_user_hmos_plan,
        RequestMethod.post,
        data: createPlan?.toJson(),
      );
      logger.d(response.data);
      return CreateHmoPlanReponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateHmoPlan({
    UpdateHmoPlanEntityModel? updatePlan,
    String? planId,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_plan}/$planId',
        RequestMethod.patch,
        data: updatePlan?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> editHospitalNetwork({
    HospitalNetworkEntityModel? hospitalNetwork,
    String? planId,
  }) async {
    try {
      final response = await _service.call(
        "${UrlConfig.get_user_hmos_plan}/$planId/hospital-network",
        RequestMethod.patch,
        data: hospitalNetwork?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> selectPlanType({String? id}) async {
    try {
      final response = await _service.call(
        UrlConfig.selects_plan_type,
        RequestMethod.post,
        data: {'planTypeId': id},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deSelectPlanType({String? id}) async {
    try {
      final response = await _service.call(
        '${UrlConfig.selects_plan_type}/$id',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetMyHmoPlanResponseModel> getMyHmoPlans() async {
    try {
      final response = await _service.call(
        UrlConfig.get_user_hmos_plan,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetMyHmoPlanResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetHospitalByIdResponseModel> getHospitalById(
    String hospitalId,
  ) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_hospital_by_id}/$hospitalId',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetHospitalByIdResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPlanHospitalNetworkResponseModel> getPlanHospitalByPlanId(
    String planId,
  ) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_plan}/$planId/hospital-networks',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPlanHospitalNetworkResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPlanDetailResponseModel> getPlanDetails(String planId) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_plan}/$planId',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPlanDetailResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> createPlanTier(
    CreatePlanTierEntityModel creatTierEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.hmo_plan_teirs,
        RequestMethod.post,
        data: creatTierEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePlanTier(
    UpdatePlanTiersEntityModel updateTierEntity,
    String planTierId,
  ) async {
    try {
      final response = await _service.call(
        '${UrlConfig.hmo_plan_teirs}/$planTierId',
        RequestMethod.patch,
        data: updateTierEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deleteHMOPlan(String planId) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_plan}/$planId/draft',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
