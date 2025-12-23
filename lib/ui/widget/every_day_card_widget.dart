import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/widget/medicate_enum.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';

import '../../core/app_assets/image.dart';
import '../../core/connect_end/view_model/health_care_view_model.dart';
import 'button.dart';

// ignore: must_be_immutable
class EverydayUserCard extends StatefulWidget {
  EverydayUserCard({
    super.key,
    required this.imge,
    required this.text,
    required this.text2,
    required this.userType,
    required this.selectedUserType,
    required this.onTap,
  });

  String? imge;
  String? text;
  String? text2;
  final UserType userType;
  final UserType? selectedUserType;
  final ValueChanged<UserType> onTap;

  @override
  State<EverydayUserCard> createState() => _EverydayUserCardState();
}

class _EverydayUserCardState extends State<EverydayUserCard> {
  // bool isTapped = false;

  // String areaExpertiseText = '';

  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedUserType == widget.userType;
    return GestureDetector(
      onTap: () => widget.onTap(widget.userType),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                    child: Center(
                      child: Image.asset(
                        widget.imge ?? "", // Replace with your image path
                        height: 140.h,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ),
                ),

                // Right text
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 2.20.w,
                      bottom: 2.20.w,
                      right: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextView(
                          text: widget.text ?? '',
                          letterSpacing: 0,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0,
                            fontFamily: 'GoogleSans',
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 3.4),
                        TextView(
                          text: widget.text2 ?? '',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 12.82.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:
                  isSelected && widget.selectedUserType == UserType.healthCare
                  ? 20.h
                  : 0.h,
            ),
            isSelected && widget.selectedUserType == UserType.healthCare
                ? Column(
                    children: [
                      tapOnHealthCareProviderType(
                        text: 'Hospital & Clinic',
                        onTap: () => navigate.navigateTo(
                          Routes.healthCareHospitalAndClinicSignUpScreen,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      tapOnHealthCareProviderType(
                        text: 'Doctors/Specialist',
                        onTap: () =>
                            modalBottomSheetExpertiseArea(context: context),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  GestureDetector tapOnHealthCareProviderType({String? text, onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 14.w, right: 14.w),
          padding: EdgeInsets.symmetric(vertical: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppColors.infoGrey1),
          ),
          child: Center(
            child: TextView(
              text: text!,
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                fontSize: 14.2.sp,
                color: AppColors.reminder,
              ),
            ),
          ),
        ),
      );

  void modalBottomSheetExpertiseArea({context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (builder) {
        return ViewModelBuilder<HealthCareViewModel>.reactive(
          viewModelBuilder: () => HealthCareViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, HealthCareViewModel model, _) {
            return StatefulBuilder(
              builder: (context, modalSetState) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.54,
                    // 80% of screen height
                    minChildSize: 0.45,
                    // Can be dragged to 30% of screen height
                    maxChildSize: 0.59,
                    builder: (context, scrollController) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context)
                              .viewInsets
                              .bottom, // 👈 pushes content above keyboard
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
                                horizontal: 10.w,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 30.w),
                                      TextView(
                                        text: 'Select area of expertise',
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
                                  ...model.areaExpertise.map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        if (!model.addAreaExpertise.contains(
                                          e,
                                        )) {
                                          modalSetState(
                                            () => model.addAreaExpertise.add(e),
                                          );
                                        } else {
                                          modalSetState(
                                            () => model.addAreaExpertise.remove(
                                              e,
                                            ),
                                          );
                                        }
                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                          left: 10.w,
                                          right: 10.w,
                                          bottom: 12.w,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16.w,
                                          horizontal: 16.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12.0,
                                          ),
                                          border: Border.all(
                                            color: AppColors.infoGrey1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding:
                                                  model.addAreaExpertise
                                                      .contains(e)
                                                  ? EdgeInsets.all(4.0.w)
                                                  : EdgeInsets.all(10.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.r),
                                                color:
                                                    model.addAreaExpertise
                                                        .contains(e)
                                                    ? AppColors.primary
                                                    : AppColors.transparent,
                                                border: Border.all(
                                                  color:
                                                      model.addAreaExpertise
                                                          .contains(e)
                                                      ? AppColors.transparent
                                                      : AppColors.infoGrey,
                                                  width: .78,
                                                ),
                                              ),
                                              child:
                                                  model.addAreaExpertise
                                                      .contains(e)
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 12.sp,
                                                      color: AppColors.white,
                                                    )
                                                  : SizedBox.shrink(),
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: e,
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Arial',
                                                fontSize: 15.2.sp,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 50.h),
                                  ButtonWidget(
                                    border: 100.r,
                                    buttonColor: AppColors.primary,
                                    buttonText: 'Continue',
                                    fontSize: 16.sp,
                                    color: AppColors.white,
                                    buttonBorderColor: AppColors.transparent,
                                    onPressed: () => navigate.navigateTo(
                                      Routes
                                          .healthCareDoctorSpecialistSignUpScreen,
                                      arguments:
                                          HealthCareDoctorSpecialistSignUpScreenArguments(
                                            healthCareType: 'Specialist',
                                            healthCareArea:
                                                model.addAreaExpertise,
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
