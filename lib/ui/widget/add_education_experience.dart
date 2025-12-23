// ignore_for_file: strict_top_level_inference
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/ui/widget/button.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:medicate_app/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';
import '../../core/app_assets/app_validation.dart';
import '../../core/app_assets/image.dart';
import '../../core/connect_end/view_model/health_care_view_model.dart';
import '../../main.dart';

class AddEducationExperienceModalWidget extends StatelessWidget {
  final bool isEdit;
  final VoidCallback onSuccess;
  final BuildContext parentContext;

  const AddEducationExperienceModalWidget({
    super.key,
    this.isEdit = false,
    required this.parentContext,
    required this.onSuccess,
  });

  void addExperience(modelPharm) async {
    if (modelPharm.formKeyValidateAddRole.currentState!.validate()) {
      if (isEdit) {
        // await modelPharm.updateRole(
        //   parentContext,
        //   updateRole: UpdateRoleEntityModel(
        //     roleId: roleId,
        //     name: modelPharm.rolenameController.text.trim(),
        //     description: modelPharm.roleDescriptionController.text.trim(),
        //   ),
        // );
      } else {
        // await modelPharm.addRoles(
        //   parentContext,
        //   roleEntity: RolesEntityModel(
        //     name: modelPharm.rolenameController.text.trim(),
        //     description: modelPharm.roleDescriptionController.text.trim(),
        //   ),
        // );
      }
    }
    // on success:
    onSuccess();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext contextP) =>
        MediaQuery.of(contextP).size.shortestSide >= 600;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85, // 80% of screen height
        minChildSize: 0.5, // Can be dragged to 30% of screen height
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return ViewModelBuilder<HealthCareViewModel>.reactive(
            viewModelBuilder: () => HealthCareViewModel(),
            onViewModelReady: (model) {
              if (isEdit) {
                // model.rolenameController.text = rolename!;
                // model.roleDescriptionController.text = roleDescription!;
              }
            },
            disposeViewModel: true,
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
                      key: model.formKeyValidateAddExperience,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 30.w),
                              TextView(
                                text: 'Educational Experience',
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
                            hint: 'School',
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
                            isShowHint: true,
                            isFilled: true,
                            controller: model.schoolController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {},
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Degree',
                            alignLabelWithHint: true,
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
                            isShowHint: true,
                            isFilled: true,
                            controller: model.degreeController,
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormWidget(
                                  hint: 'Start Date',
                                  hintSize: 14,
                                  label: 'Month',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  isShowHint: true,
                                  readOnly: true,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  controller: model.startMonthController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(14.20.w),
                                      child: SvgPicture.asset(
                                        AppImage.arrow_down,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: TextFormWidget(
                                  hint: 'Year',
                                  hintSize: 14,
                                  label: 'Year',
                                  borderColor: AppColors.transparent,
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
                                  isShowHint: true,
                                  isFilled: true,
                                  controller: model.startYearController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(14.20.w),
                                      child: SvgPicture.asset(
                                        AppImage.arrow_down,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormWidget(
                                  hint: 'End Date',
                                  hintSize: 14,
                                  label: 'Month',
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  readOnly: true,
                                  isShowHint: true,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                  controller: model.endMonthController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(14.20.w),
                                      child: SvgPicture.asset(
                                        AppImage.arrow_down,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: TextFormWidget(
                                  hint: 'Year',
                                  isShowHint: true,
                                  hintSize: 14,
                                  label: 'Year',
                                  borderColor: AppColors.transparent,
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
                                  controller: model.endYearController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(14.20.w),
                                      child: SvgPicture.asset(
                                        AppImage.arrow_down,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextView(
                                text: 'Certificate of Graduation',
                                textStyle: TextStyle(
                                  fontSize: 14.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                  fontFamily: 'Arial',
                                ),
                              ),
                              SizedBox(width: 4.w,),
                              TextView(
                                text: '*',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: double.infinity,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [10, 10],
                                strokeWidth: .94,
                                radius: Radius.circular(10),
                                color: AppColors.primary,
                              ),
                              child: GestureDetector(
                                // onTap: () => model.pickImageMeansId(context),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 24.30.w,
                                    horizontal: 22.0.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
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

                          SizedBox(height: 70.h),
                          Row(
                            children: [
                              Expanded(
                                child: ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.grey,
                                  buttonText: 'Cancel',
                                  fontSize: 14.sp,
                                  color: AppColors.deep,
                                  buttonBorderColor: AppColors.transparent,
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
                                  buttonText: 'Add',
                                  color: AppColors.white,
                                  isLoading: model.isLoading,
                                  buttonBorderColor: AppColors.primary,
                                  onPressed: () {
                                    if (model
                                        .formKeyValidateAddExperience
                                        .currentState!
                                        .validate()) {}
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50.h),
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
}
