// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/ui/widget/button.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';
import '../../core/app_assets/app_validation.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../../core/connect_end/model/roles_entity_model.dart';
import '../../core/connect_end/model/update_role_entity_model.dart';
import '../../core/connect_end/view_model/pharm_auth_view_model.dart';
import 'text_form_widget.dart';

class AddRoleModalWidget extends StatelessWidget {
  final bool isEdit;
  final String? rolename;
  final String? roleDescription;
  final String? roleId;
  final VoidCallback onSuccess;
  final BuildContext parentContext;

  const AddRoleModalWidget({
    super.key,
    this.isEdit = false,
    this.rolename,
    this.roleDescription,
    this.roleId,
    required this.parentContext,
    required this.onSuccess,
  });

  void saveRole(modelPharm) async {
    if (modelPharm.formKeyValidateAddRole.currentState!.validate()) {
      if (isEdit) {
        await modelPharm.updateRole(
          parentContext,
          updateRole: UpdateRoleEntityModel(
            roleId: roleId,
            name: modelPharm.rolenameController.text.trim(),
            description: modelPharm.roleDescriptionController.text.trim(),
          ),
        );
      } else {
        await modelPharm.addRoles(
          parentContext,
          roleEntity: RolesEntityModel(
            name: modelPharm.rolenameController.text.trim(),
            description: modelPharm.roleDescriptionController.text.trim(),
          ),
        );
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
        initialChildSize: 0.65, // 80% of screen height
        minChildSize: 0.5, // Can be dragged to 30% of screen height
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return ViewModelBuilder<PharmViewModel>.reactive(
            viewModelBuilder: () => PharmViewModel(),
            onViewModelReady: (model) {
              if (isEdit) {
                model.rolenameController.text = rolename!;
                model.roleDescriptionController.text = roleDescription!;
              }
            },
            disposeViewModel: true,
            builder: (_, PharmViewModel model, _) {
              return Padding(
                padding: EdgeInsets.only(
                  // bottom: MediaQuery.of(
                  //   context,
                  // ).viewInsets.bottom, // 👈 pushes content above keyboard
                ), //could change this to Color(0xFF737373),
                //so you don't have to change MaterialApp canvasColor
                child: Container(
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
                        key: model.formKeyValidateAddRole,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 30.w),
                                TextView(
                                  text: !isEdit ? 'Add Role' : 'Edit Role',
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
                              hint: 'Role Name',
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
                              controller: model.rolenameController,
                              validator: AppValidator.validateString(),
                              onChange: (p0) {},
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              hint: 'Description',
                              maxline: 4,
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
                              isFilled: true,
                              controller: model.roleDescriptionController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 70.h),
                            ButtonWidget(
                              border: 100.r,
                              buttonColor: AppColors.primary,
                              buttonText: !isEdit ? 'Add' : "Save Changes",
                              fontSize: 16.sp,
                              color: AppColors.white,
                              isLoading: model.isLoading,
                              buttonBorderColor: AppColors.transparent,
                              onPressed: () => saveRole(model),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
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
