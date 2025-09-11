import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/login_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/login_response_model/login_response_model.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/change_phone_no_response_model/change_phone_no_response_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_response_model/set_pin_response_model.dart';
import '../model/sign_up_entity_model.dart';
import '../model/sign_up_response_model/sign_up_response_model.dart'
    show SignUpResponseModel;
import '../model/support_entity_model.dart';
import '../model/verify_otp_response_model/verify_otp_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_phone_entity_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async =>
      await _api.signIn(loginEntity);
  Future<SignUpResponseModel> signUp(SignUpEntityModel signUpEntity) async =>
      await _api.signUp(signUpEntity);
  Future<ResendOtpResponseModel> resendOtp(
    ResendOtpEntityModel resendOtpEntity,
  ) async => await _api.resendOtp(resendOtpEntity);
  Future<VerifyOtpResponseModel> verifyPhoneOtp(
    VerifyPhoneEntityModel verifyPhoneOtp,
  ) async => await _api.verifyPhoneOtp(verifyPhoneOtp);
  Future<ForgotPasswordResponseModel> forgotPasword(
    ResendOtpEntityModel forgotPassword,
  ) async => await _api.forgotPasword(forgotPassword);
  Future<VerifyPassOtpRespnseModel> verifyForgotPassword(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async => await _api.verifyForgotPassword(verifyPhoneEntity);
  Future<dynamic> resetPin(
    ResetPasswordEntityModel resetPasswordEntity,
  ) async => await _api.resetPin(resetPasswordEntity);
  Future<ChangePhoneNoResponseModel> changePhoneNo({
    ResendOtpEntityModel? changePhoneNo,
    String? id,
  }) async => await _api.changePhoneNo(changePhoneNo: changePhoneNo, id: id);
  Future<dynamic> refreshToken() async => await _api.refreshToken();
  Future<GetUserDetailsResponseModel> getUserDetails(String phoneNo) async =>
      await _api.getUserDetails(phoneNo);
  Future<SetPinResponseModel> setPin(SetPinEntityModel setPinEntity) async =>
      await _api.setPin(setPinEntity);
  Future<dynamic> support(SupportEntityModel supportEntity) async =>
      await _api.support(supportEntity);
   Future<dynamic> uploadProPicture(MultipartFile file)async =>
      await _api.uploadProPicture(file);
}
