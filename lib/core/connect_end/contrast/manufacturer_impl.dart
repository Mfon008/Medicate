import 'package:dio/dio.dart';
import 'package:medicate_app/core/connect_end/model/manufacturer_signup_entity_model.dart';

import '../../api_folder/manufacturer_api.dart';
import '../../core_folder/app/app.locator.dart';
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
import '../model/upload_product_image_response_model/upload_product_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';

class ManufacturerContractImpl {
  final _api = locator<ManufacturerApi>();

  Future<PharmacyLoginResponseModel> login(
    LoginEntityModel loginEntity,
  ) async => await _api.signIn(loginEntity);

  Future<SignUpPhamaryResponseModel> signUp(
    ManufacturerSignupEntityModel signUpEntity,
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

  Future<dynamic> changePhoneNo({String? changePhoneNo, String? id}) async =>
      await _api.changePhoneNo(phone: changePhoneNo, id: id);

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

  Future<DistributorWholesaleCategoryModel> wholesaleCategories({
    String? page,
    String? search,
  }) async => await _api.wholesaleCategories(page: page, search: search);

  Future<NafdacRegistrationNumberResponseModel> nafdacRegNo(
    NafdacRegistrationNumberEntityModel nafdacRegNoync,
  ) async => await _api.nafdacRegNo(nafdacRegNoync);

  Future<UploadProductImageResponseModel> uploadProductimage(
    MultipartFile file,
  ) async => await _api.uploadProductimage(file);

  Future<dynamic> createProduct(
    CreateDistributorProductEntityModel createproduct,
  ) async => await _api.createProduct(createproduct);

  Future<dynamic> publishProduct(String productId) async =>
      await _api.publishProduct(productId);

  Future<dynamic> unPublishProduct(String productId) async =>
      await _api.unPublishProduct(productId);

  Future<dynamic> deleteProduct(String productId) async =>
      await _api.deleteProduct(productId);
  Future<GetAllProductListResponseModel> getProductList({String? page,String? search,String? categoryId}) async  =>
      await _api.getProductList(page: page,search: search,categoryId: categoryId);
  Future<GetSingleProductResponseModel> getSingleProductById({String? productId}) async   =>
      await _api.getSingleProductById(productId: productId);
  
}
