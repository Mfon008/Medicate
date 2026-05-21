import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/change_phone_no_response_model/change_phone_no_response_model.dart';
import 'package:medicate_app/core/connect_end/model/create_payment_wallet_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/create_payment_wallet_model/create_payment_wallet_model.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_entity_model/create_reminder_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_response_model/create_reminder_response_model.dart';
import 'package:medicate_app/core/connect_end/model/forgot_password_response_model/forgot_password_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_hmo_plan_hospital_network_response_model/get_hmo_plan_hospital_network_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_hospital_by_id_response_model/get_hospital_by_id_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_individual_application_details_model/get_individual_application_details_model.dart';
import 'package:medicate_app/core/connect_end/model/get_my_subscription_response_model/get_my_subscription_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/get_reminder_by_id.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_response_model/get_reminder_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_user_details_response_model/get_user_details_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_wallet_response_model/get_wallet_response_model.dart';
import 'package:medicate_app/core/connect_end/model/hmo_plan_payment_response_model/hmo_plan_payment_response_model.dart';
import 'package:medicate_app/core/connect_end/model/login_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/pay_with_wallet_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/reset_password_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/save_first_step_personal_info_entity_model/save_first_step_personal_info_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/save_first_step_personal_response_model/save_first_step_personal_response_model.dart';
import 'package:medicate_app/core/connect_end/model/save_second_corp_entity_model/save_second_corp_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/save_second_step_entity_model/save_second_step_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/save_third_step_entity_model/save_third_step_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/save_third_step_response_model/save_third_step_response_model.dart';
import 'package:medicate_app/core/connect_end/model/set_pin_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/set_pin_response_model/set_pin_response_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/start_application_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/start_application_rsponse_model/start_application_rsponse_model.dart';
import 'package:medicate_app/core/connect_end/model/support_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_reminder_entity_model/update_reminder_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/upload_image_reminder_response_model/upload_image_reminder_response_model.dart';
import 'package:medicate_app/core/core_folder/network/support_network_service.dart'
    as sup;
import '../connect_end/model/active_hmo_plan_response_model/active_hmo_plan_response_model.dart';
import '../connect_end/model/get_hmos_plan_response_model/get_hmos_plan_response_model.dart';
import '../connect_end/model/get_today_reminder_model/get_today_reminder_model.dart';
import '../connect_end/model/get_transaction_wallet_response_model/get_transaction_wallet_response_model.dart';
import '../connect_end/model/get_user_details_no_phone_model/get_user_details_no_phone_model.dart';
import '../connect_end/model/initiate_payment_response_model/initiate_payment_response_model.dart';
import '../connect_end/model/initiate_payment_wallet_entity_model.dart';
import '../connect_end/model/pay_with_wallet_response_model/pay_with_wallet_response_model.dart';
import '../connect_end/model/refresh_token_response_model/refresh_token_response_model.dart';
import '../connect_end/model/resend_otp_entity_model.dart';
import '../connect_end/model/resend_otp_response_model/resend_otp_response_model.dart';
import '../connect_end/model/save_second_fam_step_entity_model/save_second_fam_step_entity_model.dart';
import '../connect_end/model/save_second_step_response_model/save_second_step_response_model.dart';
import '../connect_end/model/sign_up_response_model/sign_up_response_model.dart';
import '../connect_end/model/update_doses_status_model/update_doses_status_model.dart';
import '../connect_end/model/update_user_profile_entity/update_user_profile_entity.dart';
import '../connect_end/model/update_user_profile_response_model/update_user_profile_response_model.dart';
import '../connect_end/model/upload_application_document_response_model/upload_application_document_response_model.dart';
import '../connect_end/model/upload_image_response_model/upload_image_response_model.dart';
import '../connect_end/model/verify_otp_response_model/verify_otp_response_model.dart';
import '../connect_end/model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../connect_end/model/verify_phone_entity_model.dart';
import '../core_folder/app/app.locator.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final _serviceSupport = locator<sup.SupportNetworkService>();
  final logger = getLogger('AuthViewModel');

  Future<LoginResponseModel> signIn(LoginEntityModel signInEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.sign_in,
        RequestMethod.post,
        data: signInEntity.toJson(),
      );
      logger.d(response.data);
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SignUpResponseModel> signUp(SignUpEntityModel signUpEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.sign_up,
        RequestMethod.post,
        data: signUpEntity.toJson(),
      );
      logger.d(response.data);
      return SignUpResponseModel.fromJson(response.data);
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

  Future<VerifyOtpResponseModel> verifyPhoneOtp(
    VerifyPhoneEntityModel verifyPhoneOtp,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.verify_phone_otp,
        RequestMethod.post,
        data: verifyPhoneOtp.toJson(),
      );
      logger.d(response.data);
      return VerifyOtpResponseModel.fromJson(response.data);
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

  Future<ChangePhoneNoResponseModel> changePhoneNo({
    ResendOtpEntityModel? changePhoneNo,
    String? id,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.change_number}/$id',
        RequestMethod.patch,
        data: changePhoneNo?.toJson(),
      );
      logger.d(response.data);
      return ChangePhoneNoResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<RefreshTokenResponseModel> refreshToken(String refreshToken) async {
    try {
      final response = await _service.call(
        UrlConfig.refresh_token,
        data: {'refreshToken': refreshToken},
        RequestMethod.post,
      );
      logger.d(response.data);
      return RefreshTokenResponseModel.fromJson(response.data);
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

  Future<GetUserDetailsNoPhoneModel> getUserDetailsNoPhone() async {
    try {
      final response = await _service.call(
        UrlConfig.user_detail_no_phone,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetUserDetailsNoPhoneModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SetPinResponseModel> setPin(SetPinEntityModel setPinEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.set_pin,
        RequestMethod.post,
        data: setPinEntity.toJson(),
      );
      logger.d(response.data);
      return SetPinResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> support(SupportEntityModel supportEntity) async {
    try {
      final response = await _serviceSupport.call(
        UrlConfig.support,
        sup.RequestMethod.post,
        data: supportEntity.toJson(),
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

  Future<UploadImageReminderResponseModel> uploadImageReminder(
    MultipartFile file,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.upload_image_reminder,
        RequestMethod.upload,
        formData: FormData.fromMap({'image': file}),
      );
      logger.d(response.data);
      return UploadImageReminderResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> uploadImageReminderUpdate({
    MultipartFile? file,
    String? id,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.upload_image_reminder_update}/$id/update',
        RequestMethod.patchUpdate,
        formData: FormData.fromMap({'image': file}),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<UpdateUserProfileResponseModel> uploadUserProfile(
    UpdateUserProfileEntity userProfile,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.update_user_profile,
        RequestMethod.patch,
        data: userProfile.toJson(),
      );
      logger.d(response.data);
      return UpdateUserProfileResponseModel.fromJson(response.data);
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

  Future<CreateReminderResponseModel> createReminder(
    CreateReminderEntityModel createReminderEntityModel,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.reminder,
        RequestMethod.post,
        data: createReminderEntityModel.toJson(),
      );
      logger.d(response.data);
      return CreateReminderResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetReminderById> getReminderById(String? id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.reminder}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetReminderById.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetTodayReminderModel> getTodaysReminder({
    String? period,
    String? date,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.today_reminder,
        RequestMethod.get,
        data: {'period': period, 'date': date},
      );
      logger.d(response.data);
      return GetTodayReminderModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetReminderResponseModel> getReminder({
    String? status,
    String? page,
    String? limit,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.reminder,
        RequestMethod.get,
        data: {'status': status, 'page': page, 'limit': limit},
      );
      logger.d(response.data);
      return GetReminderResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetReminderResponseModel> getReminderAll({
    String? page,
    String? limit,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.reminder,
        RequestMethod.get,
        data: {'page': page, 'limit': limit},
      );
      logger.d(response.data);
      return GetReminderResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<UpdateDosesStatusModel> updateDoseStatus({
    String? reminerId,
    String? doseId,
    String? status,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.reminder}/$reminerId/doses/$doseId/status',
        RequestMethod.patch,
        data: {'status': status},
      );
      logger.d(response.data);
      return UpdateDosesStatusModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateReminder({
    String? reminderId,
    UpdateReminderEntityModel? updateReminder,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.reminder}/$reminderId',
        RequestMethod.patch,
        data: updateReminder?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<InitiatePaymentResponseModel> initiatePayment({
    String? reference,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.initiate_payment,
        RequestMethod.post,
        data: {"reference": reference},
      );
      logger.d(response.data);
      return InitiatePaymentResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<CreatePaymentWalletModel> createWalletPayment({
    CreatePaymentWalletEntityModel? createPaymentWalletEntityModel,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.create_payment,
        RequestMethod.post,
        data: createPaymentWalletEntityModel?.toJson(),
      );
      logger.d(response.data);
      return CreatePaymentWalletModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<InitiatePaymentResponseModel> initiateWalletPayment({
    InitiatePaymentWalletEntityModel? initiatePaymentWalletEntityModel,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.initiate_payment,
        RequestMethod.post,
        data: initiatePaymentWalletEntityModel?.toJson(),
      );
      logger.d(response.data);
      return InitiatePaymentResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<PayWithWalletResponseModel> payWithWallet({
    PayWithWalletEntityModel? payWithWalletEntityModel,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.pay_with_wallet,
        RequestMethod.post,
        data: payWithWalletEntityModel?.toJson(),
      );
      logger.d(response.data);
      return PayWithWalletResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetTransactionWalletResponseModel> getTransactionWallet() async {
    try {
      final response = await _service.call(
        UrlConfig.get_transaction,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetTransactionWalletResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetWalletResponseModel> getWalletBalance() async {
    try {
      final response = await _service.call(
        UrlConfig.get_wallet,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetWalletResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<ActiveHmoPlanResponseModel> getActiveHmoPlan({
    String? page,
    String? limit,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.get_user_hmos_market,
        RequestMethod.get,
        data: {'page': '1', 'limit': limit},
      );
      logger.d(response.data);
      return ActiveHmoPlanResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetHmosPlanResponseModel> getActiveHmoPlanByType({
    String? hmodId,
    String? type,
    String? page,
    String? limit,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_market_plantype}/$hmodId/plans',
        RequestMethod.getParams,
        queryParams: {'planType': type, 'page': page, 'limit': limit},
      );
      logger.d(response.data);
      return GetHmosPlanResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetIndividualApplicationDetailsModel> getIndividualApplication({
    String? appliationId,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_application}/$appliationId',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetIndividualApplicationDetailsModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<UploadApplicationDocumentResponseModel> uploadAppDocument({
    String? appliationId,
    MultipartFile? file,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_application}/$appliationId/documents/upload',
        RequestMethod.upload,
        formData: FormData.fromMap({'document': file}),
      );
      logger.d(response.data);
      return UploadApplicationDocumentResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetHospitalByIdResponseModel> getHospitalById({
    String? hospitalId,
  }) async {
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

  Future<StartApplicationRsponseModel> startApplication({
    StartApplicationEntityModel? startApplication,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.start_application,
        RequestMethod.post,
        data: startApplication?.toJson(),
      );
      logger.d(response.data);
      return StartApplicationRsponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SaveFirstStepPersonalResponseModel> saveFirstIndividualStep({
    SaveFirstStepPersonalInfoEntityModel? saveFirstIndividualStep,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.save_first_step,
        RequestMethod.post,
        data: saveFirstIndividualStep?.toJson(),
      );
      logger.d(response.data);
      return SaveFirstStepPersonalResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SaveSecondStepResponseModel> saveSecondIndividualStep({
    SaveSecondStepEntityModel? saveSecondIndividualStep,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.save_first_step,
        RequestMethod.post,
        data: saveSecondIndividualStep?.toJson(),
      );
      logger.d(response.data);
      return SaveSecondStepResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SaveSecondStepResponseModel> saveSecondCorporateStep({
    SaveSecondCorpEntityModel? saveSecondCorporateStep,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.save_first_step,
        RequestMethod.post,
        data: saveSecondCorporateStep?.toJson(),
      );
      logger.d(response.data);
      return SaveSecondStepResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SaveSecondStepResponseModel> saveSecondFamStep({
    SaveSecondFamStepEntityModel? saveSecondFamStep,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.save_first_step,
        RequestMethod.post,
        data: saveSecondFamStep?.toJson(),
      );
      logger.d(response.data);
      return SaveSecondStepResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SaveThirdStepResponseModel> saveThirdIndividualStep({
    SaveThirdStepEntityModel? saveThirdIndividualStep,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.save_first_step,
        RequestMethod.post,
        data: saveThirdIndividualStep?.toJson(),
      );
      logger.d(response.data);
      return SaveThirdStepResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<HmoPlanPaymentResponseModel> hmoPlanPayment({
    String? applicationID,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_application}/$applicationID/pay',
        RequestMethod.post,
        data: {
          "paymentMethod": "PAYMENT_GATEWAY",
          "callbackUrl": "https://example.com/hmo/payment/callback",
        },
      );
      logger.d(response.data);
      return HmoPlanPaymentResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> submitHmoPlan({String? applicationID}) async {
    try {
      final response = await _service.call(
        UrlConfig.submit_hmo_plan,
        RequestMethod.post,
        data: {"applicationId": applicationID},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetHmoPlanHospitalNetworkResponseModel> getHospitalNetworkPlan({
    String? planId,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_user_hmos_plan}/$planId/hospital-networks',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetHmoPlanHospitalNetworkResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetMySubscriptionResponseModel> getMySubscriptions({
    String? status,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.my_subscription,
        RequestMethod.getParams,
        queryParams: {'statusFilter': status},
      );
      logger.d(response.data);
      return GetMySubscriptionResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
