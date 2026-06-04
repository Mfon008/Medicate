// ignore_for_file: must_be_immutable, use_build_context_synchronously, deprecated_member_use
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/app_validation.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/ui/dashboard/profile/hmo/hmo_plan_teir_class.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/model/create_plan_tier_entity_model/create_plan_tier_entity_model.dart';
import '../../../../core/connect_end/model/create_plan_tier_entity_model/tier.dart';
import '../../../../core/connect_end/model/get_listed_plan_tiers_response_model/plan_tier.dart';
import '../../../../core/connect_end/model/update_plan_tiers_entity_model.dart';
import '../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class HmoCreateTiersPlanManagementScreen extends StatelessWidget {
  HmoCreateTiersPlanManagementScreen({
    super.key,
    this.isEditing = false,
    this.editedPlanTier,
  });
  bool? isEditing;
  PlanTier? editedPlanTier;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (isEditing! && editedPlanTier != null) {
            model.planTierListType[0].planTierController.text =
                editedPlanTier!.name ?? '';
            model.planTierListType[0].colorControllerPrimary = Color(
              int.parse(
                    editedPlanTier!.primaryColor!.substring(1, 7),
                    radix: 16,
                  ) +
                  0xFF000000,
            );
            model.planTierListType[0].colorControllerSecondary = Color(
              int.parse(
                    editedPlanTier!.secondaryColor!.substring(1, 7),
                    radix: 16,
                  ) +
                  0xFF000000,
            );
            model.planTierListType[0].featureListController =
                editedPlanTier!.features
                    ?.map((feature) => TextEditingController(text: feature))
                    .toList() ??
                [];
            model.notifyListeners();
          }
        });
      },
      disposeViewModel: false,
      builder: (_, HMOViewModel model, _) {
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
              text: !isEditing! ? 'Create Plan Tier' : 'Edit Plan Tier',
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ...model.planTierListType.asMap().entries.map((e) {
                    final planIndex = e.key;
                    final planValue = e.value;
                    planValue.featureListController ??= [
                      TextEditingController(),
                    ];

                    if (planValue.featureListController!.isEmpty) {
                      planValue.featureListController!.add(
                        TextEditingController(),
                      );
                    }
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 200.h,
                        maxHeight: MediaQuery.of(context).size.height * .68,
                      ),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 20.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 22.w,
                                right: 22.w,
                                left: 22.w,
                                bottom: 12.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormWidget(
                                    borderTopLeft: 10.r,
                                    borderTopRight: 10.r,
                                    borderBottomLeft: 10.r,
                                    borderBottomRight: 10.r,
                                    hint: 'Plan Tier',
                                    fillColor: AppColors.grey,
                                    isFilled: true,
                                    controller: planValue.planTierController,
                                    validator: AppValidator.validateString(),
                                  ),
                                  SizedBox(height: 20.h),

                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      TextView(
                                        text: 'Color Type',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Positioned(
                                        right: -14,
                                        child: TextView(
                                          text: '*',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 22.44.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 6.10.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.grey,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 20.h,
                                              width: 20.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    planValue
                                                        .colorControllerPrimary ??
                                                    Color(0XFFFF4B4B),
                                              ),
                                            ),
                                            SizedBox(width: 4.4.w),
                                            Container(
                                              padding: EdgeInsets.all(2.6.w),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.appWhite,
                                              ),
                                              child: Container(
                                                height: 20.h,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      planValue
                                                          .colorControllerSecondary ??
                                                      Color(0XFFFDE8E8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        IconButton(
                                          onPressed: () {
                                            model.showColorPickerDialog(
                                              context: context,
                                              model: model,
                                              planIndex: planIndex,
                                            );
                                            model.notifyListeners();
                                          },
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 22.sp,
                                            color: AppColors.infoGrey,
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
                                        text: 'Tier Features',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Positioned(
                                        right: -14,
                                        child: TextView(
                                          text: '*',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 22.44.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 20.h),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: 100.h,
                                      maxHeight: 240.h,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.only(
                                        top: 12.w,
                                        left: 12.w,
                                        right: 12.w,
                                        bottom: 6.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ...(planValue
                                                        .featureListController ??
                                                    [])
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                                  final index = entry.key;
                                                  final controller =
                                                      entry.value;
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom: 12.w,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        /// TEXT FIELD
                                                        Expanded(
                                                          child: TextFormWidget(
                                                            borderTopLeft: 10.r,
                                                            borderTopRight:
                                                                10.r,
                                                            borderBottomLeft:
                                                                10.r,
                                                            borderBottomRight:
                                                                10.r,
                                                            fillColor:
                                                                AppColors.white,
                                                            isFilled: true,
                                                            controller:
                                                                controller,
                                                          ),
                                                        ),
                                                        SizedBox(width: 10.w),

                                                        /// DELETE
                                                        GestureDetector(
                                                          onTap: () {
                                                            if ((planValue
                                                                        .featureListController
                                                                        ?.length ??
                                                                    0) >
                                                                1) {
                                                              planValue
                                                                  .featureListController![index]
                                                                  .dispose();

                                                              planValue
                                                                  .featureListController!
                                                                  .removeAt(
                                                                    index,
                                                                  );

                                                              model
                                                                  .notifyListeners();
                                                            }
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                                AppImage.delete,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),

                                            /// ADD BUTTON
                                            Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  if (planValue
                                                          .featureListController!
                                                          .length <
                                                      5) {
                                                    planValue
                                                            .featureListController ??=
                                                        [];
                                                    planValue
                                                        .featureListController!
                                                        .add(
                                                          TextEditingController(),
                                                        );
                                                  } else {}
                                                  model.notifyListeners();
                                                },
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: AppColors.primary,
                                                  size: 26.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  model.planTierListType.length > 1
                                      ? Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              model.showUpdateMedicationDialog(
                                                context: context,
                                                planIndex: planIndex,
                                              );
                                              model.notifyListeners();
                                            },
                                            child: TextView(
                                              text: 'Delete',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16.44.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.appRed,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 20),
                  !isEditing!
                      ? DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            dashPattern: [6, 4],
                            strokeWidth: .94,
                            radius: Radius.circular(22),
                            color: AppColors.primary,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (model.planTierListType.length < 10) {
                                model.planTierListType.add(
                                  PlanTierListType(
                                    planTierController: TextEditingController(),
                                  ),
                                );
                              }
                              model.notifyListeners();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 5.10.h,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColors.primary,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    'Add more',
                                    style: TextStyle(
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                      fontFamily: 'GoogleSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 50),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.primary,
                    buttonText: !isEditing! ? 'Create' : 'Update',
                    fontSize: 16.sp,
                    color: AppColors.white,
                    isLoading: model.isLoading,
                    buttonBorderColor: AppColors.transparent,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (!isEditing!) {
                          model.createHmoPlanTiers(
                            context: context,
                            createPlanTier: CreatePlanTierEntityModel(
                              tiers: model.planTierListType.map((e) {
                                return Tier(
                                  name: e.planTierController.text,
                                  primaryColor: e.colorControllerPrimary != null
                                      ? '#${e.colorControllerPrimary!.value.toRadixString(16).toString().substring(2).toUpperCase()}'
                                      : '#FF4B4B',
                                  secondaryColor:
                                      e.colorControllerSecondary != null
                                      ? '#${e.colorControllerSecondary!.value.toRadixString(16).toString().substring(2).toUpperCase()}'
                                      : '#FDE8E8',
                                  features:
                                      e.featureListController
                                          ?.map((controller) => controller.text)
                                          .toList() ??
                                      [],
                                );
                              }).toList(),
                            ),
                          );
                        } else {
                          model.updateHmoPlanTiers(
                            context: context,
                            updatePlanTier: UpdatePlanTiersEntityModel(
                              name: model
                                  .planTierListType[0]
                                  .planTierController
                                  .text,
                              primaryColor:
                                  '#${model.planTierListType[0].colorControllerPrimary!.value.toRadixString(16).toString().substring(2).toUpperCase()}',
                              secondaryColor:
                                  '#${model.planTierListType[0].colorControllerSecondary!.value.toRadixString(16).toString().substring(2).toUpperCase()}',
                              features:
                                  model
                                      .planTierListType[0]
                                      .featureListController
                                      ?.map((controller) => controller.text)
                                      .toList() ??
                                  [],
                            ),
                            planTierId: editedPlanTier!.id,
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
