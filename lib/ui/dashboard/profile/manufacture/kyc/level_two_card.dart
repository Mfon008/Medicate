import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/ui/widget/text.dart';
import '../../../../../core/app_assets/app_validation.dart';
import '../../../../manufacturer/product/custom_switch_widget.dart';
import '../../../../widget/button.dart';
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

  TextEditingController cacRegNoControllerDistributor = TextEditingController();
  TextEditingController cacRegNoControllerDistributorLincense =
      TextEditingController();
  TextEditingController cacRegNoControllerDistributorNafPermit =
      TextEditingController();
  TextEditingController cacRegNoControllerDistributorCouncilLincense =
      TextEditingController();
  TextEditingController cacRegNoControllerDistributorBusinessAddress =
      TextEditingController();
  TextEditingController cacRegNoControllerDistributorContactPerson =
      TextEditingController();
  TextEditingController cacRegNoControllerDistributorContactPersonNumber =
      TextEditingController();
  TextEditingController cacRegNoControllerDistributorContactPersonEmail =
      TextEditingController();
  TextEditingController cacRegNoControllerDistributorBusinessWeb =
      TextEditingController();
  TextEditingController cacRegNoControllerDistributorTin =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturer =
      TextEditingController();
  TextEditingController cacRegNoControllerImporter = TextEditingController();

  TextEditingController cacRegNoManufacturerController =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerCertificateNum =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerLincenseNumber =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerProdNumber =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerBusinessAddress =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerContactPerson =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerContactPersonNumber =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerContactPersonEmail =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerBusinessWeb =
      TextEditingController();
  TextEditingController cacRegNoControllerManufacturerTin =
      TextEditingController();

  TextEditingController cacRegNoImporterController = TextEditingController();
  TextEditingController cacRegNoControllerImporterCertificateNum =
      TextEditingController();
  TextEditingController cacRegNoControllerImporterBusinessAddress =
      TextEditingController();
  TextEditingController cacRegNoControllerImporterContactPerson =
      TextEditingController();
  TextEditingController cacRegNoControllerImporterContactPersonNumber =
      TextEditingController();
  TextEditingController cacRegNoControllerImporterContactPersonEmail =
      TextEditingController();
  TextEditingController cacRegNoControllerImporterBusinessWeb =
      TextEditingController();
  TextEditingController cacRegNoControllerImporterTin = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                          !isExpanded
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
                              color: AppColors.fadedyellow,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 18.90.sp,
                                  color: AppColors.yellow,
                                ),

                                SizedBox(width: 8.w),

                                Expanded(
                                  child: Text(
                                    'Kindly upload and submit KYC for '
                                    'verification to obtain some access'
                                    'to platform features.',
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Select business category that applies',
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
                                    border: Border.all(color: AppColors.f1),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(AppImage.truck_out),
                                          SizedBox(width: 12.w),
                                          TextView(
                                            text: 'Are you a Distributor?',
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
                                                isSwitchedDistributor = val;
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
                                              children: [
                                                SizedBox(height: 10.h),

                                                Divider(color: AppColors.f1),
                                                SizedBox(height: 10.h),
                                                TextFormWidget(
                                                  hint:
                                                      'CAC / Company Business'
                                                      ' Registration Number',
                                                  rightPos: 0,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerDistributorLincense,
                                                ),
                                                SizedBox(height: 20.h),
                                                TextFormWidget(
                                                  hint: 'NAFDAC Permit Number',
                                                  rightPos: -14,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerDistributorCouncilLincense,
                                                ),
                                                SizedBox(height: 20.h),
                                                TextFormWidget(
                                                  hint: 'Business Address',
                                                  rightPos: -14,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerDistributorContactPersonNumber,
                                                ),
                                                SizedBox(height: 20.h),
                                                TextFormWidget(
                                                  hint: 'Contact Person Email',
                                                  rightPos: -14,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerDistributorTin,
                                                ),
                                                SizedBox(height: 20.h),

                                                TextView(
                                                  text: 'Documents to upload',
                                                  textStyle: TextStyle(
                                                    fontSize: 15.06.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),

                                                SizedBox(height: 10.h),

                                                Divider(color: AppColors.f1),
                                                SizedBox(height: 20.6.h),
                                                Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    TextView(
                                                      text: 'CAC Certificate',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                      text: 'NAFDAC Permit',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                      text: 'Company Logo',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                    border: Border.all(color: AppColors.f1),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // ignore: deprecated_member_use
                                          SvgPicture.asset(
                                            AppImage.box_cart,
                                            color: AppColors.primary,
                                          ),
                                          SizedBox(width: 12.w),
                                          TextView(
                                            text: 'Are you a Manufacturer?',
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
                                                isSwitchedManufaturer = val;
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
                                              children: [
                                                SizedBox(height: 10.h),

                                                Divider(color: AppColors.f1),
                                                SizedBox(height: 10.h),
                                                TextFormWidget(
                                                  hint:
                                                      'CAC / Company Business'
                                                      ' Registration Number',
                                                  rightPos: 0,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerManufacturerProdNumber,
                                                ),
                                                SizedBox(height: 20.h),
                                                TextFormWidget(
                                                  hint: 'Business Address',
                                                  rightPos: -14,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerManufacturerContactPersonNumber,
                                                ),
                                                SizedBox(height: 20.h),
                                                TextFormWidget(
                                                  hint: 'Contact Person Email',
                                                  rightPos: -14,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerManufacturerTin,
                                                ),
                                                SizedBox(height: 20.h),

                                                TextView(
                                                  text: 'Documents to upload',
                                                  textStyle: TextStyle(
                                                    fontSize: 15.06.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),

                                                SizedBox(height: 10.h),

                                                Divider(color: AppColors.f1),
                                                SizedBox(height: 20.6.h),
                                                Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    TextView(
                                                      text: 'CAC Certificate',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                      text: 'NAFDAC Permit',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                      text: 'Company Logo',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                    border: Border.all(color: AppColors.f1),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // ignore: deprecated_member_use
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
                                              children: [
                                                SizedBox(height: 10.h),

                                                Divider(color: AppColors.f1),
                                                SizedBox(height: 10.h),
                                                TextFormWidget(
                                                  hint:
                                                      'CAC / Company Business'
                                                      ' Registration Number',
                                                  rightPos: 0,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoImporterController,
                                                ),
                                                SizedBox(height: 20.h),
                                                TextFormWidget(
                                                  hint: 'Import Permit Number',
                                                  rightPos: -14,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerImporterCertificateNum,
                                                ),
                                                SizedBox(height: 20.h),
                                                TextFormWidget(
                                                  hint: 'Business Address',
                                                  label:
                                                      '12 Oluwole Street, Ikeja, Lagos State',
                                                  maxline: 4,
                                                  rightPos: -14,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
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
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerImporterContactPersonNumber,
                                                ),
                                                SizedBox(height: 20.h),
                                                TextFormWidget(
                                                  hint: 'Contact Person Email',
                                                  rightPos: -14,
                                                  hintSize: 14,
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
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
                                                  borderColor:
                                                      AppColors.transparent,
                                                  borderTopLeft: 10.r,
                                                  borderTopRight: 10.r,
                                                  borderBottomLeft: 10.r,
                                                  borderBottomRight: 10.r,
                                                  readOnly: true,
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Arial',
                                                    fontSize: 14.2.sp,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  fillColor: AppColors.grey,
                                                  isFilled: true,
                                                  // suffixWidget: model.getPopUpMenuDialog(context),
                                                  validator:
                                                      AppValidator.validateString(),
                                                  controller:
                                                      cacRegNoControllerImporterTin,
                                                ),
                                                SizedBox(height: 20.h),

                                                TextView(
                                                  text: 'Documents to upload',
                                                  textStyle: TextStyle(
                                                    fontSize: 15.06.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),

                                                SizedBox(height: 10.h),

                                                Divider(color: AppColors.f1),
                                                SizedBox(height: 20.6.h),
                                                Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    TextView(
                                                      text: 'CAC Certificate',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                      text: 'Import Permit',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                      text: 'Company Logo',
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // index == 2 &&
                                                            //         model.isLoadingDoc1
                                                            //     ? SizedBox(
                                                            //         width: 20.w,
                                                            //         height: 20.h,
                                                            //         child:
                                                            //             CircularProgressIndicator(
                                                            //               color: AppColors
                                                            //                   .primary,
                                                            //               strokeWidth:
                                                            //                   2.w,
                                                            //             ),
                                                            //       )
                                                            //     :
                                                            SvgPicture.asset(
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
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
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
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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

                                SizedBox(height: 30.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.white,
                                  fontSize: 14.sp,
                                  buttonText: 'Save Progress',
                                  color: AppColors.primary,
                                  // isLoading: model.isLoading,
                                  buttonBorderColor: AppColors.primary,
                                  onPressed: () {},
                                ),
                                SizedBox(height: 20.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  fontSize: 14.sp,
                                  buttonText: 'Submit for Verification',
                                  color: AppColors.white,
                                  // isLoading: model.isLoading,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {},
                                ),
                                SizedBox(height: 10.h),
                              ],
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
  }
}
