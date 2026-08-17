// ignore_for_file: strict_top_level_inference

import 'package:dio/dio.dart';
import 'package:medicate_app/core/connect_end/model/manufacturer_signup_entity_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contrast/manufacturer_impl.dart';
import '../model/create_distributor_product_entity_model/create_distributor_product_entity_model.dart';
import '../model/distributor_wholesale_category_model/distributor_wholesale_category_model.dart';
import '../model/forgot_password_response_model/forgot_password_response_model.dart';
import '../model/get_all_product_list_response_model/get_all_product_list_response_model.dart';
import '../model/get_single_product_response_model/get_single_product_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/nafdac_registration_number_entity_model.dart';
import '../model/nafdac_registration_number_response_model/nafdac_registration_number_response_model.dart';
import '../model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import '../model/update_product_management_entity_model/update_product_management_entity_model.dart';
import '../model/upload_product_image_response_model/upload_product_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';

class ManufacturerRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<ManufacturerContractImpl>();

  Future<PharmacyLoginResponseModel> signIn(
    LoginEntityModel signInEntity,
  ) async {
    final response = await _contract.login(signInEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  Future<SignUpPhamaryResponseModel> signUp(
    ManufacturerSignupEntityModel signUpEntity,
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

  Future<SetPinPharmResponseModel> setPin(
    SetPinEntityModel setPinEntity,
  ) async {
    final response = await _contract.setPin(setPinEntity);
    _chache(response);
    _session.isLogin = true;
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

  Future<NafdacRegistrationNumberResponseModel> nafdacRegNo(
    NafdacRegistrationNumberEntityModel nafdacRegNoync,
  ) async {
    final response = await _contract.nafdacRegNo(nafdacRegNoync);
    return response;
  }

  Future<dynamic> createProduct(
    CreateDistributorProductEntityModel createproduct,
  ) async {
    final response = await _contract.createProduct(createproduct);
    return response;
  }

  Future<dynamic> updateProduct({
    UpdateProductManagementEntityModel? updateproduct,
    String? productId,
  }) async {
    final response = await _contract.updateProduct(updateproduct:updateproduct,productId: productId);
    return response;
  }

  Future<dynamic> publishProduct(String productId) async {
    final response = await _contract.publishProduct(productId);
    return response;
  }

  Future<dynamic> unPublishProduct(String productId) async {
    final response = await _contract.unPublishProduct(productId);
    return response;
  }

  Future<dynamic> deleteProduct(String productId) async {
    final response = await _contract.deleteProduct(productId);
    return response;
  }

  Future<UploadProductImageResponseModel> uploadProductimage(
    MultipartFile file,
  ) async {
    final response = await _contract.uploadProductimage(file);
    return response;
  }

  Future<GetAllProductListResponseModel> getProductList({
    String? page,
    String? search,
    String? categoryId,
  }) async {
    final response = await _contract.getProductList(
      page: page,
      search: search,
      categoryId: categoryId,
    );
    return response;
  }

  Future<GetSingleProductResponseModel> getSingleProductById({
    String? productId,
  }) async {
    final response = await _contract.getSingleProductById(productId: productId);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.data.accessToken;
      _session.authRefreshToken = data.data.refreshToken;
      _session.usersData = data.data.toJson();
      _session.authType = 'manufacturer';
    }
  }
}
