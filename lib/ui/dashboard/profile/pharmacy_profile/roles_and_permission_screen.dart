// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class RolesAndPermissionScreen extends StatelessWidget {
  const RolesAndPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => locator<PharmViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getRoles(context);
        });
      },
      disposeViewModel: false,
      builder: (_, PharmViewModel model, _) {
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
              text: 'Roles & Permissions',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 200.h,
                    maxHeight: MediaQuery.of(context).size.height * .68,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        model.getRoles(context);
                      },
                      child: SizedBox(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                model.getRolesResponseModel != null &&
                                    model
                                        .getRolesResponseModel!
                                        .data!
                                        .roles!
                                        .isEmpty
                                ? 120.w
                                : 20.w,
                          ),
                          child:
                              model.getRolesResponseModel != null &&
                                  model
                                      .getRolesResponseModel!
                                      .data!
                                      .roles!
                                      .isEmpty
                              ? Column(
                                  children: [
                                    SvgPicture.asset(AppImage.no_user_data),
                                    SizedBox(height: 20.h),
                                    TextView(
                                      text: 'Add a Role',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 4.20.h),
                                    TextView(
                                      text: 'Tap on the plus button to add one',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.faintedGrey,
                                      ),
                                    ),
                                    SizedBox(height: 26.0.h),
                                    GestureDetector(
                                      onTap: () async {
                                        bool? didAddOrEdit = await model
                                            .modalBottomSheetMenuAddRole(
                                              context: context,
                                            );
                                        if (didAddOrEdit == true) {
                                          await Future.delayed(
                                            Duration(seconds: 2),
                                          );
                                          model.getRoles(
                                            context,
                                          ); // refresh roles after modal closes
                                        } else {}
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.10.w),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primary,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.white,
                                          size: 24.30.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: EdgeInsets.all(22.0),
                                  child: Column(
                                    children: [
                                      TextFormWidget(
                                        borderColor: AppColors.f1,
                                        borderTopLeft: 10.r,
                                        borderTopRight: 10.r,
                                        borderBottomLeft: 10.r,
                                        borderBottomRight: 10.r,
                                        label: 'Search',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          fontSize: 14.sp,
                                          color: AppColors.infoGrey,
                                        ),
                                        fillColor: AppColors.transparent,
                                        isFilled: true,
                                        prefixWidget: Padding(
                                          padding: EdgeInsets.all(11.6.w),
                                          child: SvgPicture.asset(
                                            AppImage.search,
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                        ),
                                        onChange: (p0) {
                                          model.searchRoles = p0;
                                          model.notifyListeners();
                                        },
                                      ),
                                      SizedBox(height: 20.h),
                                      if (model.getRolesResponseModel != null &&
                                          model
                                              .getRolesResponseModel!
                                              .data!
                                              .roles!
                                              .isNotEmpty)
                                        if (model.searchRoles != '')
                                          ...model
                                              .getRolesResponseModel!
                                              .data!
                                              .roles!
                                              .where(
                                                (e) => e.name!
                                                    .toLowerCase()
                                                    .contains(
                                                      model.searchRoles!
                                                          .toLowerCase(),
                                                    ),
                                              )
                                              .map(
                                                (e) => Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 180.w,
                                                              child: TextView(
                                                                text:
                                                                    '${e.name}',
                                                                maxLines: 1,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis,
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
                                                            ),
                                                            SizedBox(
                                                              height: 3.10.h,
                                                            ),
                                                            SizedBox(
                                                              width: 150.w,
                                                              child: TextView(
                                                                text:
                                                                    '${e.description}',
                                                                maxLines: 4,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .reminder,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 2.10.h,
                                                            ),
                                                            e.name!.toLowerCase() ==
                                                                    'owner'
                                                                ? SizedBox.shrink()
                                                                : GestureDetector(
                                                                    onTap: () async {
                                                                      bool?
                                                                      didAddOrEdit = await model.modalBottomSheetMenuAddRole(
                                                                        context:
                                                                            context,
                                                                        isEdit:
                                                                            true,
                                                                        rolename:
                                                                            e.name,
                                                                        roleDes:
                                                                            e.description,
                                                                        roleId:
                                                                            e.id,
                                                                      );
                                                                      if (didAddOrEdit ==
                                                                          true) {
                                                                        await Future.delayed(
                                                                          Duration(
                                                                            seconds:
                                                                                1,
                                                                          ),
                                                                        );
                                                                        model.getRoles(
                                                                          context,
                                                                        ); // refresh roles after modal closes
                                                                      } else {}
                                                                    },
                                                                    child: TextView(
                                                                      text:
                                                                          'Edit',
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            12.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        decoration:
                                                                            TextDecoration.underline,

                                                                        color: AppColors
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        e.name!.toLowerCase() ==
                                                                'owner'
                                                            ? SizedBox.shrink()
                                                            : GestureDetector(
                                                                onTap: () async {
                                                                  bool?
                                                                  delete = await model
                                                                      .showRemoveRoleDialog(
                                                                        context:
                                                                            context,
                                                                        roleId:
                                                                            e.id,
                                                                      );
                                                                  if (delete ==
                                                                      true) {
                                                                    await Future.delayed(
                                                                      Duration(
                                                                        seconds:
                                                                            1,
                                                                      ),
                                                                    );
                                                                    model.getRoles(
                                                                      context,
                                                                    ); // refresh roles after modal closes
                                                                  } else {}
                                                                },

                                                                child: SvgPicture.asset(
                                                                  AppImage
                                                                      .delete,
                                                                  color:
                                                                      AppColors
                                                                          .red,
                                                                ),
                                                              ),
                                                        SizedBox(
                                                          width: 14.80.w,
                                                        ),

                                                        SvgPicture.asset(
                                                          AppImage
                                                              .arrow_forward,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Divider(
                                                      color: AppColors.f1,
                                                    ),
                                                    SizedBox(height: 10.h),
                                                  ],
                                                ),
                                              )
                                        else
                                          ...model.getRolesResponseModel!.data!.roles!.map(
                                            (e) => Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 180.w,
                                                          child: TextView(
                                                            text: '${e.name}',
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'GoogleSans',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 3.10.h,
                                                        ),
                                                        SizedBox(
                                                          width: 150.w,
                                                          child: TextView(
                                                            text:
                                                                '${e.description}',
                                                            maxLines: 4,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2.10.h,
                                                        ),
                                                        e.name!.toLowerCase() ==
                                                                'owner'
                                                            ? SizedBox.shrink()
                                                            : GestureDetector(
                                                                onTap: () async {
                                                                  bool?
                                                                  didAddOrEdit = await model.modalBottomSheetMenuAddRole(
                                                                    context:
                                                                        context,
                                                                    isEdit:
                                                                        true,
                                                                    rolename:
                                                                        e.name,
                                                                    roleDes: e
                                                                        .description,
                                                                    roleId:
                                                                        e.id,
                                                                  );
                                                                  if (didAddOrEdit ==
                                                                      true) {
                                                                    await Future.delayed(
                                                                      Duration(
                                                                        seconds:
                                                                            1,
                                                                      ),
                                                                    );
                                                                    model.getRoles(
                                                                      context,
                                                                    ); // refresh roles after modal closes
                                                                  } else {}
                                                                },

                                                                child: TextView(
                                                                  text: 'Edit',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,

                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    e.name!.toLowerCase() ==
                                                            'owner'
                                                        ? SizedBox.shrink()
                                                        : GestureDetector(
                                                            onTap: () async {
                                                              bool?
                                                              delete = await model
                                                                  .showRemoveRoleDialog(
                                                                    context:
                                                                        context,
                                                                    roleId:
                                                                        e.id,
                                                                  );
                                                              if (delete ==
                                                                  true) {
                                                                await Future.delayed(
                                                                  Duration(
                                                                    seconds: 1,
                                                                  ),
                                                                );
                                                                model.getRoles(
                                                                  context,
                                                                ); // refresh roles after modal closes
                                                              } else {}
                                                            },
                                                            child:
                                                                SvgPicture.asset(
                                                                  AppImage
                                                                      .delete,
                                                                  color:
                                                                      AppColors
                                                                          .red,
                                                                ),
                                                          ),
                                                    SizedBox(width: 14.80.w),

                                                    SvgPicture.asset(
                                                      AppImage.arrow_forward,
                                                      color: AppColors.infoGrey,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                Divider(color: AppColors.f1),
                                                SizedBox(height: 10.h),
                                              ],
                                            ),
                                          ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      model.getRolesResponseModel != null &&
                          model.getRolesResponseModel!.data!.roles!.isNotEmpty
                      ? 70.h
                      : 0.h,
                ),
                model.getRolesResponseModel != null &&
                        model.getRolesResponseModel!.data!.roles!.isNotEmpty
                    ? ButtonWidget(
                        border: 100.r,
                        buttonColor: AppColors.primary,
                        buttonText: 'Add Role',
                        fontSize: 16.8.sp,
                        color: AppColors.white,
                        isLoading: model.isLoading,
                        buttonBorderColor: AppColors.transparent,
                        onPressed: () async {
                          bool? didAddOrEdit = await model
                              .modalBottomSheetMenuAddRole(context: context);
                          if (didAddOrEdit == true) {
                            await Future.delayed(Duration(seconds: 1));
                            model.getRoles(
                              context,
                            ); // refresh roles after modal closes
                          } else {}
                        },
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height:
                      model.getRolesResponseModel != null &&
                          model.getRolesResponseModel!.data!.roles!.isNotEmpty
                      ? 20.h
                      : 0.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
