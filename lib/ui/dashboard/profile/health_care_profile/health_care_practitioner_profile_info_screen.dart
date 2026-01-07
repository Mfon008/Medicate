import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/connect_end/model/update_practitioner_profile_entity_model/update_practitioner_profile_entity_model.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/model/update_practitioner_profile_entity_model/bank_detail.dart';
import '../../../../core/connect_end/model/update_practitioner_profile_entity_model/means_of_id.dart';
import '../../../../core/connect_end/view_model/health_care_view_model.dart';
import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../../main.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class HealthCarePractitionerProfileInfoScreen extends StatefulWidget {
  const HealthCarePractitionerProfileInfoScreen({super.key});

  @override
  State<HealthCarePractitionerProfileInfoScreen> createState() =>
      _HealthCarePractitionerProfileInfoScreenState();
}

class _HealthCarePractitionerProfileInfoScreenState
    extends State<HealthCarePractitionerProfileInfoScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController licenceNoController = TextEditingController();
  TextEditingController businessAddController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactDetailsController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountNameController = TextEditingController();
  TextEditingController bankNoController = TextEditingController();
  TextEditingController experienceYears = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  bool isPhone = false;
  bool isPhoneValid = false;

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
          text: 'Profile Information',
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
          viewModelBuilder: () => HealthCareViewModel(),
          onViewModelReady: (model) async {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getTenant(context);
              nameController.text =
                  model.getTetantResponseModel?.data?.name ?? '';
              phoneController.text = SharedPreferencesService
                  .instance
                  .usersData['user']['phone']
                  .toString()
                  .substring(4);
              websiteController.text =
                  model.getTetantResponseModel?.data?.website ?? '';
              licenceNoController.text =
                  model.getTetantResponseModel?.data?.registrationNumber ?? '';
              bioController.text =
                  model.getTetantResponseModel?.data?.bio ?? '';
              businessAddController.text =
                  model.getTetantResponseModel?.data?.businessAddress ?? '';
              businessEmailController.text =
                  model.getTetantResponseModel?.data?.businessEmail ?? '';
              bankNameController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .bankName ??
                  "";
              bankNoController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .accountNumber ??
                  '';
              emailController.text =
                  model.getTetantResponseModel?.data?.email ?? '';
              model.countryController.text =
                  model.getTetantResponseModel?.data?.country ?? '';
              model.stateController.text =
                  model.getTetantResponseModel?.data?.state ?? '';
              model.lgaController.text =
                  model.getTetantResponseModel?.data?.lga ?? '';
              model.selectServicePractitioner =
                  model.getTetantResponseModel?.data?.servicesOffered ?? [];
              bankAccountNameController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .accountName ??
                  '';
              bankNameController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .bankName ??
                  '';
              bankNoController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .accountNumber ??
                  '';
              experienceYears.text =
                  model.getTetantResponseModel?.data?.yearsOfExperience ?? '';
              model.meansIdController.text =
                  model.getTetantResponseModel?.data?.meansOfIdType ?? '';
              model.educationalExperienceList =
                  (model.getTetantResponseModel?.data?.educationalExperience ??
                          [])
                      .map((e) => model.convertEducationalExperience(e))
                      .toList();
            });
          },
          disposeViewModel: false,
          builder: (_, HealthCareViewModel model, _) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 22.w,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bankNameController.text.isEmpty ||
                                bankNoController.text.isEmpty
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.w,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.fadedyellow,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppImage.info),
                                    SizedBox(width: 10.w),
                                    TextView(
                                      text:
                                          'Complete your profile by updating the\nremaining fields.',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          height:
                              bankNameController.text.isEmpty ||
                                  bankNoController.text.isEmpty
                              ? 0.h
                              : 16.8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                TextView(
                                  text: 'Phone number',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
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

                            GestureDetector(
                              onTap: () => model.sendOtpHealthCare(
                                context,
                                phone: SharedPreferencesService
                                    .instance
                                    .usersData['user']['phone'],
                              ),

                              child: model.isLoading
                                  ? SpinKitCircle(
                                      color: AppColors.primary,
                                      size: 30.sp,
                                    )
                                  : TextView(
                                      text: 'Change',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.primary,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(13.8.w),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(0.r),
                                  bottomLeft: Radius.circular(10.r),
                                  bottomRight: Radius.circular(0.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImage.nigeria,
                                    width: 22.w,
                                    height: 22.h,
                                  ),
                                  SizedBox(width: 4.w),
                                  TextView(
                                    text: '+234',
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                      fontSize: 14.2.sp,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Container(
                                margin: isPhoneValid
                                    ? EdgeInsets.only(top: 20.w)
                                    : EdgeInsets.zero, // Add margin if invalid

                                child: TextFormWidget(
                                  hint: null,
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 0,
                                  borderTopRight: 10,
                                  borderBottomLeft: 0,
                                  borderBottomRight: 10,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: const Color.fromRGBO(
                                    245,
                                    246,
                                    248,
                                    1,
                                  ),
                                  isFilled: true,
                                  readOnly: true,
                                  label: phoneController.text,
                                  onChange: (p0) {
                                    if (p0.isEmpty) {
                                      isPhone = false;
                                    } else {
                                      isPhone = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Healthcare professional',
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
                          label: nameController.text,
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Healthcare facility name',
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
                          label: 'Doctor',
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'License number',
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
                          controller: licenceNoController,
                          validator: AppValidator.validateString(),
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Years of Experience',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.number,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: experienceYears,
                          validator: AppValidator.validateString(),
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Bio',
                          hintSize: 14,
                          maxline: 5,
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
                          controller: bioController,
                          validator: AppValidator.validateString(),
                          onChange: (p0) {
                            setState(() {});
                          },
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
                          controller: model.countryController,
                          validator: AppValidator.validateString(),
                          suffixWidget: GestureDetector(
                            onTap: () =>
                                model.modalBottomSheetMenuCountry(context),

                            child: Padding(
                              padding: EdgeInsets.all(14.20.w),
                              child: SvgPicture.asset(AppImage.arrow_down),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormWidget(
                                hint: 'State',
                                hintSize: 14,
                                label: '',
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
                                controller: model.stateController,
                                validator: AppValidator.validateString(),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: TextFormWidget(
                                hint: 'LGA',
                                hintSize: 14,
                                label: '',
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
                                controller: model.lgaController,
                                validator: AppValidator.validateString(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Means of ID',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.number,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: true,
                          controller: model.meansIdController,
                          validator: AppValidator.validateString(),
                          suffixWidget: model.getPopUpMenuDialog(context),
                        ),
                        SizedBox(height: 20.h),
                        model.getTetantResponseModel != null &&
                                    model
                                            .getTetantResponseModel!
                                            .data!
                                            .meansOfId !=
                                        null ||
                                model.filenameMeansId != null
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.w,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.grey,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppImage.kyc_file),
                                    SizedBox(width: 8.w),
                                    SizedBox(
                                      width: 140.w,
                                      child: TextView(
                                        text: model.filenameMeansId != null
                                            ? '${model.filenameMeansId}.png'
                                            : model.getMeansOFIDApp(
                                                model
                                                    .getTetantResponseModel!
                                                    .data!
                                                    .meansOfIdType,
                                              ),
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 16.2.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () =>
                                          model.pickImageMeansIdPractitioner(
                                            context,
                                          ),
                                      child: SvgPicture.asset(AppImage.upload),
                                    ),
                                    SizedBox(width: 10.w),
                                    GestureDetector(
                                      onTap: () {
                                        model.filenameMeansId = null;
                                        model
                                                .getTetantResponseModel!
                                                .data!
                                                .meansOfId =
                                            null;
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
                                    onTap: () => model
                                        .pickImageMeansIdPractitioner(context),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 24.30.w,
                                        horizontal: 22.0.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        color: AppColors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(AppImage.upload_doc),
                                          SizedBox(height: 16.0.w),
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
                                                '(.jpg, .jpeg, png, or .pdf supported)',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                          TextView(
                                            text: 'Max file size: 2MB',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Website',
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
                          isShowHint: true,
                          controller: websiteController,
                          // validator: AppValidator.validateString(),
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextView(
                          text: 'Select service',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        ...List.generate(model.servicesPractitioner.length, (
                          index,
                        ) {
                          return model.chooseNotChannelWidget(
                            context,
                            text: model.servicesPractitioner[index],
                            isTapped: model.selectServicePractitioner.contains(
                              model.servicesPractitioner[index],
                            ), // ✅ reflect state
                            onTap: () {
                              if (model.selectServicePractitioner.contains(
                                model.servicesPractitioner[index],
                              )) {
                                // unselect
                                model.selectServicePractitioner.remove(
                                  model.servicesPractitioner[index],
                                );
                              } else {
                                // select
                                model.selectServicePractitioner.add(
                                  model.servicesPractitioner[index],
                                );
                              } // ✅ update selection

                              model.notifyListeners();
                            },
                          );
                        }),
                        SizedBox(height: 30.h),
                        TextView(
                          text: 'Contact Details',
                          textStyle: TextStyle(
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Divider(
                          color: const Color.fromARGB(255, 227, 227, 228),
                        ),
                        SizedBox(height: 6.h),
                        TextFormWidget(
                          hint: 'Business address',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.text,
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
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Business email',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.text,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: businessEmailController,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.allow(RegExp("[a-z]")),
                          // ],
                        ),
                        SizedBox(height: 30.h),
                        TextView(
                          text: 'Bank Information',
                          textStyle: TextStyle(
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Divider(
                          color: const Color.fromARGB(255, 227, 227, 228),
                        ),
                        SizedBox(height: 6.h),
                        TextFormWidget(
                          hint: 'Bank name',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.text,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: bankNameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Account name',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: 'Enter account name',
                          keyboardType: TextInputType.text,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: bankAccountNameController,
                          validator: AppValidator.validateString(),
                          // ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Account number',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: 'Enter account number',
                          keyboardType: TextInputType.number,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: bankNoController,
                          validator: AppValidator.validateString(),
                          // ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Educational Experience',
                              textStyle: TextStyle(
                                fontSize: 16.2.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                final experience = await model
                                    .modalBottomSheetMenuAddEducationExperience(
                                      context: context,
                                    );
                                if (experience != null) {
                                  model.addExperience(experience);
                                }
                              },
                              icon: Icon(
                                Icons.add,
                                color: AppColors.black,
                                size: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 227, 227, 228),
                        ),
                        SizedBox(height: 6.h),
                        if (model.educationalExperienceList.isNotEmpty)
                          ...model.educationalExperienceList.map(
                            (e) => Container(
                              margin: EdgeInsets.only(bottom: 10.w),
                              padding: EdgeInsets.symmetric(
                                vertical: 16.w,
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.grey,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: e.school ?? '',
                                        textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                          fontFamily: 'GoogleSans',
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      SizedBox(
                                        width: 182.w,
                                        child: TextView(
                                          text: e.degree ?? '',
                                          maxLines: 2,
                                          textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4.0.h),
                                      TextView(
                                        text: '${e.startYear} - ${e.endYear}',
                                        textStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.infoGrey,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          final updated = await model
                                              .modalBottomSheetMenuAddEducationExperience(
                                                context: context,
                                                isEdit: true,
                                                educationalExperience: e,
                                              );

                                          if (updated != null) {
                                            final index = model
                                                .educationalExperienceList
                                                .indexOf(e);
                                            model.updateExperience(
                                              index,
                                              updated,
                                            );
                                          }
                                        },
                                        child: SvgPicture.asset(
                                          AppImage.round_edit,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      GestureDetector(
                                        onTap: () {
                                          model.removeExperience(e);
                                          model.notifyListeners();
                                        },
                                        child: SvgPicture.asset(
                                          AppImage.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(height: 50.h),
                        Row(
                          children: [
                            Expanded(
                              child: ButtonWidget(
                                border: 100.r,
                                buttonColor: AppColors.white,
                                buttonText: 'Discard',
                                fontSize: 14.sp,
                                color: AppColors.primary,
                                buttonBorderColor: AppColors.primary,
                                onPressed: () {
                                  navigate.back();
                                },
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Expanded(
                              child: ButtonWidget(
                                border: 100.r,
                                buttonColor: AppColors.primary,
                                fontSize: 14.sp,
                                buttonText: 'Save Changes',
                                color: AppColors.white,
                                isLoading: model.isLoading,
                                buttonBorderColor: AppColors.transparent,
                                onPressed: model.isLoading
                                    ? () {}
                                    : () {
                                        if (formKey.currentState!.validate()) {
                                          model.updateHealthCarePractitioner(
                                            context,
                                            updatePractitioner: UpdatePractitionerProfileEntityModel(
                                              logo: null,
                                              typeOfHealthcareProvider:
                                                  'DOCTOR',
                                              healthcareFacilityName:
                                                  nameController.text.trim(),
                                              registrationNumber:
                                                  licenceNoController.text
                                                      .trim(),
                                              yearsOfExperience: int.parse(
                                                experienceYears.text.trim(),
                                              ),
                                              bio: bioController.text.trim(),
                                              country: model
                                                  .countryController
                                                  .text
                                                  .trim(),
                                              state: model.stateController.text
                                                  .trim(),
                                              lga: model.lgaController.text
                                                  .trim(),
                                              servicesOffered: model
                                                  .selectServicePractitioner,
                                              businessAddress:
                                                  businessAddController.text
                                                      .trim(),
                                              businessEmail:
                                                  businessEmailController.text
                                                      .trim(),
                                              educationalExperience: model
                                                  .educationalExperienceList,
                                              bankDetails: [
                                                BankDetail(
                                                  bankName:
                                                      bankNameController.text,
                                                  accountName:
                                                      bankAccountNameController
                                                          .text,
                                                  accountNumber:
                                                      bankNoController.text,
                                                ),
                                              ],
                                              meansOfIdType:
                                                  model.isUpperCase(
                                                    model
                                                        .meansIdController
                                                        .text,
                                                  )
                                                  ? model.meansIdController.text
                                                  : model
                                                        .getMeansOFIDAppReverse(
                                                          model
                                                              .meansIdController
                                                              .text,
                                                        ),
                                              meansOfId:
                                                  model
                                                      .pracAuthDocumentsList
                                                      .isEmpty
                                                  ? null
                                                  : MeansOfId(
                                                      url: model
                                                          .pracAuthDocumentsList[0]
                                                          .url,
                                                      mimeType: model
                                                          .pracAuthDocumentsList[0]
                                                          .mimeType,
                                                      width: model
                                                          .pracAuthDocumentsList[0]
                                                          .width,
                                                      size: model
                                                          .pracAuthDocumentsList[0]
                                                          .size,
                                                      height: model
                                                          .pracAuthDocumentsList[0]
                                                          .height,
                                                      format: model
                                                          .pracAuthDocumentsList[0]
                                                          .format,
                                                    ),
                                            ),
                                          );
                                        }
                                      },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
