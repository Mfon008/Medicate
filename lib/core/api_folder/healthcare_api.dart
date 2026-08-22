import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medicate_app/core/connect_end/model/get_single_market_product_response_model/get_single_market_product_response_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_business_owner_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_healthcare_provider_practitioner_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_business_owner_profile_response_model/update_business_owner_profile_response_model.dart';
import '../connect_end/model/create_payment_wallet_entity_model.dart';
import '../connect_end/model/create_payment_wallet_model/create_payment_wallet_model.dart';
import '../connect_end/model/create_reminder_response_model/create_reminder_response_model.dart';
import '../connect_end/model/create_tenant_reminder_entity_model/create_tenant_reminder_entity_model.dart';
import '../connect_end/model/create_user_entity_model.dart';
import '../connect_end/model/distributor_wholesale_category_model/distributor_wholesale_category_model.dart';
import '../connect_end/model/forgot_password_response_model/forgot_password_response_model.dart';
import '../connect_end/model/get_created_user_response_model/get_created_user_response_model.dart';
import '../connect_end/model/get_pharmacy_kyc_response_model/get_pharmacy_kyc_response_model.dart';
import '../connect_end/model/get_reminder_by_id/get_reminder_by_id.dart';
import '../connect_end/model/get_reminder_for_tenant_response_model/get_reminder_for_tenant_response_model.dart';
import '../connect_end/model/get_roles_response_model/get_roles_response_model.dart';
import '../connect_end/model/get_tenant_response_model/get_tenant_response_model.dart';
import '../connect_end/model/get_today_reminder_model/get_today_reminder_model.dart';
import '../connect_end/model/get_transaction_wallet_response_model/get_transaction_wallet_response_model.dart';
import '../connect_end/model/get_user_details_response_model/get_user_details_response_model.dart';
import '../connect_end/model/get_wallet_response_model/get_wallet_response_model.dart';
import '../connect_end/model/initiate_payment_response_model/initiate_payment_response_model.dart';
import '../connect_end/model/initiate_payment_wallet_entity_model.dart';
import '../connect_end/model/list_market_product_response_model/list_market_product_response_model.dart';
import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/pay_with_wallet_entity_model.dart';
import '../connect_end/model/pay_with_wallet_response_model/pay_with_wallet_response_model.dart';
import '../connect_end/model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../connect_end/model/resend_otp_entity_model.dart';
import '../connect_end/model/resend_otp_response_model/resend_otp_response_model.dart';
import '../connect_end/model/reset_password_entity_model.dart';
import '../connect_end/model/roles_entity_model.dart';
import '../connect_end/model/set_pin_entity_model.dart';
import '../connect_end/model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../connect_end/model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import '../connect_end/model/update_business_owner_profile_entity_model/update_business_owner_profile_entity_model.dart';
import '../connect_end/model/update_doses_status_model/update_doses_status_model.dart';
import '../connect_end/model/update_pharmacy_kyc_entity_model/update_pharmacy_kyc_entity_model.dart';
import '../connect_end/model/update_practitioner_profile_entity_model/update_practitioner_profile_entity_model.dart';
import '../connect_end/model/update_reminder_entity_model/update_reminder_entity_model.dart';
import '../connect_end/model/update_role_entity_model.dart';
import '../connect_end/model/update_user_entity_model.dart';
import '../connect_end/model/upload_image_reminder_response_model/upload_image_reminder_response_model.dart';
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

  Future<GetPharmacyKycResponseModel> getHealthCareKyc() async {
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

  Future<dynamic> updateHealthCareKyc(
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

  Future<dynamic> addDoctor(CreateUserEntityModel createEntity) async {
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

  Future<GetCreatedUserResponseModel> getDoctors() async {
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

  Future<dynamic> updateDoctor(UpdateUserEntityModel createUser) async {
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

  Future<dynamic> deleteDoctor(String id) async {
    try {
      final response = await _service.call(
        UrlConfig.delete_user,
        RequestMethod.patch,
        data: {'membershipId': id},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  ///
  /// reminder flow
  Future<CreateReminderResponseModel> createReminder(
    CreateTenantReminderEntityModel createReminderEntityModel,
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

  Future<dynamic> getUserDetailsByTenant({String? phone}) async {
    try {
      final response = await _service.call(
        UrlConfig.get_user_details_by_tenant,
        RequestMethod.post,
        data: {"phone": phone},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> registerUserByTenant({String? phone}) async {
    try {
      final response = await _service.call(
        UrlConfig.register_user_by_tenant,
        RequestMethod.post,
        data: {"phone": phone},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetReminderForTenantResponseModel> getReminderForTenant({
    String? status,
    String? page,
    String? limit,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.reminders_tenant,
        RequestMethod.get,
        data: {'status': status, 'page': page, 'limit': limit},
      );
      logger.d(response.data);
      return GetReminderForTenantResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetReminderForTenantResponseModel> getReminderForTenantAll({
    String? page,
    String? limit,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.reminders_tenant,
        RequestMethod.get,
        data: {'page': page, 'limit': limit},
      );
      logger.d(response.data);
      return GetReminderForTenantResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetReminderForTenantResponseModel> getReminderForTenantByUserIdAll({
    String? page,
    String? limit,
    String? userId,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.reminders_tenant}/$userId',
        RequestMethod.get,
        data: {'page': page, 'limit': limit},
      );
      logger.d(response.data);
      return GetReminderForTenantResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetReminderForTenantResponseModel> getReminderForTenantByUserId({
    String? status,
    String? page,
    String? limit,
    String? userId,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.reminders_tenant}/$userId',
        RequestMethod.get,
        data: {'status': status, 'page': page, 'limit': limit},
      );
      logger.d(response.data);
      return GetReminderForTenantResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetReminderById> getReminderByUserId({String? userId}) async {
    try {
      final response = await _service.call(
        '${UrlConfig.reminder}/$userId',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetReminderById.fromJson(response.data);
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

  Future<GetSingleMarketProductResponseModel> getSingleMarketPlaceProduct({
    String? productIds,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.wholesale_marketplace_products}/$productIds',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetSingleMarketProductResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<ListMarketProductResponseModel> getListedMarketPlaceProduct({
    String? page,
    String? sortPrice,
    String? search,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.wholesale_marketplace_products,
        RequestMethod.getParams,
        queryParams: {
          'page': page,
          'limit': '10',
          'search': search,
          'priceSort': sortPrice,
        },
      );
      logger.d(response.data);
      return ListMarketProductResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<ListMarketProductResponseModel> getListedMarketPlaceProductWithCatId({
    String? page,
    String? catId,
    String? sortPrice,
    String? search,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.wholesale_marketplace_products,
        RequestMethod.getParams,
        queryParams: {
          'page': page,
          'limit': '10',
          'search': search,
          'categoryId': catId,
          'priceSort': sortPrice,
        },
      );
      logger.d(response.data);
      return ListMarketProductResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<DistributorWholesaleCategoryModel> wholesaleCategories({
    String? page,
    String? search,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.wholesale_categories,
        RequestMethod.getParams,
        queryParams: {'page': page, 'limit': 20, 'search': search},
      );
      logger.d(response.data);
      return DistributorWholesaleCategoryModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
