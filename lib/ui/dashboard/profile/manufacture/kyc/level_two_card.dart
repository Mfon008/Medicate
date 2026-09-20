// ignore_for_file: prefer_null_aware_operators, deprecated_member_use, must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/business_details.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/distributor.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/documents.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/manufacturer.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/app_assets/app_validation.dart';
import '../../../../../core/app_assets/constant.dart';
import '../../../../../core/connect_end/model/second_level_distributor_kyc_entity_model/importer.dart';
import '../../../../../core/connect_end/model/second_level_distributor_kyc_entity_model/second_level_distributor_kyc_entity_model.dart';
import '../../../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../../../manufacturer/product/custom_switch_widget.dart';
import '../../../../widget/button.dart';
import '../../../../widget/kyc_url_view.dart';
import '../../../../widget/text_form_widget.dart';
import '../dashed_border_painter.dart';

class LevelTwoCard extends StatefulWidget {
  const LevelTwoCard({super.key});

  @override
  State<LevelTwoCard> createState() => _LevelTwoCardState();
}

class _LevelTwoCardState extends State<LevelTwoCard> {
  bool isExpanded = false;
  bool isSwitchedDistributor = false;
  bool isSwitchedManufaturer = false;
  bool isSwitchedImporter = false;

  TextEditingController cacRegNoControllerDistributor = TextEditingController(
    text: '',
  );
  TextEditingController cacRegNoControllerDistributorLincense =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerDistributorNafPermit =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerDistributorCouncilLincense =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerDistributorBusinessAddress =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerDistributorContactPerson =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerDistributorContactPersonNumber =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerDistributorContactPersonEmail =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerDistributorBusinessWeb =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerDistributorTin =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturer = TextEditingController(
    text: '',
  );

  TextEditingController cacRegNoManufacturerController = TextEditingController(
    text: '',
  );
  TextEditingController cacRegNoControllerManufacturerCertificateNum =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturerLincenseNumber =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturerProdNumber =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturerBusinessAddress =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturerContactPerson =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturerContactPersonNumber =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturerContactPersonEmail =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturerBusinessWeb =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerManufacturerTin =
      TextEditingController(text: '');

  TextEditingController cacRegNoImporterController = TextEditingController(
    text: '',
  );
  TextEditingController cacRegNoControllerImporterCertificateNum =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerImporterBusinessAddress =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerImporterContactPerson =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerImporterContactPersonNumber =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerImporterContactPersonEmail =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerImporterBusinessWeb =
      TextEditingController(text: '');
  TextEditingController cacRegNoControllerImporterTin = TextEditingController(
    text: '',
  );

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  Future<void> getStuffs(ManufacturerViewModel model) async {
    model.businessTypes =
        model.getDistributorKycResponseModel?.data?.level2?.businessTypes ?? [];
    await Future.delayed(Duration(seconds: 1));
    if (model.businessTypes.contains('DISTRIBUTOR')) {
      isSwitchedDistributor = true;
    }
    if (model.businessTypes.contains('MANUFACTURER')) {
      isSwitchedManufaturer = true;
    }
    if (model.businessTypes.contains('IMPORTER')) {
      isSwitchedImporter = true;
    }
    cacRegNoControllerDistributor.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.cacRegistrationNumber ??
        '';
    cacRegNoControllerDistributorLincense.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.pharmaceuticalDistributionLicenseNumber ??
        '';
    cacRegNoControllerDistributorNafPermit.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.nafdacPermitNumber ??
        '';
    cacRegNoControllerDistributorCouncilLincense.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.pharmacyCouncilLicenseNumber ??
        '';
    cacRegNoControllerDistributorBusinessAddress.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.businessAddress ??
        '';
    cacRegNoControllerDistributorContactPerson.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.contactPersonName ??
        '';
    cacRegNoControllerDistributorContactPersonEmail.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.contactPersonEmail ??
        '';
    cacRegNoControllerDistributorBusinessWeb.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.businessWebsite ??
        '';
    cacRegNoControllerDistributorTin.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.distributor
            ?.businessDetails
            ?.taxIdentificationNumber ??
        '';

    cacRegNoManufacturerController.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.cacRegistrationNumber ??
        '';
    cacRegNoControllerManufacturerCertificateNum.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.gmpCertificateNumber ??
        '';
    cacRegNoControllerManufacturerLincenseNumber.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.nafdacManufacturingLicenseNumber ??
        '';
    cacRegNoControllerManufacturerProdNumber.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.productRegistrationEvidenceNumber ??
        '';
    cacRegNoControllerManufacturerBusinessAddress.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.businessAddress ??
        '';
    cacRegNoControllerManufacturerContactPerson.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.contactPersonName ??
        '';
    cacRegNoControllerManufacturerContactPersonEmail.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.contactPersonEmail ??
        '';
    cacRegNoControllerManufacturerBusinessWeb.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.businessWebsite ??
        '';
    cacRegNoControllerManufacturerTin.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.manufacturer
            ?.businessDetails
            ?.taxIdentificationNumber ??
        '';

    cacRegNoImporterController.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.importer
            ?.businessDetails
            ?.cacRegistrationNumber ??
        '';
    cacRegNoControllerImporterCertificateNum.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.importer
            ?.businessDetails
            ?.importPermitNumber ??
        '';
    cacRegNoControllerImporterBusinessAddress.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.importer
            ?.businessDetails
            ?.businessAddress ??
        '';
    cacRegNoControllerImporterContactPerson.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.importer
            ?.businessDetails
            ?.contactPersonName ??
        '';
    cacRegNoControllerImporterContactPersonNumber.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.importer
            ?.businessDetails
            ?.contactPersonPhoneNumber ??
        '';
    cacRegNoControllerImporterContactPersonEmail.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.importer
            ?.businessDetails
            ?.contactPersonEmail ??
        '';
    cacRegNoControllerImporterBusinessWeb.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.importer
            ?.businessDetails
            ?.businessWebsite ??
        '';
    cacRegNoControllerImporterTin.text =
        model
            .getDistributorKycResponseModel
            ?.data
            ?.level2
            ?.importer
            ?.businessDetails
            ?.taxIdentificationNumber ??
        "";

    if (model.getDistributorKycResponseModel!.data!.level2 != null &&
        model
                .getDistributorKycResponseModel!
                .data!
                .level2!
                .distributor!
                .businessDetails!
                .contactPersonPhoneNumber !=
            '') {
      cacRegNoControllerDistributorContactPersonNumber.text = model
          .returnAddingPhoneNoStructureWith234Kyc(
            model
                .getDistributorKycResponseModel!
                .data!
                .level2!
                .distributor!
                .businessDetails!
                .contactPersonPhoneNumber!,
          );
    } else {
      cacRegNoControllerDistributorContactPersonNumber.text = '';
    }
    final manPhoneNumber = model
        .getDistributorKycResponseModel
        ?.data
        ?.level2
        ?.manufacturer
        ?.businessDetails
        ?.contactPersonPhoneNumber;

    if (manPhoneNumber != null && manPhoneNumber.trim().isNotEmpty) {
      cacRegNoControllerManufacturerContactPersonNumber.text = model
          .returnAddingPhoneNoStructureWith234Kyc(manPhoneNumber);
    } else {
      cacRegNoControllerManufacturerContactPersonNumber.text = '';
    }

    final impPhoneNumber = model
        .getDistributorKycResponseModel
        ?.data
        ?.level2
        ?.manufacturer
        ?.businessDetails
        ?.contactPersonPhoneNumber;

    if (impPhoneNumber != null && impPhoneNumber.trim().isNotEmpty) {
      cacRegNoControllerImporterContactPersonNumber.text = model
          .returnAddingPhoneNoStructureWith234Kyc(impPhoneNumber);
    } else {
      cacRegNoControllerDistributorContactPersonNumber.text = '';
    }
    model.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManufacturerViewModel>.reactive(
      viewModelBuilder: () => ManufacturerViewModel(),
      onViewModelReady: (model) async {
        await model.getManAndDistributorKyc(context);
        getStuffs(model);
      },
      disposeViewModel: false,
      builder: (_, ManufacturerViewModel model, _) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: CustomPaint(
            painter: DashedBorderPainter(
              color: !isExpanded ? AppColors.transparent : AppColors.primary1,
              strokeWidth: 1.90,
              dashWidth: 4,
              dashSpace: 0,
              radius: 16.r,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: Container(
                  color: const Color(0xFFF1F7FE),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ==========================================
                      // HEADER
                      // ==========================================
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 13.h,
                          ),
                          color: !isExpanded
                              ? AppColors.f1
                              : const Color(0xFFF1F7FE),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              model
                                          .getDistributorKycResponseModel
                                          ?.data
                                          ?.kycLevels?[1]
                                          .status
                                          ?.toLowerCase() ==
                                      'approved'
                                  ? Container(
                                      width: 14.w,
                                      height: 14.w,
                                      margin: EdgeInsets.only(top: 1.h),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF58C58A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 9.sp,
                                        color: Colors.white,
                                      ),
                                    )
                                  : !isExpanded
                                  ? Icon(
                                      Icons.info_outline,
                                      size: 18.sp,
                                      color: AppColors.yellow,
                                    )
                                  : SvgPicture.asset(AppImage.open_padlock),

                              SizedBox(width: 8.w),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Level 2',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: !isExpanded
                                          ? AppColors.reminder1
                                          : AppColors.primary,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),

                                  SizedBox(height: 2.h),

                                  TextView(
                                    text:
                                        'Business Verification &\nRegulatory Compliance',
                                    textStyle: TextStyle(
                                      fontSize: 13.22.sp,
                                      fontWeight: FontWeight.w400,
                                      color: !isExpanded
                                          ? AppColors.reminder1
                                          : AppColors.primary,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),

                              AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 21.sp,
                                  color: const Color(0xFF333333),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ==========================================
                      // EXPANDED CONTENT
                      // ==========================================
                      if (isExpanded)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,

                            // Curved top corners
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ==================================
                              // KYC MESSAGE
                              // ==================================
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 12.h,
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 22.h,
                                ),
                                decoration: BoxDecoration(
                                  color: model.kycStatusColor(
                                    model
                                        .getDistributorKycResponseModel
                                        ?.data
                                        ?.kycLevels?[1]
                                        .status,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    model
                                                .getDistributorKycResponseModel
                                                ?.data
                                                ?.kycLevels?[1]
                                                .status
                                                ?.toLowerCase() ==
                                            'approved'
                                        ? Container(
                                            width: 14.w,
                                            height: 14.w,
                                            margin: EdgeInsets.only(top: 1.h),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF58C58A),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              size: 9.sp,
                                              color: Colors.white,
                                            ),
                                          )
                                        : Icon(
                                            Icons.info_outline,
                                            size: 18.90.sp,
                                            color: model.kycStatusColorIcon(
                                              model
                                                  .getDistributorKycResponseModel
                                                  ?.data
                                                  ?.kycLevels?[1]
                                                  .status,
                                            ),
                                          ),

                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Text(
                                        model.kycStatusText(
                                          model
                                              .getDistributorKycResponseModel
                                              ?.data
                                              ?.kycLevels?[1]
                                              .status,
                                        ),
                                        style: TextStyle(
                                          fontSize: 12.5.sp,
                                          height: 1.35,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF252525),
                                          fontFamily: 'DMSans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // ==================================
                              // INFORMATION
                              // ==================================
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 14.w),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 20.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.f1),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text:
                                            'Select business category that applies',
                                        textStyle: TextStyle(
                                          fontSize: 15.06.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.reminder1,
                                          fontFamily: 'DMSans',
                                        ),
                                      ),

                                      SizedBox(height: 5.10.h),

                                      Divider(color: AppColors.f1),
                                      SizedBox(height: 13.6.h),

                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14.w,
                                          vertical: 12.20.w,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.f1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.truck_out,
                                                ),
                                                SizedBox(width: 12.w),
                                                TextView(
                                                  text:
                                                      'Are you a Distributor?',
                                                  textStyle: TextStyle(
                                                    fontSize: 14.06.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextView(
                                                  text: 'No',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 15.22.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: isSwitchedDistributor
                                                        ? AppColors.infoGrey
                                                        : AppColors.reminder,
                                                  ),
                                                ),
                                                SizedBox(width: 3.10.h),
                                                CustomSwitch(
                                                  value: isSwitchedDistributor,
                                                  valueColor: AppColors.primary,
                                                  onChanged: (bool val) {
                                                    setState(() {
                                                      isSwitchedDistributor =
                                                          val;
                                                      if (isSwitchedDistributor) {
                                                        model.businessTypes.add(
                                                          'DISTRIBUTOR',
                                                        );
                                                      } else {
                                                        model.businessTypes
                                                            .remove(
                                                              'DISTRIBUTOR',
                                                            );
                                                      }
                                                      model.notifyListeners();
                                                    });
                                                  },
                                                ),
                                                SizedBox(width: 3.10.h),
                                                TextView(
                                                  text: 'Yes',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 15.22.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: isSwitchedDistributor
                                                        ? AppColors.reminder
                                                        : AppColors.infoGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            isSwitchedDistributor
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 10.h),

                                                      Divider(
                                                        color: AppColors.f1,
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'CAC / Company Business'
                                                            ' Registration Number',
                                                        rightPos: 0,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributor,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Pharmaceutical Distribution'
                                                            ' License Number',
                                                        rightPos: 0,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorLincense,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'NAFDAC Permit Number',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorNafPermit,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Pharmacy Council License'
                                                            ' Number',
                                                        rightPos: 0,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorCouncilLincense,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Business Address',
                                                        label:
                                                            '12 Oluwole Street, Ikeja, Lagos State',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        alignLabelWithHint:
                                                            true,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        maxline: 4,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorBusinessAddress,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint: 'Contact Person',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorContactPerson,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Contact Person Phone Number',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorContactPersonNumber,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Contact Person Email',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorContactPersonEmail,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Business Website (Optional)',
                                                        isShowHint: true,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorBusinessWeb,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Tax Identification Number (TIN)',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerDistributorTin,
                                                      ),
                                                      SizedBox(height: 20.h),

                                                      TextView(
                                                        text:
                                                            'Documents to upload',
                                                        textStyle: TextStyle(
                                                          fontSize: 15.06.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .reminder1,
                                                          fontFamily: 'DMSans',
                                                        ),
                                                      ),

                                                      SizedBox(height: 10.h),

                                                      Divider(
                                                        color: AppColors.f1,
                                                      ),
                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'CAC Certificate',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .distributor!
                                                                          .documents!
                                                                          .cacCertificate !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelCAC !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelCAC!
                                                                          .distributor !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelCAC!
                                                                          .distributor!
                                                                          .documents!
                                                                          .cacCertificate !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'CAC Certificate.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.distributor?.documents?.cacCertificate?.url ??
                                                                              model.secondLevelDistributorKycEntityModelCAC!.distributor?.documents?.cacCertificate?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageDistributorKycCAC(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingCAC
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Pharmaceutical\n'
                                                                'Distribution License',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .distributor!
                                                                          .documents!
                                                                          .pharmaceuticalDistributionLicense !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelPharmLin !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelPharmLin!
                                                                          .distributor !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelPharmLin!
                                                                          .distributor!
                                                                          .documents!
                                                                          .pharmaceuticalDistributionLicense !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'Pharm Distributor Lincense.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.distributor?.documents?.pharmaceuticalDistributionLicense?.url ??
                                                                              model.secondLevelDistributorKycEntityModelPharmLin!.distributor!.documents!.pharmaceuticalDistributionLicense?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageDistributorKycPharmLin(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingGMP
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'NAFDAC Permit',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .distributor!
                                                                          .documents!
                                                                          .nafdacPermit !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelNAF !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelNAF!
                                                                          .distributor !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelNAF!
                                                                          .distributor!
                                                                          .documents!
                                                                          .nafdacPermit !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'NAFDAC Permit.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.distributor?.documents?.nafdacPermit?.url ??
                                                                              model.secondLevelDistributorKycEntityModelNAF?.distributor?.documents?.nafdacPermit?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageDistributorKycNAFPermit(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingNAF
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Pharmacy Council License',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .distributor!
                                                                          .documents!
                                                                          .pharmacyCouncilLicense !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelPharmCouncilLin !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelPharmCouncilLin!
                                                                          .distributor !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelPharmCouncilLin!
                                                                          .distributor!
                                                                          .documents!
                                                                          .pharmacyCouncilLicense !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'Pharm Counsil Lincense.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.distributor?.documents?.pharmacyCouncilLicense?.url ??
                                                                              model.secondLevelDistributorKycEntityModelPharmCouncilLin?.distributor?.documents?.pharmacyCouncilLicense?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageDistributorKycPharmCouncilLin(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingProd
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Company Logo',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .distributor!
                                                                          .documents!
                                                                          .companyLogo !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelLogo !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelLogo!
                                                                          .distributor !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelLogo!
                                                                          .distributor!
                                                                          .documents!
                                                                          .companyLogo !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'Company Logo.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.distributor?.documents?.companyLogo?.url ??
                                                                              model.secondLevelDistributorKycEntityModelLogo?.distributor?.documents?.companyLogo?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageDistributorKycLogo(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingLogo
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                      SizedBox(height: 20.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              TextView(
                                                                text:
                                                                    'Area/Location ',
                                                                textStyle: TextStyle(
                                                                  fontSize:
                                                                      15.86.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: AppColors
                                                                      .reminder1,
                                                                  fontFamily:
                                                                      'DMSans',
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 6.10.w,
                                                              ),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          6.2.w,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        22,
                                                                      ),
                                                                  border: Border.all(
                                                                    color: AppColors
                                                                        .primary1,
                                                                  ),
                                                                ),
                                                                child: TextView(
                                                                  text:
                                                                      '${model.listOfAddedLocation.length}',
                                                                  textStyle: TextStyle(
                                                                    fontSize:
                                                                        12.6.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    color: AppColors
                                                                        .primary1,
                                                                    fontFamily:
                                                                        'DMSans',
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              model
                                                                  .stateController
                                                                  .clear();
                                                              model.lgaListCopy
                                                                  .clear();
                                                              model
                                                                  .showLGAAndStateDialog(
                                                                    context,
                                                                  );
                                                            },
                                                            icon: Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .reminder1,
                                                              size: 22.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        color: AppColors.f1,
                                                      ),

                                                      ...model.listOfAddedLocation.map(
                                                        (o) => Container(
                                                          width:
                                                              double.infinity,
                                                          margin:
                                                              EdgeInsets.only(
                                                                bottom: 12.w,
                                                              ),
                                                          padding:
                                                              EdgeInsets.all(
                                                                16.w,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  12,
                                                                ),
                                                            color:
                                                                AppColors.grey,
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              TextView(
                                                                text: o
                                                                    .keys
                                                                    .first,
                                                                textStyle: TextStyle(
                                                                  fontSize:
                                                                      13.86.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: AppColors
                                                                      .reminder1,
                                                                  fontFamily:
                                                                      'DMSans',
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 7.2.h,
                                                              ),

                                                              AnimatedSize(
                                                                duration:
                                                                    const Duration(
                                                                      milliseconds:
                                                                          300,
                                                                    ),
                                                                curve: Curves
                                                                    .easeInOut,
                                                                child:
                                                                    model.selectedLocation ==
                                                                        o
                                                                    ? Wrap(
                                                                        children: [
                                                                          ...o.values.first.map(
                                                                            (
                                                                              e,
                                                                            ) => TextView(
                                                                              text: '$e, ',
                                                                              textStyle: TextStyle(
                                                                                fontSize: 13.86.sp,
                                                                                fontWeight: FontWeight.w200,
                                                                                color: AppColors.infoGrey,
                                                                                fontFamily: 'DMSans',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : Text(
                                                                        o
                                                                            .values
                                                                            .first
                                                                            .map(
                                                                              (
                                                                                e,
                                                                              ) => '$e,',
                                                                            )
                                                                            .join(
                                                                              ' ',
                                                                            ),
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                          fontSize:
                                                                              13.86.sp,
                                                                          fontWeight:
                                                                              FontWeight.w200,
                                                                          color:
                                                                              AppColors.infoGrey,
                                                                          fontFamily:
                                                                              'DMSans',
                                                                        ),
                                                                      ),
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  if (model
                                                                          .selectedLocation ==
                                                                      o) {
                                                                    model.selectedLocation =
                                                                        null;
                                                                  } else {
                                                                    model.selectedLocation =
                                                                        o;
                                                                  }
                                                                  model
                                                                      .notifyListeners();
                                                                },
                                                                child: TextView(
                                                                  text:
                                                                      model.selectedLocation ==
                                                                          o
                                                                      ? 'Hide'
                                                                      : 'See all',
                                                                  textStyle: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                    decorationColor:
                                                                        model.selectedLocation ==
                                                                            o
                                                                        ? AppColors
                                                                              .primary
                                                                        : AppColors
                                                                              .reminder1,
                                                                    fontSize:
                                                                        12.86
                                                                            .sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        model.selectedLocation ==
                                                                            o
                                                                        ? AppColors
                                                                              .primary
                                                                        : AppColors
                                                                              .reminder1,
                                                                    fontFamily:
                                                                        'DMSans',
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      model
                                                                          .stateController
                                                                          .text = o
                                                                          .keys
                                                                          .first;
                                                                      model.showLGAAndStateDialog(
                                                                        context,
                                                                        isEdit:
                                                                            true,
                                                                        editState: o
                                                                            .keys
                                                                            .first,
                                                                        editLgas: o
                                                                            .values
                                                                            .first,
                                                                      );
                                                                      model
                                                                          .notifyListeners();
                                                                    },
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .round_edit,
                                                                      height:
                                                                          22.h,
                                                                      width:
                                                                          22.h,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.h,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      model
                                                                          .listOfAddedLocation
                                                                          .remove(
                                                                            o,
                                                                          );
                                                                      setState(
                                                                        () {},
                                                                      );
                                                                      model
                                                                          .notifyListeners();
                                                                    },
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .delete,
                                                                      height:
                                                                          20.h,
                                                                      width:
                                                                          20.h,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 20.h),

                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14.w,
                                          vertical: 16.20.w,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.f1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.box_cart,
                                                  color: AppColors.primary,
                                                ),
                                                SizedBox(width: 12.w),
                                                TextView(
                                                  text:
                                                      'Are you a Manufacturer?',
                                                  textStyle: TextStyle(
                                                    fontSize: 14.06.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextView(
                                                  text: 'No',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 15.22.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: isSwitchedManufaturer
                                                        ? AppColors.infoGrey
                                                        : AppColors.reminder,
                                                  ),
                                                ),
                                                SizedBox(width: 3.10.h),
                                                CustomSwitch(
                                                  value: isSwitchedManufaturer,
                                                  valueColor: AppColors.primary,
                                                  onChanged: (bool val) {
                                                    setState(() {
                                                      isSwitchedManufaturer =
                                                          val;
                                                      if (isSwitchedManufaturer) {
                                                        model.businessTypes.add(
                                                          'MANUFACTURER',
                                                        );
                                                      } else {
                                                        model.businessTypes
                                                            .remove(
                                                              'MANUFACTURER',
                                                            );
                                                      }
                                                      model.notifyListeners();
                                                    });
                                                  },
                                                ),
                                                SizedBox(width: 3.10.h),
                                                TextView(
                                                  text: 'Yes',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 15.22.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: isSwitchedManufaturer
                                                        ? AppColors.reminder
                                                        : AppColors.infoGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            isSwitchedManufaturer
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 10.h),

                                                      Divider(
                                                        color: AppColors.f1,
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'CAC / Company Business'
                                                            ' Registration Number',
                                                        rightPos: 0,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoManufacturerController,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'GMP Certificate Number',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerCertificateNum,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'NAFDAC Manufacturing\nLicense Number',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerLincenseNumber,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Product Registration\nEvidence Number',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerProdNumber,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Business Address',
                                                        label:
                                                            '12 Oluwole Street, Ikeja, Lagos State',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        maxline: 4,
                                                        alignLabelWithHint:
                                                            true,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerBusinessAddress,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint: 'Contact Person',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerContactPerson,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Contact Person Phone Number',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerContactPersonNumber,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Contact Person Email',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerContactPersonEmail,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Business Website (Optional)',
                                                        isShowHint: true,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerBusinessWeb,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Tax Identification Number (TIN)',
                                                        rightPos: -12,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerManufacturerTin,
                                                      ),
                                                      SizedBox(height: 20.h),

                                                      TextView(
                                                        text:
                                                            'Documents to upload',
                                                        textStyle: TextStyle(
                                                          fontSize: 15.06.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .reminder1,
                                                          fontFamily: 'DMSans',
                                                        ),
                                                      ),

                                                      SizedBox(height: 10.h),

                                                      Divider(
                                                        color: AppColors.f1,
                                                      ),
                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'CAC Certificate',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .cacCertificate !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelManCAC !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManCAC!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManCAC!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .cacCertificate !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'CAC Certificate.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.manufacturer?.documents?.cacCertificate?.url ??
                                                                              model.secondLevelDistributorKycEntityModelManCAC?.manufacturer?.documents?.cacCertificate?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageManufacturerKycCAC(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingCAC
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 120.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'GMP Certificate',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .gmpCertificate !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelManGMP !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManGMP!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManGMP!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .gmpCertificate !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'GMP Certificate.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.manufacturer?.documents?.gmpCertificate?.url ??
                                                                              model.secondLevelDistributorKycEntityModelManGMP?.manufacturer?.documents?.gmpCertificate?.url ??
                                                                              ''
                                                                                  '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageManufacturerKycGMP(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingGMP
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 120.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'NAFDAC Manufacturing\nLicense',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .nafdacManufacturingLicense !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelManNAF !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManNAF!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManNAF!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .nafdacManufacturingLicense !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'NAFDAC Manufacturing License.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.manufacturer?.documents?.nafdacManufacturingLicense?.url ??
                                                                              model.secondLevelDistributorKycEntityModelManNAF?.manufacturer?.documents?.nafdacManufacturingLicense?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageManufacturerKycNAFManLin(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingNAF
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),

                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Pharmacy Council License',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .productRegistrationEvidence !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelManProd !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManProd!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManProd!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .productRegistrationEvidence !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'Product Registration Evidence.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.manufacturer?.documents?.productRegistrationEvidence?.url ??
                                                                              model.secondLevelDistributorKycEntityModelManProd?.manufacturer?.documents?.productRegistrationEvidence?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageManufacturerKycProdRegEvi(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingProd
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Company Logo',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .companyLogo !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelManLogo !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManLogo!
                                                                          .manufacturer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelManLogo!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .companyLogo !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'Company Logo.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.manufacturer?.documents?.companyLogo?.url ??
                                                                              model.secondLevelDistributorKycEntityModelManLogo?.manufacturer?.documents?.companyLogo?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageManufacturerKycComLogo(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingLogo
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 20.h),

                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14.w,
                                          vertical: 16.20.w,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.f1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.plane,
                                                  color: AppColors.primary,
                                                ),
                                                SizedBox(width: 12.w),
                                                TextView(
                                                  text: 'Are you a Importer?',
                                                  textStyle: TextStyle(
                                                    fontSize: 14.06.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextView(
                                                  text: 'No',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 15.22.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: isSwitchedImporter
                                                        ? AppColors.infoGrey
                                                        : AppColors.reminder,
                                                  ),
                                                ),
                                                SizedBox(width: 3.10.h),
                                                CustomSwitch(
                                                  value: isSwitchedImporter,
                                                  valueColor: AppColors.primary,
                                                  onChanged: (bool val) {
                                                    setState(() {
                                                      isSwitchedImporter = val;
                                                      if (isSwitchedImporter) {
                                                        model.businessTypes.add(
                                                          'IMPORTER',
                                                        );
                                                      } else {
                                                        model.businessTypes
                                                            .remove('IMPORTER');
                                                      }
                                                      model.notifyListeners();
                                                    });
                                                  },
                                                ),
                                                SizedBox(width: 3.10.h),
                                                TextView(
                                                  text: 'Yes',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 15.22.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: isSwitchedImporter
                                                        ? AppColors.reminder
                                                        : AppColors.infoGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            isSwitchedImporter
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 10.h),

                                                      Divider(
                                                        color: AppColors.f1,
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'CAC / Company Business'
                                                            ' Registration Number',
                                                        rightPos: 0,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoImporterController,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Import Permit Number',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerImporterCertificateNum,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Business Address',
                                                        label:
                                                            '12 Oluwole Street, Ikeja, Lagos State',

                                                        alignLabelWithHint:
                                                            true,
                                                        maxline: 4,
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerImporterBusinessAddress,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint: 'Contact Person',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerImporterContactPerson,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Contact Person Phone Number',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerImporterContactPersonNumber,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Contact Person Email',
                                                        rightPos: -14,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerImporterContactPersonEmail,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Business Website (Optional)',
                                                        isShowHint: true,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerImporterBusinessWeb,
                                                      ),
                                                      SizedBox(height: 20.h),
                                                      TextFormWidget(
                                                        hint:
                                                            'Tax Identification Number (TIN)',
                                                        rightPos: -12,
                                                        hintSize: 14,
                                                        borderColor: AppColors
                                                            .transparent,
                                                        borderTopLeft: 10.r,
                                                        borderTopRight: 10.r,
                                                        borderBottomLeft: 10.r,
                                                        borderBottomRight: 10.r,
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.2.sp,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                        fillColor:
                                                            AppColors.grey,
                                                        isFilled: true,
                                                        validator:
                                                            AppValidator.validateString(),
                                                        controller:
                                                            cacRegNoControllerImporterTin,
                                                      ),
                                                      SizedBox(height: 20.h),

                                                      TextView(
                                                        text:
                                                            'Documents to upload',
                                                        textStyle: TextStyle(
                                                          fontSize: 15.06.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .reminder1,
                                                          fontFamily: 'DMSans',
                                                        ),
                                                      ),

                                                      SizedBox(height: 10.h),

                                                      Divider(
                                                        color: AppColors.f1,
                                                      ),
                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'CAC Certificate',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .importer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .importer!
                                                                          .documents!
                                                                          .cacCertificate !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelImpCAC !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelImpCAC!
                                                                          .importer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelImpCAC!
                                                                          .importer!
                                                                          .documents!
                                                                          .cacCertificate !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'CAC Certificate.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.importer?.documents?.cacCertificate?.url ??
                                                                              model.secondLevelDistributorKycEntityModelImpCAC?.importer?.documents?.cacCertificate?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageImporterKycCAC(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingCAC
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Import Permit',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),

                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .importer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .importer!
                                                                          .documents!
                                                                          .importPermit !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelImpPermit !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelImpPermit!
                                                                          .importer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelImpPermit!
                                                                          .importer!
                                                                          .documents!
                                                                          .importPermit !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'Import Permit.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.importer?.documents?.importPermit?.url ??
                                                                              model.secondLevelDistributorKycEntityModelImpPermit?.importer?.documents?.importPermit?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageImporterKycPermit(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingProd
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Manufacturer Authorization Letter',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),

                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .importer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .importer!
                                                                          .documents!
                                                                          .manufacturerAuthorizationLetter !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelImpManAuthLetter !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelImpManAuthLetter!
                                                                          .importer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelImpManAuthLetter!
                                                                          .importer!
                                                                          .documents!
                                                                          .manufacturerAuthorizationLetter !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'Manufacturer Authorization Letter.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.importer?.documents?.manufacturerAuthorizationLetter?.url ??
                                                                              model.secondLevelDistributorKycEntityModelImpManAuthLetter?.importer?.documents?.manufacturerAuthorizationLetter?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageImporterKycManAuthLetter(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingNAF
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                      SizedBox(height: 20.6.h),
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'Company Logo',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -12.10,
                                                            child: TextView(
                                                              text: '*',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      model.getDistributorKycResponseModel!.data!.level2 !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .importer !=
                                                                      null &&
                                                                  model
                                                                          .getDistributorKycResponseModel!
                                                                          .data!
                                                                          .level2!
                                                                          .importer!
                                                                          .documents!
                                                                          .companyLogo !=
                                                                      null ||
                                                              model.secondLevelDistributorKycEntityModelImpLogo !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelImpLogo!
                                                                          .importer !=
                                                                      null &&
                                                                  model
                                                                          .secondLevelDistributorKycEntityModelImpLogo!
                                                                          .importer!
                                                                          .documents!
                                                                          .companyLogo !=
                                                                      null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    10.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .tintColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_file,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        14.20.w,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 80.w,
                                                                    child: TextView(
                                                                      text:
                                                                          'Company Logo.jpg',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (_) => ImageWebViewScreen(
                                                                          imageUrl:
                                                                              model.getDistributorKycResponseModel?.data?.level2?.importer?.documents?.companyLogo?.url ??
                                                                              model.secondLevelDistributorKycEntityModelImpLogo?.importer?.documents?.companyLogo?.url ??
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .kyc_eye,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child: DottedBorder(
                                                                options: RoundedRectDottedBorderOptions(
                                                                  dashPattern: [
                                                                    10,
                                                                    10,
                                                                  ],
                                                                  strokeWidth:
                                                                      .94,
                                                                  radius:
                                                                      Radius.circular(
                                                                        10,
                                                                      ),
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageImporterKycLogo(
                                                                        context,
                                                                      ),
                                                                  child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          16.20
                                                                              .w,
                                                                      horizontal:
                                                                          14.0.w,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            10.r,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        model.isLoadingLogo
                                                                            ? SizedBox(
                                                                                width: 20.w,
                                                                                height: 20.h,
                                                                                child: CircularProgressIndicator(
                                                                                  color: AppColors.primary,
                                                                                  strokeWidth: 2.w,
                                                                                ),
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                AppImage.upload_doc,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Upload Document',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'GoogleSans',
                                                                                fontSize: 14.2.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.0.h,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 130.w,
                                                                              child: TextView(
                                                                                text:
                                                                                    'Max file size: 2MB (.jpg,'
                                                                                    ' .jpeg, .png, or'
                                                                                    ' .pdf supported)',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'Arial',
                                                                                  fontSize: 13.6.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.fineGrey,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                      ),

                                      model
                                                  .getDistributorKycResponseModel
                                                  ?.data
                                                  ?.kycLevels?[1]
                                                  .status
                                                  ?.toLowerCase() ==
                                              'approved'
                                          ? SizedBox.shrink()
                                          : Column(
                                              children: [
                                                SizedBox(height: 30.h),
                                                ButtonWidget(
                                                  border: 100.r,
                                                  buttonColor: AppColors.white,
                                                  fontSize: 14.sp,
                                                  buttonText: 'Save Progress',
                                                  color: AppColors.primary,
                                                  isLoading: model.isLoading,
                                                  buttonBorderColor:
                                                      AppColors.primary,
                                                  onPressed: () => model.saveLevelTwoManAndDistributorKycProgress(
                                                    context: context,
                                                    kycEntity: SecondLevelDistributorKycEntityModel(
                                                      businessTypes:
                                                          model.businessTypes,
                                                      distributor:
                                                          !isSwitchedDistributor
                                                          ? null
                                                          : Distributor(
                                                              businessDetails: BusinessDetails(
                                                                cacRegistrationNumber:
                                                                    cleanValue(
                                                                      cacRegNoControllerDistributor
                                                                          .text
                                                                          .trim(),
                                                                    ),
                                                                businessAddress:
                                                                    cacRegNoControllerDistributorBusinessAddress
                                                                        .text
                                                                        .trim(),
                                                                contactPersonName:
                                                                    cacRegNoControllerDistributorContactPerson
                                                                        .text
                                                                        .trim(),
                                                                contactPersonEmail:
                                                                    cacRegNoControllerDistributorContactPersonEmail
                                                                        .text
                                                                        .trim(),
                                                                contactPersonPhoneNumber:
                                                                    cacRegNoControllerDistributorContactPersonNumber
                                                                            .text !=
                                                                        ''
                                                                    ? model.returnAddingPhoneNoStructureWith234Kyc(
                                                                        cacRegNoControllerDistributorContactPersonNumber
                                                                            .text
                                                                            .trim(),
                                                                      )
                                                                    : '',
                                                                businessWebsite:
                                                                    cacRegNoControllerDistributorBusinessWeb
                                                                        .text
                                                                        .trim(),
                                                                taxIdentificationNumber:
                                                                    cacRegNoControllerDistributorTin
                                                                        .text
                                                                        .trim(),
                                                                pharmaceuticalDistributionLicenseNumber:
                                                                    cacRegNoControllerDistributorLincense
                                                                        .text
                                                                        .trim(),
                                                                pharmacyCouncilLicenseNumber:
                                                                    cacRegNoControllerDistributorCouncilLincense
                                                                        .text
                                                                        .trim(),
                                                                nafdacPermitNumber:
                                                                    cacRegNoControllerDistributorNafPermit
                                                                        .text
                                                                        .trim(),
                                                                productRegistrationEvidenceNumber:
                                                                    null,
                                                                importPermitNumber:
                                                                    null,
                                                                nafdacManufacturingLicenseNumber:
                                                                    null,
                                                                gmpCertificateNumber:
                                                                    null,
                                                              ),
                                                              documents: Documents(
                                                                cacCertificate:
                                                                    model.secondLevelDistributorKycEntityModelCAC ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelCAC!
                                                                          .distributor!
                                                                          .documents!
                                                                          .cacCertificate!,
                                                                pharmaceuticalDistributionLicense:
                                                                    model.secondLevelDistributorKycEntityModelPharmLin ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelPharmLin!
                                                                          .distributor!
                                                                          .documents!
                                                                          .pharmaceuticalDistributionLicense!,
                                                                nafdacPermit:
                                                                    model.secondLevelDistributorKycEntityModelNAF ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelNAF!
                                                                          .distributor!
                                                                          .documents!
                                                                          .nafdacPermit!,
                                                                pharmacyCouncilLicense:
                                                                    model.secondLevelDistributorKycEntityModelPharmCouncilLin ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelPharmCouncilLin!
                                                                          .distributor!
                                                                          .documents!
                                                                          .pharmacyCouncilLicense!,
                                                                companyLogo:
                                                                    model.secondLevelDistributorKycEntityModelLogo ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelLogo!
                                                                          .distributor!
                                                                          .documents!
                                                                          .companyLogo!,
                                                              ),
                                                            ),
                                                      manufacturer:
                                                          !isSwitchedManufaturer
                                                          ? null
                                                          : Manufacturer(
                                                              businessDetails: BusinessDetails(
                                                                cacRegistrationNumber:
                                                                    cacRegNoControllerManufacturer
                                                                        .text
                                                                        .trim(),
                                                                businessAddress:
                                                                    cacRegNoControllerManufacturerBusinessAddress
                                                                        .text
                                                                        .trim(),
                                                                contactPersonName:
                                                                    cacRegNoControllerManufacturerContactPerson
                                                                        .text
                                                                        .trim(),
                                                                contactPersonEmail:
                                                                    cacRegNoControllerManufacturerContactPersonEmail
                                                                        .text
                                                                        .trim(),
                                                                contactPersonPhoneNumber:
                                                                    cacRegNoControllerManufacturerContactPersonNumber
                                                                            .text !=
                                                                        ''
                                                                    ? model.returnAddingPhoneNoStructureWith234Kyc(
                                                                        cacRegNoControllerManufacturerContactPersonNumber
                                                                            .text
                                                                            .trim(),
                                                                      )
                                                                    : '',
                                                                businessWebsite:
                                                                    cacRegNoControllerManufacturerBusinessWeb
                                                                        .text
                                                                        .trim(),
                                                                taxIdentificationNumber:
                                                                    cacRegNoControllerManufacturerTin
                                                                        .text
                                                                        .trim(),
                                                                gmpCertificateNumber:
                                                                    cacRegNoControllerManufacturerCertificateNum
                                                                        .text
                                                                        .trim(),
                                                                nafdacManufacturingLicenseNumber:
                                                                    cacRegNoControllerManufacturerLincenseNumber
                                                                        .text
                                                                        .trim(),
                                                                productRegistrationEvidenceNumber:
                                                                    cacRegNoControllerManufacturerProdNumber
                                                                        .text
                                                                        .trim(),
                                                                pharmaceuticalDistributionLicenseNumber:
                                                                    null,
                                                                pharmacyCouncilLicenseNumber:
                                                                    null,
                                                                importPermitNumber:
                                                                    null,
                                                                nafdacPermitNumber:
                                                                    null,
                                                              ),
                                                              documents: Documents(
                                                                cacCertificate:
                                                                    model.secondLevelDistributorKycEntityModelManCAC ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelManCAC!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .cacCertificate!,
                                                                gmpCertificate:
                                                                    model.secondLevelDistributorKycEntityModelManGMP ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelManGMP!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .gmpCertificate!,
                                                                nafdacManufacturingLicense:
                                                                    model.secondLevelDistributorKycEntityModelManNAF ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelManNAF!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .nafdacManufacturingLicense!,
                                                                productRegistrationEvidence:
                                                                    model.secondLevelDistributorKycEntityModelManProd ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelManProd!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .productRegistrationEvidence!,
                                                                companyLogo:
                                                                    model.secondLevelDistributorKycEntityModelManLogo ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelManLogo!
                                                                          .manufacturer!
                                                                          .documents!
                                                                          .companyLogo!,
                                                              ),
                                                            ),
                                                      importer:
                                                          !isSwitchedImporter
                                                          ? null
                                                          : Importer(
                                                              businessDetails: BusinessDetails(
                                                                cacRegistrationNumber:
                                                                    cacRegNoImporterController
                                                                        .text
                                                                        .trim(),
                                                                businessAddress:
                                                                    cacRegNoControllerImporterBusinessAddress
                                                                        .text
                                                                        .trim(),
                                                                contactPersonName:
                                                                    cacRegNoControllerImporterContactPerson
                                                                        .text
                                                                        .trim(),
                                                                contactPersonEmail:
                                                                    cacRegNoControllerImporterContactPersonEmail
                                                                        .text
                                                                        .trim(),
                                                                contactPersonPhoneNumber:
                                                                    cacRegNoControllerImporterContactPersonNumber
                                                                            .text !=
                                                                        ''
                                                                    ? model.returnAddingPhoneNoStructureWith234Kyc(
                                                                        cacRegNoControllerImporterContactPersonNumber
                                                                            .text
                                                                            .trim(),
                                                                      )
                                                                    : '',
                                                                businessWebsite:
                                                                    cacRegNoControllerImporterBusinessWeb
                                                                        .text
                                                                        .trim(),
                                                                taxIdentificationNumber:
                                                                    cacRegNoControllerImporterTin
                                                                        .text
                                                                        .trim(),
                                                                importPermitNumber:
                                                                    cacRegNoControllerImporterCertificateNum
                                                                        .text
                                                                        .trim(),
                                                                pharmaceuticalDistributionLicenseNumber:
                                                                    null,
                                                                pharmacyCouncilLicenseNumber:
                                                                    null,
                                                                productRegistrationEvidenceNumber:
                                                                    null,
                                                                nafdacPermitNumber:
                                                                    null,
                                                                gmpCertificateNumber:
                                                                    null,
                                                                nafdacManufacturingLicenseNumber:
                                                                    null,
                                                              ),
                                                              documents: Documents(
                                                                cacCertificate:
                                                                    model.secondLevelDistributorKycEntityModelImpCAC ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelImpCAC!
                                                                          .importer!
                                                                          .documents!
                                                                          .cacCertificate!,
                                                                importPermit:
                                                                    model.secondLevelDistributorKycEntityModelImpPermit ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelImpPermit!
                                                                          .importer!
                                                                          .documents!
                                                                          .importPermit!,
                                                                manufacturerAuthorizationLetter:
                                                                    model.secondLevelDistributorKycEntityModelImpManAuthLetter ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelImpManAuthLetter!
                                                                          .importer!
                                                                          .documents!
                                                                          .manufacturerAuthorizationLetter!,
                                                                companyLogo:
                                                                    model.secondLevelDistributorKycEntityModelImpLogo ==
                                                                        null
                                                                    ? null
                                                                    : model
                                                                          .secondLevelDistributorKycEntityModelImpLogo!
                                                                          .importer!
                                                                          .documents!
                                                                          .companyLogo!,
                                                              ),
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 20.h),
                                                ButtonWidget(
                                                  border: 100.r,
                                                  buttonColor:
                                                      AppColors.primary,
                                                  fontSize: 14.sp,
                                                  buttonText:
                                                      'Submit for Verification',
                                                  color: AppColors.white,
                                                  isLoading: model.isLoading,
                                                  buttonBorderColor:
                                                      AppColors.transparent,
                                                  onPressed: () {
                                                    if (formKey!.currentState!
                                                        .validate()) {
                                                      model.submitLevelTwoManAndDistributorKyc(
                                                        context: context,
                                                        kycEntity: SecondLevelDistributorKycEntityModel(
                                                          businessTypes: model
                                                              .businessTypes,
                                                          distributor: Distributor(
                                                            businessDetails: BusinessDetails(
                                                              cacRegistrationNumber:
                                                                  cacRegNoControllerDistributor
                                                                      .text
                                                                      .trim(),
                                                              businessAddress:
                                                                  cacRegNoControllerDistributorBusinessAddress
                                                                      .text
                                                                      .trim(),
                                                              contactPersonName:
                                                                  cacRegNoControllerDistributorContactPerson
                                                                      .text
                                                                      .trim(),
                                                              contactPersonEmail:
                                                                  cacRegNoControllerDistributorContactPersonEmail
                                                                      .text
                                                                      .trim(),
                                                              contactPersonPhoneNumber:
                                                                  cacRegNoControllerDistributorContactPersonNumber
                                                                          .text !=
                                                                      ''
                                                                  ? model.returnAddingPhoneNoStructureWith234Kyc(
                                                                      cacRegNoControllerDistributorContactPersonNumber
                                                                          .text
                                                                          .trim(),
                                                                    )
                                                                  : '',
                                                              businessWebsite:
                                                                  cacRegNoControllerDistributorBusinessWeb
                                                                      .text
                                                                      .trim(),
                                                              taxIdentificationNumber:
                                                                  cacRegNoControllerDistributorTin
                                                                      .text
                                                                      .trim(),
                                                              pharmaceuticalDistributionLicenseNumber:
                                                                  cacRegNoControllerDistributorLincense
                                                                      .text
                                                                      .trim(),
                                                              pharmacyCouncilLicenseNumber:
                                                                  cacRegNoControllerDistributorCouncilLincense
                                                                      .text
                                                                      .trim(),
                                                              nafdacPermitNumber:
                                                                  cacRegNoControllerDistributorNafPermit
                                                                      .text
                                                                      .trim(),
                                                              productRegistrationEvidenceNumber:
                                                                  null,
                                                              importPermitNumber:
                                                                  null,
                                                              nafdacManufacturingLicenseNumber:
                                                                  null,
                                                              gmpCertificateNumber:
                                                                  null,
                                                            ),
                                                            documents: Documents(
                                                              cacCertificate:
                                                                  model.secondLevelDistributorKycEntityModelCAC ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelCAC!
                                                                        .distributor!
                                                                        .documents!
                                                                        .cacCertificate!,
                                                              pharmaceuticalDistributionLicense:
                                                                  model.secondLevelDistributorKycEntityModelPharmLin ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelPharmLin!
                                                                        .distributor!
                                                                        .documents!
                                                                        .pharmaceuticalDistributionLicense!,
                                                              nafdacPermit:
                                                                  model.secondLevelDistributorKycEntityModelNAF ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelNAF!
                                                                        .distributor!
                                                                        .documents!
                                                                        .nafdacPermit!,
                                                              pharmacyCouncilLicense:
                                                                  model.secondLevelDistributorKycEntityModelPharmCouncilLin ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelPharmCouncilLin!
                                                                        .distributor!
                                                                        .documents!
                                                                        .pharmacyCouncilLicense!,
                                                              companyLogo:
                                                                  model.secondLevelDistributorKycEntityModelLogo ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelLogo!
                                                                        .distributor!
                                                                        .documents!
                                                                        .companyLogo!,
                                                            ),
                                                          ),
                                                          manufacturer: Manufacturer(
                                                            businessDetails: BusinessDetails(
                                                              cacRegistrationNumber:
                                                                  cacRegNoControllerManufacturer
                                                                      .text
                                                                      .trim(),
                                                              businessAddress:
                                                                  cacRegNoControllerManufacturerBusinessAddress
                                                                      .text
                                                                      .trim(),
                                                              contactPersonName:
                                                                  cacRegNoControllerManufacturerContactPerson
                                                                      .text
                                                                      .trim(),
                                                              contactPersonEmail:
                                                                  cacRegNoControllerManufacturerContactPersonEmail
                                                                      .text
                                                                      .trim(),
                                                              contactPersonPhoneNumber:
                                                                  cacRegNoControllerManufacturerContactPersonNumber
                                                                          .text !=
                                                                      ''
                                                                  ? model.returnAddingPhoneNoStructureWith234Kyc(
                                                                      cacRegNoControllerManufacturerContactPersonNumber
                                                                          .text
                                                                          .trim(),
                                                                    )
                                                                  : '',
                                                              businessWebsite:
                                                                  cacRegNoControllerManufacturerBusinessWeb
                                                                      .text
                                                                      .trim(),
                                                              taxIdentificationNumber:
                                                                  cacRegNoControllerManufacturerTin
                                                                      .text
                                                                      .trim(),
                                                              gmpCertificateNumber:
                                                                  cacRegNoControllerManufacturerCertificateNum
                                                                      .text
                                                                      .trim(),
                                                              nafdacManufacturingLicenseNumber:
                                                                  cacRegNoControllerManufacturerLincenseNumber
                                                                      .text
                                                                      .trim(),
                                                              productRegistrationEvidenceNumber:
                                                                  cacRegNoControllerManufacturerProdNumber
                                                                      .text
                                                                      .trim(),
                                                            ),
                                                            documents: Documents(
                                                              cacCertificate:
                                                                  model.secondLevelDistributorKycEntityModelManCAC ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelManCAC!
                                                                        .manufacturer!
                                                                        .documents!
                                                                        .cacCertificate!,
                                                              gmpCertificate:
                                                                  model.secondLevelDistributorKycEntityModelManGMP ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelManGMP!
                                                                        .manufacturer!
                                                                        .documents!
                                                                        .gmpCertificate!,
                                                              nafdacManufacturingLicense:
                                                                  model.secondLevelDistributorKycEntityModelManNAF ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelManNAF!
                                                                        .manufacturer!
                                                                        .documents!
                                                                        .nafdacManufacturingLicense!,
                                                              productRegistrationEvidence:
                                                                  model.secondLevelDistributorKycEntityModelManProd ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelManProd!
                                                                        .manufacturer!
                                                                        .documents!
                                                                        .productRegistrationEvidence!,
                                                              companyLogo:
                                                                  model.secondLevelDistributorKycEntityModelManLogo ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelManLogo!
                                                                        .manufacturer!
                                                                        .documents!
                                                                        .companyLogo!,
                                                              pharmaceuticalDistributionLicense:
                                                                  null,
                                                              pharmacyCouncilLicense:
                                                                  null,
                                                              importPermit:
                                                                  null,
                                                              nafdacPermit:
                                                                  null,
                                                            ),
                                                          ),
                                                          importer: Importer(
                                                            businessDetails: BusinessDetails(
                                                              cacRegistrationNumber:
                                                                  cacRegNoImporterController
                                                                      .text
                                                                      .trim(),
                                                              businessAddress:
                                                                  cacRegNoControllerImporterBusinessAddress
                                                                      .text
                                                                      .trim(),
                                                              contactPersonName:
                                                                  cacRegNoControllerImporterContactPerson
                                                                      .text
                                                                      .trim(),
                                                              contactPersonEmail:
                                                                  cacRegNoControllerImporterContactPersonEmail
                                                                      .text
                                                                      .trim(),
                                                              contactPersonPhoneNumber:
                                                                  cacRegNoControllerImporterContactPersonNumber
                                                                          .text !=
                                                                      ''
                                                                  ? model.returnAddingPhoneNoStructureWith234Kyc(
                                                                      cacRegNoControllerImporterContactPersonNumber
                                                                          .text
                                                                          .trim(),
                                                                    )
                                                                  : '',
                                                              businessWebsite:
                                                                  cacRegNoControllerImporterBusinessWeb
                                                                      .text
                                                                      .trim(),
                                                              taxIdentificationNumber:
                                                                  cacRegNoControllerImporterTin
                                                                      .text
                                                                      .trim(),
                                                              importPermitNumber:
                                                                  cacRegNoControllerImporterCertificateNum
                                                                      .text
                                                                      .trim(),

                                                              pharmaceuticalDistributionLicenseNumber:
                                                                  null,
                                                              pharmacyCouncilLicenseNumber:
                                                                  null,
                                                              productRegistrationEvidenceNumber:
                                                                  null,
                                                              nafdacPermitNumber:
                                                                  null,
                                                              gmpCertificateNumber:
                                                                  null,
                                                              nafdacManufacturingLicenseNumber:
                                                                  null,
                                                            ),
                                                            documents: Documents(
                                                              cacCertificate:
                                                                  model.secondLevelDistributorKycEntityModelImpCAC ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelImpCAC!
                                                                        .importer!
                                                                        .documents!
                                                                        .cacCertificate!,
                                                              importPermit:
                                                                  model.secondLevelDistributorKycEntityModelImpPermit ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelImpPermit!
                                                                        .importer!
                                                                        .documents!
                                                                        .importPermit!,
                                                              manufacturerAuthorizationLetter:
                                                                  model.secondLevelDistributorKycEntityModelImpManAuthLetter ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelImpManAuthLetter!
                                                                        .importer!
                                                                        .documents!
                                                                        .manufacturerAuthorizationLetter!,
                                                              companyLogo:
                                                                  model.secondLevelDistributorKycEntityModelImpLogo ==
                                                                      null
                                                                  ? null
                                                                  : model
                                                                        .secondLevelDistributorKycEntityModelImpLogo!
                                                                        .importer!
                                                                        .documents!
                                                                        .companyLogo!,
                                                              pharmaceuticalDistributionLicense:
                                                                  null,
                                                              pharmacyCouncilLicense:
                                                                  null,
                                                              productRegistrationEvidence:
                                                                  null,
                                                              nafdacPermit:
                                                                  null,
                                                              gmpCertificate:
                                                                  null,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                                SizedBox(height: 10.h),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
