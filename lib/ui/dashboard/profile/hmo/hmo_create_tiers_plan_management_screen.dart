// ignore_for_file: must_be_immutable, use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class HmoCreateTiersPlanManagementScreen extends StatelessWidget {
  const HmoCreateTiersPlanManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {});
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
              text: 'Create Plan Tier',
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
                        // model.getRoles(context);
                      },
                      child: SizedBox(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(vertical: 20.w),
                          child: Padding(
                            padding: EdgeInsets.all(22.0),
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
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hint: 'Duration (Months)',
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                ),
                                SizedBox(height: 20.h),
                                TextFormWidget(
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  hint: 'Color Type',
                                  fillColor: AppColors.grey,
                                  isFilled: true,
                                ),
                                SizedBox(height: 20.h),
                                TextView(
                                  text: 'Tier Features',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 17.88.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
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
                                          ...model.featureListController.asMap().entries.map((
                                            entry,
                                          ) {
                                            final index = entry.key;
                                            final controller = entry.value;

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
                                                      borderTopRight: 10.r,
                                                      borderBottomLeft: 10.r,
                                                      borderBottomRight: 10.r,
                                                      fillColor:
                                                          AppColors.white,
                                                      isFilled: true,
                                                      controller: controller,
                                                    ),
                                                  ),

                                                  SizedBox(width: 10.w),

                                                  /// DELETE
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (model
                                                              .featureListController
                                                              .length >
                                                          1) {
                                                        /// dispose controller before removing
                                                        model
                                                            .featureListController[index]
                                                            .dispose();

                                                        /// remove item
                                                        model
                                                            .featureListController
                                                            .removeAt(index);

                                                        model.notifyListeners();
                                                      }
                                                    },
                                                    child: SvgPicture.asset(
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
                                                model.featureListController.add(
                                                  TextEditingController(),
                                                );

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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.primary,
                  buttonText: 'Create',
                  fontSize: 16.sp,
                  color: AppColors.white,
                  isLoading: model.isLoading,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HmoTeirEntity {
  String? name;
  Color? tierColor;
  Color? tierBackgroundColor;

  HmoTeirEntity({this.name, this.tierColor, this.tierBackgroundColor});
}
