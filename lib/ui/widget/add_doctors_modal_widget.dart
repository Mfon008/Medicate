// ignore_for_file: deprecated_member_use, strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/connect_end/model/get_roles_response_model/role.dart';
import 'package:medicate_app/ui/widget/button.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';
import '../../core/app_assets/app_validation.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../../core/connect_end/model/create_user_entity_model.dart';
import '../../core/connect_end/model/update_user_entity_model.dart';
import '../../core/connect_end/view_model/health_care_view_model.dart';
import 'text_form_widget.dart';

class AddDoctorsModalWidget extends StatelessWidget {
  const AddDoctorsModalWidget({
    super.key,
    required this.isEdit,
    required this.onSuccess,
    required this.parentContext,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.address,
    this.gender,
    this.country,
    this.state,
    this.role,
    this.roleId,
    this.specialty,
    this.licenseNo,
    this.membershipId,
  });
  final bool isEdit;
  final VoidCallback onSuccess;
  final BuildContext parentContext;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? address;
  final String? gender;
  final String? country;
  final String? state;
  final String? role;
  final String? licenseNo;
  final String? roleId;
  final List<String>? specialty;
  final dynamic membershipId;

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.9, // 90% of screen height
        minChildSize: 0.5, // Can be dragged to 50% of screen height
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return ViewModelBuilder<HealthCareViewModel>.reactive(
            viewModelBuilder: () => HealthCareViewModel(),
            onViewModelReady: (model) async {
              await model.getRoles(context);
              if (isEdit) {
                model.firstNameController.text = firstName!;
                model.lastNameController.text = lastName!;
                model.doctorsPhoneController.text = '0${phone!.substring(4)}';
                model.doctorsEmailController.text = email!;
                model.doctorsGenderController.text = gender!;
                model.doctorsRoleController.text = role!;
                model.doctorsRoleControllerId = roleId;
                model.countryController.text = country!;
                model.doctorsAddressController.text = address!;
                // model.doctorsLicenseNoController.text = licenseNo!;
                model.stateController.text = state!;
                // model.selectService = specialty!;
              } else {
                model.firstNameController.text = '';
                model.lastNameController.text = '';
                model.doctorsPhoneController.text = '';
                model.doctorsEmailController.text = '';
                model.doctorsGenderController.text = '';
                model.doctorsRoleController.text = '';
                model.doctorsRoleControllerId = '';
                model.doctorsLicenseNoController.text = '';
                model.countryController.text = '';
                model.doctorsAddressController.text = '';
                model.stateController.text = '';
                model.selectService = [];
              }
            },
            disposeViewModel: false,
            builder: (_, HealthCareViewModel model, _) {
              return Container(
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
                      key: model.formKeyValidateAddDoctor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 30.w),
                              TextView(
                                text: !isEdit ? 'Add Doctor' : 'Update Doctor',
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
                          TextFormWidget(
                            hint: 'First Name',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: model.firstNameController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {},
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Last Name',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: model.lastNameController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {},
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Phone Number',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: model.doctorsPhoneController,
                            validator: AppValidator.validatePhoneUser(),
                            onChange: (p0) {},
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Email Address',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: model.doctorsEmailController,
                            validator: AppValidator.validateEmail(),
                            onChange: (p0) {},
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'License Number',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: model.doctorsLicenseNoController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {},
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Address',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: model.doctorsAddressController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {},
                          ),

                          SizedBox(height: 20.h),

                          TextFormWidget(
                            hint: 'Gender',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: AppColors.infoGrey,
                            ),
                            readOnly: true,
                            fillColor: AppColors.grey,
                            isFilled: true,
                            label: '--Select--',
                            controller: model.doctorsGenderController,
                            validator: AppValidator.validateString(),
                            suffixWidget: PopupMenuButton<String>(
                              color: AppColors.white,
                              child: Padding(
                                padding: EdgeInsets.all(14.20.w),
                                child: SvgPicture.asset(AppImage.arrow_down),
                              ),
                              onSelected: (String result) {
                                model.doctorsGenderController.text = result;
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<String>>[
                                    PopupMenuItem<String>(
                                      value: 'MALE',
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
                                      value: 'FEMALE',
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
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
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
                              onTap: () {
                                model.modalBottomSheetMenuCountry(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(14.20.w),
                                child: SvgPicture.asset(AppImage.arrow_down),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'State',
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
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
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Role',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            readOnly: true,
                            label: model.doctorsRoleController.text == ''
                                ? '--Select--'
                                : model.doctorsRoleController.text,
                            controller: model.doctorsRoleController,
                            suffixWidget: PopupMenuButton<Role>(
                              color: AppColors.white,
                              child: Padding(
                                padding: EdgeInsets.all(14.20.w),
                                child: SvgPicture.asset(AppImage.arrow_down),
                              ),
                              onSelected: (Role? result) {
                                model.doctorsRoleController.text =
                                    result!.name!;
                                model.doctorsRoleControllerId = result.id!;
                                model.notifyListeners();
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<Role>>[
                                    if (model.getRolesResponseModel != null &&
                                        model
                                            .getRolesResponseModel!
                                            .data!
                                            .roles!
                                            .isNotEmpty)
                                      ...model
                                          .getRolesResponseModel!
                                          .data!
                                          .roles!
                                          .map(
                                            (e) => PopupMenuItem<Role>(
                                              value: e,
                                              child: TextView(
                                                text: e.name ?? '',
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          !isEdit
                              ? TextFormWidget(
                                  hint: 'Temporary 4-digit PIN',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  obscureText: !model.onTempPinTap
                                      ? true
                                      : false,
                                  hintSize: isTablet(context)
                                      ? 6.82.sp
                                      : 14.60.sp,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  controller: model.doctorPinController,
                                  validator: AppValidator.validate4String(),
                                  suffixWidget: Padding(
                                    padding: EdgeInsets.all(14.20.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        model.isOnToggleTempPinTap();
                                        model.notifyListeners();
                                      },
                                      child: SvgPicture.asset(
                                        !model.onTempPinTap
                                            ? AppImage.closed_eye_user
                                            : AppImage.opened_eye,
                                        color: AppColors.greyee,
                                        height: !model.onTempPinTap
                                            ? 20.h
                                            : 26.30.h,
                                        width: !model.onTempPinTap
                                            ? 20.w
                                            : 28.30.w,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                          SizedBox(height: 20.h),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              TextView(
                                text: 'Specialty',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.sp,
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
                          SizedBox(height: 20.h),
                          ...List.generate(model.areaExpertise.length, (index) {
                            return model.chooseNotChannelWidget(
                              context,
                              text: model.areaExpertise[index],
                              isTapped: model.addAreaExpertiseDoctorShow
                                  .contains(
                                    model.areaExpertise[index],
                                  ), // ✅ reflect state
                              onTap: () {
                                if (model.addAreaExpertiseDoctor.contains(
                                  model.areaExpertise[index],
                                )) {
                                  // unselect
                                  model.removeSpecialtyFormat(
                                    model.areaExpertise[index],
                                  );
                                } else {
                                  // select
                                  model.addSpecialtyFormat(
                                    model.areaExpertise[index],
                                  );
                                } // ✅ update selection

                                model.notifyListeners();
                              },
                            );
                          }),
                          SizedBox(height: 70.h),
                          ButtonWidget(
                            border: 100.r,
                            buttonColor: AppColors.primary,
                            buttonText: !isEdit ? 'Add' : 'Update',
                            fontSize: 16.sp,
                            color: AppColors.white,
                            isLoading: model.isLoading,
                            buttonBorderColor: AppColors.transparent,
                            onPressed: () {
                              if (model.formKeyValidateAddDoctor.currentState!
                                  .validate()) {
                                saveUser(context, model: model);
                              }
                            },
                          ),
                          SizedBox(height: 20.h),
                        ],
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
  }

  void saveUser(context, {HealthCareViewModel? model}) async {
    if (isEdit) {
      await model!.updateDoctor(
        context,
        updateUser: UpdateUserEntityModel(
          fullName:
              '${model.firstNameController.text.trim()} ${model.lastNameController.text.trim()}',
          email: model.doctorsEmailController.text.trim(),
          phone: '+234${model.doctorsPhoneController.text.trim().substring(1)}',
          gender: model.doctorsGenderController.text.trim(),
          address: model.doctorsAddressController.text.trim(),
          roleId: model.doctorsRoleControllerId,
          membershipId: membershipId,
          country: model.countryController.text,
          state: model.stateController.text,
          licenseNumber: model.doctorsLicenseNoController.text.trim(),
          specialty: model.addAreaExpertiseDoctor,
        ),
      );
    } else {
      await model!.addDoctors(
        context,
        createEntity: CreateUserEntityModel(
          fullName:
              '${model.firstNameController.text.trim()} ${model.lastNameController.text.trim()}',
          email: model.doctorsEmailController.text.trim(),
          phone: '+234${model.doctorsPhoneController.text.trim().substring(1)}',
          gender: model.doctorsGenderController.text.trim(),
          address: model.doctorsAddressController.text.trim(),
          pin: model.doctorPinController.text.trim(),
          roleId: model.doctorsRoleControllerId,
          country: model.countryController.text,
          state: model.stateController.text,
          licenseNumber: model.doctorsLicenseNoController.text.trim(),
          specialty: model.addAreaExpertiseDoctor,
        ),
      );
    }
    onSuccess();
  }
}
