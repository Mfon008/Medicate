// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/app_assets/app_validation.dart';
import 'package:medicate_app/core/connect_end/model/create_hospital_network_entity_model.dart';
import 'package:stacked/stacked.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../../main.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class HmoAddHospitalNetworkPortalScreen extends StatelessWidget {
  HmoAddHospitalNetworkPortalScreen({
    super.key,
    required this.isEditing,
    this.hospitalId,
  });
  bool? isEditing;
  String? hospitalId;
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // bool isTablet(BuildContext context) =>
    //     MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) async {
        if (isEditing!) {
          await model.getHospitalNetworkById(
            context: context,
            hospitalId: hospitalId,
          );
          nameController.text =
              model.getHospitalByIdResponseModel?.data?.hospital?.name ?? '';
          typeController.text =
              model.getHospitalByIdResponseModel?.data?.hospital?.type ?? '';
          stateController.text =
              model.getHospitalByIdResponseModel?.data?.hospital?.state ?? '';
          cityController.text =
              model.getHospitalByIdResponseModel?.data?.hospital?.city ?? '';
          addressController.text =
              model.getHospitalByIdResponseModel?.data?.hospital?.address ?? '';
          phoneController.text =
              model.getHospitalByIdResponseModel?.data?.hospital?.phone ?? '';
          emailController.text =
              model.getHospitalByIdResponseModel?.data?.hospital?.email ?? '';
        }
      },
      disposeViewModel: false,
      builder: (_, HMOViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.dashboard,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 80.0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => navigate.back(),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.reminder1),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 12.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: TextView(
                      text: isEditing! ? 'Edit Hospital' : 'Add New Hospital',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 18.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.deep,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 16.0.w),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 30.w,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.infoGrey1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormWidget(
                          hint: 'Hospital Name',
                          hintSize: 15.6.sp,
                          hintWeight: FontWeight.w400,
                          isFilled: true,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          controller: nameController,
                          fillColor: AppColors.grey,
                          onChange: (value) {},
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 14.h),
                        TextFormWidget(
                          hint: 'Hospital Type',
                          hintSize: 15.6.sp,
                          hintWeight: FontWeight.w400,
                          isFilled: true,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          controller: typeController,
                          fillColor: AppColors.grey,
                          validator: AppValidator.validateString(),
                          suffixWidget: PopupMenuButton(
                            color: AppColors.white,
                            onSelected: (value) {},
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.w,
                            ),
                            itemBuilder: (context) => [
                              ...model.hospitalType.map(
                                (e) => PopupMenuItem(
                                  onTap: () {
                                    typeController.text = e;
                                    model.notifyListeners();
                                  },
                                  child: TextView(
                                    text: e,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20.sp,
                              color: AppColors.reminder,
                            ),
                          ),
                          onChange: (value) {},
                        ),
                        SizedBox(height: 14.h),
                        TextFormWidget(
                          hint: 'State',
                          hintSize: 15.6.sp,
                          hintWeight: FontWeight.w400,
                          isFilled: true,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.grey,
                          controller: stateController,
                          validator: AppValidator.validateString(),
                          onChange: (value) {},
                        ),
                        SizedBox(height: 14.h),
                        TextFormWidget(
                          hint: 'City',
                          hintSize: 15.6.sp,
                          hintWeight: FontWeight.w400,
                          isFilled: true,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.grey,
                          controller: cityController,
                          validator: AppValidator.validateString(),
                          onChange: (value) {},
                        ),
                        SizedBox(height: 14.h),
                        TextFormWidget(
                          hint: 'Address',
                          hintSize: 15.6.sp,
                          hintWeight: FontWeight.w400,
                          isFilled: true,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.grey,
                          controller: addressController,
                          validator: AppValidator.validateString(),
                          onChange: (value) {},
                        ),
                        SizedBox(height: 14.h),
                        TextFormWidget(
                          hint: 'Phone',
                          hintSize: 15.6.sp,
                          hintWeight: FontWeight.w400,
                          isFilled: true,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.grey,
                          controller: phoneController,
                          validator: AppValidator.validatePhoneNewPatient(),
                          onChange: (value) {},
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 14.h),
                        TextFormWidget(
                          hint: 'Email',
                          hintSize: 15.6.sp,
                          hintWeight: FontWeight.w400,
                          isFilled: true,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          controller: emailController,
                          fillColor: AppColors.grey,
                          validator: AppValidator.validateEmail(),
                          onChange: (value) {},
                        ),
                        SizedBox(height: 24.h),
                        ButtonWidget(
                          border: 100.r,
                          buttonColor: AppColors.primary,
                          buttonText: isEditing! ? 'Save Changes' : 'Add',
                          color: AppColors.white,
                          buttonBorderColor: AppColors.primary,
                          isLoading: model.isLoading,
                          onPressed: isEditing!
                              ? () {
                                  if (formkey.currentState!.validate()) {
                                    model.editHospital(
                                      context: context,
                                      hospitalId: hospitalId,
                                      editHospital:
                                          CreateHospitalNetworkEntityModel(
                                            name: nameController.text.trim(),
                                            type: typeController.text.trim(),
                                            state: stateController.text.trim(),
                                            city: cityController.text.trim(),
                                            address: addressController.text
                                                .trim(),
                                            phone: model
                                                .returnPhoneNoStructureAdd234After(
                                                  phoneController.text.trim(),
                                                ),
                                            email: emailController.text.trim(),
                                          ),
                                    );
                                  }
                                }
                              : () {
                                  if (formkey.currentState!.validate()) {
                                    model.createHospitalNetwork(
                                      context: context,
                                      createHospital:
                                          CreateHospitalNetworkEntityModel(
                                            name: nameController.text.trim(),
                                            type: typeController.text.trim(),
                                            state: stateController.text.trim(),
                                            city: cityController.text.trim(),
                                            address: addressController.text
                                                .trim(),
                                            phone: model
                                                .returnPhoneNoStructureAdd234After(
                                                  phoneController.text.trim(),
                                                ),
                                            email: emailController.text.trim(),
                                          ),
                                    );
                                  }
                                },
                        ),
                        SizedBox(height: 20.60.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
