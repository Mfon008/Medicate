import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/get_transaction_wallet_response_model/get_transaction_wallet_response_model.dart';
import 'package:medicate_app/core/connect_end/model/login_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:medicate_app/core/connect_end/model/pay_with_wallet_response_model/pay_with_wallet_response_model.dart';
import 'package:medicate_app/core/connect_end/model/verify_otp_response_model/verify_otp_response_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contrast/contract_impl.dart';
import '../model/change_phone_no_response_model/change_phone_no_response_model.dart';
import '../model/create_payment_wallet_entity_model.dart';
import '../model/create_payment_wallet_model/create_payment_wallet_model.dart';
import '../model/create_reminder_entity_model/create_reminder_entity_model.dart';
import '../model/create_reminder_response_model/create_reminder_response_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_reminder_by_id/get_reminder_by_id.dart';
import '../model/get_reminder_response_model/get_reminder_response_model.dart';
import '../model/get_today_reminder_model/get_today_reminder_model.dart';
import '../model/get_user_details_no_phone_model/get_user_details_no_phone_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/get_wallet_response_model/get_wallet_response_model.dart';
import '../model/initiate_payment_response_model/initiate_payment_response_model.dart';
import '../model/initiate_payment_wallet_entity_model.dart';
import '../model/pay_with_wallet_entity_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_response_model/set_pin_response_model.dart';
import '../model/sign_up_entity_model.dart';
import '../model/sign_up_response_model/sign_up_response_model.dart';
import '../model/support_entity_model.dart';
import '../model/update_doses_status_model/update_doses_status_model.dart';
import '../model/update_reminder_entity_model/update_reminder_entity_model.dart';
import '../model/update_user_profile_entity/update_user_profile_entity.dart';
import '../model/update_user_profile_response_model/update_user_profile_response_model.dart';
import '../model/upload_image_reminder_response_model/upload_image_reminder_response_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
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

  Future<ResendOtpResponseModel> resendOtp(
    ResendOtpEntityModel resendOtpEntity,
  ) async {
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

  Future<ChangePhoneNoResponseModel> changePhoneNo({
    ResendOtpEntityModel? changePhoneNo,
    String? id,
  }) async {
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

  Future<dynamic> support(SupportEntityModel supportEntity) async {
    final response = await _contract.support(supportEntity);
    return response;
  }

  Future<dynamic> uploadProPicture(MultipartFile file) async {
    final response = await _contract.uploadProPicture(file);
    return response;
  }

  Future<UpdateUserProfileResponseModel> uploadUserProfile(
    UpdateUserProfileEntity? userProfile,
  ) async {
    final response = await _contract.uploadUserProfile(userProfile);
    return response;
  }

  Future<CreateReminderResponseModel> createReminder(
    CreateReminderEntityModel createReminderEntityModel,
  ) async {
    final response = await _contract.createReminder(createReminderEntityModel);
    return response;
  }

  Future<UploadImageReminderResponseModel> uploadImageReminder(
    MultipartFile file,
  ) async {
    final response = await _contract.uploadImageReminder(file);
    return response;
  }

  Future<dynamic> uploadImageReminderUpdate({
    MultipartFile? file,
    String? id,
  }) async {
    final response = await _contract.uploadImageReminderUpdate(
      file: file,
      id: id,
    );
    return response;
  }

  Future<GetReminderResponseModel> getReminder({
    String? status,
    String? page,
    String? limit,
  }) async {
    final response = await _contract.getReminder(
      status: status,
      page: page,
      limit: limit,
    );
    return response;
  }

  Future<GetReminderResponseModel> getReminderAll({
    String? page,
    String? limit,
  }) async {
    final response = await _contract.getReminderAll(page: page, limit: limit);
    return response;
  }

  Future<GetReminderById> getReminderById(String? id) async {
    final response = await _contract.getReminderById(id);
    return response;
  }

  Future<GetTodayReminderModel> getTodaysReminder({
    String? period,
    String? date,
  }) async {
    final response = await _contract.getTodaysReminder(
      period: period,
      date: date,
    );
    return response;
  }

  Future<UpdateDosesStatusModel> updateDosesStatusModel({
    String? reminderId,
    String? doseId,
    String? status,
  }) async {
    final response = await _contract.updateDosesStatusModel(
      status: status,
      reminderId: reminderId,
      doseId: doseId,
    );
    return response;
  }

  Future<dynamic> updateReminder({
    String? reminderId,
    UpdateReminderEntityModel? updateReminder,
  }) async {
    final response = await _contract.updateReminder(
      reminderId: reminderId,
      updateReminder: updateReminder,
    );
    return response;
  }

  Future<InitiatePaymentResponseModel> initiatePayment({
    String? reference,
  }) async {
    final response = await _contract.initiatePayment(reference: reference);
    return response;
  }

  Future<UploadImageResponseModel> uploadImage(MultipartFile file) async {
    final response = await _contract.uploadImage(file);
    return response;
  }

  Future<GetUserDetailsNoPhoneModel> getUserDetailsNoPhone() async {
    final response = await _contract.getUserDetailsNoPhone();
    _chacheUser(response);
    return response;
  }

  Future<CreatePaymentWalletModel> createWalletPayment({
    CreatePaymentWalletEntityModel? createPaymentWalletEntityModel,
  }) async {
    final response = await _contract.createWalletPayment(
      createPaymentWalletEntityModel: createPaymentWalletEntityModel,
    );
    return response;
  }

  Future<InitiatePaymentResponseModel> initiateWalletPayment({
    InitiatePaymentWalletEntityModel? initiatePaymentWalletEntityModel,
  }) async {
    final response = await _contract.initiateWalletPayment(
      initiatePaymentWalletEntityModel: initiatePaymentWalletEntityModel,
    );
    return response;
  }

  Future<PayWithWalletResponseModel> payWithWallet({
    PayWithWalletEntityModel? payWithWalletEntityModel,
  }) async {
    final response = await _contract.payWithWallet(
      payWithWalletEntityModel: payWithWalletEntityModel,
    );
    return response;
  }

  Future<GetTransactionWalletResponseModel> getTransactionWallet() async {
    final response = await _contract.getTransactionWallet();
    return response;
  }

  Future<GetWalletResponseModel> getWalletBalance() async {
    final response = await _contract.getWalletBalance();
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.data.accessToken;
      _session.authRefreshToken = data.data.refreshToken;
      _session.usersData = data.data.toJson();
      _session.authType = 'everyday_user';
    }
  }

  void _chacheUser(data) {
    if (data != null) {
      _session.usersData1 = data.data.toJson();
    }
  }
}
