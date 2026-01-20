import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/model/update_hmo_profile_entity_model/update_hmo_profile_entity_model.dart';
import '../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class HMOProfileInfoScreen extends StatefulWidget {
  const HMOProfileInfoScreen({super.key});

  @override
  State<HMOProfileInfoScreen> createState() => _HMOProfileInfoScreenState();
}

class _HMOProfileInfoScreenState extends State<HMOProfileInfoScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController businessAddController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController contactFirstNameController = TextEditingController();
  TextEditingController contactLastNameController = TextEditingController();
  TextEditingController contactDesignationController = TextEditingController();

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
        child: ViewModelBuilder<HMOViewModel>.reactive(
          viewModelBuilder: () => HMOViewModel(),
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
              businessAddController.text =
                  model.getTetantResponseModel?.data?.businessAddress ?? '';
              contactFirstNameController.text =
                  model.getTetantResponseModel?.data?.contactPersonFirstName ??
                  "";
              contactLastNameController.text =
                  model.getTetantResponseModel?.data?.contactPersonLastName ??
                  '';
              emailController.text =
                  model.getTetantResponseModel?.data?.businessEmail ?? '';
              model.countryController.text =
                  model.getTetantResponseModel?.data?.country ?? '';
              model.stateController.text =
                  model.getTetantResponseModel?.data?.state ?? '';
              model.lgaController.text =
                  model.getTetantResponseModel?.data?.lga ?? '';
              contactDesignationController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.contactPersonDesignation ??
                  '';
            });
          },
          disposeViewModel: false,
          builder: (_, HMOViewModel model, _) {
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
                        Container(
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
                        ),
                        // : SizedBox.shrink(),
                        SizedBox(height: 10.h),
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
                              onTap: () => model.sendOtpHMO(
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
                          hint: 'HMO Name',
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
                          onChange: (p0) {
                            setState(() {});
                          },
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
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: emailController,
                          validator: AppValidator.validateEmail(),
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
                          hint: 'First Name',
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
                          controller: contactFirstNameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Last Name',
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
                          controller: contactLastNameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Designation',
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
                          controller: contactDesignationController,
                          validator: AppValidator.validateString(),
                        ),

                        SizedBox(height: 30.h),
                      ],
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
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              model.updateHMO(
                                context,
                                update: UpdateHmoProfileEntityModel(
                                  country: model.countryController.text.trim(),
                                  state: model.stateController.text.trim(),
                                  lga: model.lgaController.text.trim(),
                                  businessAddress: businessAddController.text
                                      .trim(),
                                  name: nameController.text.trim(),
                                  businessEmail: emailController.text.trim(),
                                  contactPersonDesignation:
                                      contactDesignationController.text.trim(),
                                  contactPersonFirstName:
                                      contactFirstNameController.text.trim(),
                                  contactPersonLastName:
                                      contactLastNameController.text.trim(),
                                  bankDetails: [],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
