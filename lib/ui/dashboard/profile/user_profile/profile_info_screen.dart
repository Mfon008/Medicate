import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/model/update_user_profile_entity/update_user_profile_entity.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  bool isPhone = false;
  bool isPhoneValid = false;
  DateTime?
  _selectedDate; // Use nullable DateTime to handle no selection initially

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // Initial date shown
      firstDate: DateTime(1900), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        ageController.text = calculateAge(_selectedDate!).toString();
        dobController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

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
        child: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => locator<AuthViewModel>(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getUserDetailsNoPhone(context);
              nameController.text = SharedPreferencesService
                  .instance
                  .usersData1['user']['fullName'];
              phoneController.text = SharedPreferencesService
                  .instance
                  .usersData1['user']['phone']['number']
                  .toString()
                  .substring(4);
              emailController.text =
                  SharedPreferencesService
                      .instance
                      .usersData1['user']['email'] ??
                  '';
              dobController.text =
                  SharedPreferencesService.instance.usersData1['dateOfBirth'] !=
                      null
                  ? model.getDOB(
                      SharedPreferencesService
                              .instance
                              .usersData1['dateOfBirth'] ??
                          "",
                    )
                  : '';
              genderController.text =
                  SharedPreferencesService.instance.usersData1['gender'] ?? '';
              ageController.text =
                  SharedPreferencesService.instance.usersData1['dateOfBirth'] !=
                      null
                  ? model
                        .calculateAge(
                          model.getDOB(
                            SharedPreferencesService
                                .instance
                                .usersData1['dateOfBirth'],
                          ),
                        )
                        .toString()
                  : '';
              model.countryController.text =
                  SharedPreferencesService.instance.usersData1['country'] ?? '';
              heightController.text =
                  SharedPreferencesService.instance.usersData1['heightCm'] ==
                      null
                  ? ''
                  : SharedPreferencesService.instance.usersData1['heightCm']
                        .toString();
              weightController.text =
                  SharedPreferencesService.instance.usersData1['weightKg'] ==
                      null
                  ? ''
                  : SharedPreferencesService.instance.usersData1['weightKg']
                        .toString();
            });
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, _) {
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
                        TextView(
                          text: 'Bio Data',
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
                              onTap: () => model.sendOtpEverydayUser(
                                context,
                                phone: SharedPreferencesService
                                    .instance
                                    .usersData1['user']['phone']['number'],
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
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  controller: phoneController,
                                  onChange: (p0) {
                                    if (p0.isEmpty) {
                                      isPhone = false;
                                    } else {
                                      isPhone = true;
                                    }
                                    setState(() {});
                                  },
                                  validator: (value) {
                                    final result = AppValidator.validatePhone()(
                                      value,
                                    );
                                    if (result != null) {
                                      isPhoneValid = true;
                                    } else {
                                      isPhoneValid = false;
                                    }
                                    setState(() {});
                                    return result;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Full name',
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
                          controller: nameController,
                          validator: AppValidator.validateString(),
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Email',
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
                          validator: AppValidator.validateString(),
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Date of Birth',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: 'YYYY/MM/DD',
                          readOnly: true,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: dobController,
                          validator: AppValidator.validateString(),
                          suffixWidget: Padding(
                            padding: EdgeInsets.all(14.10.w),
                            child: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: SvgPicture.asset(AppImage.calendar),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Age',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: '0 - 100',
                          readOnly: true,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: ageController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Gender',
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
                          controller: genderController,
                          validator: AppValidator.validateString(),
                          suffixWidget: PopupMenuButton<String>(
                            color: AppColors.white,
                            child: Padding(
                              padding: EdgeInsets.all(14.20.w),
                              child: SvgPicture.asset(AppImage.arrow_down),
                            ),
                            onSelected: (String result) {
                              genderController.text = result;
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<String>>[
                                  PopupMenuItem<String>(
                                    value: 'male',
                                    child: TextView(
                                      text: 'Male',
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                        fontSize: 15.2.sp,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'female',
                                    child: TextView(
                                      text: 'Female',
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                        fontSize: 15.2.sp,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                ],
                          ),
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
                          suffixWidget: Padding(
                            padding: EdgeInsets.all(14.20.w),
                            child: GestureDetector(
                              onTap: () {
                                Future.microtask(() {
                                  model.modalBottomSheetMenuCountry(context);
                                });
                              },
                              child: SvgPicture.asset(AppImage.arrow_down),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextView(
                          text: 'Physical Measurement',
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
                          hint: 'Height (ft/in)',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          // label: '--Select--',
                          keyboardType: TextInputType.number,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: heightController,
                          validator: AppValidator.validateString(),
                          // suffixWidget: Padding(
                          //   padding: EdgeInsets.all(14.20.w),
                          //   child: SvgPicture.asset(AppImage.arrow_down),
                          // ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Weight (Kg)',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          // label: '--Select--',
                          keyboardType: TextInputType.number,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: weightController,
                          validator: AppValidator.validateString(),
                          // suffixWidget: Padding(
                          //   padding: EdgeInsets.all(14.20.w),
                          //   child: SvgPicture.asset(AppImage.arrow_down),
                          // ),
                        ),
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
                          buttonText: 'Save Changes',
                          color: AppColors.white,
                          isLoading: model.isLoading,
                          buttonBorderColor: AppColors.transparent,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              model.uploadUserProfile(
                                context: context,
                                userEntity: UpdateUserProfileEntity(
                                  dateOfBirth: dobController.text.trim(),
                                  // age: int.parse(ageController.text.trim()),
                                  gender: genderController.text
                                      .trim()
                                      .toUpperCase(),
                                  email: emailController.text.trim(),
                                  country: model.countryController.text.trim(),
                                  height: int.parse(
                                    heightController.text.trim(),
                                  ),
                                  weight: int.parse(
                                    weightController.text.trim(),
                                  ),
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
