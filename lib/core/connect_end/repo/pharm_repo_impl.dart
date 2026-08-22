// ignore_for_file: strict_top_level_inference

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contrast/pharm_contract_impl.dart';
import '../model/create_payment_wallet_entity_model.dart';
import '../model/create_payment_wallet_model/create_payment_wallet_model.dart';
import '../model/create_reminder_response_model/create_reminder_response_model.dart';
import '../model/create_tenant_reminder_entity_model/create_tenant_reminder_entity_model.dart';
import '../model/create_user_entity_model.dart';
import '../model/distributor_wholesale_category_model/distributor_wholesale_category_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_created_user_response_model/get_created_user_response_model.dart';
import '../model/get_pharmacy_kyc_response_model/get_pharmacy_kyc_response_model.dart';
import '../model/get_reminder_by_id/get_reminder_by_id.dart';
import '../model/get_reminder_for_tenant_response_model/get_reminder_for_tenant_response_model.dart';
import '../model/get_roles_response_model/get_roles_response_model.dart';
import '../model/get_single_market_product_response_model/get_single_market_product_response_model.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/get_today_reminder_model/get_today_reminder_model.dart';
import '../model/get_transaction_wallet_response_model/get_transaction_wallet_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/get_wallet_response_model/get_wallet_response_model.dart';
import '../model/initiate_payment_response_model/initiate_payment_response_model.dart';
import '../model/initiate_payment_wallet_entity_model.dart';
import '../model/list_market_product_response_model/list_market_product_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/pay_with_wallet_entity_model.dart';
import '../model/pay_with_wallet_response_model/pay_with_wallet_response_model.dart';
import '../model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/roles_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import '../model/sign_up_pharmacy_entity_model.dart';
import '../model/update_doses_status_model/update_doses_status_model.dart';
import '../model/update_pharmacy_kyc_entity_model/update_pharmacy_kyc_entity_model.dart';
import '../model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
import '../model/update_reminder_entity_model/update_reminder_entity_model.dart';
import '../model/update_role_entity_model.dart';
import '../model/update_user_entity_model.dart';
import '../model/upload_image_reminder_response_model/upload_image_reminder_response_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';
import '../model/wholesale_add_to_cart_entity_model.dart';
import '../model/wholesale_get_product_added_to_cart_response_model/wholesale_get_product_added_to_cart_response_model.dart';

@lazySingleton
class PharmRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<PharmContractsImpl>();

  Future<PharmacyLoginResponseModel> signIn(
    LoginEntityModel signInEntity,
  ) async {
    final response = await _contract.login(signInEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  Future<SignUpPhamaryResponseModel> signUp(
    SignUpPharmacyEntityModel signUpEntity,
  ) async {
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

  Future<VerifyPharmacyOtpModel> verifyPhoneOtp(
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

  Future<dynamic> changePhoneNo({String? changePhoneNo, String? id}) async {
    final response = await _contract.changePhoneNo(
      changePhoneNo: changePhoneNo,
      id: id,
    );
    return response;
  }

  Future<dynamic> sendOtp(String phone) async {
    final response = await _contract.sendOtp(phone);
    return response;
  }

  Future<dynamic> verifyChangePhoneOtp(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async {
    final response = await _contract.verifyChangePhoneOtp(verifyPhoneEntity);
    return response;
  }

  Future<dynamic> verifyChangePhoneOtpChange(
    VerifyPhoneEntityModel verifyPhoneEntity,
  ) async {
    final response = await _contract.verifyChangePhoneOtpChange(
      verifyPhoneEntity,
    );
    return response;
  }

  Future<GetUserDetailsResponseModel> getUserDetails(String phoneNo) async {
    final response = await _contract.getUserDetails(phoneNo);
    return response;
  }

  Future<GetTenantResponseModel> getTenant() async {
    final response = await _contract.getTenant();
    return response;
  }

  Future<GetPharmacyKycResponseModel> getPharmacyKyc() async {
    final response = await _contract.getPharmacyKyc();
    return response;
  }

  Future<dynamic> updatePharmacyKyc(
    UpdatePharmacyKycEntityModel updateKyc,
  ) async {
    final response = await _contract.updatePharmacyKyc(updateKyc);
    return response;
  }

  Future<dynamic> updatePharmacy(
    UpdatePharmacyProfileEntityModel? updatePharmacy,
  ) async {
    final response = await _contract.updatePharmacy(updatePharmacy);
    return response;
  }

  Future<UploadImageResponseModel> uploadImage(MultipartFile file) async {
    final response = await _contract.uploadImage(file);
    return response;
  }

  Future<SetPinPharmResponseModel> setPin(
    SetPinEntityModel setPinEntity,
  ) async {
    final response = await _contract.setPin(setPinEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  Future<dynamic> addRole(RolesEntityModel roleEntity) async {
    final response = await _contract.addRole(roleEntity);
    return response;
  }

  Future<GetRolesResponseModel> getRoles() async {
    final response = await _contract.getRoles();
    return response;
  }

  Future<dynamic> updateRoles(UpdateRoleEntityModel updateRole) async {
    final response = await _contract.updateRoles(updateRole);
    return response;
  }

  Future<dynamic> deleteRole(String roleId) async {
    final response = await _contract.deleteRole(roleId);
    return response;
  }

  Future<dynamic> addUser(CreateUserEntityModel createEntity) async {
    final response = await _contract.addUser(createEntity);
    return response;
  }

  Future<GetCreatedUserResponseModel> getUsers() async {
    final response = await _contract.getUsers();
    return response;
  }

  Future<dynamic> updateUser(UpdateUserEntityModel updateEntity) async {
    final response = await _contract.updateUser(updateEntity);
    return response;
  }

  Future<dynamic> deleteUser(String id) async {
    final response = await _contract.deleteUser(id);
    return response;
  }

  Future<dynamic> uploadProPicture(MultipartFile file) async {
    final response = await _contract.uploadProPicture(file);
    return response;
  }

  Future<CreateReminderResponseModel> createReminder(
    CreateTenantReminderEntityModel createReminderEntityModel,
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

  Future<dynamic> getUserDetailsByTenant({String? phone}) async {
    final response = await _contract.getUserDetailsByTenant(phone: phone);
    return response;
  }

  Future<dynamic> registerUserByTenant({String? phone}) async {
    final response = await _contract.registerUserByTenant(phone: phone);
    return response;
  }

  Future<GetReminderForTenantResponseModel> getReminderForTenant({
    String? status,
    String? page,
    String? limit,
  }) async {
    final response = await _contract.getReminderForTenant(
      status: status,
      page: page,
      limit: limit,
    );
    return response;
  }

  Future<GetReminderForTenantResponseModel> getReminderForTenantAll({
    String? page,
    String? limit,
  }) async {
    final response = await _contract.getReminderForTenantAll(
      page: page,
      limit: limit,
    );
    return response;
  }

  Future<GetReminderForTenantResponseModel> getReminderForTenantByUserIdAll({
    String? page,
    String? limit,
    String? userId,
  }) async {
    final response = await _contract.getReminderForTenantByUserIdAll(
      page: page,
      limit: limit,
      userId: userId,
    );
    return response;
  }

  Future<GetReminderForTenantResponseModel> getReminderForTenantByUserId({
    String? status,
    String? page,
    String? limit,
    String? userId,
  }) async {
    final response = await _contract.getReminderForTenantByUserId(
      status: status,
      page: page,
      limit: limit,
      userId: userId,
    );
    return response;
  }

  Future<GetReminderById> getReminderByUserId({String? userId}) async {
    final response = await _contract.getReminderByUserId(userId: userId);

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

  Future<ListMarketProductResponseModel> getListedMarketPlaceProduct({
    String? page,
    String? sortPrice,
    String? search,
  }) async {
    final response = await _contract.getListedMarketPlaceProduct(
      page: page,
      search: search,
      sortPrice: sortPrice,
    );
    return response;
  }

  Future<ListMarketProductResponseModel> getListedMarketPlaceProductWithCatId({
    String? page,
    String? catId,
    String? sortPrice,
    String? search,
  }) async {
    final response = await _contract.getListedMarketPlaceProductWithCatId(
      page: page,
      search: search,
      sortPrice: sortPrice,
      catId: catId,
    );
    return response;
  }

  Future<DistributorWholesaleCategoryModel> wholesaleCategories({
    String? page,
    String? search,
  }) async {
    final response = await _contract.wholesaleCategories(
      page: page,
      search: search,
    );
    return response;
  }

  Future<GetSingleMarketProductResponseModel> getSingleMarketPlaceProduct({
    String? productIds,
  }) async {
    final response = await _contract.getSingleMarketPlaceProduct(
      productIds: productIds,
    );
    return response;
  }

  Future<dynamic> addWholesaleProductToCart(
    WholesaleAddToCartEntityModel? addToCart,
  ) async {
    final response = await _contract.addWholesaleProductToCart(addToCart);
    return response;
  }

  Future<WholesaleGetProductAddedToCartResponseModel>
  getWholesaleProductAddedToCart() async {
    final response = await _contract.getWholesaleProductAddedToCart();
    return response;
  }

  Future<dynamic> updateWholesaleProductToCart({
    String? productId,
    int? quantity,
  }) async {
    final response = await _contract.updateWholesaleProductToCart(
      productId: productId,
      quantity: quantity,
    );
    return response;
  }

  Future<dynamic> removeWholesaleProductItemFromCart(String? productId) async {
    final response = await _contract.removeWholesaleProductItemFromCart(
      productId,
    );
    return response;
  }

  Future<dynamic> clearWholesaleProductFromCart(String? productId) async {
    final response = await _contract.clearWholesaleProductFromCart(productId);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.data.accessToken;
      _session.authRefreshToken = data.data.refreshToken;
      _session.usersData = data.data.toJson();
      _session.authType = 'pharmacy';
    }
  }
}
