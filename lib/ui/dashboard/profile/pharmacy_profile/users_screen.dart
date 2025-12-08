// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => locator<PharmViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getUser(context);
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
              text: 'Users',
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
                        model.getUser(context);
                      },
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          vertical:
                              model.getCreatedUserResponseModel != null &&
                                  model
                                      .getCreatedUserResponseModel!
                                      .data!
                                      .staff!
                                      .isEmpty
                              ? 120.w
                              : 20.w,
                        ),
                        child:
                            model.getCreatedUserResponseModel != null &&
                                model
                                    .getCreatedUserResponseModel!
                                    .data!
                                    .staff!
                                    .isEmpty
                            ? Column(
                                children: [
                                  SvgPicture.asset(AppImage.no_user_data),
                                  SizedBox(height: 20.h),
                                  TextView(
                                    text: 'No Sub User Added',
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
                                          .modalBottomSheetMenuAddUser(
                                            context: context,
                                          );
                                      if (didAddOrEdit == true) {
                                        await Future.delayed(
                                          Duration(seconds: 1),
                                        );
                                        model.getUser(
                                          context,
                                        ); // refresh roles after modal closes
                                      }else {}
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
                                        model.searchUsers = p0;
                                        model.notifyListeners();
                                      },
                                    ),
                                    SizedBox(height: 20.h),
                                    if (model.getCreatedUserResponseModel !=
                                            null &&
                                        model
                                            .getCreatedUserResponseModel!
                                            .data!
                                            .staff!
                                            .isNotEmpty)
                                      if (model.searchUsers != '')
                                        ...model
                                            .getCreatedUserResponseModel!
                                            .data!
                                            .staff!
                                            .where(
                                              (e) => model.searchUsers!
                                                  .toLowerCase()
                                                  .contains(
                                                    e.user!.fullName!
                                                        .toLowerCase(),
                                                  ),
                                            )
                                            .map(
                                              (e) =>
                                                  e.role?.name?.toLowerCase() ==
                                                      'owner'
                                                  ? SizedBox.shrink()
                                                  : Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () async {
                                                            bool?
                                                            didAddOrEdit = await model.modalBottomSheetMenuAddUser(
                                                              context: context,
                                                              isEdit: true,
                                                              firstName: model
                                                                  .getFirstWord(
                                                                    e.user?.fullName ??
                                                                        '',
                                                                  ),
                                                              lastName: model
                                                                  .getSecondWord(
                                                                    e.user?.fullName ??
                                                                        '',
                                                                  ),
                                                              phone:
                                                                  e.user?.phone,
                                                              email:
                                                                  e.user?.email,
                                                              address: e
                                                                  .profile
                                                                  ?.address,
                                                              gender: e
                                                                  .profile
                                                                  ?.gender,
                                                              role:
                                                                  e.role?.name,
                                                              roleId:
                                                                  e.role?.id,
                                                              membershipId: e
                                                                  .membershipId,
                                                              country: e.profile?.country,
                                                              state: e.profile?.state
                                                            );
                                                            if (didAddOrEdit ==
                                                                true) {
                                                              await Future.delayed(
                                                                Duration(
                                                                  seconds: 1,
                                                                ),
                                                              );
                                                              model.getUser(
                                                                context,
                                                              ); // refresh roles after modal closes
                                                            } else {}
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                      5.0.w,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                      AppColors
                                                                          .f7,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: SvgPicture.asset(
                                                                  AppImage
                                                                      .user_pro_pic,
                                                                  height:
                                                                      34.40.h,
                                                                  width:
                                                                      34.40.w,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 11.20.w,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                        180.w,
                                                                    child: TextView(
                                                                      text:
                                                                          e.user?.fullName ??
                                                                          '',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'GoogleSans',
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        3.10.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        150.w,
                                                                    child: TextView(
                                                                      text:
                                                                          e.user?.email ??
                                                                          '',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            12.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        2.10.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        100.w,
                                                                    child: TextView(
                                                                      text:
                                                                          e.role?.name ??
                                                                          '',
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            12.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .infoGrey,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Spacer(),
                                                              e.role?.name?.toLowerCase() ==
                                                                      'owner'
                                                                  ? SizedBox.shrink()
                                                                  : GestureDetector(
                                                                      onTap: () async {
                                                                        bool?
                                                                        delete = await model.showRemoveUserDialog(
                                                                          context,
                                                                          id: e
                                                                              .membershipId,
                                                                          userName: e
                                                                              .user!
                                                                              .fullName,
                                                                        );
                                                                        if (delete ==
                                                                            true) {
                                                                          await Future.delayed(
                                                                            Duration(
                                                                              seconds: 1,
                                                                            ),
                                                                          );
                                                                          model.getUser(
                                                                            context,
                                                                          );
                                                                        } else {}
                                                                      },
                                                                      child: SvgPicture.asset(
                                                                        AppImage
                                                                            .delete,
                                                                        color: AppColors
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
                                        ...model.getCreatedUserResponseModel!.data!.staff!.map(
                                          (e) =>
                                              e.role?.name?.toLowerCase() ==
                                                  'owner'
                                              ? SizedBox.shrink()
                                              : Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        bool?
                                                        didAddOrEdit = await model
                                                            .modalBottomSheetMenuAddUser(
                                                              context: context,
                                                              isEdit: true,
                                                              firstName: model
                                                                  .getFirstWord(
                                                                    e.user?.fullName ??
                                                                        '',
                                                                  ),
                                                              lastName: model
                                                                  .getSecondWord(
                                                                    e.user?.fullName ??
                                                                        '',
                                                                  ),
                                                              phone:
                                                                  e.user?.phone,
                                                              email:
                                                                  e.user?.email,
                                                              address: e
                                                                  .profile
                                                                  ?.address,
                                                              gender: e
                                                                  .profile
                                                                  ?.gender,
                                                              role:
                                                                  e.role?.name,
                                                              roleId:
                                                                  e.role?.id,
                                                              membershipId: e
                                                                  .membershipId,
                                                              country: e.profile?.country,
                                                          state: e.profile?.state
                                                            );
                                                        if (didAddOrEdit ==
                                                            true) {
                                                          await Future.delayed(
                                                            Duration(
                                                              seconds: 1,
                                                            ),
                                                          );
                                                          model.getUser(
                                                            context,
                                                          ); // refresh roles after modal closes
                                                        } else {}
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                  5.0.w,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  color:
                                                                      AppColors
                                                                          .f7,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                            child: SvgPicture.asset(
                                                              AppImage
                                                                  .user_pro_pic,
                                                              height: 34.40.h,
                                                              width: 34.40.w,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 11.20.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                width: 180.w,
                                                                child: TextView(
                                                                  text:
                                                                      e
                                                                          .user
                                                                          ?.fullName ??
                                                                      '',
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
                                                                      e
                                                                          .user
                                                                          ?.email ??
                                                                      '',
                                                                  maxLines: 1,
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
                                                              SizedBox(
                                                                width: 100.w,
                                                                child: TextView(
                                                                  text:
                                                                      e
                                                                          .role
                                                                          ?.name ??
                                                                      '',
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
                                                                        .infoGrey,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              bool?
                                                              delete = await model
                                                                  .showRemoveUserDialog(
                                                                    context,
                                                                    id: e
                                                                        .membershipId,
                                                                    userName: e
                                                                        .user!
                                                                        .fullName,
                                                                  );
                                                              if (delete ==
                                                                  true) {
                                                                await Future.delayed(
                                                                  Duration(
                                                                    seconds: 1,
                                                                  ),
                                                                );
                                                                model.getUser(
                                                                  context,
                                                                );
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
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Divider(
                                                      color: AppColors.f1,
                                                    ),
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
                SizedBox(
                  height:
                      model.getCreatedUserResponseModel != null &&
                          model
                              .getCreatedUserResponseModel!
                              .data!
                              .staff!
                              .isNotEmpty
                      ? 70.h
                      : 0.h,
                ),
                model.getCreatedUserResponseModel != null &&
                        model
                            .getCreatedUserResponseModel!
                            .data!
                            .staff!
                            .isNotEmpty
                    ? ButtonWidget(
                        border: 100.r,
                        buttonColor: AppColors.primary,
                        buttonText: 'Add User',
                        fontSize: 16.8.sp,
                        color: AppColors.white,
                        isLoading: model.isLoading,
                        buttonBorderColor: AppColors.transparent,
                        onPressed: () async {
                          bool? didAddOrEdit = await model
                              .modalBottomSheetMenuAddUser(context: context);
                          if (didAddOrEdit == true) {
                            await Future.delayed(Duration(seconds: 1));
                            model.getUser(
                              context,
                            ); // refresh roles after modal closes
                          }else {}
                        },
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height:
                      model.getCreatedUserResponseModel != null &&
                          model
                              .getCreatedUserResponseModel!
                              .data!
                              .staff!
                              .isNotEmpty
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
