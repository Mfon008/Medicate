// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/ui/dashboard/hmo/hospital_class.dart';
import 'package:medicate_app/ui/widget/button.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';
import 'custom_checkbox_widget.dart';

class CreateHmoPlan extends StatefulWidget {
  const CreateHmoPlan({super.key});

  @override
  State<CreateHmoPlan> createState() => _CreateHmoPlanState();
}

class _CreateHmoPlanState extends State<CreateHmoPlan> {
  List<TextEditingController> benefitController = [TextEditingController()];
  List<TextEditingController> limitController = [TextEditingController()];
  TextEditingController planTypeController = TextEditingController();
  TextEditingController renewalPriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController planTierController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isTapped = false;

  bool selectAll = false;

  List<Hospital> hospitals = [
    Hospital(
      name: "Abia State University Teaching Hospital",
      location: "Aba, Abia",
    ),
    Hospital(
      name: "Lagos State University Teaching Hospital",
      location: "Ikeja, Lagos",
    ),
    Hospital(name: "University College Hospital", location: "Ibadan, Oyo"),
    Hospital(name: "National Hospital Abuja", location: "Abuja, FCT"),
  ];

  List<String> planType = ['Individual', 'Family', 'Corporate'];
  String? selectedPlanType;
  List<String> planTier = ['Ruby', 'Pearl', 'Diamond'];
  String? selectedPlanTier;

  Widget planTypeList(
    BuildContext ctx,
    void Function(void Function()) setMenuState,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        TextView(
          text: 'Type',
          textStyle: TextStyle(
            fontFamily: 'Arial',
            fontSize: 16.60.sp,
            color: AppColors.greyee,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 14.h),

        ...planType.map(
          (e) => GestureDetector(
            onTap: () {
              setState(() {
                planTypeController.text = e;
                setMenuState(() {});
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, e.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: planTypeController.text == e
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: planTypeController.text == e
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  TextView(
                    text: e,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16.60.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (planTypeController.text == e)
                    Icon(
                      Icons.check,
                      color: AppColors.primary1,
                      size: 15.60.sp,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget planTierList(
    BuildContext ctx,
    void Function(void Function()) setMenuState,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        TextView(
          text: 'Tiers',
          textStyle: TextStyle(
            fontFamily: 'Arial',
            fontSize: 16.60.sp,
            color: AppColors.greyee,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 14.h),

        ...planTier.map(
          (e) => GestureDetector(
            onTap: () {
              setState(() {
                planTierController.text = e;
                setMenuState(() {});
              });

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(ctx, e.toString());
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: planTierController.text == e
                    ? AppColors.skyBlue
                    : AppColors.white,
                border: Border.all(
                  color: planTierController.text == e
                      ? AppColors.primary1
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  TextView(
                    text: e,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16.60.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (planTierController.text == e)
                    Icon(
                      Icons.check,
                      color: AppColors.primary1,
                      size: 15.60.sp,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      for (var h in hospitals) {
        h.isSelected = selectAll;
      }
    });
  }

  void toggleSingle(int index) {
    hospitals[index].isSelected = !hospitals[index].isSelected;
    selectAll = hospitals.every((h) => h.isSelected);
  }

  @override
  void dispose() {
    for (var c in benefitController) {
      c.dispose();
    }
    for (var c in limitController) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
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
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: GlobalNavigator(),
              ),
              TextView(
                text: 'Create New Plans',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deep,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 2.4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.bell,
                    height: isTablet(context) ? 40.h : 20.h,
                    width: isTablet(context) ? 40.w : 20.w,
                    color: AppColors.primary,
                  ),
                  onPressed: () {},
                  splashRadius: 28,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormWidget(
                hint: 'Plan Type',
                label: '--Select--',
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
                controller: planTypeController,
                validator: AppValidator.validateString(),
                onChange: (p0) {},
                suffixWidget: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.white,
                        builder: (ctx) => StatefulBuilder(
                          builder: (ctx, setMenuState) {
                            return Container(
                              margin: EdgeInsets.all(16.w),
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: planTypeList(ctx, setMenuState),
                            );
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(AppImage.arrow_down),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Plan Tier',
                label: '--Select--',
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
                controller: planTierController,
                validator: AppValidator.validateString(),
                suffixWidget: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.white,
                        builder: (ctx) => StatefulBuilder(
                          builder: (ctx, setMenuState) {
                            return Container(
                              margin: EdgeInsets.all(16.w),
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: planTierList(ctx, setMenuState),
                            );
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(AppImage.arrow_down),
                  ),
                ),
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
                controller: descriptionController,
                validator: AppValidator.validateString(),
              ),
              SizedBox(height: 20.h),

              TextFormWidget(
                hint: 'Renewal Price (₦)',
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
                controller: renewalPriceController,
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),

              TextFormWidget(
                hint: 'Price (₦)',
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
                controller: priceController,
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              
              SizedBox(height: 20.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      isTapped = !isTapped;
                      if (isTapped) {
                        renewalPriceController.text = priceController.text;
                      } else {
                        renewalPriceController.clear();
                      }
                    }),
                    child: Container(
                      padding: isTapped
                          ? EdgeInsets.all(4.0.w)
                          : EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: isTapped
                            ? AppColors.primary
                            : AppColors.transparent,
                        border: Border.all(
                          color: isTapped
                              ? AppColors.transparent
                              : AppColors.infoGrey,
                          width: .78,
                        ),
                      ),
                      child: isTapped
                          ? Icon(
                              Icons.check,
                              size: 12.sp,
                              color: AppColors.white,
                            )
                          : SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(width: 10.20.w),
                  TextView(
                    text: 'Use this price as renewal price',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Duration (Months)',
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
                controller: durationController,
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  TextView(
                    text: 'Hospital Network',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 17.80.sp,
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.grey, width: .78),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 20.w,
                        top: 20.w,
                        left: 22.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.r),
                          topRight: Radius.circular(14.r),
                        ),
                        color: AppColors.grey,
                      ),
                      child: Row(
                        children: [
                          CustomCheckbox(
                            isSelected: selectAll,
                            onTap: () {
                              toggleSelectAll(!selectAll); // 👈 fix here
                              setState(() {});
                            },
                          ),
                          SizedBox(width: 16.w),
                          TextView(
                            text: 'Select All Hospitals',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.80.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.w),

                    /// 🔹 List
                    SizedBox(
                      height: 300.h,
                      child: ListView.builder(
                        itemCount: hospitals.length,
                        padding: EdgeInsets.only(
                          // bottom: 20.w,
                          // top: 20.w,
                          left: 22.w,
                        ),
                        itemBuilder: (context, index) {
                          final hospital = hospitals[index];

                          return Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCheckbox(
                                isSelected: hospital.isSelected,
                                onTap: () {
                                  toggleSingle(index);
                                  setState(() {});
                                },
                              ),
                              SizedBox(width: 12.w),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.w),
                                    TextView(
                                      text: hospital.name,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.80.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    TextView(
                                      text: hospital.location,
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.80.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(height: 10.w),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    text: 'Benefits (Optional)',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 16.80.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.reminder,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        benefitController.add(TextEditingController());
                        limitController.add(TextEditingController());
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.primary,
                          size: 22.0.sp,
                          weight: 20,
                        ),
                        SizedBox(width: 3.6.w),
                        TextView(
                          text: 'Add Benefit',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.82.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.w),
              Divider(color: AppColors.grey, thickness: .78),
              SizedBox(height: 10.w),
              ...List.generate(
                benefitController.length,
                (index) => Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.w),
                  margin: EdgeInsets.only(bottom: 20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.grey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormWidget(
                        label: 'Benefit Description',
                        borderColor: AppColors.transparent,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          fontSize: 14.sp,
                          color: AppColors.infoGrey,
                        ),
                        fillColor: AppColors.appWhite,
                        isFilled: true,
                        controller: benefitController[index],
                        validator: AppValidator.validateString(),
                        onChange: (p0) {},
                      ),
                      SizedBox(height: 16.20.w),
                      TextFormWidget(
                        label: 'Coverage Limit',
                        borderColor: AppColors.transparent,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          fontSize: 14.sp,
                          color: AppColors.infoGrey,
                        ),
                        fillColor: AppColors.appWhite,
                        isFilled: true,
                        controller: limitController[index],
                        validator: AppValidator.validateString(),
                        onChange: (p0) {},
                      ),
                      SizedBox(height: 20.w),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (benefitController.length > 1) {
                                benefitController.removeAt(index);
                                limitController.removeAt(index);
                              }
                            });
                          },
                          child: SvgPicture.asset(AppImage.delete),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
