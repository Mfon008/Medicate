import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/app_utils.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_kyc_entity_model/update_pharmacy_kyc_entity_model.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/app_assets/image.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/connect_end/view_model/health_care_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../widget/button.dart';
import '../../../../widget/kyc_url_view.dart';
import '../../../../widget/text.dart';

class HealthCareKycScreen extends StatelessWidget {
  const HealthCareKycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        surfaceTintColor: Colors.transparent, // removes Material3 tint
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(14.w),
          child: GlobalNavigator(),
        ),
        title: TextView(
          text: 'KYC',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
        child: ViewModelBuilder<HealthCareViewModel>.reactive(
          viewModelBuilder: () => locator<HealthCareViewModel>(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getHealthCareKyc(context);
            });
          },
          disposeViewModel: false,
          builder: (_, HealthCareViewModel model, __) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 22.w,
                    horizontal: 24.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.w,
                          horizontal: 22.w,
                        ),
                        decoration: BoxDecoration(
                          color: model.getKycStatusColor(
                            cac: model
                                .getPharmacyKycResponseModel
                                ?.data
                                ?.kycDocuments?[0]
                                .status,
                            license: model
                                .getPharmacyKycResponseModel
                                ?.data
                                ?.kycDocuments?[1]
                                .status,
                            tin: model
                                .getPharmacyKycResponseModel
                                ?.data
                                ?.kycDocuments?[2]
                                .status,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImage.info),
                            SizedBox(width: 10.w),
                            TextView(
                              text: model.getKycStatus(
                                cac: model
                                    .getPharmacyKycResponseModel
                                    ?.data
                                    ?.kycDocuments?[0]
                                    .status,
                                license: model
                                    .getPharmacyKycResponseModel
                                    ?.data
                                    ?.kycDocuments?[1]
                                    .status,
                                tin: model
                                    .getPharmacyKycResponseModel
                                    ?.data
                                    ?.kycDocuments?[2]
                                    .status,
                              ),
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'Medical license & certificate',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                          Positioned(
                            right: -12.10,
                            child: TextView(
                              text: '*',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.20.h),
                      model
                                  .getPharmacyKycResponseModel
                                  ?.data
                                  ?.kycDocuments?[0]
                                  .file !=
                              null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  TextView(
                                    text:
                                        '${model.getPharmacyKycResponseModel?.data?.kycDocuments?[0].documentType ?? ''}.jpg',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
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
                                                  .getPharmacyKycResponseModel
                                                  ?.data
                                                  ?.kycDocuments?[0]
                                                  .file
                                                  ?.url ??
                                              '',
                                        ),
                                      ),
                                    ),
                                    child: SvgPicture.asset(AppImage.kyc_eye),
                                  ),
                                ],
                              ),
                            )
                          : model.isLoadingCAC
                          ? Center(
                              child: SpinKitCircle(
                                color: AppColors.infoGrey,
                                size: 32.40.sp,
                              ),
                            )
                          : model.filenameCAC != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 160.w,
                                    child: TextView(
                                      text: "${model.filenameCAC ?? ""}.jpg",
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      model.pickImageCAC(context);
                                      model.notifyListeners();
                                    },
                                    child: SvgPicture.asset(
                                      AppImage.upload_arr_up,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  GestureDetector(
                                    onTap: () {
                                      model.filenameCAC = null;
                                      model.imageCAC = null;
                                      model.notifyListeners();
                                    },
                                    child: SvgPicture.asset(AppImage.delete),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  dashPattern: [10, 10],
                                  strokeWidth: .94,
                                  radius: Radius.circular(10),
                                  color: AppColors.primary,
                                ),
                                child: GestureDetector(
                                  onTap: () => model.pickImageCAC(context),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.20.w,
                                      horizontal: 22.0.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(AppImage.upload_doc),
                                        SizedBox(width: 10.w),
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
                                            SizedBox(height: 2.0.h),
                                            TextView(
                                              text:
                                                  'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 13.6.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.fineGrey,
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
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'Proof of physical address',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                          Positioned(
                            right: -12.10,
                            child: TextView(
                              text: '*',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.20.h),
                      model
                                  .getPharmacyKycResponseModel
                                  ?.data
                                  ?.kycDocuments?[1]
                                  .file !=
                              null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  TextView(
                                    text:
                                        '${model.getPharmacyKycResponseModel?.data?.kycDocuments?[1].documentType ?? ''}.jpg',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
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
                                                  .getPharmacyKycResponseModel
                                                  ?.data
                                                  ?.kycDocuments?[1]
                                                  .file
                                                  ?.url ??
                                              '',
                                        ),
                                      ),
                                    ),
                                    child: SvgPicture.asset(AppImage.kyc_eye),
                                  ),
                                ],
                              ),
                            )
                          : model.isLoadingLicense
                          ? Center(
                              child: SpinKitCircle(
                                color: AppColors.infoGrey,
                                size: 32.40.sp,
                              ),
                            )
                          : model.filenamePharmLicense != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 120.w,
                                    child: TextView(
                                      text:
                                          "${model.filenamePharmLicense ?? ""}.jpg",
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      model.pickImagePharmLicense(context);
                                      model.notifyListeners();
                                    },
                                    child: SvgPicture.asset(
                                      AppImage.upload_arr_up,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  GestureDetector(
                                    onTap: () {
                                      model.filenamePharmLicense = null;
                                      model.imagePharmLicense = null;
                                      model.notifyListeners();
                                    },
                                    child: SvgPicture.asset(AppImage.delete),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  dashPattern: [10, 10],
                                  strokeWidth: .94,
                                  radius: Radius.circular(10),
                                  color: AppColors.primary,
                                ),
                                child: GestureDetector(
                                  onTap: () =>
                                      model.pickImagePharmLicense(context),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.20.w,
                                      horizontal: 22.0.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(AppImage.upload_doc),
                                        SizedBox(width: 10.w),
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
                                            SizedBox(height: 2.0.h),
                                            TextView(
                                              text:
                                                  'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 13.6.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.fineGrey,
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
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'Tax identification number',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                          Positioned(
                            right: -12.10,
                            child: TextView(
                              text: '*',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.20.h),
                      model
                                  .getPharmacyKycResponseModel
                                  ?.data
                                  ?.kycDocuments?[2]
                                  .file !=
                              null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 160.w,
                                    child: TextView(
                                      text:
                                          '${model.getPharmacyKycResponseModel?.data?.kycDocuments?[2].documentType ?? ""}.jpg',

                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
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
                                                  .getPharmacyKycResponseModel
                                                  ?.data
                                                  ?.kycDocuments?[2]
                                                  .file
                                                  ?.url ??
                                              '',
                                        ),
                                      ),
                                    ),
                                    child: SvgPicture.asset(AppImage.kyc_eye),
                                  ),
                                ],
                              ),
                            )
                          : model.isLoadingTIN
                          ? Center(
                              child: SpinKitCircle(
                                color: AppColors.infoGrey,
                                size: 32.40.sp,
                              ),
                            )
                          : model.filenameTIN != null
                          ? Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.tintColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImage.kyc_file),
                                  SizedBox(width: 14.20.w),
                                  SizedBox(
                                    width: 160.w,
                                    child: TextView(
                                      text: "${model.filenameTIN ?? ""}.jpg",
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      model.pickImageTIN(context);
                                      model.notifyListeners();
                                    },
                                    child: SvgPicture.asset(
                                      AppImage.upload_arr_up,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  GestureDetector(
                                    onTap: () {
                                      model.filenameTIN = null;
                                      model.imageTIN = null;
                                      model.notifyListeners();
                                    },
                                    child: SvgPicture.asset(AppImage.delete),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  dashPattern: [10, 10],
                                  strokeWidth: .94,
                                  radius: Radius.circular(10),
                                  color: AppColors.primary,
                                ),
                                child: GestureDetector(
                                  onTap: () => model.pickImageTIN(context),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.20.w,
                                      horizontal: 22.0.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(AppImage.upload_doc),
                                        SizedBox(width: 10.w),
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
                                            SizedBox(height: 2.0.h),
                                            TextView(
                                              text:
                                                  'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 13.6.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.fineGrey,
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
                      SizedBox(height: 50.h),
                      ButtonWidget(
                        border: 100.r,
                        buttonColor:
                            model.getKycStatusBool(
                                  cac: model
                                      .getPharmacyKycResponseModel
                                      ?.data
                                      ?.kycDocuments?[0]
                                      .status,
                                  license: model
                                      .getPharmacyKycResponseModel
                                      ?.data
                                      ?.kycDocuments?[1]
                                      .status,
                                  tin: model
                                      .getPharmacyKycResponseModel
                                      ?.data
                                      ?.kycDocuments?[2]
                                      .status,
                                ) ==
                                false
                            ? AppColors.primary
                            : AppColors.infoGrey,
                        fontSize: 16.sp,
                        buttonText: 'Submit for Verification',
                        color: AppColors.white,
                        isLoading: model.isLoading,
                        buttonBorderColor: AppColors.transparent,
                        onPressed:
                            model.getKycStatusBool(
                                  cac: model
                                      .getPharmacyKycResponseModel
                                      ?.data
                                      ?.kycDocuments?[0]
                                      .status,
                                  license: model
                                      .getPharmacyKycResponseModel
                                      ?.data
                                      ?.kycDocuments?[1]
                                      .status,
                                  tin: model
                                      .getPharmacyKycResponseModel
                                      ?.data
                                      ?.kycDocuments?[2]
                                      .status,
                                ) ==
                                false
                            ? () {
                                if (model.imageCAC != null &&
                                    model.imagePharmLicense != null &&
                                    model.imageTIN != null) {
                                  model.updateHealthCareKyc(
                                    context,
                                    updateKyc: UpdatePharmacyKycEntityModel(
                                      documents: model.kycDocumentsList,
                                    ),
                                  );
                                } else {
                                  AppUtils.snackbar(
                                    context,
                                    message:
                                        'Kindly select and upload all documents. ',
                                    error: true,
                                  );
                                }
                              }
                            : () {},
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
