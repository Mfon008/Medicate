import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/change_phone_no_response_model/change_phone_no_response_model.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_entity_model/create_reminder_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/create_reminder_response_model/create_reminder_response_model.dart';
import 'package:medicate_app/core/connect_end/model/forgot_password_response_model/forgot_password_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/get_reminder_by_id.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_response_model/get_reminder_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_user_details_response_model/get_user_details_response_model.dart';
import 'package:medicate_app/core/connect_end/model/login_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/reset_password_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/set_pin_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/set_pin_response_model/set_pin_response_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/support_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_reminder_entity_model/update_reminder_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_user_profile_entity.dart';
import 'package:medicate_app/core/connect_end/model/upload_image_reminder_response_model/upload_image_reminder_response_model.dart';
import 'package:medicate_app/core/core_folder/network/support_network_service.dart'
    as sup;
import '../connect_end/model/get_today_reminder_model/get_today_reminder_model.dart';
import '../connect_end/model/resend_otp_entity_model.dart';
import '../connect_end/model/resend_otp_response_model/resend_otp_response_model.dart';
import '../connect_end/model/sign_up_response_model/sign_up_response_model.dart';
import '../connect_end/model/update_doses_status_model/update_doses_status_model.dart';
import '../connect_end/model/update_user_profile_response_model/update_user_profile_response_model.dart';
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
        UrlConfig.verify_otp,
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

  Future<ForgotPasswordResponseModel> forgotPasword(
    ResendOtpEntityModel forgotPassword,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.forgot_password,
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
        UrlConfig.verify_forget_pin_otp,
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
        options: Options(headers: {"x-token": "Bearer $resetToken"}),
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
}
