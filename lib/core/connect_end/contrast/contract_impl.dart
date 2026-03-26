import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/login_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:medicate_app/core/connect_end/model/save_second_step_response_model/save_second_step_response_model.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/active_hmo_plan_response_model/active_hmo_plan_response_model.dart';
import '../model/change_phone_no_response_model/change_phone_no_response_model.dart';
import '../model/create_payment_wallet_entity_model.dart';
import '../model/create_payment_wallet_model/create_payment_wallet_model.dart';
import '../model/create_reminder_entity_model/create_reminder_entity_model.dart';
import '../model/create_reminder_response_model/create_reminder_response_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_hmo_plan_hospital_network_response_model/get_hmo_plan_hospital_network_response_model.dart';
import '../model/get_hmos_plan_response_model/get_hmos_plan_response_model.dart';
import '../model/get_hospital_by_id_response_model/get_hospital_by_id_response_model.dart';
import '../model/get_individual_application_details_model/get_individual_application_details_model.dart';
import '../model/get_reminder_by_id/get_reminder_by_id.dart';
import '../model/get_reminder_response_model/get_reminder_response_model.dart';
import '../model/get_today_reminder_model/get_today_reminder_model.dart';
import '../model/get_transaction_wallet_response_model/get_transaction_wallet_response_model.dart';
import '../model/get_user_details_no_phone_model/get_user_details_no_phone_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/get_wallet_response_model/get_wallet_response_model.dart';
import '../model/hmo_plan_payment_response_model/hmo_plan_payment_response_model.dart';
import '../model/initiate_payment_response_model/initiate_payment_response_model.dart';
import '../model/initiate_payment_wallet_entity_model.dart';
import '../model/pay_with_wallet_entity_model.dart';
import '../model/pay_with_wallet_response_model/pay_with_wallet_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/save_first_step_personal_info_entity_model/save_first_step_personal_info_entity_model.dart';
import '../model/save_first_step_personal_response_model/save_first_step_personal_response_model.dart';
import '../model/save_second_step_entity_model/save_second_step_entity_model.dart';
import '../model/save_third_step_entity_model/save_third_step_entity_model.dart';
import '../model/save_third_step_response_model/save_third_step_response_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_response_model/set_pin_response_model.dart';
import '../model/sign_up_entity_model.dart';
import '../model/sign_up_response_model/sign_up_response_model.dart';
import '../model/start_application_entity_model.dart';
import '../model/start_application_rsponse_model/start_application_rsponse_model.dart';
import '../model/support_entity_model.dart';
import '../model/update_doses_status_model/update_doses_status_model.dart';
import '../model/update_reminder_entity_model/update_reminder_entity_model.dart';
import '../model/update_user_profile_entity/update_user_profile_entity.dart';
import '../model/update_user_profile_response_model/update_user_profile_response_model.dart';
import '../model/upload_application_document_response_model/upload_application_document_response_model.dart';
import '../model/upload_image_reminder_response_model/upload_image_reminder_response_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
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
  Future<dynamic> resetPin({
    ResetPasswordEntityModel? resetPasswordEntity,
    String? resetToken,
  }) async => await _api.resetPin(
    resetPasswordEntity: resetPasswordEntity,
    resetToken: resetToken,
  );
  Future<dynamic> verifyChangePhoneOtp(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async => await _api.verifyChangePhoneOtp(verifyPhoneEntity);
  Future<dynamic> sendOtp(String phone) async => await _api.sendOtp(phone);
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
  Future<dynamic> uploadProPicture(MultipartFile file) async =>
      await _api.uploadProPicture(file);
  Future<UpdateUserProfileResponseModel> uploadUserProfile(
    UpdateUserProfileEntity? userProfile,
  ) async => await _api.uploadUserProfile(userProfile!);
  Future<CreateReminderResponseModel> createReminder(
    CreateReminderEntityModel createReminderEntityModel,
  ) async => await _api.createReminder(createReminderEntityModel);
  Future<UploadImageReminderResponseModel> uploadImageReminder(
    MultipartFile file,
  ) async => await _api.uploadImageReminder(file);
  Future<dynamic> uploadImageReminderUpdate({
    MultipartFile? file,
    String? id,
  }) async => await _api.uploadImageReminderUpdate(file: file, id: id);
  Future<GetReminderResponseModel> getReminder({
    String? status,
    String? page,
    String? limit,
  }) async => await _api.getReminder(status: status, page: page, limit: limit);
  Future<GetReminderResponseModel> getReminderAll({
    String? page,
    String? limit,
  }) async => await _api.getReminderAll(page: page, limit: limit);

  Future<GetReminderById> getReminderById(String? id) async =>
      await _api.getReminderById(id!);
  Future<GetTodayReminderModel> getTodaysReminder({
    String? period,
    String? date,
  }) async => await _api.getTodaysReminder(period: period, date: date);

  Future<UpdateDosesStatusModel> updateDosesStatusModel({
    String? reminderId,
    String? doseId,
    String? status,
  }) async => await _api.updateDoseStatus(
    reminerId: reminderId,
    doseId: doseId,
    status: status,
  );

  Future<dynamic> updateReminder({
    String? reminderId,
    UpdateReminderEntityModel? updateReminder,
  }) async => await _api.updateReminder(
    reminderId: reminderId,
    updateReminder: updateReminder,
  );

  Future<InitiatePaymentResponseModel> initiatePayment({
    String? reference,
  }) async => await _api.initiatePayment(reference: reference);

  Future<UploadImageResponseModel> uploadImage(MultipartFile file) async =>
      await _api.uploadImage(file);
  Future<GetUserDetailsNoPhoneModel> getUserDetailsNoPhone() async =>
      await _api.getUserDetailsNoPhone();
  Future<CreatePaymentWalletModel> createWalletPayment({
    CreatePaymentWalletEntityModel? createPaymentWalletEntityModel,
  }) async => await _api.createWalletPayment(
    createPaymentWalletEntityModel: createPaymentWalletEntityModel,
  );
  Future<InitiatePaymentResponseModel> initiateWalletPayment({
    InitiatePaymentWalletEntityModel? initiatePaymentWalletEntityModel,
  }) async => await _api.initiateWalletPayment(
    initiatePaymentWalletEntityModel: initiatePaymentWalletEntityModel,
  );
  Future<PayWithWalletResponseModel> payWithWallet({
    PayWithWalletEntityModel? payWithWalletEntityModel,
  }) async => await _api.payWithWallet(
    payWithWalletEntityModel: payWithWalletEntityModel,
  );
  Future<GetTransactionWalletResponseModel> getTransactionWallet() async =>
      await _api.getTransactionWallet();
  Future<GetWalletResponseModel> getWalletBalance() async =>
      await _api.getWalletBalance();

  Future<ActiveHmoPlanResponseModel> getActiveHmoPlan() async =>
      await _api.getActiveHmoPlan();

  Future<GetHmosPlanResponseModel> getActiveHmoPlanByType({
    String? hmodId,
    String? type,
  }) async => await _api.getActiveHmoPlanByType(hmodId: hmodId, type: type);

  Future<GetIndividualApplicationDetailsModel> getIndividualApplication({
    String? appliationId,
  }) async => await _api.getIndividualApplication(appliationId: appliationId);

  Future<StartApplicationRsponseModel> startApplication({
    StartApplicationEntityModel? startApplication,
  }) async => await _api.startApplication(startApplication: startApplication);

  Future<SaveFirstStepPersonalResponseModel> saveFirstIndividualStep({
    SaveFirstStepPersonalInfoEntityModel? saveFirstIndividualStep,
  }) async => await _api.saveFirstIndividualStep(
    saveFirstIndividualStep: saveFirstIndividualStep,
  );
  Future<SaveSecondStepResponseModel> saveSecondIndividualStep({
    SaveSecondStepEntityModel? saveSecondIndividualStep,
  }) async => await _api.saveSecondIndividualStep(
    saveSecondIndividualStep: saveSecondIndividualStep,
  );
  Future<SaveThirdStepResponseModel> saveThirdIndividualStep({
    SaveThirdStepEntityModel? saveThirdIndividualStep,
  }) async => await _api.saveThirdIndividualStep(
    saveThirdIndividualStep: saveThirdIndividualStep,
  );
  Future<GetHospitalByIdResponseModel> getHospitalById({
    String? hospitalId,
  }) async => await _api.getHospitalById(hospitalId: hospitalId);
  Future<UploadApplicationDocumentResponseModel> uploadAppDocument({
    String? appliationId,
    MultipartFile? file,
  }) async =>
      await _api.uploadAppDocument(appliationId: appliationId, file: file);
  Future<HmoPlanPaymentResponseModel> hmoPlanPayment({
    String? applicationID,
  }) async => await _api.hmoPlanPayment(applicationID: applicationID);
  Future<dynamic> submitHmoPlan({String? applicationID}) async =>
      await _api.submitHmoPlan(applicationID: applicationID);
  Future<GetHmoPlanHospitalNetworkResponseModel> getHospitalNetworkPlan({String? planId}) async  =>
      await _api.getHospitalNetworkPlan(planId: planId);
}
