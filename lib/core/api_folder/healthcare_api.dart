import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_business_owner_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_provider_practitioner_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_business_owner_profile_response_model/update_business_owner_profile_response_model.dart';

import '../connect_end/model/forgot_password_response_model/forgot_password_response_model.dart';
import '../connect_end/model/get_roles_response_model/get_roles_response_model.dart';
import '../connect_end/model/get_tenant_response_model/get_tenant_response_model.dart';
import '../connect_end/model/get_user_details_response_model/get_user_details_response_model.dart';
import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../connect_end/model/resend_otp_entity_model.dart';
import '../connect_end/model/resend_otp_response_model/resend_otp_response_model.dart';
import '../connect_end/model/reset_password_entity_model.dart';
import '../connect_end/model/roles_entity_model.dart';
import '../connect_end/model/set_pin_entity_model.dart';
import '../connect_end/model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../connect_end/model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import '../connect_end/model/update_business_owner_profile_entity_model/update_business_owner_profile_entity_model.dart';
import '../connect_end/model/update_practitioner_profile_entity_model/update_practitioner_profile_entity_model.dart';
import '../connect_end/model/update_role_entity_model.dart';
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
class HealthcareApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('Healthcare Api');
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

  Future<SignUpPhamaryResponseModel> signUpPractitioner(
    SignUpHealthcareProviderPractitionerEntityModel signUpEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.sign_up_practitioner,
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

  Future<SignUpPhamaryResponseModel> signUpBusinessOwner(
    SignUpHealthcareBusinessOwnerEntityModel signUpEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.sign_up_business_owner,
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

  Future<UpdateBusinessOwnerProfileResponseModel> updateHealthCareBusinessOwner(
    UpdateBusinessOwnerProfileEntityModel? updateBusinessOwner,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.update_healthcare_business_owner_profile,
        RequestMethod.patch,
        data: updateBusinessOwner!.toJson(),
      );
      logger.d(response.data);
      return UpdateBusinessOwnerProfileResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateHealthCarePractitioner(
    UpdatePractitionerProfileEntityModel? updatePractitioner,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.update_healthcare_practitioner_profile,
        RequestMethod.patch,
        data: updatePractitioner!.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
