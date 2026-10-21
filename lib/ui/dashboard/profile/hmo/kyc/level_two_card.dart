// ignore_for_file: unnecessary_null_comparison, prefer_null_aware_operators, deprecated_member_use, must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/connect_end/model/update_hmo_kyc_entity_model/hmo_accreditation.dart';
import 'package:medicate_app/core/connect_end/model/update_hmo_kyc_entity_model/logo.dart';
import 'package:medicate_app/core/connect_end/model/update_hmo_kyc_entity_model/tax_id_certificate.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/model/update_hmo_kyc_entity_model/cac_certificate.dart';
import '../../../../../core/connect_end/model/update_hmo_kyc_entity_model/update_hmo_kyc_entity_model.dart';
import '../../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../widget/button.dart';
import '../../../../widget/kyc_url_view.dart';
import '../../manufacture/dashed_border_painter.dart';

class LevelTwoCard extends StatefulWidget {
  const LevelTwoCard({super.key});

  @override
  State<LevelTwoCard> createState() => _LevelTwoCardState();
}

class _LevelTwoCardState extends State<LevelTwoCard> {
  bool isExpanded = false;

  Future<void> getStuffs(HMOViewModel model) async {
    ///
    if (model.getHmoKycResponseModel != null &&
        model.getHmoKycResponseModel!.data!.level2 != null) {
      final level2 = model.getHmoKycResponseModel!.data!.level2;
      if (level2?.cacCertificate != null) {
        model.secondLevelHmoKycEntityModelCAC!.cacCertificate =
            CacCertificate.fromJson(level2?.cacCertificate?.toJson() ?? {});
      }

      if (level2?.logo != null) {
        model.secondLevelHmoKycEntityModelLogo!.logo = Logo.fromJson(
          level2?.logo?.toJson() ?? {},
        );
      }
      if (level2?.hmoAccreditation != null) {
        model.secondLevelHmoKycEntityModelNHIS!.hmoAccreditation =
            HmoAccreditation.fromJson(level2?.hmoAccreditation?.toJson() ?? {});
      }
      if (level2?.taxIdCertificate != null) {
        model.secondLevelHmoKycEntityModelTax!.taxIdCertificate =
            TaxIdCertificate.fromJson(level2?.taxIdCertificate?.toJson() ?? {});
      }
    }

    model.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => HMOViewModel(),
      onViewModelReady: (model) async {
        await model.getHMOKyc(context);
        getStuffs(model);
      },
      disposeViewModel: false,
      builder: (_, HMOViewModel model, _) {
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
                                          .getHmoKycResponseModel
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
                                  ? SvgPicture.asset(AppImage.open_padlock)
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
                                  SizedBox(height: 10.h),
                                  !isExpanded
                                      ? Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 5.0.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                              ),
                                              child: TextView(
                                                text: 'Continue',
                                                textStyle: TextStyle(
                                                  fontSize: 12.22.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.white,
                                                  fontFamily: 'DMSans',
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Start Over',
                                              textStyle: TextStyle(
                                                fontSize: 14.22.sp,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    AppColors.primary,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primary,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),

                              const Spacer(),
                              !isExpanded
                                  ? SizedBox.shrink()
                                  : AnimatedRotation(
                                      turns: isExpanded ? 0.5 : 0,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
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
                                            .getHmoKycResponseModel
                                            ?.data
                                            ?.kycLevels![1]
                                            .status ??
                                        '',
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    model
                                                .getHmoKycResponseModel
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
                                                      .getHmoKycResponseModel
                                                      ?.data
                                                      ?.kycLevels?[1]
                                                      .status ??
                                                  "",
                                            ),
                                          ),

                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Text(
                                        model.kycStatusText(
                                          model
                                                  .getHmoKycResponseModel
                                                  ?.data
                                                  ?.kycLevels?[1]
                                                  .status ??
                                              "",
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
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                model
                                                                    .getHmoKycResponseModel!
                                                                    .data!
                                                                    .level2 !=
                                                                null &&
                                                            model
                                                                    .getHmoKycResponseModel!
                                                                    .data!
                                                                    .level2!
                                                                    .logo !=
                                                                null ||
                                                        model.secondLevelHmoKycEntityModelLogo !=
                                                                null &&
                                                            model
                                                                    .secondLevelHmoKycEntityModelLogo!
                                                                    .logo !=
                                                                null
                                                    ? Container(
                                                        padding: EdgeInsets.all(
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
                                                              AppImage.kyc_file,
                                                            ),
                                                            SizedBox(
                                                              width: 14.20.w,
                                                            ),
                                                            SizedBox(
                                                              width: 80.w,
                                                              child: TextView(
                                                                text:
                                                                    'Logo.jpg',
                                                                maxLines: 1,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      13.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      AppColors
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
                                                                        model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.level2
                                                                            ?.logo
                                                                            ?.url ??
                                                                        model
                                                                            .secondLevelHmoKycEntityModelLogo
                                                                            ?.logo
                                                                            ?.url ??
                                                                        '',
                                                                  ),
                                                                ),
                                                              ),
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_eye,
                                                                  ),
                                                            ),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                            model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'approved' ||
                                                                    model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'UNDER_REVIEW'
                                                                            .toLowerCase()
                                                                ? SizedBox.shrink()
                                                                : model
                                                                          .secondLevelHmoKycEntityModelLogo
                                                                          ?.logo !=
                                                                      null
                                                                ? GestureDetector(
                                                                    onTap: () =>
                                                                        model.pickImageLogo(
                                                                          context,
                                                                        ),
                                                                    child:
                                                                        model
                                                                            .isLoadingLogo
                                                                        ? SizedBox(
                                                                            width:
                                                                                10.w,
                                                                            height:
                                                                                10.h,
                                                                            child: CircularProgressIndicator(
                                                                              color: AppColors.primary,
                                                                              strokeWidth: 2.w,
                                                                            ),
                                                                          )
                                                                        : SvgPicture.asset(
                                                                            AppImage.upload_arr_up,
                                                                          ),
                                                                  )
                                                                : SizedBox.shrink(),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                            model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'approved' ||
                                                                    model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'UNDER_REVIEW'
                                                                            .toLowerCase()
                                                                ? SizedBox.shrink()
                                                                : model
                                                                          .secondLevelHmoKycEntityModelLogo
                                                                          ?.logo !=
                                                                      null
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      model.secondLevelHmoKycEntityModelLogo?.logo =
                                                                          null;
                                                                      model
                                                                          .notifyListeners();
                                                                    },
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .delete,
                                                                    ),
                                                                  )
                                                                : SizedBox.shrink(),
                                                          ],
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: double.infinity,
                                                        child: DottedBorder(
                                                          options:
                                                              RoundedRectDottedBorderOptions(
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
                                                                .pickImageLogo(
                                                                  context,
                                                                ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        16.20.w,
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
                                                                          width:
                                                                              20.w,
                                                                          height:
                                                                              20.h,
                                                                          child: CircularProgressIndicator(
                                                                            color:
                                                                                AppColors.primary,
                                                                            strokeWidth:
                                                                                2.w,
                                                                          ),
                                                                        )
                                                                      : SvgPicture.asset(
                                                                          AppImage
                                                                              .upload_doc,
                                                                        ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      TextView(
                                                                        text:
                                                                            'Upload Document',
                                                                        textStyle: TextStyle(
                                                                          fontFamily:
                                                                              'GoogleSans',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              AppColors.reminder,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            2.0.h,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            130.w,
                                                                        child: TextView(
                                                                          text:
                                                                              'Max file size: 2MB (.jpg,'
                                                                              ' .jpeg, .png, or'
                                                                              ' .pdf supported)',
                                                                          textStyle: TextStyle(
                                                                            fontFamily:
                                                                                'Arial',
                                                                            fontSize:
                                                                                13.6.sp,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                AppColors.fineGrey,
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
                                                          'CAC Registration Certificate'
                                                          '(Nigeria)',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 14.2.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -12.10,
                                                      child: TextView(
                                                        text: '*',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                model
                                                                    .getHmoKycResponseModel!
                                                                    .data!
                                                                    .level2 !=
                                                                null &&
                                                            model
                                                                    .getHmoKycResponseModel!
                                                                    .data!
                                                                    .level2!
                                                                    .cacCertificate !=
                                                                null ||
                                                        model.secondLevelHmoKycEntityModelCAC !=
                                                                null &&
                                                            model
                                                                    .secondLevelHmoKycEntityModelCAC
                                                                    ?.cacCertificate !=
                                                                null &&
                                                            model
                                                                    .secondLevelHmoKycEntityModelCAC
                                                                    ?.cacCertificate !=
                                                                null
                                                    ? Container(
                                                        padding: EdgeInsets.all(
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
                                                              AppImage.kyc_file,
                                                            ),
                                                            SizedBox(
                                                              width: 14.20.w,
                                                            ),
                                                            SizedBox(
                                                              width: 80.w,
                                                              child: TextView(
                                                                text:
                                                                    'Pharm Distributor Lincense.jpg',
                                                                maxLines: 1,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      13.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      AppColors
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
                                                                        model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.level2
                                                                            ?.cacCertificate
                                                                            ?.url ??
                                                                        model
                                                                            .secondLevelHmoKycEntityModelCAC
                                                                            ?.cacCertificate
                                                                            ?.url ??
                                                                        '',
                                                                  ),
                                                                ),
                                                              ),
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_eye,
                                                                  ),
                                                            ),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                            model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'approved' ||
                                                                    model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'UNDER_REVIEW'
                                                                            .toLowerCase()
                                                                ? SizedBox.shrink()
                                                                : model.secondLevelHmoKycEntityModelCAC !=
                                                                          null &&
                                                                      model.secondLevelHmoKycEntityModelCAC?.cacCertificate !=
                                                                          null
                                                                ? GestureDetector(
                                                                    onTap: () =>
                                                                        model.pickImageCAC(
                                                                          context,
                                                                        ),
                                                                    child:
                                                                        model
                                                                            .isLoadingCAC
                                                                        ? SizedBox(
                                                                            width:
                                                                                10.w,
                                                                            height:
                                                                                10.h,
                                                                            child: CircularProgressIndicator(
                                                                              color: AppColors.primary,
                                                                              strokeWidth: 2.w,
                                                                            ),
                                                                          )
                                                                        : SvgPicture.asset(
                                                                            AppImage.upload_arr_up,
                                                                          ),
                                                                  )
                                                                : SizedBox.shrink(),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                            model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'approved' ||
                                                                    model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'UNDER_REVIEW'
                                                                            .toLowerCase()
                                                                ? SizedBox.shrink()
                                                                : model.secondLevelHmoKycEntityModelCAC?.cacCertificate !=
                                                                          null &&
                                                                      model.secondLevelHmoKycEntityModelCAC?.cacCertificate !=
                                                                          null
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      model.secondLevelHmoKycEntityModelCAC?.cacCertificate =
                                                                          null;
                                                                      model
                                                                          .notifyListeners();
                                                                    },
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .delete,
                                                                    ),
                                                                  )
                                                                : SizedBox.shrink(),
                                                          ],
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: double.infinity,
                                                        child: DottedBorder(
                                                          options:
                                                              RoundedRectDottedBorderOptions(
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
                                                                .pickImageCAC(
                                                                  context,
                                                                ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        16.20.w,
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
                                                                          width:
                                                                              20.w,
                                                                          height:
                                                                              20.h,
                                                                          child: CircularProgressIndicator(
                                                                            color:
                                                                                AppColors.primary,
                                                                            strokeWidth:
                                                                                2.w,
                                                                          ),
                                                                        )
                                                                      : SvgPicture.asset(
                                                                          AppImage
                                                                              .upload_doc,
                                                                        ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      TextView(
                                                                        text:
                                                                            'Upload Document',
                                                                        textStyle: TextStyle(
                                                                          fontFamily:
                                                                              'GoogleSans',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              AppColors.reminder,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            2.0.h,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            130.w,
                                                                        child: TextView(
                                                                          text:
                                                                              'Max file size: 2MB (.jpg,'
                                                                              ' .jpeg, .png, or'
                                                                              ' .pdf supported)',
                                                                          textStyle: TextStyle(
                                                                            fontFamily:
                                                                                'Arial',
                                                                            fontSize:
                                                                                13.6.sp,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                AppColors.fineGrey,
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
                                                          'HMO accreditation certificate from'
                                                          'NHIS (National Health Insurance'
                                                          'Scheme)',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 14.2.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -12.10,
                                                      child: TextView(
                                                        text: '*',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                model
                                                                    .getHmoKycResponseModel!
                                                                    .data!
                                                                    .level2 !=
                                                                null &&
                                                            model
                                                                    .getHmoKycResponseModel!
                                                                    .data!
                                                                    .level2!
                                                                    .hmoAccreditation !=
                                                                null ||
                                                        model.secondLevelHmoKycEntityModelNHIS !=
                                                                null &&
                                                            model
                                                                    .secondLevelHmoKycEntityModelNHIS
                                                                    ?.hmoAccreditation !=
                                                                null
                                                    ? Container(
                                                        padding: EdgeInsets.all(
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
                                                              AppImage.kyc_file,
                                                            ),
                                                            SizedBox(
                                                              width: 14.20.w,
                                                            ),
                                                            SizedBox(
                                                              width: 80.w,
                                                              child: TextView(
                                                                text:
                                                                    'NHIS.jpg',
                                                                maxLines: 1,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      13.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      AppColors
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
                                                                        model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.level2
                                                                            ?.hmoAccreditation
                                                                            ?.url ??
                                                                        model
                                                                            .secondLevelHmoKycEntityModelNHIS
                                                                            ?.hmoAccreditation
                                                                            ?.url ??
                                                                        '',
                                                                  ),
                                                                ),
                                                              ),
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_eye,
                                                                  ),
                                                            ),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),

                                                            model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'approved' ||
                                                                    model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'UNDER_REVIEW'
                                                                            .toLowerCase()
                                                                ? SizedBox.shrink()
                                                                : model
                                                                          .secondLevelHmoKycEntityModelNHIS
                                                                          ?.hmoAccreditation !=
                                                                      null
                                                                ? GestureDetector(
                                                                    onTap: () =>
                                                                        model.pickImageNHISLicense(
                                                                          context,
                                                                        ),
                                                                    child:
                                                                        model
                                                                            .isLoadingLicense
                                                                        ? SizedBox(
                                                                            width:
                                                                                10.w,
                                                                            height:
                                                                                10.h,
                                                                            child: CircularProgressIndicator(
                                                                              color: AppColors.primary,
                                                                              strokeWidth: 2.w,
                                                                            ),
                                                                          )
                                                                        : SvgPicture.asset(
                                                                            AppImage.upload_arr_up,
                                                                          ),
                                                                  )
                                                                : SizedBox.shrink(),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                            model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'approved' ||
                                                                    model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'UNDER_REVIEW'
                                                                            .toLowerCase()
                                                                ? SizedBox.shrink()
                                                                : model
                                                                          .secondLevelHmoKycEntityModelNHIS
                                                                          ?.hmoAccreditation !=
                                                                      null
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      model.secondLevelHmoKycEntityModelNHIS?.hmoAccreditation =
                                                                          null;
                                                                      model
                                                                          .notifyListeners();
                                                                    },
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .delete,
                                                                    ),
                                                                  )
                                                                : SizedBox.shrink(),
                                                          ],
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: double.infinity,
                                                        child: DottedBorder(
                                                          options:
                                                              RoundedRectDottedBorderOptions(
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
                                                                .pickImageNHISLicense(
                                                                  context,
                                                                ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        16.20.w,
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
                                                                  model.isLoadingLicense
                                                                      ? SizedBox(
                                                                          width:
                                                                              20.w,
                                                                          height:
                                                                              20.h,
                                                                          child: CircularProgressIndicator(
                                                                            color:
                                                                                AppColors.primary,
                                                                            strokeWidth:
                                                                                2.w,
                                                                          ),
                                                                        )
                                                                      : SvgPicture.asset(
                                                                          AppImage
                                                                              .upload_doc,
                                                                        ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      TextView(
                                                                        text:
                                                                            'Upload Document',
                                                                        textStyle: TextStyle(
                                                                          fontFamily:
                                                                              'GoogleSans',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              AppColors.reminder,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            2.0.h,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            130.w,
                                                                        child: TextView(
                                                                          text:
                                                                              'Max file size: 2MB (.jpg,'
                                                                              ' .jpeg, .png, or'
                                                                              ' .pdf supported)',
                                                                          textStyle: TextStyle(
                                                                            fontFamily:
                                                                                'Arial',
                                                                            fontSize:
                                                                                13.6.sp,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                AppColors.fineGrey,
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
                                                          'Tax Identification Number'
                                                          '(TIN)',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 14.2.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -12.10,
                                                      child: TextView(
                                                        text: '*',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                model
                                                                    .getHmoKycResponseModel!
                                                                    .data!
                                                                    .level2 !=
                                                                null &&
                                                            model
                                                                    .getHmoKycResponseModel!
                                                                    .data!
                                                                    .level2!
                                                                    .taxIdCertificate !=
                                                                null ||
                                                        model.secondLevelHmoKycEntityModelTax !=
                                                                null &&
                                                            model
                                                                    .secondLevelHmoKycEntityModelTax
                                                                    ?.taxIdCertificate !=
                                                                null
                                                    ? Container(
                                                        padding: EdgeInsets.all(
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
                                                              AppImage.kyc_file,
                                                            ),
                                                            SizedBox(
                                                              width: 14.20.w,
                                                            ),
                                                            SizedBox(
                                                              width: 80.w,
                                                              child: TextView(
                                                                text: 'Tax.jpg',
                                                                maxLines: 1,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      13.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      AppColors
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
                                                                        model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.level2
                                                                            ?.taxIdCertificate
                                                                            ?.url ??
                                                                        model
                                                                            .secondLevelHmoKycEntityModelTax
                                                                            ?.taxIdCertificate
                                                                            ?.url ??
                                                                        '',
                                                                  ),
                                                                ),
                                                              ),
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .kyc_eye,
                                                                  ),
                                                            ),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                            model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'approved' ||
                                                                    model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'UNDER_REVIEW'
                                                                            .toLowerCase()
                                                                ? SizedBox.shrink()
                                                                : model
                                                                          .secondLevelHmoKycEntityModelTax
                                                                          ?.taxIdCertificate !=
                                                                      null
                                                                ? GestureDetector(
                                                                    onTap: () =>
                                                                        model.pickImageTIN(
                                                                          context,
                                                                        ),
                                                                    child:
                                                                        model
                                                                            .isLoadingTIN
                                                                        ? SizedBox(
                                                                            width:
                                                                                10.w,
                                                                            height:
                                                                                10.h,
                                                                            child: CircularProgressIndicator(
                                                                              color: AppColors.primary,
                                                                              strokeWidth: 2.w,
                                                                            ),
                                                                          )
                                                                        : SvgPicture.asset(
                                                                            AppImage.upload_arr_up,
                                                                          ),
                                                                  )
                                                                : SizedBox.shrink(),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                            model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'approved' ||
                                                                    model
                                                                            .getHmoKycResponseModel
                                                                            ?.data
                                                                            ?.kycLevels?[1]
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        'UNDER_REVIEW'
                                                                            .toLowerCase()
                                                                ? SizedBox.shrink()
                                                                : model
                                                                          .secondLevelHmoKycEntityModelTax
                                                                          ?.taxIdCertificate !=
                                                                      null
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      model.secondLevelHmoKycEntityModelTax?.taxIdCertificate =
                                                                          null;
                                                                      model
                                                                          .notifyListeners();
                                                                    },
                                                                    child: SvgPicture.asset(
                                                                      AppImage
                                                                          .delete,
                                                                    ),
                                                                  )
                                                                : SizedBox.shrink(),
                                                          ],
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: double.infinity,
                                                        child: DottedBorder(
                                                          options:
                                                              RoundedRectDottedBorderOptions(
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
                                                                .pickImageTIN(
                                                                  context,
                                                                ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        16.20.w,
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
                                                                  model.isLoadingTIN
                                                                      ? SizedBox(
                                                                          width:
                                                                              20.w,
                                                                          height:
                                                                              20.h,
                                                                          child: CircularProgressIndicator(
                                                                            color:
                                                                                AppColors.primary,
                                                                            strokeWidth:
                                                                                2.w,
                                                                          ),
                                                                        )
                                                                      : SvgPicture.asset(
                                                                          AppImage
                                                                              .upload_doc,
                                                                        ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      TextView(
                                                                        text:
                                                                            'Upload Document',
                                                                        textStyle: TextStyle(
                                                                          fontFamily:
                                                                              'GoogleSans',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              AppColors.reminder,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            2.0.h,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            130.w,
                                                                        child: TextView(
                                                                          text:
                                                                              'Max file size: 2MB (.jpg,'
                                                                              ' .jpeg, .png, or'
                                                                              ' .pdf supported)',
                                                                          textStyle: TextStyle(
                                                                            fontFamily:
                                                                                'Arial',
                                                                            fontSize:
                                                                                13.6.sp,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                AppColors.fineGrey,
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
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 20.h),

                                      model
                                                      .getHmoKycResponseModel
                                                      ?.data
                                                      ?.kycLevels?[1]
                                                      .status
                                                      ?.toLowerCase() ==
                                                  'approved' ||
                                              model
                                                      .getHmoKycResponseModel
                                                      ?.data
                                                      ?.kycLevels?[1]
                                                      .status
                                                      ?.toLowerCase() ==
                                                  'UNDER_REVIEW'.toLowerCase()
                                          ? SizedBox.shrink()
                                          : Column(
                                              children: [
                                                SizedBox(height: 20.h),
                                                ButtonWidget(
                                                  border: 100.r,
                                                  buttonColor: AppColors.white,
                                                  fontSize: 14.sp,
                                                  buttonText: 'Save Progress',
                                                  color: AppColors.primary,
                                                  isLoading: model.isLoading,
                                                  buttonBorderColor:
                                                      AppColors.primary,
                                                  onPressed: () => model.updateHMOKycSave(
                                                    context,
                                                    updateKyc: UpdateHmoKycEntityModel(
                                                      logo:
                                                          model.secondLevelHmoKycEntityModelLogo ==
                                                                  null ||
                                                              model
                                                                      .secondLevelHmoKycEntityModelLogo!
                                                                      .logo ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .secondLevelHmoKycEntityModelLogo!
                                                                .logo,
                                                      cacCertificate:
                                                          model.secondLevelHmoKycEntityModelCAC ==
                                                                  null ||
                                                              model
                                                                      .secondLevelHmoKycEntityModelCAC!
                                                                      .cacCertificate ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .secondLevelHmoKycEntityModelCAC!
                                                                .cacCertificate,
                                                      hmoAccreditation:
                                                          model.secondLevelHmoKycEntityModelNHIS ==
                                                                  null ||
                                                              model
                                                                      .secondLevelHmoKycEntityModelNHIS!
                                                                      .hmoAccreditation ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .secondLevelHmoKycEntityModelNHIS!
                                                                .hmoAccreditation,
                                                      taxIdCertificate:
                                                          model.secondLevelHmoKycEntityModelTax ==
                                                                  null ||
                                                              model
                                                                      .secondLevelHmoKycEntityModelTax!
                                                                      .taxIdCertificate ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .secondLevelHmoKycEntityModelTax!
                                                                .taxIdCertificate,
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
                                                  onPressed: () => model.updateHMOKycSubmit(
                                                    context,
                                                    updateKyc: UpdateHmoKycEntityModel(
                                                      logo:
                                                          model.secondLevelHmoKycEntityModelLogo ==
                                                                  null ||
                                                              model
                                                                      .secondLevelHmoKycEntityModelLogo!
                                                                      .logo ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .secondLevelHmoKycEntityModelLogo!
                                                                .logo,
                                                      cacCertificate:
                                                          model.secondLevelHmoKycEntityModelCAC ==
                                                                  null ||
                                                              model
                                                                      .secondLevelHmoKycEntityModelCAC!
                                                                      .cacCertificate ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .secondLevelHmoKycEntityModelCAC!
                                                                .cacCertificate,
                                                      hmoAccreditation:
                                                          model.secondLevelHmoKycEntityModelNHIS ==
                                                                  null ||
                                                              model
                                                                      .secondLevelHmoKycEntityModelNHIS!
                                                                      .hmoAccreditation ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .secondLevelHmoKycEntityModelNHIS!
                                                                .hmoAccreditation,
                                                      taxIdCertificate:
                                                          model.secondLevelHmoKycEntityModelTax ==
                                                                  null ||
                                                              model
                                                                      .secondLevelHmoKycEntityModelTax!
                                                                      .taxIdCertificate ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .secondLevelHmoKycEntityModelTax!
                                                                .taxIdCertificate,
                                                    ),
                                                  ),
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
