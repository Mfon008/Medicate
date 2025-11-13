import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/get_pharmacy_kyc_response_model/get_pharmacy_kyc_response_model.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_kyc_entity_model/update_pharmacy_kyc_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/upload_image_response_model/upload_image_response_model.dart';
import '../connect_end/model/forgot_password_response_model/forgot_password_response_model.dart';
import '../connect_end/model/get_tenant_response_model/get_tenant_response_model.dart';
import '../connect_end/model/get_user_details_response_model/get_user_details_response_model.dart';
import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../connect_end/model/resend_otp_entity_model.dart';
import '../connect_end/model/resend_otp_response_model/resend_otp_response_model.dart';
import '../connect_end/model/reset_password_entity_model.dart';
import '../connect_end/model/set_pin_entity_model.dart';
import '../connect_end/model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../connect_end/model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import '../connect_end/model/sign_up_pharmacy_entity_model.dart';
import '../connect_end/model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
import '../connect_end/model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../connect_end/model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../connect_end/model/verify_phone_entity_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/manager/shared_preference.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class PharmApi {
  final _service = locator<NetworkService>();
  // final _servicesupport = locator<sup.SupportNetworkService>();
  final logger = getLogger('Pharm Api');
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
    SignUpPharmacyEntityModel signUpEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.sign_up_pharmacy,
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

  Future<GetPharmacyKycResponseModel> getPharmacyKyc() async {
    try {
      final response = await _service.call(
        UrlConfig.get_kyc,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPharmacyKycResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePharmacyKyc(
    UpdatePharmacyKycEntityModel updateKyc,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.update_pharm_kyc,
        RequestMethod.patch,
        data: updateKyc.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePharmacy(
    UpdatePharmacyProfileEntityModel? updatePharmacy,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.update_pharmacy_profile,
        RequestMethod.patch,
        data: updatePharmacy!.toJson(),
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
}
