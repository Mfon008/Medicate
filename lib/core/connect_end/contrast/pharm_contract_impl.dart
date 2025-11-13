import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/api_folder/pharm_auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_pharmacy_kyc_response_model/get_pharmacy_kyc_response_model.dart';
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
import '../model/sign_up_pharmacy_entity_model.dart';
import '../model/update_pharmacy_kyc_entity_model/update_pharmacy_kyc_entity_model.dart';
import '../model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';

@lazySingleton
class PharmContractsImpl {
  final _api = locator<PharmApi>();

  Future<PharmacyLoginResponseModel> login(
    LoginEntityModel loginEntity,
  ) async => await _api.signIn(loginEntity);
  Future<SignUpPhamaryResponseModel> signUp(
    SignUpPharmacyEntityModel signUpEntity,
  ) async => await _api.signUp(signUpEntity);
  Future<ResendOtpResponseModel> resendOtp(
    ResendOtpEntityModel resendOtpEntity,
  ) async => await _api.resendOtp(resendOtpEntity);
  Future<VerifyPharmacyOtpModel> verifyPhoneOtp(
    VerifyPhoneEntityModel verifyPhoneOtp,
  ) async => await _api.verifyPhoneOtp(verifyPhoneOtp);
  Future<ForgotPasswordResponseModel> forgotPasword(
    ResendOtpEntityModel forgotPassword,
  ) async => await _api.forgotPasword(forgotPassword);
  Future<VerifyPassOtpRespnseModel> verifyForgotPassword(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async => await _api.verifyForgotPassword(verifyPhoneEntity);
  Future<dynamic> resetPin({
    ResetPasswordEntityModel? resetPasswordEntity,
    String? resetToken,
  }) async => await _api.resetPin(
    resetPasswordEntity: resetPasswordEntity,
    resetToken: resetToken,
  );
  Future<GetUserDetailsResponseModel> getUserDetails(String phoneNo) async =>
      await _api.getUserDetails(phoneNo);
  Future<dynamic> changePhoneNo({String? changePhoneNo, String? id}) async =>
      await _api.changePhoneNo(phone: changePhoneNo, id: id);
  Future<dynamic> refreshToken() async => await _api.refreshToken();
  Future<dynamic> sendOtp(String phone) async => await _api.sendOtp(phone);
  Future<dynamic> verifyChangePhoneOtp(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async => await _api.verifyChangePhoneOtp(verifyPhoneEntity);
  Future<dynamic> verifyChangePhoneOtpChange(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async => await _api.verifyChangePhoneOtpChange(verifyPhoneEntity);
  Future<SetPinPharmResponseModel> setPin(
    SetPinEntityModel setPinEntity,
  ) async => await _api.setPin(setPinEntity);
  Future<GetTenantResponseModel> getTenant() async => await _api.getTenant();
  Future<GetPharmacyKycResponseModel> getPharmacyKyc() async =>
      await _api.getPharmacyKyc();
  Future<dynamic> updatePharmacyKyc(UpdatePharmacyKycEntityModel updateKyc) async =>
      await _api.updatePharmacyKyc(updateKyc);
  Future<dynamic> updatePharmacy(
    UpdatePharmacyProfileEntityModel? updatePharmacy,
  ) async => await _api.updatePharmacy(updatePharmacy);
  Future<UploadImageResponseModel> uploadImage(MultipartFile file) async =>
      await _api.uploadImage(file);
}
