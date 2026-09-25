// ignore_for_file: deprecated_member_use, use_build_context_synchronously, strict_top_level_inference, public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/connect_end/model/distributor_wholesale_category_model/distributor_wholesale_category_model.dart';
import 'package:medicate_app/core/connect_end/model/forgot_password_response_model/forgot_password_response_model.dart';
import 'package:medicate_app/core/connect_end/model/get_distributor_kyc_response_model/coverage_areas.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/distributor.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/import_permit.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/importer.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/manufacturer.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/manufacturer_authorization_letter.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/nafdac_permit.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/pharmaceutical_distribution_license.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/pharmacy_council_license.dart';
import 'package:medicate_app/core/connect_end/model/sign_up_phamary_response_model/sign_up_phamary_response_model.dart';
import 'package:medicate_app/core/connect_end/model/update_distributor_profile_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_product_management_entity_model/update_product_management_entity_model.dart';
import 'package:medicate_app/main.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../ui/widget/button.dart';
import '../../../ui/widget/text.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../app_assets/app_utils.dart';
import '../../app_assets/app_validation.dart';
import '../../app_assets/decouncer_class.dart';
import '../../app_assets/image.dart';
import '../../app_assets/image_picker.dart';
import '../../app_assets/state_lga_format.dart';
import '../../config/colors.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/business_addresses_entity.dart';
import '../model/create_distributor_product_entity_model/create_distributor_product_entity_model.dart';
import '../model/distributor_wholesale_category_model/category.dart';
import '../model/get_all_product_list_response_model/get_all_product_list_response_model.dart';
import '../model/get_distributor_kyc_response_model/get_distributor_kyc_response_model.dart';
import '../model/get_distributor_profile_response_model/business_addresses.dart';
import '../model/get_distributor_profile_response_model/get_distributor_profile_response_model.dart';
import '../model/get_incoming_order_ddetail_response_model/get_incoming_order_ddetail_response_model.dart';
import '../model/get_single_product_response_model/get_single_product_response_model.dart';
import '../model/get_transaction_wallet_response_model/get_transaction_wallet_response_model.dart';
import '../model/get_user_details_response_model/get_user_details_response_model.dart';
import '../model/get_wallet_response_model/get_wallet_response_model.dart';
import '../model/initiate_payment_response_model/initiate_payment_response_model.dart';
import '../model/level_three_distributor_kyc_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/documents.dart';
import '../model/list_incoming_orders_response_model/list_incoming_orders_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/manufacturer_signup_entity_model.dart';
import '../model/nafdac_registration_number_entity_model.dart';
import '../model/nafdac_registration_number_response_model/nafdac_registration_number_response_model.dart';
import '../model/pharmacy_login_response_model/pharmacy_login_response_model.dart';
import '../model/resend_otp_entity_model.dart';
import '../model/resend_otp_response_model/resend_otp_response_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/second_level_distributor_kyc_entity_model/cac_certificate.dart';
import '../model/second_level_distributor_kyc_entity_model/company_logo.dart';
import '../model/second_level_distributor_kyc_entity_model/gmp_certificate.dart';
import '../model/second_level_distributor_kyc_entity_model/nafdac_manufacturing_license.dart';
import '../model/second_level_distributor_kyc_entity_model/product_registration_evidence.dart';
import '../model/second_level_distributor_kyc_entity_model/second_level_distributor_kyc_entity_model.dart';
import '../model/set_pin_entity_model.dart';
import '../model/set_pin_pharm_response_model/set_pin_pharm_response_model.dart';
import '../model/upload_image_response_model/upload_image_response_model.dart';
import '../model/upload_product_image_response_model/upload_product_image_response_model.dart';
import '../model/verify_pass_otp_respnse_model/verify_pass_otp_respnse_model.dart';
import '../model/verify_pharmacy_otp_model/verify_pharmacy_otp_model.dart';
import '../model/verify_phone_entity_model.dart';
import '../repo/manufacturer_repo_impl.dart';
import 'package:medicate_app/core/connect_end/model/create_distributor_product_entity_model/image.dart'
    as iml;
import 'package:medicate_app/core/connect_end/model/get_single_product_response_model/image.dart'
    as im;

class ManufacturerViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger(' ManufacturerViewModel');

  final repositoryImply = ManufacturerRepoImpl();

  int _start = 60;
  int page = 1;
  // bool isHideLga = false;

  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingNaf = false;
  bool get isLoadingNaf => _isLoadingNaf;
  bool _isLoadingProductImage = false;
  bool get isLoadingProductImage => _isLoadingProductImage;

  List<Documents> kycDistributorDocumentsList = [];
  List<Documents> kycManufacturerDocumentsList = [];
  List<Documents> kycImporterDocumentsList = [];

  final _pickImage = ImagePickerHandler();

  bool _isLoadingCAC = false;
  bool get isLoadingCAC => _isLoadingCAC;

  bool _isLoadingGMP = false;
  bool get isLoadingGMP => _isLoadingGMP;

  bool _isLoadingNAF = false;
  bool get isLoadingNAF => _isLoadingNAF;

  bool _isLoadingProd = false;
  bool get isLoadingProd => _isLoadingProd;

  bool _isLoadingLogo = false;
  bool get isLoadingLogo => _isLoadingLogo;

  ManufacturerViewModel({this.context});

  final debouncer = Debouncer(milliseconds: 200);

  final defaultPinTheme = PinTheme(
    width: 50.w,
    height: 50.h,
    margin: EdgeInsets.only(right: 10.w),
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      color: AppColors.grey, // light background
      border: Border.all(color: AppColors.transparent),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  InitiatePaymentResponseModel? _initiatePaymentResponseModel;
  InitiatePaymentResponseModel? get initiatePaymentResponseModel =>
      _initiatePaymentResponseModel;
  GetWalletResponseModel? _getWalletBalanceResponseModel;
  GetWalletResponseModel? get getWalletBalanceResponseModel =>
      _getWalletBalanceResponseModel;
  GetTransactionWalletResponseModel? _getWalletTransactionHistoryResponseModel;
  GetTransactionWalletResponseModel?
  get getWalletTransactionHistoryResponseModel =>
      _getWalletTransactionHistoryResponseModel;

  SignUpPhamaryResponseModel? _signUpPhamaryResponseModel;
  PharmacyLoginResponseModel? _loginPharmacyResponseModel;
  VerifyPharmacyOtpModel? _verifyPharmOtpRespnseModel;
  SetPinPharmResponseModel? _setPinPharmResponseModel;
  ResendOtpResponseModel? _resendOtpResponseModel;
  ForgotPasswordResponseModel? _forgotPasswordResponseModel;
  VerifyPassOtpRespnseModel? _verifyPassOtpRespnseModel;
  DistributorWholesaleCategoryModel? _distributorWholesaleCategoryModel;
  DistributorWholesaleCategoryModel? get distributorWholesaleCategoryModel =>
      _distributorWholesaleCategoryModel;
  UploadProductImageResponseModel? _uploadProductImageResponseModel;
  UploadProductImageResponseModel? get uploadProductImageResponseModel =>
      _uploadProductImageResponseModel;
  NafdacRegistrationNumberResponseModel? _nafdacRegistrationNumberResponseModel;
  NafdacRegistrationNumberResponseModel?
  get nafdacRegistrationNumberResponseModel =>
      _nafdacRegistrationNumberResponseModel;

  ListIncomingOrdersResponseModel? _listIncomingOrdersResponseModel;
  ListIncomingOrdersResponseModel? get listIncomingOrdersResponseModel =>
      _listIncomingOrdersResponseModel;
  GetIncomingOrderDdetailResponseModel? _getIncomingOrderDdetailResponseModel;
  GetIncomingOrderDdetailResponseModel?
  get getIncomingOrderDdetailResponseModel =>
      _getIncomingOrderDdetailResponseModel;

  GetDistributorProfileResponseModel? _getDistributorDetailsResponseModel;
  GetDistributorProfileResponseModel? get getDistributorDetailsResponseModel =>
      _getDistributorDetailsResponseModel;

  GetUserDetailsResponseModel? _getUserDetailsResponseModel;
  GetUserDetailsResponseModel? get getUserDetailsResponseModel =>
      _getUserDetailsResponseModel;
  GetDistributorKycResponseModel? _getDistributorKycResponseModel;
  GetDistributorKycResponseModel? get getDistributorKycResponseModel =>
      _getDistributorKycResponseModel;

  UploadImageResponseModel? _uploadImageResponseModel;
  UploadImageResponseModel? get uploadImageResponseModel =>
      _uploadImageResponseModel;

  UploadImageResponseModel? _uploadImageResponseModelDisCAC;
  UploadImageResponseModel? get uploadImageResponseModelDisCAC =>
      _uploadImageResponseModelDisCAC;
  UploadImageResponseModel? _uploadImageResponseModelDisPharmLin;
  UploadImageResponseModel? get uploadImageResponseModelDisPharmLin =>
      _uploadImageResponseModelDisPharmLin;
  UploadImageResponseModel? _uploadImageResponseModelDisNAFPermit;
  UploadImageResponseModel? get uploadImageResponseModelDisNAFPermit =>
      _uploadImageResponseModelDisNAFPermit;
  UploadImageResponseModel? _uploadImageResponseModelDisPharmCouncilLin;
  UploadImageResponseModel? get uploadImageResponseModelDisPharmCouncilLin =>
      _uploadImageResponseModelDisPharmCouncilLin;
  UploadImageResponseModel? _uploadImageResponseModelDisComLogo;
  UploadImageResponseModel? get uploadImageResponseModelDisComLogo =>
      _uploadImageResponseModelDisComLogo;

  UploadImageResponseModel? _uploadImageResponseModelManCAC;
  UploadImageResponseModel? get uploadImageResponseModelManCAC =>
      _uploadImageResponseModelManCAC;
  UploadImageResponseModel? _uploadImageResponseModelManGMP;
  UploadImageResponseModel? get uploadImageResponseModelManGMP =>
      _uploadImageResponseModelManGMP;
  UploadImageResponseModel? _uploadImageResponseModelNAFManLin;
  UploadImageResponseModel? get uploadImageResponseModelNAFManLin =>
      _uploadImageResponseModelNAFManLin;
  UploadImageResponseModel? _uploadImageResponseModelManProdRegEvi;
  UploadImageResponseModel? get uploadImageResponseModelManProdRegEvi =>
      _uploadImageResponseModelManProdRegEvi;
  UploadImageResponseModel? _uploadImageResponseModelManComLogo;
  UploadImageResponseModel? get uploadImageResponseModelManComLogo =>
      _uploadImageResponseModelManComLogo;

  UploadImageResponseModel? _uploadImageResponseModelCAC;
  UploadImageResponseModel? get uploadImageResponseModelCAC =>
      _uploadImageResponseModelCAC;
  UploadImageResponseModel? _uploadImageResponseModelImportPermit;
  UploadImageResponseModel? get uploadImageResponseModelImportPermit =>
      _uploadImageResponseModelImportPermit;
  UploadImageResponseModel? _uploadImageResponseModelManAuthLetter;
  UploadImageResponseModel? get uploadImageResponseModelManAuthLetter =>
      _uploadImageResponseModelManAuthLetter;
  UploadImageResponseModel? _uploadImageResponseModelComLogo;
  UploadImageResponseModel? get uploadImageResponseModelComLogo =>
      _uploadImageResponseModelComLogo;

  String? pinInput;

  int? minimumOrderQuantity;
  File? imageCAC;
  String? filenameCAC;

  GlobalKey<FormState> formKeyValidate2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateCancelOrder = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateRejectOrder = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateVerify = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidateVerifyChange = GlobalKey<FormState>();
  Category? c;

  TextEditingController nafdacRegNoController = TextEditingController();
  TextEditingController cancelOrderReasonController = TextEditingController();
  TextEditingController rejectOrderReasonController = TextEditingController();

  TextEditingController manufacturerDateController = TextEditingController(
    text: '',
  );
  TextEditingController expiryDateController = TextEditingController(text: '');
  GetAllProductListResponseModel? _getAllProductListResponseModel;
  GetAllProductListResponseModel? get getAllProductListResponseModel =>
      _getAllProductListResponseModel;
  GetSingleProductResponseModel? _getSingleProductResponseModel;
  GetSingleProductResponseModel? get getSingleProductResponseModel =>
      _getSingleProductResponseModel;

  File? image;
  String? filename;
  List<iml.Image>? imagesProductList = [];

  DateTime? _selectedManDate;
  DateTime? _selectedExDate;

  im.Image? images;
  int inImage = 0;
  String searchProduct = '';

  TextEditingController? searchProductController = TextEditingController();

  List<String> lgaList = [];
  List<String> lgaListCopy = [];
  List<String> lgaAddedList = [];
  List<Map<String, dynamic>> listOfAddedLocation = [];
  // List<BusinessAddresses> listOfAddedAddress = [];
  BusinessAddresses? selectedLocation;
  CoverageAreas? coverageAreas;

  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelCAC =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelCAC =>
      _secondLevelDistributorKycEntityModelCAC;

  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelPharmLin =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelPharmLin =>
      _secondLevelDistributorKycEntityModelPharmLin;
  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelNAF =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelNAF =>
      _secondLevelDistributorKycEntityModelNAF;
  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelPharmCouncilLin =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelPharmCouncilLin =>
      _secondLevelDistributorKycEntityModelPharmCouncilLin;
  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelLogo =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelLogo =>
      _secondLevelDistributorKycEntityModelLogo;

  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelManCAC =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelManCAC =>
      _secondLevelDistributorKycEntityModelManCAC;

  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelManGMP =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelManGMP =>
      _secondLevelDistributorKycEntityModelManGMP;
  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelManNAF =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelManNAF =>
      _secondLevelDistributorKycEntityModelManNAF;
  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelManProd =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelManProd =>
      _secondLevelDistributorKycEntityModelManProd;
  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelManLogo =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelManLogo =>
      _secondLevelDistributorKycEntityModelManLogo;

  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelImpCAC =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelImpCAC =>
      _secondLevelDistributorKycEntityModelImpCAC;

  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelImpPermit =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelImpPermit =>
      _secondLevelDistributorKycEntityModelImpPermit;
  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelImpManAuthLetter =
      SecondLevelDistributorKycEntityModel();
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelImpManAuthLetter =>
      _secondLevelDistributorKycEntityModelImpManAuthLetter;
  SecondLevelDistributorKycEntityModel
  _secondLevelDistributorKycEntityModelImpLogo =
      SecondLevelDistributorKycEntityModel();

  List<String> businessTypes = [];
  SecondLevelDistributorKycEntityModel?
  get secondLevelDistributorKycEntityModelImpLogo =>
      _secondLevelDistributorKycEntityModelImpLogo;
  bool isNotReadable = false;
  bool isNotReadable2 = false;

  TextEditingController stateController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController businessAddController = TextEditingController();

  bool isSeeMore = false;

  BusinessAddresses? profileUpdate;

  void pickImage(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          image = file;
          filename = image!.path.split("/").last;
          await uploadProfilePicture(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(image).readAsBytesSync(),
              filename: image!.path.split("/").last,
            ),
          );
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> uploadProfilePicture({context, MultipartFile? file}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateDistributorProfilePicture(file!),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);
        getUserDetails(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getUserDetails(context) async {
    try {
      _isLoading = true;
      _getDistributorDetailsResponseModel = await runBusyFuture(
        repositoryImply.getUserDetails(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> updateDistributorProfile(
    context, {
    UpdateDistributorProfileEntityModel? updateEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateDistributorProfile(updateEntity!),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);
        navigate.clearStackAndShow(Routes.overviewDashboard);
      }
      _isLoading = false;
    } catch (e) {
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  getOrderPaymentStatusColorBorder(String s) {
    if (s.toLowerCase() == 'pending') {
      return AppColors.yellow.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'failed') {
      return AppColors.red.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'success') {
      return AppColors.app_green.withValues(alpha: .1);
    }
    return AppColors.infoGrey.withValues(alpha: .1);
  }

  getOrderPaymentStatusColor(String s) {
    if (s.toLowerCase() == 'pending') {
      return AppColors.yellow;
    }
    if (s.toLowerCase() == 'failed') {
      return AppColors.red;
    }
    if (s.toLowerCase() == 'success') {
      return AppColors.app_green;
    }
    return AppColors.infoGrey;
  }

  getOrderStatusColorBorder(String s) {
    if (s.toLowerCase() == 'delivered') {
      return AppColors.app_green.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'cancelled') {
      return AppColors.red.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'rejected') {
      return AppColors.red.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'pending') {
      return AppColors.yellow.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'returned') {
      return AppColors.yellow.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'confirmed') {
      return AppColors.primary.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'processing') {
      return AppColors.lightBlue.withValues(alpha: .1);
    }
    if (s.toLowerCase() == 'shipped') {
      return AppColors.purple.withValues(alpha: .1);
    }
    return AppColors.infoGrey.withValues(alpha: .1);
  }

  getOrderStatusColor(String s) {
    if (s.toLowerCase() == 'delivered') {
      return AppColors.app_green;
    }
    if (s.toLowerCase() == 'cancelled') {
      return AppColors.red;
    }
    if (s.toLowerCase() == 'rejected') {
      return AppColors.red;
    }
    if (s.toLowerCase() == 'pending') {
      return AppColors.yellow;
    }
    if (s.toLowerCase() == 'returned') {
      return AppColors.yellow;
    }
    if (s.toLowerCase() == 'confirmed') {
      return AppColors.primary;
    }
    if (s.toLowerCase() == 'processing') {
      return AppColors.lightBlue;
    }
    if (s.toLowerCase() == 'shipped') {
      return AppColors.purple;
    }
    return AppColors.infoGrey;
  }

  advanceStatusHighlights({String? stat, String? text}) {
    if (stat == 'PENDING' && text == 'confirmed') {
      return false;
    }
    if (stat == 'PENDING' && text == 'cancelled' ||
        stat == 'CONFIRMED' && text == 'cancelled' ||
        stat == 'PROCESSING' && text == 'cancelled' ||
        stat == 'SHIPPED' && text == 'cancelled') {
      return false;
    }
    if (stat == 'PENDING' && text == 'rejected') {
      return false;
    }
    if (stat == 'CONFIRMED' && text == 'processing') {
      return false;
    }
    if (stat == 'PROCESSING' && text == 'shipped') {
      return false;
    }
    if (stat == 'SHIPPED' && text == 'delivered') {
      return false;
    }
    if (stat == 'DELIVERED' && text == 'returned') {
      return false;
    }
    return true;
  }

  getFilterTextOrder(s) {
    if (s == 'All') {
      return 'All';
    }
    if (s == 'Pending') {
      return 'Pending';
    }
    if (s == 'Confirmed') {
      return 'Confirmed';
    }
    if (s == 'Packaging') {
      return 'Processing';
    }
    if (s == 'In Transit') {
      return 'Shipped';
    }
    if (s == 'Delivered') {
      return 'Delivered';
    }
    if (s == 'Cancelled') {
      return 'Cancelled';
    }
    if (s == 'Rejected') {
      return 'Rejected';
    }
    if (s == 'Returned') {
      return 'Returned';
    }
  }

  returnFulfillmentIncomingOrderText(String s) {
    if (s.toLowerCase() == 'pending') {
      return 'confrimed';
    }
    if (s.toLowerCase() == 'confirmed') {
      return 'processing';
    }
    if (s.toLowerCase() == 'processing') {
      return 'out for delivery';
    }
    if (s.toLowerCase() == 'shipped') {
      return 'delivered';
    }
    if (s.toLowerCase() == 'delivered') {
      return 'Delivered';
    }
  }

  getFulfillmentOrderColor({
    bool? completed,
    bool? current,
    bool? completed2,
    bool? current2,
  }) {
    if (completed2 == false && current2 == true || completed == true) {
      return AppColors.app_green;
    } else if (completed == false &&
        current == true &&
        completed2 == false &&
        current2 == false) {
      return AppColors.amber;
    } else {
      return AppColors.grey;
    }
  }

  getFulfillmentOrderColorArrow({
    bool? completed,
    bool? current,
    bool? completed2,
    bool? current2,
  }) {
    if (completed2 == false && current2 == true || completed == true) {
      return AppColors.app_green;
    } else if (completed == false &&
        current == true &&
        completed2 == false &&
        current2 == false) {
      return AppColors.grey1;
    } else {
      return AppColors.infoGrey;
    }
  }

  getFulfillmentOrderTextColor({
    bool? completed,
    bool? current,
    bool? completed2,
    bool? current2,
  }) {
    if (completed2 == false && current2 == true || completed == true) {
      return AppColors.white;
    } else if (completed == false &&
        current == true &&
        completed2 == false &&
        current2 == false) {
      return AppColors.white;
    } else {
      return AppColors.infoGrey;
    }
  }

  getFulfillmentOrderTextStatusColor({
    bool? completed,
    bool? current,
    bool? completed2,
    bool? current2,
  }) {
    if (completed2 == false && current2 == true || completed == true) {
      return AppColors.green;
    } else if (completed == false &&
        current == true &&
        completed2 == false &&
        current2 == false) {
      return AppColors.reminder;
    } else {
      return AppColors.infoGrey;
    }
  }

  Future<void> selectManDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedManDate ?? DateTime.now(), // Initial date shown
      firstDate: DateTime(1900), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );
    if (picked != null && picked != _selectedManDate) {
      _selectedManDate = picked;
      manufacturerDateController.text = DateFormat(
        'yyyy-MM-dd',
      ).format(_selectedManDate!);
    }
    notifyListeners();
  }

  Future<void> selectExDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedExDate ?? DateTime.now(), // Initial date shown
      firstDate: DateTime(1900), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );
    if (picked != null && picked != _selectedExDate) {
      _selectedExDate = picked;
      expiryDateController.text = DateFormat(
        'yyyy-MM-dd',
      ).format(_selectedExDate!);
    }
    notifyListeners();
  }

  String returnReminderPhoneStructureWith234(String phoneNo) {
    if (phoneNo.substring(0).startsWith('0')) {
      phoneNo = '+234${phoneNo.substring(1)}';
    } else {
      phoneNo = '+234$phoneNo';
    }
    notifyListeners();
    return phoneNo;
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        _start--;
      }
      notifyListeners();
    });
  }

  void modalBottomSheetMenu({
    context,
    String? phoneNo,
    String? id,
    String? name,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9, // 80% of screen height
            minChildSize: 0.5, // Can be dragged to 30% of screen height
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<ManufacturerViewModel>.reactive(
                viewModelBuilder: () => ManufacturerViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, ManufacturerViewModel model, _) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // 👈 pushes content above keyboard
                    ), //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                            horizontal: 20.w,
                          ),
                          child: Form(
                            key: formKeyValidate,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 30.w),
                                    TextView(
                                      text: 'Verify Phone Number',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        AppImage.x,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),

                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                    ),
                                    children: [
                                      const TextSpan(
                                        text:
                                            "Enter the 4-digit code we sent to your phone number ",
                                      ),
                                      TextSpan(
                                        text: "$phoneNo",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: " to complete your verification.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Center(
                                  child: Pinput(
                                    length: 4,
                                    obscureText: true,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    submittedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: AppValidator.validateOTP(),
                                    onCompleted: (pin) {
                                      pinInput = pin;
                                      notifyListeners();
                                    },
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Didn’t receive a code? ",
                                        ),
                                        TextSpan(
                                          text: "Resend",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                model.resendOtpManufacturer(
                                                  context,
                                                  resendotp:
                                                      ResendOtpEntityModel(
                                                        phone: phoneNo,
                                                      ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Incorrect Number? ",
                                        ),
                                        TextSpan(
                                          text: "Change",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => navigate.navigateTo(
                                              Routes
                                                  .manufacturerChangePhoneNumber,
                                              arguments:
                                                  ManufacturerChangePhoneNumberArguments(
                                                    id: id,
                                                  ),
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: model.isLoading ? 20.h : 0.h),
                                model.isLoading
                                    ? Center(
                                        child: SpinKitFadingCircle(
                                          color: AppColors.primary,
                                          size: 28.sp,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(height: 300.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Verify',
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  isLoading: model.isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    if (formKeyValidate.currentState!
                                        .validate()) {
                                      model.verifyOtpManufacturer(
                                        context,
                                        verifyEntity: VerifyPhoneEntityModel(
                                          phone: '$phoneNo',
                                          otp: pinInput,
                                        ),
                                      );
                                    }
                                    notifyListeners();
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void modalBottomSheetMenuVerifyPhone({
    context,
    String? phoneNo,
    String? id,
    String? name,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9, // 80% of screen height
            minChildSize: 0.5, // Can be dragged to 30% of screen height
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<ManufacturerViewModel>.reactive(
                viewModelBuilder: () => ManufacturerViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, ManufacturerViewModel model, _) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // 👈 pushes content above keyboard
                    ), //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                            horizontal: 20.w,
                          ),
                          child: Form(
                            key: formKeyValidateVerify,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 30.w),
                                    TextView(
                                      text: 'Verify Phone Number',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        AppImage.x,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),

                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                    ),
                                    children: [
                                      const TextSpan(
                                        text:
                                            "Enter the 4-digit code we sent to your phone number ",
                                      ),
                                      TextSpan(
                                        text: "$phoneNo",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: " to complete your verification.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Center(
                                  child: Pinput(
                                    length: 4,
                                    obscureText: true,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    submittedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: AppValidator.validateOTP(),
                                    onCompleted: (pin) {
                                      pinInput = pin;
                                      notifyListeners();
                                    },
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Didn’t receive a code? ",
                                        ),
                                        TextSpan(
                                          text: "Resend",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                model.resendOtpManufacturer(
                                                  context,
                                                  resendotp:
                                                      ResendOtpEntityModel(
                                                        phone: phoneNo,
                                                      ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Incorrect Number? ",
                                        ),
                                        TextSpan(
                                          text: "Change",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => navigate.navigateTo(
                                              Routes
                                                  .manufacturerChangePhoneNumber,
                                              arguments:
                                                  ManufacturerChangePhoneNumberArguments(
                                                    id: id,
                                                  ),
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: model.isLoading ? 20.h : 0.h),
                                model.isLoading
                                    ? Center(
                                        child: SpinKitFadingCircle(
                                          color: AppColors.primary,
                                          size: 28.sp,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(height: 300.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Verify',
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  isLoading: _isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    if (formKeyValidateVerify.currentState!
                                        .validate()) {
                                      verifyChangePhoneOtp(
                                        context: context,
                                        verifyPhoneEntity:
                                            VerifyPhoneEntityModel(
                                              phone: '$phoneNo',
                                              otp: pinInput,
                                            ),
                                      );
                                    }
                                    model.notifyListeners();
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void modalBottomSheetMenuChangeVerifyPhone({
    context,
    String? phoneNo,
    String? id,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9, // 80% of screen height
            minChildSize: 0.5, // Can be dragged to 30% of screen height
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ViewModelBuilder<ManufacturerViewModel>.reactive(
                viewModelBuilder: () => ManufacturerViewModel(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                builder: (_, ManufacturerViewModel model, _) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // 👈 pushes content above keyboard
                    ), //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                            horizontal: 20.w,
                          ),
                          child: Form(
                            key: formKeyValidateVerifyChange,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 30.w),
                                    TextView(
                                      text: 'Verify Phone Number',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        AppImage.x,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),

                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                    ),
                                    children: [
                                      const TextSpan(
                                        text:
                                            "Enter the 4-digit code we sent to your phone number ",
                                      ),
                                      TextSpan(
                                        text: "$phoneNo",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: " to complete your verification.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Center(
                                  child: Pinput(
                                    length: 4,
                                    obscureText: true,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    submittedPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: AppValidator.validateOTP(),
                                    onCompleted: (pin) {
                                      pinInput = pin;
                                      notifyListeners();
                                    },
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Didn’t receive a code? ",
                                        ),
                                        TextSpan(
                                          text: "Resend",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                model.resendOtpManufacturer(
                                                  context,
                                                  resendotp:
                                                      ResendOtpEntityModel(
                                                        phone: phoneNo,
                                                      ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.24.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.w,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.skyBlue,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Incorrect Number? ",
                                        ),
                                        TextSpan(
                                          text: "Change",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => navigate.navigateTo(
                                              Routes
                                                  .manufacturerChangePhoneNumber,
                                              arguments:
                                                  ManufacturerChangePhoneNumberArguments(
                                                    id: id,
                                                  ),
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: model.isLoading ? 20.h : 0.h),
                                model.isLoading
                                    ? Center(
                                        child: SpinKitFadingCircle(
                                          color: AppColors.primary,
                                          size: 28.sp,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(height: 300.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Verify',
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  isLoading: _isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    if (formKeyValidateVerifyChange
                                        .currentState!
                                        .validate()) {
                                      verifyChangePhoneOtpChange(
                                        context: context,
                                        verifyPhoneEntity:
                                            VerifyPhoneEntityModel(
                                              phone: '$phoneNo',
                                              otp: pinInput,
                                            ),
                                      );
                                    }
                                    model.notifyListeners();
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void signUpManufacturer(
    context, {
    ManufacturerSignupEntityModel? signUpEntity,
  }) async {
    try {
      _isLoading = true;
      _signUpPhamaryResponseModel = await runBusyFuture(
        repositoryImply.signUp(signUpEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_signUpPhamaryResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _signUpPhamaryResponseModel?.message,
        );
        modalBottomSheetMenu(
          context: context,
          phoneNo: signUpEntity.phone,
          id: _signUpPhamaryResponseModel?.data?.tenantId,
          name: signUpEntity.distributorManufacturerName,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void signInManufacturer(context, {LoginEntityModel? signInEntity}) async {
    try {
      _isLoading = true;
      _loginPharmacyResponseModel = await runBusyFuture(
        repositoryImply.signIn(signInEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_loginPharmacyResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _loginPharmacyResponseModel?.message ?? '',
        );
        navigate.navigateTo(Routes.overviewDashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void changeNumberManufacturer(context, {String? phone, String? id}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.changePhoneNo(changePhoneNo: phone, id: id),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 200) {
        await AppUtils.snackbar(context, message: v['message']);
        modalBottomSheetMenuChangeVerifyPhone(context: context, phoneNo: phone);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void verifyOtpManufacturer(
    context, {
    VerifyPhoneEntityModel? verifyEntity,
  }) async {
    try {
      _isLoading = true;
      _verifyPharmOtpRespnseModel = await runBusyFuture(
        repositoryImply.verifyPhoneOtp(verifyEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_verifyPharmOtpRespnseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _verifyPharmOtpRespnseModel?.message,
        );

        navigate.navigateTo(Routes.manufacturerSetupPinScreen);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void verifyChangePhoneOtp({
    context,
    VerifyPhoneEntityModel? verifyPhoneEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.verifyChangePhoneOtp(verifyPhoneEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);

        navigate.navigateTo(
          Routes.manufacturerChangePhoneNumber,
          arguments: ManufacturerChangePhoneNumberArguments(
            id: v['data']['resetToken'],
          ),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void verifyChangePhoneOtpChange({
    context,
    VerifyPhoneEntityModel? verifyPhoneEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.verifyChangePhoneOtpChange(verifyPhoneEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);

        navigate.navigateTo(Routes.manufacturerLoginScreen);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void sendOtpManufacturer(context, {String? phone}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.sendOtp(phone!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);

        modalBottomSheetMenuVerifyPhone(context: context, phoneNo: phone);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void setPinManufacturer(
    context, {
    SetPinEntityModel? setPinEntityModel,
  }) async {
    try {
      _isLoading = true;
      await Future.delayed(Duration(seconds: 2));
      _setPinPharmResponseModel = await runBusyFuture(
        repositoryImply.setPin(setPinEntityModel!),
        throwException: true,
      );
      _isLoading = false;
      if (_setPinPharmResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _setPinPharmResponseModel?.message,
        );
        navigate.navigateTo(Routes.overviewDashboard);

        SharedPreferencesService.instance.pinSet = setPinEntityModel.pin!;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void resendOtpManufacturer(context, {ResendOtpEntityModel? resendotp}) async {
    try {
      _isLoading = true;
      startTimer();
      _resendOtpResponseModel = await runBusyFuture(
        repositoryImply.resendOtp(resendotp!),
        throwException: true,
      );
      _isLoading = false;
      if (_resendOtpResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _resendOtpResponseModel?.message,
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void resetPinManufacturer(
    context, {
    ResetPasswordEntityModel? resetPasswordEntityModel,
    String? resetToken,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.resetPin(
          resetPasswordEntity: resetPasswordEntityModel!,
          resetToken: resetToken,
        ),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['data']['message']);
        navigate.navigateTo(Routes.manufacturerResetSuccessScreen);
        SharedPreferencesService.instance.pinSet =
            resetPasswordEntityModel.newPin!;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void forgotPasswordManufacturer(
    context, {
    ResendOtpEntityModel? forgotPassword,
  }) async {
    try {
      _isLoading = true;
      _forgotPasswordResponseModel = await runBusyFuture(
        repositoryImply.forgotPasword(forgotPassword!),
        throwException: true,
      );
      _isLoading = false;
      if (_forgotPasswordResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _forgotPasswordResponseModel?.message,
        );
        modalBottomSheetMenuForgotPassword(
          context: context,
          phoneNo: forgotPassword.phone,
          id:
              SharedPreferencesService.instance.usersData['_id'] ??
              SharedPreferencesService.instance.usersData['id'],
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void modalBottomSheetMenuForgotPassword({
    context,
    String? phoneNo,
    String? id,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return ViewModelBuilder<ManufacturerViewModel>.reactive(
          viewModelBuilder: () => locator<ManufacturerViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, ManufacturerViewModel model, _) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(
                  context,
                ).viewInsets.bottom, // 👈 pushes content above keyboard
              ), //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: 40.w,
                      horizontal: 20.w,
                    ),
                    child: Form(
                      key: formKeyValidate2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 30.h, width: 30.w),
                              TextView(
                                text: 'Verify Phone Number',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: SvgPicture.asset(
                                  AppImage.x,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18.h),

                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      "Enter the 4-digit code we sent to your phone number ",
                                ),
                                TextSpan(
                                  text: "$phoneNo",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                const TextSpan(
                                  text: " to complete your verification.",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Center(
                            child: Pinput(
                              length: 4,
                              obscureText: true,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: BoxDecoration(
                                  color: AppColors.transparent,
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration: BoxDecoration(
                                  color: AppColors.transparent,
                                  border: Border.all(color: AppColors.primary),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: AppValidator.validateOTP(),
                              onCompleted: (pin) {
                                pinInput = pin;
                                notifyListeners();
                              },
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.w,
                              horizontal: 16.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.skyBlue,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Didn’t receive a code? ",
                                  ),
                                  TextSpan(
                                    text: _start == 60 || _start == 0
                                        ? "Resend"
                                        : "$_start seconds",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          model.resendOtpManufacturer(
                                            context,
                                            resendotp: ResendOtpEntityModel(
                                              phone: phoneNo,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.24.h),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.w,
                              horizontal: 16.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.skyBlue,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                                children: [
                                  const TextSpan(text: "Incorrect Number? "),
                                  TextSpan(
                                    text: "Change",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => navigate.navigateTo(
                                        Routes.manufacturerChangePhoneNumber,
                                        arguments:
                                            ManufacturerChangePhoneNumberArguments(
                                              id: id,
                                            ),
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: model.isLoading ? 20.h : 0.h),
                          model.isLoading
                              ? Center(
                                  child: SpinKitFadingCircle(
                                    color: AppColors.primary,
                                    size: 28.sp,
                                  ),
                                )
                              : SizedBox.shrink(),
                          SizedBox(height: 70.h),
                          ButtonWidget(
                            border: 100.r,
                            buttonColor: AppColors.primary,
                            buttonText: 'Continue',
                            color: AppColors.white,
                            isLoading: model.isLoading,
                            buttonBorderColor: AppColors.transparent,
                            onPressed: () {
                              if (formKeyValidate2.currentState!.validate()) {
                                verifyForgotPasswordManufacturer(
                                  context,
                                  verifyPhoneEntity: VerifyPhoneEntityModel(
                                    phone: '$phoneNo',
                                    otp: pinInput,
                                  ),
                                );
                              }
                              model.notifyListeners();
                            },
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void verifyForgotPasswordManufacturer(
    context, {
    VerifyPhoneEntityModel? verifyPhoneEntity,
  }) async {
    try {
      _isLoading = true;
      _verifyPassOtpRespnseModel = await runBusyFuture(
        repositoryImply.verifyForgotPassword(verifyPhoneEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_verifyPassOtpRespnseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _verifyPassOtpRespnseModel?.message,
        );
        navigate.navigateTo(
          Routes.manufacturerResetPinScreen,
          arguments: ManufacturerResetPinScreenArguments(
            phone: verifyPhoneEntity.phone,
            resetToken: _verifyPassOtpRespnseModel!.data!.resetToken,
          ),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getWholesaleCategoryList(context, {String? search}) async {
    try {
      _isLoading = true;
      _distributorWholesaleCategoryModel = await runBusyFuture(
        repositoryImply.wholesaleCategories(
          page: page.toString(),
          search: search,
        ),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void nafdacRegNo(
    context, {
    NafdacRegistrationNumberEntityModel? nafdacRegNoync,
  }) async {
    try {
      _isLoadingNaf = true;
      _nafdacRegistrationNumberResponseModel = await runBusyFuture(
        repositoryImply.nafdacRegNo(nafdacRegNoync!),
        throwException: true,
      );
      if (_nafdacRegistrationNumberResponseModel!.statusCode == 201) {
        nafdacRegNoController.text = _nafdacRegistrationNumberResponseModel!
            .data!
            .nafdac!
            .registrationNumber!;
      }
      _isLoadingNaf = false;
    } catch (e) {
      _isLoadingNaf = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void createProduct(
    context, {
    CreateDistributorProductEntityModel? createproduct,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.createProduct(createproduct!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);
        navigate.clearStackAndShow(
          Routes.overviewDashboard,
          arguments: OverviewDashboardArguments(index: 1),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> listIncomingOrder(
    context, {
    String? status,
    String? search,
  }) async {
    try {
      _isLoading = true;
      _listIncomingOrdersResponseModel = await runBusyFuture(
        repositoryImply.listIncomingOrder(
          page: page.toString(),
          status: status,
          search: search,
        ),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getIncomingOrderDetail(context, {String? id}) async {
    try {
      _isLoading = true;
      _getIncomingOrderDdetailResponseModel = await runBusyFuture(
        repositoryImply.getIncomingOrder(wholesaleOrderId: id),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<bool> advaceIncomingOrder(
    BuildContext context, {
    String? orderId,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.advanceIncomingOrder(wholesaleOrderId: orderId),
        throwException: true,
      );
      await AppUtils.snackbar(context, message: v['message']);
      await listIncomingOrder(context, status: 'All');

      return true;
    } catch (e) {
      logger.d(e);
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> cancelIncomingOrder(
    BuildContext context, {
    String? orderId,
    String? reason,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.cancelIncomingOrder(
          wholesaleOrderId: orderId,
          reason: reason,
        ),
        throwException: true,
      );
      await AppUtils.snackbar(context, message: v['message']);
      await listIncomingOrder(context, status: 'All');
      cancelOrderReasonController.clear();
      // Navigator.pop(context);

      return true;
    } catch (e) {
      logger.d(e);
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> rejectIncomingOrder(
    BuildContext context, {
    String? orderId,
    String? reason,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.rejectIncomingOrder(
          wholesaleOrderId: orderId,
          reason: reason,
        ),
        throwException: true,
      );
      await AppUtils.snackbar(context, message: v['message']);
      await listIncomingOrder(context, status: 'All');
      rejectOrderReasonController.clear();
      // Navigator.pop(context);

      return true;
    } catch (e) {
      logger.d(e);
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> returnIncomingOrder(
    BuildContext context, {
    String? orderId,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.returnIncomingOrder(wholesaleOrderId: orderId),
        throwException: true,
      );
      await AppUtils.snackbar(context, message: v['message']);
      await listIncomingOrder(context, status: 'All');

      return true;
    } catch (e) {
      logger.d(e);
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateProduct(
    context, {
    UpdateProductManagementEntityModel? updateproduct,
    String? productId,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateProduct(
          updateproduct: updateproduct,
          productId: productId,
        ),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);
        navigate.clearStackAndShow(
          Routes.overviewDashboard,
          arguments: OverviewDashboardArguments(index: 1),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  getAllProduct(context, {String? categoryId, String? search}) async {
    try {
      _isLoading = true;
      _getAllProductListResponseModel = await runBusyFuture(
        repositoryImply.getProductList(
          page: page.toString(),
          search: search,
          categoryId: categoryId,
        ),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getSingleProduct(context, {String? productId}) async {
    try {
      _isLoading = true;
      _getSingleProductResponseModel = await runBusyFuture(
        repositoryImply.getSingleProductById(productId: productId),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void publishProduct(context, {String? productId}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.publishProduct(productId!),
        throwException: true,
      );
      _isLoading = false;

      // AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void unPublishProduct(context, {String? productId}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.unPublishProduct(productId!),
        throwException: true,
      );
      _isLoading = false;

      // AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void deleteProduct(context, {String? productId}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.deleteProduct(productId!),
        throwException: true,
      );
      _isLoading = false;
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);
        navigate.clearStackAndShow(
          Routes.overviewDashboard,
          arguments: OverviewDashboardArguments(index: 1),
        );
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void uploadProductImage({context, MultipartFile? file}) async {
    try {
      _isLoadingProductImage = true;
      _uploadProductImageResponseModel = await runBusyFuture(
        repositoryImply.uploadProductimage(file!),
        throwException: true,
      );
      if (_uploadProductImageResponseModel!.statusCode == 200 ||
          _uploadProductImageResponseModel!.statusCode == 201) {
        imagesProductList!.add(
          iml.Image.fromJson(
            _uploadProductImageResponseModel!.data!.image!.toJson(),
          ),
        );
      }
      _isLoadingProductImage = false;
    } catch (e) {
      _isLoadingProductImage = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  void pickProductImage(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) {
          image = file;
          filename = image!.path.split("/").last;
          uploadProductImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(image).readAsBytesSync(),
              filename: image!.path.split("/").last,
            ),
          );
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  void showCategoryMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final double popupWidth = 250.w;
    final double rightMargin = 10.w;

    // Approximate height of the popup
    final double popupHeight = 300.h;

    // Vertically center the popup
    final double top = (overlay.size.height - popupHeight) / 2;

    final RelativeRect menuPosition = RelativeRect.fromLTRB(
      overlay.size.width - popupWidth - rightMargin,
      top,
      rightMargin,
      top,
    );

    Category? selectedCategory = c;

    await showMenu(
      context: context,
      position: menuPosition,
      color: AppColors.white,
      elevation: .8,
      items: [
        PopupMenuItem(
          enabled: false,
          padding: EdgeInsets.zero,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextView(
                        text: 'Category',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.infoGrey,
                        ),
                      ),
                    ),
                  ),

                  ...distributorWholesaleCategoryModel!.data!.categories!.map((
                    e,
                  ) {
                    final bool isSelected = selectedCategory == e;
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        // Rebuild the popup itself
                        menuSetState(() {
                          selectedCategory = e;
                          c = e;
                        });
                        notifyListeners();
                        // Keep popup open so user can see the selection
                        await Future.delayed(const Duration(milliseconds: 300));

                        // Close popup
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8.w,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.skyBlue
                              : AppColors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.cool_blue
                                : AppColors.transparent,
                          ),
                        ),
                        child: TextView(
                          text: e.name ?? '',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.reminder,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  void filterProductByCategory(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final double popupWidth = 250.w;
    final double rightMargin = 10.w;

    // Approximate height of the popup
    final double popupHeight = 300.h;

    // Vertically center the popup
    final double top = (overlay.size.height - popupHeight) / 2;

    final RelativeRect menuPosition = RelativeRect.fromLTRB(
      overlay.size.width - popupWidth - rightMargin,
      top,
      rightMargin,
      top,
    );

    Category? selectedCategory = c;

    await showMenu(
      context: context,
      position: menuPosition,
      color: AppColors.white,
      elevation: .8,
      items: [
        PopupMenuItem(
          enabled: false,
          padding: EdgeInsets.zero,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextView(
                        text: 'Category',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.infoGrey,
                        ),
                      ),
                    ),
                  ),

                  ...distributorWholesaleCategoryModel!.data!.categories!.map((
                    e,
                  ) {
                    final bool isSelected = selectedCategory == e;
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        // Rebuild the popup itself
                        menuSetState(() {
                          selectedCategory = e;
                          c = e;
                        });
                        notifyListeners();
                        getAllProduct(
                          context,
                          categoryId: c!.id,
                          search: searchProduct,
                        );
                        // Keep popup open so user can see the selection
                        await Future.delayed(const Duration(milliseconds: 300));

                        // Close popup
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8.w,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.skyBlue
                              : AppColors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.cool_blue
                                : AppColors.transparent,
                          ),
                        ),
                        child: TextView(
                          text: e.name ?? '',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.reminder,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> duplicateProductDialog({
    BuildContext? context,
    String? productId,
  }) async {
    return showDialog(
      context: context!,
      barrierDismissible: false, // Prevent dismiss when tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top warning icon
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.yellow.withOpacity(.09),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.yellow,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppImage.ex_error,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextView(
                  text: "Are you sure?",
                  textStyle: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.bblack,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      "This action will enlist this product on the wholesale store.",
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 14.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.success,
                  ),
                ),

                SizedBox(height: 24.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.w,
                          vertical: 12.w,
                        ),
                      ),
                      child: TextView(
                        text: "No, Cancel",
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.6.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),

                    // Continue Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => navigate.navigateTo(
                          Routes.addProductScreen,
                          arguments: AddProductScreenArguments(
                            isDuplicate: true,
                            isEdit: false,
                            productId: productId,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.w,
                          ),
                          elevation: 0,
                        ),
                        child: TextView(
                          text: "Yes, Approve",
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 15.6.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> advanceDetailedIncomingOrderDialog({
    BuildContext? context,
    String? orderId,
    String? text,
    ManufacturerViewModel? model,
  }) async {
    if (context == null || model == null) {
      return;
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Warning icon
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.yellow.withValues(alpha: .09),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.yellow,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppImage.ex_error,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                TextView(
                  text: "Are you sure?",
                  textStyle: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.bblack,
                  ),
                ),

                SizedBox(height: 10.h),

                TextView(
                  text: "This order would be marked as $text.",
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 14.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.success,
                  ),
                ),

                SizedBox(height: 24.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CANCEL BUTTON
                    ListenableBuilder(
                      listenable: model,
                      builder: (context, child) {
                        return OutlinedButton(
                          onPressed: model.isLoading
                              ? null
                              : () {
                                  Navigator.pop(dialogContext);
                                },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 12.w,
                            ),
                          ),
                          child: TextView(
                            text: "No, Cancel",
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15.6.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(width: 16.w),

                    // CONTINUE BUTTON
                    Expanded(
                      child: ListenableBuilder(
                        listenable: model,
                        builder: (_, child) {
                          return ElevatedButton(
                            onPressed: model.isLoading
                                ? null
                                : () async {
                                    bool success = true;
                                    final result = await model
                                        .advaceIncomingOrder(
                                          context,
                                          orderId: orderId,
                                        );

                                    if (!result) {
                                      success = false;
                                    }

                                    if (!dialogContext.mounted) return;

                                    if (success) {
                                      navigate.clearStackAndShow(
                                        Routes.overviewDashboard,
                                        arguments: OverviewDashboardArguments(
                                          index: 2,
                                        ),
                                      );
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              disabledBackgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 12.w,
                              ),
                              elevation: 0,
                            ),
                            child: model.isLoading
                                ? SpinKitCircle(
                                    size: 20.sp,
                                    color: AppColors.white,
                                  )
                                : TextView(
                                    text: "Yes, Continue",
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.6.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> advanceIncomingOrderDialog({
    BuildContext? context,
    String? orderId,
    String? text,
    ManufacturerViewModel? model,
  }) async {
    if (context == null || model == null) {
      return;
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Warning icon
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.yellow.withValues(alpha: .09),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.yellow,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppImage.ex_error,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                TextView(
                  text: "Are you sure?",
                  textStyle: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.bblack,
                  ),
                ),

                SizedBox(height: 10.h),

                TextView(
                  text: "This order would be marked as $text.",
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 14.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.success,
                  ),
                ),

                SizedBox(height: 24.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CANCEL BUTTON
                    ListenableBuilder(
                      listenable: model,
                      builder: (contxt, child) {
                        return OutlinedButton(
                          onPressed: model.isLoading
                              ? null
                              : () {
                                  Navigator.pop(dialogContext);
                                },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 12.w,
                            ),
                          ),
                          child: TextView(
                            text: "No, Cancel",
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15.6.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(width: 16.w),

                    // CONTINUE BUTTON
                    Expanded(
                      child: ListenableBuilder(
                        listenable: model,
                        builder: (_, child) {
                          return ElevatedButton(
                            onPressed: model.isLoading
                                ? null
                                : () async {
                                    bool success = true;

                                    if (text == 'returned') {
                                      final result = await model
                                          .returnIncomingOrder(
                                            context,
                                            orderId: orderId,
                                          );

                                      if (!result) {
                                        success = false;
                                      }
                                      if (!dialogContext.mounted) return;

                                      if (success) {
                                        Navigator.pop(dialogContext);
                                      }
                                    } else if (text == 'rejected') {
                                      if (!dialogContext.mounted) {
                                        return;
                                      }
                                      Navigator.of(dialogContext).pop();
                                      // Give Flutter a frame to remove // the current dialog before opening // another one.
                                      await Future<void>.delayed(
                                        const Duration(milliseconds: 100),
                                      );
                                      // IMPORTANT: // Do NOT use dialogContext here.
                                      if (!context.mounted) {
                                        return;
                                      }
                                      await model.rejectIncomingOrderDialog(
                                        context: context,
                                        orderId: orderId,
                                        model: model,
                                      );

                                      return;
                                    } else if (text == 'cancelled') {
                                      if (!dialogContext.mounted) {
                                        return;
                                      }
                                      Navigator.of(dialogContext).pop();
                                      // Give Flutter a frame to remove // the current dialog before opening // another one.
                                      await Future<void>.delayed(
                                        const Duration(milliseconds: 100),
                                      );
                                      // IMPORTANT: // Do NOT use dialogContext here.
                                      if (!context.mounted) {
                                        return;
                                      }
                                      await model.cancelIncomingOrderDialog(
                                        context: context,
                                        orderId: orderId,
                                        model: model,
                                      );
                                      return;
                                    } else {
                                      final result = await model
                                          .advaceIncomingOrder(
                                            context,
                                            orderId: orderId,
                                          );

                                      if (!result) {
                                        success = false;
                                      }
                                      if (!dialogContext.mounted) return;

                                      if (success) {
                                        Navigator.pop(dialogContext);
                                      }
                                    }
                                    model.notifyListeners();
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              disabledBackgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 12.w,
                              ),
                              elevation: 0,
                            ),
                            child: model.isLoading
                                ? SpinKitCircle(
                                    size: 20.sp,
                                    color: AppColors.white,
                                  )
                                : TextView(
                                    text: "Yes, Continue",
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.6.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> cancelIncomingOrderDialog({
    BuildContext? context,
    String? orderId,
    ManufacturerViewModel? model,
  }) async {
    if (context == null || model == null) {
      return;
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Form(
              key: formKeyValidateCancelOrder,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.h),

                  TextView(
                    text: "Cancel Order",
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.bblack,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  TextView(
                    text: "This action will cancel this order.",
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bblack,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  TextView(
                    text: "Leave a Comment",
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.success,
                    ),
                  ),

                  SizedBox(height: 4.h),
                  TextFormWidget(
                    hintWeight: FontWeight.w400,
                    hintColor: AppColors.reminder,
                    hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                    borderColor: AppColors.infoGrey1,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    fillColor: AppColors.white,
                    isFilled: true,
                    controller: cancelOrderReasonController,
                    maxline: 4,
                    validator: AppValidator.validateString(),
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                    ),
                    labelStyle: TextStyle(
                      fontSize: 15.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                      color: AppColors.faintedGrey,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CANCEL BUTTON
                      ListenableBuilder(
                        listenable: model,
                        builder: (context, child) {
                          return OutlinedButton(
                            onPressed: model.isLoading
                                ? null
                                : () {
                                    Navigator.pop(dialogContext);
                                  },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 32.w,
                                vertical: 12.w,
                              ),
                            ),
                            child: TextView(
                              text: "No, Cancel",
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 15.6.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(width: 16.w),

                      // CONTINUE BUTTON
                      Expanded(
                        child: ListenableBuilder(
                          listenable: model,
                          builder: (context, child) {
                            return ElevatedButton(
                              onPressed: model.isLoading
                                  ? null
                                  : () async {
                                      if (formKeyValidateCancelOrder
                                          .currentState!
                                          .validate()) {
                                        // ignore: unused_local_variable
                                        bool success = true;

                                        final result = await model
                                            .cancelIncomingOrder(
                                              context,
                                              orderId: orderId,
                                              reason:
                                                  cancelOrderReasonController
                                                      .text
                                                      .trim(),
                                            );

                                        if (!result) {
                                          success = false;
                                        }
                                        if (!dialogContext.mounted) return;

                                        if (success) {
                                          Navigator.pop(dialogContext);
                                        }
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                disabledBackgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 12.w,
                                ),
                                elevation: 0,
                              ),
                              child: model.isLoading
                                  ? SpinKitCircle(
                                      size: 20.sp,
                                      color: AppColors.white,
                                    )
                                  : TextView(
                                      text: "Yes, Continue",
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.6.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> rejectIncomingOrderDialog({
    BuildContext? context,
    String? orderId,
    ManufacturerViewModel? model,
  }) async {
    if (context == null || model == null) {
      return;
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Form(
              key: formKeyValidateRejectOrder,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.h),

                  TextView(
                    text: "Reject Order",
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.bblack,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  TextView(
                    text: "This action will reject this order.",
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bblack,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  TextView(
                    text: "Leave a Comment",
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.success,
                    ),
                  ),

                  SizedBox(height: 4.h),
                  TextFormWidget(
                    hintWeight: FontWeight.w400,
                    hintColor: AppColors.reminder,
                    hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                    borderColor: AppColors.infoGrey1,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    fillColor: AppColors.white,
                    isFilled: true,
                    controller: rejectOrderReasonController,
                    maxline: 4,
                    validator: AppValidator.validateString(),
                    style: TextStyle(
                      fontSize: 16.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                    ),
                    labelStyle: TextStyle(
                      fontSize: 15.20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                      color: AppColors.faintedGrey,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CANCEL BUTTON
                      ListenableBuilder(
                        listenable: model,
                        builder: (context, child) {
                          return OutlinedButton(
                            onPressed: model.isLoading
                                ? null
                                : () {
                                    Navigator.pop(dialogContext);
                                  },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 32.w,
                                vertical: 12.w,
                              ),
                            ),
                            child: TextView(
                              text: "No, Cancel",
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 15.6.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(width: 16.w),

                      // CONTINUE BUTTON
                      Expanded(
                        child: ListenableBuilder(
                          listenable: model,
                          builder: (context, child) {
                            return ElevatedButton(
                              onPressed: model.isLoading
                                  ? null
                                  : () async {
                                      if (formKeyValidateRejectOrder
                                          .currentState!
                                          .validate()) {
                                        bool success = true;

                                        // for (final item in itemsOrderId) {
                                        final result = await model
                                            .rejectIncomingOrder(
                                              context,
                                              orderId: orderId,
                                              reason:
                                                  rejectOrderReasonController
                                                      .text
                                                      .trim(),
                                            );

                                        if (!result) {
                                          success = false;
                                        }

                                        if (!dialogContext.mounted) return;

                                        if (success) {
                                          Navigator.pop(dialogContext);
                                        }
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                disabledBackgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 12.w,
                                ),
                                elevation: 0,
                              ),
                              child: model.isLoading
                                  ? SpinKitCircle(
                                      size: 20.sp,
                                      color: AppColors.white,
                                    )
                                  : TextView(
                                      text: "Yes, Continue",
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.6.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> deleteProductDialog({
    BuildContext? context,
    String? productId,
  }) async {
    return showDialog(
      context: context!,
      barrierDismissible: false, // Prevent dismiss when tapping outside
      builder: (BuildContext context) {
        return ViewModelBuilder<ManufacturerViewModel>.reactive(
          viewModelBuilder: () => ManufacturerViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          onDispose: (viewModel) {},
          builder: (_, ManufacturerViewModel model, _) {
            return Dialog(
              backgroundColor: AppColors.white,
              insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top warning icon
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.yellow.withOpacity(.09),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12.0.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.yellow,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppImage.ex_error,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextView(
                      text: "Are you sure?",
                      textStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.bblack,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextView(
                      text:
                          "This action will remove this product from the wholesale store.",
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.success,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 12.w,
                            ),
                          ),
                          child: TextView(
                            text: "No, Cancel",
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15.6.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),

                        // Continue Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => model.deleteProduct(
                              context,
                              productId: productId,
                            ),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 12.w,
                              ),
                              elevation: 0,
                            ),
                            child: model.isLoading
                                ? SpinKitCircle(
                                    size: 28.80.sp,
                                    color: AppColors.white,
                                  )
                                : TextView(
                                    text: "Yes, Approve",
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.6.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String returnAddingPhoneNoStructureWith234(String phoneNo) {
    if (phoneNo.substring(0).startsWith('0')) {
      phoneNo = '+234${phoneNo.substring(1)}';
    } else {
      phoneNo = '+234$phoneNo';
    }
    notifyListeners();
    return phoneNo;
  }

  String returnAddingPhoneNoStructureWith234Kyc(String phoneNo) {
    if (phoneNo.substring(0).startsWith('0')) {
      phoneNo = '+234${phoneNo.substring(1)}';
    } else {
      phoneNo = '0${phoneNo.substring(4)}';
    }
    notifyListeners();
    return phoneNo;
  }

  void getManufacturerDetails({context, phoneNo}) async {
    try {
      _isLoading = true;
      _getUserDetailsResponseModel = await runBusyFuture(
        repositoryImply.getManufacturerDetails(phoneNo),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getManAndDistributorKyc(context) async {
    try {
      _isLoading = true;
      _getDistributorKycResponseModel = await runBusyFuture(
        repositoryImply.getManAndDistributorKyc(),
        throwException: true,
      );
      if (_getDistributorKycResponseModel?.statusCode == 200 ||
          _getDistributorKycResponseModel?.statusCode == 201) {
        if (_getDistributorKycResponseModel?.data?.kycLevels?[1].status
                    ?.toLowerCase() ==
                'approved' ||
            _getDistributorKycResponseModel?.data?.kycLevels?[1].status
                    ?.toLowerCase() ==
                'UNDER_REVIEW'.toLowerCase()) {
          isNotReadable = true;
        }
        if (_getDistributorKycResponseModel?.data?.kycLevels?[2].status
                    ?.toLowerCase() ==
                'approved' ||
            _getDistributorKycResponseModel?.data?.kycLevels?[2].status
                    ?.toLowerCase() ==
                'UNDER_REVIEW'.toLowerCase()) {
          isNotReadable2 = true;
        }
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  void saveLevelTwoManAndDistributorKycProgress({
    context,
    SecondLevelDistributorKycEntityModel? kycEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.saveLevelTwoManAndDistributorKycProgress(kycEntity!),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);
        getManAndDistributorKyc(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
      logger.d(e);
    }
    notifyListeners();
  }

  void submitLevelTwoManAndDistributorKyc({
    context,
    SecondLevelDistributorKycEntityModel? kycEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.submitLevelTwoManAndDistributorKyc(kycEntity!),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);
        getManAndDistributorKyc(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
      logger.d(e);
    }
    notifyListeners();
  }

  void submitLevelThreeManAndDistributorKyc({
    context,
    LevelThreeDistributorKycEntityModel? kycEntity,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.submitLevelThreeManAndDistributorKyc(kycEntity!),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await AppUtils.snackbar(context, message: v['message']);
        getManAndDistributorKyc(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
      logger.d(e);
    }
    notifyListeners();
  }

  String kycStatusText(status) {
    if (status.toLowerCase() == 'UNDER_REVIEW'.toLowerCase()) {
      return 'Your KYC is submitted and under '
          'review. We’ll notify you once it’s '
          'verified.';
    }
    if (status.toLowerCase() == 'NOT_SUBMITTED'.toLowerCase()) {
      return 'Kindly upload and submit KYC for '
          'verification to obtain some access '
          'to platform features.';
    }
    if (status.toLowerCase() == 'REJECTED'.toLowerCase()) {
      return 'Your KYC couldn’t be verified. '
          'Please review your details and '
          'resubmit the required documents.';
    }
    if (status.toLowerCase() == 'APPROVED'.toLowerCase()) {
      return 'Your KYC has been successfully '
          'verified. You can now access '
          'some services.';
    }
    return 'Kindly upload and submit KYC for '
        'verification to obtain some access '
        'to platform features.';
  }

  Color kycStatusColor(status) {
    if (status.toLowerCase() == 'UNDER_REVIEW'.toLowerCase()) {
      return AppColors.fadedyellow;
    }
    if (status.toLowerCase() == 'NOT_SUBMITTED'.toLowerCase()) {
      return AppColors.fadedyellow;
    }
    if (status.toLowerCase() == 'REJECTED'.toLowerCase()) {
      return AppColors.red_bar_faded;
    }
    if (status.toLowerCase() == 'APPROVED'.toLowerCase()) {
      return AppColors.app_green_light;
    }
    return AppColors.fadedyellow;
  }

  Color kycStatusColorIcon(status) {
    if (status.toLowerCase() == 'UNDER_REVIEW'.toLowerCase()) {
      return AppColors.yellow;
    }
    if (status.toLowerCase() == 'NOT_SUBMITTED'.toLowerCase()) {
      return AppColors.yellow;
    }
    if (status.toLowerCase() == 'REJECTED'.toLowerCase()) {
      return AppColors.red_bar;
    }
    if (status.toLowerCase() == 'APPROVED'.toLowerCase()) {
      return AppColors.app_green;
    }
    return AppColors.yellow;
  }

  Future<void> uploadImage({context, MultipartFile? file}) async {
    try {
      _isLoading = true;
      _uploadImageResponseModel = await runBusyFuture(
        repositoryImply.uploadImage(file!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> addBusinessAddresses({
    context,
    BusinessAddressesEntity? businessAddresses,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.addBusinessAddresses(businessAddresses!),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        getUserDetails(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateBusinessAddress({
    context,
    BusinessAddressesEntity? businessAddress,
    String? id,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateBusinessAddress(
          businessAddresses: businessAddress!,
          id: id,
        ),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        getUserDetails(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteBusinessAddress(String id) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.deleteBusinessAddress(id),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        getUserDetails(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  void pickImageDistributorKycCAC(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingCAC = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingCAC = _isLoading;
          _uploadImageResponseModelDisCAC = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelCAC =
              SecondLevelDistributorKycEntityModel(
                distributor: Distributor(
                  documents: Documents(
                    cacCertificate: CacCertificate(
                      width: _uploadImageResponseModelDisCAC!.data!.width,
                      height: _uploadImageResponseModelDisCAC!.data!.height,
                      format: _uploadImageResponseModelDisCAC!.data!.format,
                      url: _uploadImageResponseModelDisCAC!.data!.url!,
                      mimeType: _uploadImageResponseModelDisCAC!.data!.mimeType,
                      size: _uploadImageResponseModelDisCAC!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageDistributorKycPharmLin(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingGMP = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingGMP = _isLoading;
          _uploadImageResponseModelDisPharmLin = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelPharmLin =
              SecondLevelDistributorKycEntityModel(
                distributor: Distributor(
                  documents: Documents(
                    pharmaceuticalDistributionLicense:
                        PharmaceuticalDistributionLicense(
                          width:
                              _uploadImageResponseModelDisPharmLin!.data!.width,
                          height: _uploadImageResponseModelDisPharmLin!
                              .data!
                              .height,
                          format: _uploadImageResponseModelDisPharmLin!
                              .data!
                              .format,
                          url: _uploadImageResponseModelDisPharmLin!.data!.url!,
                          mimeType: _uploadImageResponseModelDisPharmLin!
                              .data!
                              .mimeType,
                          size:
                              _uploadImageResponseModelDisPharmLin!.data!.size,
                        ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageDistributorKycNAFPermit(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingNAF = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingNAF = _isLoading;
          _uploadImageResponseModelDisNAFPermit = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelNAF =
              SecondLevelDistributorKycEntityModel(
                distributor: Distributor(
                  documents: Documents(
                    nafdacPermit: NafdacPermit(
                      width: _uploadImageResponseModelDisNAFPermit!.data!.width,
                      height:
                          _uploadImageResponseModelDisNAFPermit!.data!.height,
                      format:
                          _uploadImageResponseModelDisNAFPermit!.data!.format,
                      url: _uploadImageResponseModelDisNAFPermit!.data!.url!,
                      mimeType:
                          _uploadImageResponseModelDisNAFPermit!.data!.mimeType,
                      size: _uploadImageResponseModelDisNAFPermit!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageDistributorKycPharmCouncilLin(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingProd = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingProd = _isLoading;
          _uploadImageResponseModelDisPharmCouncilLin =
              _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelPharmCouncilLin =
              SecondLevelDistributorKycEntityModel(
                distributor: Distributor(
                  documents: Documents(
                    pharmacyCouncilLicense: PharmacyCouncilLicense(
                      width: _uploadImageResponseModelDisPharmCouncilLin!
                          .data!
                          .width,
                      height: _uploadImageResponseModelDisPharmCouncilLin!
                          .data!
                          .height,
                      format: _uploadImageResponseModelDisPharmCouncilLin!
                          .data!
                          .format,
                      url: _uploadImageResponseModelDisPharmCouncilLin!
                          .data!
                          .url!,
                      mimeType: _uploadImageResponseModelDisPharmCouncilLin!
                          .data!
                          .mimeType,
                      size: _uploadImageResponseModelDisPharmCouncilLin!
                          .data!
                          .size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageDistributorKycLogo(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingLogo = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingLogo = _isLoading;
          _uploadImageResponseModelDisComLogo = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelLogo =
              SecondLevelDistributorKycEntityModel(
                distributor: Distributor(
                  documents: Documents(
                    companyLogo: CompanyLogo(
                      width: _uploadImageResponseModelDisComLogo!.data!.width,
                      height: _uploadImageResponseModelDisComLogo!.data!.height,
                      format: _uploadImageResponseModelDisComLogo!.data!.format,
                      url: _uploadImageResponseModelDisComLogo!.data!.url!,
                      mimeType:
                          _uploadImageResponseModelDisComLogo!.data!.mimeType,
                      size: _uploadImageResponseModelDisComLogo!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageManufacturerKycCAC(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingCAC = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingCAC = _isLoading;
          _uploadImageResponseModelManCAC = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelManCAC =
              SecondLevelDistributorKycEntityModel(
                manufacturer: Manufacturer(
                  documents: Documents(
                    cacCertificate: CacCertificate(
                      width: _uploadImageResponseModelManCAC!.data!.width,
                      height: _uploadImageResponseModelManCAC!.data!.height,
                      format: _uploadImageResponseModelManCAC!.data!.format,
                      url: _uploadImageResponseModelManCAC!.data!.url!,
                      mimeType: _uploadImageResponseModelManCAC!.data!.mimeType,
                      size: _uploadImageResponseModelManCAC!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageManufacturerKycGMP(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingGMP = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingGMP = _isLoading;
          _uploadImageResponseModelManGMP = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelManGMP =
              SecondLevelDistributorKycEntityModel(
                manufacturer: Manufacturer(
                  documents: Documents(
                    gmpCertificate: GmpCertificate(
                      width: _uploadImageResponseModelManGMP!.data!.width,
                      height: _uploadImageResponseModelManGMP!.data!.height,
                      format: _uploadImageResponseModelManGMP!.data!.format,
                      url: _uploadImageResponseModelManGMP!.data!.url!,
                      mimeType: _uploadImageResponseModelManGMP!.data!.mimeType,
                      size: _uploadImageResponseModelManGMP!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageManufacturerKycNAFManLin(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingNAF = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingNAF = _isLoading;
          _uploadImageResponseModelNAFManLin = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelManNAF =
              SecondLevelDistributorKycEntityModel(
                manufacturer: Manufacturer(
                  documents: Documents(
                    nafdacManufacturingLicense: NafdacManufacturingLicense(
                      width: _uploadImageResponseModelNAFManLin!.data!.width,
                      height: _uploadImageResponseModelNAFManLin!.data!.height,
                      format: _uploadImageResponseModelNAFManLin!.data!.format,
                      url: _uploadImageResponseModelNAFManLin!.data!.url!,
                      mimeType:
                          _uploadImageResponseModelNAFManLin!.data!.mimeType,
                      size: _uploadImageResponseModelNAFManLin!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageManufacturerKycProdRegEvi(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingProd = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingProd = _isLoading;
          _uploadImageResponseModelManProdRegEvi = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelManProd =
              SecondLevelDistributorKycEntityModel(
                manufacturer: Manufacturer(
                  documents: Documents(
                    productRegistrationEvidence: ProductRegistrationEvidence(
                      width:
                          _uploadImageResponseModelManProdRegEvi!.data!.width,
                      height:
                          _uploadImageResponseModelManProdRegEvi!.data!.height,
                      format:
                          _uploadImageResponseModelManProdRegEvi!.data!.format,
                      url: _uploadImageResponseModelManProdRegEvi!.data!.url!,
                      mimeType: _uploadImageResponseModelManProdRegEvi!
                          .data!
                          .mimeType,
                      size: _uploadImageResponseModelManProdRegEvi!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageManufacturerKycComLogo(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingLogo = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingLogo = _isLoading;
          _uploadImageResponseModelManComLogo = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelManLogo =
              SecondLevelDistributorKycEntityModel(
                manufacturer: Manufacturer(
                  documents: Documents(
                    companyLogo: CompanyLogo(
                      width: _uploadImageResponseModelManComLogo!.data!.width,
                      height: _uploadImageResponseModelManComLogo!.data!.height,
                      format: _uploadImageResponseModelManComLogo!.data!.format,
                      url: _uploadImageResponseModelManComLogo!.data!.url!,
                      mimeType:
                          _uploadImageResponseModelManComLogo!.data!.mimeType,
                      size: _uploadImageResponseModelManComLogo!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageImporterKycCAC(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingCAC = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingCAC = _isLoading;
          _uploadImageResponseModelCAC = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelImpCAC =
              SecondLevelDistributorKycEntityModel(
                importer: Importer(
                  documents: Documents(
                    cacCertificate: CacCertificate(
                      width: _uploadImageResponseModelCAC!.data!.width,
                      height: _uploadImageResponseModelCAC!.data!.height,
                      format: _uploadImageResponseModelCAC!.data!.format,
                      url: _uploadImageResponseModelCAC!.data!.url!,
                      mimeType: _uploadImageResponseModelCAC!.data!.mimeType,
                      size: _uploadImageResponseModelCAC!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageImporterKycPermit(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingProd = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingProd = _isLoading;
          _uploadImageResponseModelImportPermit = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelImpPermit =
              SecondLevelDistributorKycEntityModel(
                importer: Importer(
                  documents: Documents(
                    importPermit: ImportPermit(
                      width: _uploadImageResponseModelImportPermit!.data!.width,
                      height:
                          _uploadImageResponseModelImportPermit!.data!.height,
                      format:
                          _uploadImageResponseModelImportPermit!.data!.format,
                      url: _uploadImageResponseModelImportPermit!.data!.url!,
                      mimeType:
                          _uploadImageResponseModelImportPermit!.data!.mimeType,
                      size: _uploadImageResponseModelImportPermit!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageImporterKycManAuthLetter(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingNAF = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingNAF = _isLoading;
          _uploadImageResponseModelManAuthLetter = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelImpManAuthLetter =
              SecondLevelDistributorKycEntityModel(
                importer: Importer(
                  documents: Documents(
                    manufacturerAuthorizationLetter:
                        ManufacturerAuthorizationLetter(
                          width: _uploadImageResponseModelManAuthLetter!
                              .data!
                              .width,
                          height: _uploadImageResponseModelManAuthLetter!
                              .data!
                              .height,
                          format: _uploadImageResponseModelManAuthLetter!
                              .data!
                              .format,
                          url: _uploadImageResponseModelManAuthLetter!
                              .data!
                              .url!,
                          mimeType: _uploadImageResponseModelManAuthLetter!
                              .data!
                              .mimeType,
                          size: _uploadImageResponseModelManAuthLetter!
                              .data!
                              .size,
                        ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  void pickImageImporterKycLogo(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) async {
          imageCAC = file;
          filenameCAC = imageCAC!.path.split("/").last;
          _isLoadingLogo = true;
          await uploadImage(
            context: context,
            file: MultipartFile.fromBytes(
              formartFileImage(imageCAC).readAsBytesSync(),
              filename: imageCAC!.path.split("/").last,
            ),
          );
          _isLoadingLogo = _isLoading;
          _uploadImageResponseModelComLogo = _uploadImageResponseModel;
          _secondLevelDistributorKycEntityModelImpLogo =
              SecondLevelDistributorKycEntityModel(
                importer: Importer(
                  documents: Documents(
                    companyLogo: CompanyLogo(
                      width: _uploadImageResponseModelComLogo!.data!.width,
                      height: _uploadImageResponseModelComLogo!.data!.height,
                      format: _uploadImageResponseModelComLogo!.data!.format,
                      url: _uploadImageResponseModelComLogo!.data!.url!,
                      mimeType:
                          _uploadImageResponseModelComLogo!.data!.mimeType,
                      size: _uploadImageResponseModelComLogo!.data!.size,
                    ),
                  ),
                ),
              );
        },
      );
    } catch (e) {
      logger.e(e);
    }
    notifyListeners();
  }

  Future<void> updatePrimaryBusinessAddress({context, String? id}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updatePrimaryBusinessAddress(id!),
        throwException: true,
      );
      if (v['statusCode'] == 200 || v['statusCode'] == 201) {
        await getUserDetails(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void showLGAAndStateDialog(
    BuildContext context, {
    bool isEdit = false,
    String? editState,
    List<String>? editLgas,
  }) {
    if (isEdit && editState != null) {
      stateController.text = editState;
      lgaAddedList.clear();

      lgaAddedList.addAll(List<String>.from(editLgas ?? []));

      // Get all LGAs belonging to this state
      final selectedStateLga = stateLgaFormat.firstWhere(
        (state) =>
            state['state'].toString().trim().toLowerCase() ==
            editState.trim().toLowerCase(),
        orElse: () => <String, dynamic>{'state': '', 'lgas': <String>[]},
      );

      final selectedLgas = List<String>.from(
        selectedStateLga['lgas'] ?? <String>[],
      );

      lgaList = List<String>.from(selectedLgas);
      lgaListCopy = List<String>.from(selectedLgas);
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              color: AppColors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: Colors.white, size: 18),
                      label: Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.10.h),
                  Dialog(
                    insetPadding: EdgeInsets.all(16.20.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.all(21.4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: !isEdit
                                ? 'Add Area/Location'
                                : 'Edit Area/Location',
                            textStyle: TextStyle(
                              fontSize: 15.86.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder1,
                              fontFamily: 'DMSans',
                            ),
                          ),
                          SizedBox(height: 16.2.h),
                          TextFormWidget(
                            hint: 'State',
                            label: '--Select--',
                            rightPos: -14,
                            hintSize: 14,
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            readOnly: true,
                            controller: stateController,
                            suffixWidget: Builder(
                              builder: (context) {
                                return GestureDetector(
                                  onTap: isEdit
                                      ? () {}
                                      : () async {
                                          final RenderBox button =
                                              context.findRenderObject()
                                                  as RenderBox;

                                          final RenderBox overlay =
                                              Overlay.of(
                                                    context,
                                                  ).context.findRenderObject()
                                                  as RenderBox;

                                          final Offset buttonPosition = button
                                              .localToGlobal(
                                                Offset.zero,
                                                ancestor: overlay,
                                              );

                                          final Size buttonSize = button.size;

                                          final selectedState =
                                              await showMenu<String>(
                                                context: context,

                                                position: RelativeRect.fromLTRB(
                                                  buttonPosition.dx,
                                                  buttonPosition.dy +
                                                      buttonSize.height +
                                                      5.h,
                                                  overlay.size.width -
                                                      buttonPosition.dx -
                                                      buttonSize.width,
                                                  0,
                                                ),

                                                constraints: BoxConstraints(
                                                  minWidth: 200.w,
                                                  maxWidth: 250.w,
                                                  minHeight: 150.h,
                                                  maxHeight: 450.h,
                                                ),

                                                color: AppColors.white,

                                                elevation: 4,

                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        10.r,
                                                      ),
                                                ),

                                                items: stateLgaFormat
                                                    .map<
                                                      PopupMenuEntry<String>
                                                    >((s) {
                                                      final String state =
                                                          s['state']
                                                              ?.toString() ??
                                                          '';

                                                      return PopupMenuItem<
                                                        String
                                                      >(
                                                        value: state,
                                                        height: 38.h,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 14.w,
                                                            ),
                                                        child: TextView(
                                                          text: state,
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'GoogleSans',
                                                            fontSize: 13.70.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                        ),
                                                      );
                                                    })
                                                    .toList(),
                                              );

                                          if (selectedState != null) {
                                            stateController.text =
                                                selectedState;
                                            final selectedStateLga =
                                                stateLgaFormat.firstWhere(
                                                  (state) =>
                                                      state['state']
                                                          .toString()
                                                          .trim()
                                                          .toLowerCase() ==
                                                      stateController.text
                                                          .trim()
                                                          .toLowerCase(),
                                                  orElse: () =>
                                                      <String, dynamic>{
                                                        'state': '',
                                                        'lgas': <String>[],
                                                      },
                                                );

                                            final selectedLgas =
                                                List<String>.from(
                                                  selectedStateLga['lgas'] ??
                                                      <String>[],
                                                );

                                            lgaList = List<String>.from(
                                              selectedLgas,
                                            );
                                            lgaListCopy = List<String>.from(
                                              selectedLgas,
                                            );

                                            // Optional: reset previously selected LGAs
                                            lgaAddedList.clear();
                                          }
                                          setModalState(() {});
                                          notifyListeners();
                                        },

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                    ),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: isEdit
                                          ? AppColors.greygreyer
                                          : AppColors.grey1,
                                    ),
                                  ),
                                );
                              },
                            ),

                            validator: AppValidator.validateString(),
                          ),

                          SizedBox(height: 12.30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  TextView(
                                    text: 'LGA ',
                                    textStyle: TextStyle(
                                      fontSize: 13.86.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder1,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),
                                  TextView(
                                    text: '(Please click to select)',
                                    textStyle: TextStyle(
                                      fontSize: 13.86.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  lgaAddedList.clear();
                                  lgaAddedList.addAll(lgaListCopy);
                                  setModalState(() {});
                                  notifyListeners();
                                },
                                child: TextView(
                                  text: 'Select all',
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary,
                                    fontSize: 13.86.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primary,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            height: lgaListCopy.length > 30 ? 250.h : 120.h,
                            width: double.infinity,
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.grey,
                            ),
                            child: SingleChildScrollView(
                              child: Wrap(
                                runSpacing: 10,
                                spacing: 10,
                                children: [
                                  ...lgaListCopy.map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        if (lgaAddedList.contains(e)) {
                                          lgaAddedList.remove(e);
                                        } else {
                                          lgaAddedList.add(e);
                                        }
                                        setModalState(() {});
                                        notifyListeners();
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 14.w,
                                            height: 14.w,
                                            margin: EdgeInsets.only(top: 1.h),
                                            decoration: BoxDecoration(
                                              color: lgaAddedList.contains(e)
                                                  ? AppColors.app_green
                                                  : AppColors.infoGrey1,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              size: 9.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 2.w),
                                          TextView(
                                            text: '$e ',
                                            textStyle: TextStyle(
                                              fontSize: 13.86.sp,
                                              fontWeight: FontWeight.w200,
                                              color: lgaAddedList.contains(e)
                                                  ? AppColors.reminder
                                                  : AppColors.infoGrey,
                                              fontFamily: 'DMSans',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.grey,
                                  buttonText: 'Cancel',
                                  color: AppColors.reminder1,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    notifyListeners();
                                  },
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                flex: !isEdit ?1:2,
                                child: ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: !isEdit ? 'Add' : 'Save Changes',
                                  color: AppColors.white,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () async {
                                    final state = stateController.text.trim();

                                    if (state.isEmpty) {
                                      return;
                                    }

                                    final stateIndex = listOfAddedLocation
                                        .indexWhere(
                                          (location) => location.keys.any(
                                            (key) =>
                                                key.trim().toLowerCase() ==
                                                state.toLowerCase(),
                                          ),
                                        );

                                    if (isEdit) {
                                      // EDIT EXISTING STATE
                                      if (stateIndex != -1) {
                                        listOfAddedLocation[stateIndex] = {
                                          state: List<String>.from(
                                            lgaAddedList,
                                          ),
                                        };
                                      } else {
                                        // In case the state was changed during editing
                                        listOfAddedLocation.add({
                                          state: List<String>.from(
                                            lgaAddedList,
                                          ),
                                        });
                                      }
                                    } else {
                                      // ADD NEW STATE
                                      listOfAddedLocation.add({
                                        state: List<String>.from(lgaAddedList),
                                      });
                                      // }
                                    }
                                    await Future.delayed(Duration(seconds: 1));
                                    lgaListCopy.clear();
                                    setModalState(() {});
                                    Navigator.pop(context);
                                    notifyListeners();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showBusinessAreaLGAAndStateCountryDialog(
    BuildContext context, {
    bool isEdit = false,
    BusinessAddresses? busAddress,
  }) {
    if (isEdit) {
      businessAddController.text =
          busAddress?.businessAddress?.toString() ?? '';

      countryController.text = busAddress?.country?.toString() ?? '';

      stateController.text = busAddress?.state?.toString() ?? '';

      lgaController.text = busAddress?.lga?.toString() ?? '';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return ViewModelBuilder<ManufacturerViewModel>.reactive(
              viewModelBuilder: () => ManufacturerViewModel(),
              onViewModelReady: (model) async {
                model.getUserDetails(context);
              },
              disposeViewModel: false,
              builder: (_, ManufacturerViewModel model, _) {
                return Container(
                  color: AppColors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: TextButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: Text(
                            "Close",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6.10.h),
                      Dialog(
                        insetPadding: EdgeInsets.all(16.20.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: AppColors.white,
                        child: Padding(
                          padding: EdgeInsets.all(21.4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: !isEdit ? 'Add Address' : 'Edit Address',
                                textStyle: TextStyle(
                                  fontSize: 15.86.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.reminder1,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                              SizedBox(height: 16.2.h),
                              TextFormWidget(
                                hint: 'Business address',
                                hintSize: 14,
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  fontSize: 14.2.sp,
                                  color: AppColors.infoGrey,
                                ),
                                fillColor: AppColors.grey,
                                isFilled: true,
                                controller: businessAddController,
                                validator: AppValidator.validateString(),
                                onChange: (p0) {},
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                hint: 'Country',
                                hintSize: 14,
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                label: '--Select--',
                                readOnly: true,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  fontSize: 14.2.sp,
                                  color: AppColors.infoGrey,
                                ),
                                fillColor: AppColors.grey,
                                isFilled: true,
                                controller: countryController,
                                validator: AppValidator.validateString(),
                                suffixWidget: Builder(
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () async {
                                        final RenderBox button =
                                            context.findRenderObject()
                                                as RenderBox;

                                        final RenderBox overlay =
                                            Overlay.of(
                                                  context,
                                                ).context.findRenderObject()
                                                as RenderBox;

                                        final Offset buttonPosition = button
                                            .localToGlobal(
                                              Offset.zero,
                                              ancestor: overlay,
                                            );

                                        final Size buttonSize = button.size;

                                        final selectedState =
                                            await showMenu<String>(
                                              context: context,

                                              position: RelativeRect.fromLTRB(
                                                buttonPosition.dx,
                                                buttonPosition.dy +
                                                    buttonSize.height +
                                                    5.h,
                                                overlay.size.width -
                                                    buttonPosition.dx -
                                                    buttonSize.width,
                                                0,
                                              ),

                                              constraints: BoxConstraints(
                                                minWidth: 200.w,
                                                maxWidth: 250.w,
                                                minHeight: 60.h,
                                                maxHeight: 450.h,
                                              ),

                                              color: AppColors.white,

                                              elevation: 4,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),

                                              items: ['Nigeria']
                                                  .map<PopupMenuEntry<String>>((
                                                    s,
                                                  ) {
                                                    final String country = s;

                                                    return PopupMenuItem<
                                                      String
                                                    >(
                                                      value: country,
                                                      height: 38.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 14.w,
                                                          ),
                                                      child: TextView(
                                                        text: country,
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 13.70.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                  .toList(),
                                            );

                                        if (selectedState != null) {
                                          countryController.text =
                                              selectedState;

                                          // Reset LGA whenever state changes
                                          lgaController.clear();
                                          notifyListeners();
                                        }
                                      },

                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                        ),
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 16.2.h),
                              TextFormWidget(
                                hint: 'State',
                                label: '--Select--',
                                rightPos: -14,
                                hintSize: 14,
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  fontSize: 14.2.sp,
                                  color: AppColors.infoGrey,
                                ),
                                fillColor: AppColors.grey,
                                isFilled: true,
                                readOnly: true,
                                controller: stateController,
                                suffixWidget: Builder(
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () async {
                                        final RenderBox button =
                                            context.findRenderObject()
                                                as RenderBox;

                                        final RenderBox overlay =
                                            Overlay.of(
                                                  context,
                                                ).context.findRenderObject()
                                                as RenderBox;

                                        final Offset buttonPosition = button
                                            .localToGlobal(
                                              Offset.zero,
                                              ancestor: overlay,
                                            );

                                        final Size buttonSize = button.size;

                                        final selectedState =
                                            await showMenu<String>(
                                              context: context,

                                              position: RelativeRect.fromLTRB(
                                                buttonPosition.dx,
                                                buttonPosition.dy +
                                                    buttonSize.height +
                                                    5.h,
                                                overlay.size.width -
                                                    buttonPosition.dx -
                                                    buttonSize.width,
                                                0,
                                              ),

                                              constraints: BoxConstraints(
                                                minWidth: 200.w,
                                                maxWidth: 250.w,
                                                minHeight: 150.h,
                                                maxHeight: 450.h,
                                              ),

                                              color: AppColors.white,

                                              elevation: 4,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),

                                              items: stateLgaFormat
                                                  .map<PopupMenuEntry<String>>((
                                                    s,
                                                  ) {
                                                    final String state =
                                                        s['state']
                                                            ?.toString() ??
                                                        '';

                                                    return PopupMenuItem<
                                                      String
                                                    >(
                                                      value: state,
                                                      height: 38.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 14.w,
                                                          ),
                                                      child: TextView(
                                                        text: state,
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 13.70.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                  .toList(),
                                            );

                                        if (selectedState != null) {
                                          stateController.text = selectedState;
                                          final selectedStateLga =
                                              stateLgaFormat.firstWhere(
                                                (state) =>
                                                    state['state']
                                                        .toString()
                                                        .trim()
                                                        .toLowerCase() ==
                                                    stateController.text
                                                        .trim()
                                                        .toLowerCase(),
                                                orElse: () => <String, dynamic>{
                                                  'state': '',
                                                  'lgas': <String>[],
                                                },
                                              );

                                          final selectedLgas =
                                              List<String>.from(
                                                selectedStateLga['lgas'] ??
                                                    <String>[],
                                              );

                                          lgaList = List<String>.from(
                                            selectedLgas,
                                          );
                                          lgaListCopy = List<String>.from(
                                            selectedLgas,
                                          );

                                          // Optional: reset previously selected LGAs
                                          lgaAddedList.clear();
                                        }
                                        setModalState(() {});
                                        notifyListeners();
                                      },

                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                        ),
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                validator: AppValidator.validateString(),
                              ),

                              SizedBox(height: 12.30.h),
                              TextFormWidget(
                                hint: 'LGA',
                                label: '-Select-',
                                hintColor: AppColors.reminder,
                                hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                fillColor: AppColors.grey,
                                isFilled: true,
                                readOnly: true,
                                controller: lgaController,
                                suffixWidget: Builder(
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () async {
                                        final RenderBox button =
                                            context.findRenderObject()
                                                as RenderBox;

                                        final RenderBox overlay =
                                            Overlay.of(
                                                  context,
                                                ).context.findRenderObject()
                                                as RenderBox;

                                        final Offset buttonPosition = button
                                            .localToGlobal(
                                              Offset.zero,
                                              ancestor: overlay,
                                            );

                                        final Size buttonSize = button.size;

                                        final selectedState = stateLgaFormat
                                            .firstWhere(
                                              (state) =>
                                                  state['state']
                                                      .toString()
                                                      .trim()
                                                      .toLowerCase() ==
                                                  stateController.text
                                                      .trim()
                                                      .toLowerCase(),
                                              orElse: () => <String, dynamic>{
                                                'state': '',
                                                'lgas': <String>[],
                                              },
                                            );

                                        final List<dynamic> lgas =
                                            selectedState['lgas'] ?? [];

                                        if (lgas.isEmpty) {
                                          return;
                                        }

                                        final selectedLga =
                                            await showMenu<String>(
                                              context: context,

                                              position: RelativeRect.fromLTRB(
                                                buttonPosition.dx,
                                                buttonPosition.dy +
                                                    buttonSize.height +
                                                    5.h,
                                                overlay.size.width -
                                                    buttonPosition.dx -
                                                    buttonSize.width,
                                                0,
                                              ),

                                              constraints: BoxConstraints(
                                                minWidth: 200.w,
                                                maxWidth: 250.w,
                                                minHeight: 110.h,
                                                maxHeight: 420.h,
                                              ),

                                              color: AppColors.white,

                                              elevation: 4,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),

                                              items: lgas
                                                  .map<PopupMenuEntry<String>>((
                                                    lga,
                                                  ) {
                                                    return PopupMenuItem<
                                                      String
                                                    >(
                                                      value: lga.toString(),
                                                      height: 38.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 14.w,
                                                          ),
                                                      child: TextView(
                                                        text: lga.toString(),
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 13.70.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                  .toList(),
                                            );

                                        if (selectedLga != null) {
                                          lgaController.text = selectedLga;
                                          notifyListeners();
                                        }
                                      },

                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                        ),
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                validator: AppValidator.validateString(),
                                style: TextStyle(
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                ),

                                labelStyle: TextStyle(
                                  fontSize: 15.20.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                  color: AppColors.faintedGrey,
                                ),
                              ),
                              SizedBox(height: 30.h),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ButtonWidget(
                                      border: 100.r,
                                      buttonColor: AppColors.grey,
                                      buttonText: 'Cancel',
                                      color: AppColors.reminder1,
                                      buttonBorderColor: AppColors.transparent,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        notifyListeners();
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    flex: 3,
                                    child: ButtonWidget(
                                      border: 100.r,
                                      buttonColor: AppColors.primary,
                                      buttonText: !isEdit
                                          ? 'Add'
                                          : 'Save Changes',
                                      color: AppColors.white,
                                      buttonBorderColor: AppColors.transparent,
                                      isLoading: model.isLoading,
                                      onPressed: () async {
                                        if (isEdit) {
                                          model.updateBusinessAddress(
                                            context: context,
                                            businessAddress:
                                                BusinessAddressesEntity(
                                                  state: stateController.text
                                                      .trim(),
                                                  lga: lgaController.text
                                                      .trim(),
                                                  country: countryController
                                                      .text
                                                      .trim(),
                                                  businessAddress:
                                                      businessAddController.text
                                                          .trim(),
                                                ),
                                            id: busAddress?.id,
                                          );

                                          // listOfAddedAddress[editIndex] =
                                          //     BusinessAddresses(
                                          //       state: stateController.text
                                          //           .trim(),
                                          //       lga: lgaController.text.trim(),
                                          //       country: countryController.text
                                          //           .trim(),
                                          //       businessAddress:
                                          //           businessAddController.text
                                          //               .trim(),
                                          //     );
                                          // }
                                        } else {
                                          // ADD NEW STATE
                                          if (getDistributorDetailsResponseModel!
                                                  .data!
                                                  .businessAddresses!
                                                  .length <
                                              3) {
                                            model.addBusinessAddresses(
                                              context: context,
                                              businessAddresses:
                                                  BusinessAddressesEntity(
                                                    state: stateController.text
                                                        .trim(),
                                                    lga: lgaController.text
                                                        .trim(),
                                                    country: countryController
                                                        .text
                                                        .trim(),
                                                    businessAddress:
                                                        businessAddController
                                                            .text
                                                            .trim(),
                                                  ),
                                            );

                                            // listOfAddedAddress.add(
                                            //   BusinessAddresses(
                                            //     state: stateController.text.trim(),
                                            //     lga: lgaController.text.trim(),
                                            //     country: countryController.text
                                            //         .trim(),
                                            //     businessAddress:
                                            //         businessAddController.text
                                            //             .trim(),
                                            //   ),
                                            // );
                                          }
                                        }
                                        // }
                                        // await Future.delayed(
                                        //   Duration(seconds: 1),
                                        // );
                                        // lgaListCopy.clear();
                                        // setModalState(() {});
                                        Navigator.pop(context);
                                        model.notifyListeners();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void viewKycLevelDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return ViewModelBuilder<ManufacturerViewModel>.reactive(
              viewModelBuilder: () => locator<ManufacturerViewModel>(),
              onViewModelReady: (model) {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  model.getManAndDistributorKyc(context);
                });
              },
              disposeViewModel: false,
              builder: (_, ManufacturerViewModel model, _) {
                return Container(
                  color: AppColors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: TextButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: Text(
                            "Close",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6.10.h),
                      Dialog(
                        insetPadding: EdgeInsets.all(16.20.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: AppColors.white,
                        child: Padding(
                          padding: EdgeInsets.all(21.4.w),
                          child: SizedBox(
                            height: 500.h,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'What each level unlocks',
                                    textStyle: TextStyle(
                                      fontSize: 15.86.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder1,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),
                                  SizedBox(height: 4.2.h),
                                  Divider(color: AppColors.infoGrey1),
                                  SizedBox(height: 10.2.h),

                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(bottom: 14.w),
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.grey,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextView(
                                                  text: 'Level 1',
                                                  textStyle: TextStyle(
                                                    fontSize: 14.46.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 2.4.w,
                                                    horizontal: 8.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.app_green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  child: TextView(
                                                    text: 'Unlocked',
                                                    textStyle: TextStyle(
                                                      fontSize: 14.46.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.white,
                                                      fontFamily: 'DMSans',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 2.h),
                                            TextView(
                                              text: 'Account Created',
                                              textStyle: TextStyle(
                                                fontSize: 13.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.infoGrey,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16.90.h),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              size: 16.sp,
                                              color: AppColors.app_green,
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text:
                                                  'Access the distributor portal',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              size: 16.sp,
                                              color: AppColors.app_green,
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Complete company profile',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.locked_padlock,
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Upload products',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.infoGrey,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.locked_padlock,
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Publish products',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.infoGrey,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.locked_padlock,
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Receive Orders',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.infoGrey,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(bottom: 14.w),
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.grey,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextView(
                                                  text: 'Level 2',
                                                  textStyle: TextStyle(
                                                    fontSize: 14.46.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),
                                                model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[1]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? TextView(
                                                        text: 'Locked',
                                                        textStyle: TextStyle(
                                                          fontSize: 14.46.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .infoGrey,
                                                          fontFamily: 'DMSans',
                                                        ),
                                                      )
                                                    : Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 2.4.w,
                                                              horizontal: 8.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color: AppColors
                                                              .app_green,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                        child: TextView(
                                                          text: 'Unlocked',
                                                          textStyle: TextStyle(
                                                            fontSize: 14.46.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.white,
                                                            fontFamily:
                                                                'DMSans',
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                            SizedBox(height: 2.h),
                                            SizedBox(
                                              width: 260.w,
                                              child: TextView(
                                                text:
                                                    'Business Verification & Regulatory Compliance',
                                                maxLines: 2,
                                                textStyle: TextStyle(
                                                  fontSize: 13.86.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.infoGrey,
                                                  fontFamily: 'DMSans',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16.90.h),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[1]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Complete company profile',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[1]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[1]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text:
                                                  'Create and upload products',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[1]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[1]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'View product uploads',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[1]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[1]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Save draft products',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[1]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.locked_padlock,
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text:
                                                  'Publish products to the\nmarketplace',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.infoGrey,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(bottom: 14.w),
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.grey,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextView(
                                                  text: 'Level 3',
                                                  textStyle: TextStyle(
                                                    fontSize: 14.46.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),
                                                model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[2]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? TextView(
                                                        text: 'Locked',
                                                        textStyle: TextStyle(
                                                          fontSize: 14.86.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .infoGrey,
                                                          fontFamily: 'DMSans',
                                                        ),
                                                      )
                                                    : Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 2.4.w,
                                                              horizontal: 8.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color: AppColors
                                                              .app_green,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                        child: TextView(
                                                          text: 'Unlocked',
                                                          textStyle: TextStyle(
                                                            fontSize: 14.86.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.white,
                                                            fontFamily:
                                                                'DMSans',
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                            SizedBox(height: 2.h),
                                            SizedBox(
                                              width: 200.w,
                                              child: TextView(
                                                text:
                                                    'Commercial Activation — Verified Supplier',
                                                maxLines: 2,
                                                textStyle: TextStyle(
                                                  fontSize: 13.86.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.infoGrey,
                                                  fontFamily: 'DMSans',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 16.90.h),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[2]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Upload products',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[2]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[2]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Submit products',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[2]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[2]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Receive orders',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[2]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[2]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Manage orders',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[2]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[2]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Fulfilment',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[2]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[2]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Wallet',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[2]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            model
                                                        .getDistributorKycResponseModel
                                                        ?.data
                                                        ?.kycLevels?[2]
                                                        .status
                                                        ?.toLowerCase() !=
                                                    'approved'
                                                ? SvgPicture.asset(
                                                    AppImage.locked_padlock,
                                                  )
                                                : Icon(
                                                    Icons.check_circle_outline,
                                                    size: 16.sp,
                                                    color: AppColors.app_green,
                                                  ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Reports',
                                              textStyle: TextStyle(
                                                fontSize: 14.86.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    model
                                                            .getDistributorKycResponseModel
                                                            ?.data
                                                            ?.kycLevels?[2]
                                                            .status
                                                            ?.toLowerCase() !=
                                                        'approved'
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder1,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 30.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
