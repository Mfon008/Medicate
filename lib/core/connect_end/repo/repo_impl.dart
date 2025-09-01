import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/login_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:medicate_app/core/connect_end/model/verify_otp_response_model/verify_otp_response_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contrast/contract_impl.dart';
import '../model/change_phone_no_response_model/change_phone_no_response_model.dart';
import '../model/change_pin_entity_model.dart';
import '../model/change_pin_response_model/change_pin_response_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_response_model/set_pin_response_model.dart';
import '../model/sign_up_entity_model.dart';
import '../model/sign_up_response_model/sign_up_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_phone_entity_model.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  Future<LoginResponseModel> signIn(LoginEntityModel signInEntity) async {
    final response = await _contract.login(signInEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  Future<SignUpResponseModel> signUp(SignUpEntityModel signUpEntity) async {
    final response = await _contract.signUp(signUpEntity);
    _session.isSignUp = true;
    return response;
  }

  Future<ResendOtpResponseModel> resendOtp(ResendOtpEntityModel resendOtpEntity) async {
    final response = await _contract.resendOtp(resendOtpEntity);
    return response;
  }

  Future<VerifyOtpResponseModel> verifyPhoneOtp(
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

  Future<dynamic> resetPin(ResetPasswordEntityModel resetPasswordEntity) async {
    final response = await _contract.resetPin(resetPasswordEntity);
    return response;
  }

  Future<ChangePhoneNoResponseModel> changePhoneNo(
    {ResendOtpEntityModel? changePhoneNo,String? id}
  ) async {
    final response = await _contract.changePhoneNo(changePhoneNo:changePhoneNo,id:id);
    return response;
  }

  Future<ChangePinResponseModel> changePin(
    ChangePinEntityModel changePin,
  ) async {
    final response = await _contract.changePin(changePin);
    return response;
  }

  Future<dynamic> refreshToken() async {
    final response = await _contract.refreshToken();
    return response;
  }

  Future<GetUserDetailsResponseModel> getUserDetails(String phoneNo) async {
    final response = await _contract.getUserDetails(phoneNo);
    return response;
  }

  Future<SetPinResponseModel> setPin(SetPinEntityModel setPinEntity) async {
    final response = await _contract.setPin(setPinEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.data.tokens.accessToken;
      _session.authRefreshToken = data.data.tokens.refreshToken;
      _session.usersData = data.data.toJson();
    }
  }
}
