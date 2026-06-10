// ignore_for_file: use_build_context_synchronously, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/connect_end/model/create_hmo_plan_entity_model/benefit.dart';
import 'package:medicate_app/core/connect_end/model/create_hmo_plan_entity_model/create_hmo_plan_entity_model.dart';
import 'package:medicate_app/ui/widget/button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/decouncer_class.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/model/get_list_of_hospital_response_model/hospital.dart'
    as hp;
import '../../../core/connect_end/model/get_my_hmo_plan_response_model/plan.dart';
import '../../../core/connect_end/model/update_hmo_plan_entity_model/update_hmo_plan_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_hmo_plan_entity_model/benefit.dart'
    as ben;
import '../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';
import 'custom_checkbox_widget.dart';

class CreateHmoPlan extends StatefulWidget {
  CreateHmoPlan({super.key, this.isEdited = true, this.plan});

  bool? isEdited;
  Plan? plan;

  @override
  State<CreateHmoPlan> createState() => _CreateHmoPlanState();
}

class _CreateHmoPlanState extends State<CreateHmoPlan> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isTapped = false;

  bool selectAll = false;

  String? selectedPlanTypeId;
  String? selectedPlanTierId;
  Set<String> selectedHospitalIds = {};
  List<Benefit> benefitList = [];
  List<ben.Benefit> benefitListUpdate = [];
  final debouncer = Debouncer(milliseconds: 200);

  Widget planTypeList(
    BuildContext ctx,
    void Function(void Function()) setMenuState,
    HMOViewModel model,
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
        if (model.getAllListedPlanTypesResponseModel == null)
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.w, top: 50.w),
              child: SpinKitHourGlass(
                size: 50.sp,
                color: AppColors.primaryLight,
              ),
            ),
          ),
        if (model.getAllListedPlanTypesResponseModel != null &&
            model
                .getAllListedPlanTypesResponseModel!
                .data!
                .planTypes!
                .isNotEmpty)
          ...model.getAllListedPlanTypesResponseModel!.data!.planTypes!.map(
            (e) => GestureDetector(
              onTap: () {
                model.planTypeController.text = e.name ?? '';
                selectedPlanTypeId = e.id;
                setMenuState(() {});
                model.notifyListeners();
                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pop(ctx, e.toString());
                });
                // model.selectPlanType(context: context, id: selectedPlanTypeId);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: model.planTypeController.text == e.name
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.planTypeController.text == e.name
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e.name ?? '',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.planTypeController.text == e.name)
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
    HMOViewModel model,
  ) {
    final response = model.getAllListedPlanTiersResponseModel;

    Widget content;

    switch (true) {
      // LOADING
      case true when response == null:
        content = Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 100.w, top: 50.w),
            child: SpinKitHourGlass(size: 50.sp, color: AppColors.primaryLight),
          ),
        );
        break;

      // NO DATA
      case true when response!.data == null:
        content = Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.w),
            child: TextView(
              text: 'No available tiers',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 16.60.sp,
                color: AppColors.greyee,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
        break;

      // EMPTY LIST
      case true
          when response!.data!.planTiers == null ||
              response.data!.planTiers!.isEmpty:
        content = Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: TextView(
              text: 'No tiers found',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 16.60.sp,
                color: AppColors.greyee,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
        break;

      // DATA AVAILABLE
      default:
        content = Column(
          children: response!.data!.planTiers!.map((e) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  model.planTierController.text = e.name ?? '';
                  selectedPlanTierId = e.id;
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
                  color: model.planTierController.text == e.name
                      ? AppColors.skyBlue
                      : AppColors.white,
                  border: Border.all(
                    color: model.planTierController.text == e.name
                        ? AppColors.primary1
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    TextView(
                      text: e.name ?? "",
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    if (model.planTierController.text == e.name)
                      Icon(
                        Icons.check,
                        color: AppColors.primary1,
                        size: 15.60.sp,
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
    }

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

        content,
      ],
    );
  }

  void toggleSelectAll(List hospitals, HMOViewModel model) {
    setState(() {
      if (selectedHospitalIds.length == hospitals.length) {
        // unselect all
        selectedHospitalIds.clear();
        selectAll = false;
      } else {
        // select all
        selectedHospitalIds = hospitals.map((h) => h.id as String).toSet();
        selectAll = true;
      }
    });
  }

  void toggleSingle(
    String id,
    List<hp.Hospital> hospitals,
    HMOViewModel model,
  ) {
    setState(() {
      if (selectedHospitalIds.contains(id)) {
        selectedHospitalIds.remove(id);
      } else {
        selectedHospitalIds.add(id);
      }
      // update selectAll state
      selectAll = selectedHospitalIds.length == hospitals.length;
    });
  }

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  // @override
  // void dispose() {
  //   for (var c in benefitController) {
  //     c.dispose();
  //   }
  //   for (var c in limitController) {
  //     c.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) async {
        await model.getListedPlanTypesForHMO(context);
        await model.getListedPlanTiersForHMO(context);
        model.getListOfHospital(context);
        if (!widget.isEdited!) {
          await model.getPlanDetail(context: context, planId: widget.plan?.id);
          model.planTypeController.text =
              model.getPlanDetailResponseModel?.data?.plan?.planType ?? '';
          model.planTierController.text =
              model.getPlanDetailResponseModel?.data?.plan?.planTier ?? '';
          model.descriptionController.text =
              model.getPlanDetailResponseModel?.data?.plan?.description ?? '';
          model.renewalPriceController.text =
              model.getPlanDetailResponseModel?.data?.plan?.renewalPrice
                  ?.toString() ??
              '';
          model.priceController.text =
              model.getPlanDetailResponseModel?.data?.plan?.price?.toString() ??
              '';
          model.maxDependentsController.text =
              model.getPlanDetailResponseModel?.data?.plan?.maximumDependents
                  ?.toString() ??
              '';
          model.durationController.text =
              model.getPlanDetailResponseModel?.data?.plan?.duration
                  ?.toString() ??
              '';
          selectedHospitalIds.addAll(
            model.getPlanDetailResponseModel!.data!.plan!.hospitalNetworkIds!,
          );
          model.benefitController = model
              .getPlanDetailResponseModel!
              .data!
              .plan!
              .benefits!
              .map((b) => TextEditingController(text: b.description ?? ''))
              .toList();
          model.limitController = model
              .getPlanDetailResponseModel!
              .data!
              .plan!
              .benefits!
              .map((b) => TextEditingController(text: b.coverageLimit ?? ''))
              .toList();
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
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withOpacity(.1),
                      border: Border.all(
                        color: AppColors.inactive.withOpacity(.4),
                      ),
                    ),
                    child: GlobalNavigator(),
                  ),
                  TextView(
                    text: widget.isEdited!
                        ? 'Create New Plans'
                        : !model.isViewHmoPlans
                        ? "View Plan"
                        : "Edit Plan",
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
                      border: Border.all(
                        color: AppColors.inactive.withOpacity(.4),
                      ),
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
              child: Form(
                key: formKey,
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
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 16.sp,
                        color: model.isViewHmoPlans
                            ? AppColors.bblack
                            : AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      readOnly: true,
                      controller: model.planTypeController,
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                      suffixWidget: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: GestureDetector(
                          onTap: model.isViewHmoPlans
                              ? () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: AppColors.white,
                                    builder: (ctx) => StatefulBuilder(
                                      builder: (ctx, setMenuState) {
                                        return Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.all(16.w),
                                          padding: EdgeInsets.all(10.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: planTypeList(
                                            ctx,
                                            setMenuState,
                                            model,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              : () {},
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
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 16.sp,
                        color: model.isViewHmoPlans
                            ? AppColors.bblack
                            : AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      readOnly: true,
                      controller: model.planTierController,
                      validator: AppValidator.validateString(),
                      suffixWidget: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: GestureDetector(
                          onTap: model.isViewHmoPlans
                              ? () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: AppColors.white,
                                    builder: (ctx) => StatefulBuilder(
                                      builder: (ctx, setMenuState) {
                                        return Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.all(16.w),
                                          padding: EdgeInsets.all(10.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: planTierList(
                                            ctx,
                                            setMenuState,
                                            model,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              : () {},
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
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 16.sp,
                        color: model.isViewHmoPlans
                            ? AppColors.bblack
                            : AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      readOnly: model.isViewHmoPlans ? false : true,
                      controller: model.descriptionController,
                      validator: AppValidator.validateString(),
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
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 16.sp,
                        color: model.isViewHmoPlans
                            ? AppColors.bblack
                            : AppColors.infoGrey,
                      ),
                      readOnly: model.isViewHmoPlans ? false : true,
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: model.priceController,
                      validator: AppValidator.validateString(),
                      keyboardType: TextInputType.number,
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: model.isViewHmoPlans
                              ? () => setState(() {
                                  isTapped = !isTapped;
                                  if (isTapped) {
                                    model.renewalPriceController.text =
                                        model.priceController.text;
                                  } else {
                                    model.renewalPriceController.clear();
                                  }
                                })
                              : () {},
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
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 16.sp,
                        color: model.isViewHmoPlans
                            ? AppColors.bblack
                            : AppColors.infoGrey,
                      ),
                      readOnly: model.isViewHmoPlans ? false : true,
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: model.renewalPriceController,
                      keyboardType: TextInputType.number,
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                    ),

                    SizedBox(
                      height:
                          model.planTypeController.text.toLowerCase() ==
                              'family'
                          ? 20.h
                          : 0.h,
                    ),
                    model.planTypeController.text.toLowerCase() == 'family'
                        ? TextFormWidget(
                            hint: 'Maximum Dependents',
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
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 16.sp,
                              color: model.isViewHmoPlans
                                  ? AppColors.bblack
                                  : AppColors.infoGrey,
                            ),
                            readOnly: model.isViewHmoPlans ? false : true,
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: model.maxDependentsController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {},
                            keyboardType: TextInputType.number,
                          )
                        : SizedBox(),

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
                      controller: model.durationController,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 16.sp,
                        color: model.isViewHmoPlans
                            ? AppColors.bblack
                            : AppColors.infoGrey,
                      ),
                      readOnly: model.isViewHmoPlans ? false : true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter duration in months';
                        }

                        final number = int.tryParse(value);
                        if (number == null) {
                          return 'Invalid number';
                        }

                        if (number < 1 || number > 12) {
                          return 'Enter between 1 and 12 months';
                        }

                        return null;
                      },

                      onChange: (value) {
                        setState(() {});
                      },
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
                                model.getAllOfHospitalsResponseModel != null &&
                                        model
                                                .getAllOfHospitalsResponseModel!
                                                .data !=
                                            null &&
                                        model
                                            .getAllOfHospitalsResponseModel!
                                            .data!
                                            .hospitals!
                                            .isNotEmpty
                                    ? CustomCheckbox(
                                        isSelected: selectAll,
                                        isViewModel: model.isViewHmoPlans,
                                        onTap: model.isViewHmoPlans
                                            ? () {
                                                toggleSelectAll(
                                                  model
                                                      .getAllOfHospitalsResponseModel!
                                                      .data!
                                                      .hospitals!,
                                                  model,
                                                ); // 👈 fix here
                                                setState(() {});
                                              }
                                            : () {},
                                      )
                                    : SizedBox.shrink(),
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
                          SizedBox(height: 15.10.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            decoration: BoxDecoration(),
                            width: double.infinity,
                            child: TextFormWidget(
                              label: 'Search Hospital',
                              labelStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.60.sp,
                                color: AppColors.fineGrey,
                                fontWeight: FontWeight.w400,
                              ),
                              isFilled: true,
                              borderTopLeft: 10.r,
                              borderTopRight: 10.r,
                              borderBottomLeft: 10.r,
                              borderBottomRight: 10.r,
                              fillColor: AppColors.grey,
                              prefixWidget: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 12.6.w,
                                ),
                                child: SvgPicture.asset(
                                  AppImage.search,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                              onChange: (value) {
                                debouncer.run(() {
                                  model.getListOfHospital(
                                    context,
                                    query: value,
                                  );
                                });
                                // model.searchHospitalName = value;
                                // print(model.searchHospitalName);
                                setState(() {});
                                model.notifyListeners();
                              },
                            ),
                          ),
                          SizedBox(height: 10.20.w),

                          /// 🔹 List
                          if (model.getAllOfHospitalsResponseModel == null ||
                              model.getAllOfHospitalsResponseModel!.data ==
                                  null ||
                              model
                                  .getAllOfHospitalsResponseModel!
                                  .data!
                                  .hospitals!
                                  .isEmpty)
                            SizedBox.shrink(),
                          if (model.getAllOfHospitalsResponseModel != null &&
                              model.getAllOfHospitalsResponseModel!.data !=
                                  null &&
                              model
                                  .getAllOfHospitalsResponseModel!
                                  .data!
                                  .hospitals!
                                  .isNotEmpty)
                            SizedBox(
                              height:
                                  model
                                          .getAllOfHospitalsResponseModel!
                                          .data!
                                          .hospitals!
                                          .length >
                                      3
                                  ? 300.h
                                  : 150.h,
                              child: SmartRefresher(
                                enablePullDown: false,
                                enablePullUp: true,
                                controller: refreshController,
                                header: WaterDropHeader(),
                                onRefresh: () async {
                                  await Future.delayed(
                                    Duration(milliseconds: 1000),
                                  );
                                  // if failed,use refreshFailed()
                                  refreshController.refreshCompleted();
                                },
                                onLoading: () async {
                                  await Future.delayed(
                                    Duration(milliseconds: 1000),
                                  );
                                  if (model.page >=
                                      model
                                          .getAllOfHospitalsResponseModel!
                                          .data!
                                          .meta!
                                          .totalPages!) {
                                    refreshController.loadNoData();
                                  } else {
                                    model.page++;
                                    model.getListOfHospital(context);
                                    refreshController.loadComplete();
                                  }
                                },
                                child: ListView.builder(
                                  itemCount: model
                                      .getAllOfHospitalsResponseModel!
                                      .data!
                                      .hospitals!
                                      .length,
                                  padding: EdgeInsets.only(left: 22.w),
                                  itemBuilder: (context, index) {
                                    final hospital = model
                                        .getAllOfHospitalsResponseModel!
                                        .data!
                                        .hospitals![index];
                                    final h = model
                                        .getAllOfHospitalsResponseModel!
                                        .data!
                                        .hospitals!;

                                    return Row(
                                      children: [
                                        CustomCheckbox(
                                          isViewModel: model.isViewHmoPlans,
                                          isSelected: selectedHospitalIds
                                              .contains(hospital.id),
                                          onTap: model.isViewHmoPlans
                                              ? () {
                                                  toggleSingle(
                                                    hospital.id!,
                                                    h,
                                                    model,
                                                  );
                                                }
                                              : () {},
                                        ),
                                        SizedBox(width: 12.w),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10.w),
                                              TextView(
                                                text: hospital.name ?? '',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.80.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                              SizedBox(height: 4.h),
                                              TextView(
                                                text: hospital.address ?? '',
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
                              model.benefitController.add(
                                TextEditingController(),
                              );
                              model.limitController.add(
                                TextEditingController(),
                              );
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
                      model.benefitController.length,
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
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontSize: 16.sp,
                                color: model.isViewHmoPlans
                                    ? AppColors.bblack
                                    : AppColors.infoGrey,
                              ),
                              readOnly: model.isViewHmoPlans ? false : true,
                              fillColor: AppColors.appWhite,
                              isFilled: true,
                              controller: model.benefitController[index],
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
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontSize: 16.sp,
                                color: model.isViewHmoPlans
                                    ? AppColors.bblack
                                    : AppColors.infoGrey,
                              ),
                              readOnly: model.isViewHmoPlans ? false : true,
                              fillColor: AppColors.appWhite,
                              isFilled: true,
                              controller: model.limitController[index],
                              validator: AppValidator.validateString(),
                              onChange: (p0) {},
                            ),
                            SizedBox(height: 20.w),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                      model.benefitController.removeAt(index);
                                      model.limitController.removeAt(index);
                                  
                                  });
                                },
                                child: SvgPicture.asset(AppImage.delete),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 48.h),
                    model.getPlanDetailResponseModel != null &&
                            model.getPlanDetailResponseModel!.data != null &&
                            model
                                    .getPlanDetailResponseModel!
                                    .data!
                                    .plan!
                                    .approvalStatus!
                                    .toLowerCase() !=
                                'Approved'.toLowerCase()
                        ? ButtonWidget(
                            border: 100.r,
                            buttonColor: AppColors.primary,
                            buttonText: widget.isEdited! || model.isViewHmoPlans
                                ? 'Submit for Review'
                                : 'Edit Plan',
                            color: AppColors.white,
                            buttonBorderColor: AppColors.transparent,
                            isLoading: model.isLoading,
                            onPressed: widget.isEdited!
                                ? () {
                                    if (formKey.currentState!.validate()) {
                                      benefitList.clear();
                                      for (
                                        int i = 0;
                                        i < model.benefitController.length;
                                        i++
                                      ) {
                                        benefitList.add(
                                          Benefit(
                                            description:
                                                model.benefitController[i].text,
                                            coverageLimit:
                                                model.limitController[i].text,
                                          ),
                                        );
                                      }
                                      model.createHmoPlan(
                                        context: context,
                                        createPlan: CreateHmoPlanEntityModel(
                                          planName:
                                              '${model.planTierController.text} ${model.planTypeController.text} Plan',
                                          planType: selectedPlanTypeId,
                                          planTier: selectedPlanTierId,
                                          description:
                                              model.descriptionController.text,
                                          price: int.parse(
                                            model.priceController.text,
                                          ),
                                          maximumDependents:
                                              model.planTypeController.text
                                                      .toLowerCase() ==
                                                  'family'
                                              ? int.parse(
                                                  model
                                                      .maxDependentsController
                                                      .text,
                                                )
                                              : null,
                                          renewalPrice: int.parse(
                                            model.renewalPriceController.text,
                                          ),
                                          duration: int.parse(
                                            model.durationController.text,
                                          ),
                                          hospitalNetworkIds:
                                              selectedHospitalIds.toList(),
                                          benefits: benefitList,
                                        ),
                                      );
                                    }
                                  }
                                : () async {
                                    if (model.isViewHmoPlans) {
                                      if (formKey.currentState!.validate()) {
                                        benefitListUpdate.clear();
                                        for (
                                          int i = 0;
                                          i < model.benefitController.length;
                                          i++
                                        ) {
                                          benefitListUpdate.add(
                                            ben.Benefit(
                                              description: model
                                                  .benefitController[i]
                                                  .text,
                                              coverageLimit:
                                                  model.limitController[i].text,
                                            ),
                                          );
                                        }
                                        await model.updateHmoPlan(
                                          context: context,
                                          planId: widget.plan!.id,
                                          updatePlan: UpdateHmoPlanEntityModel(
                                            planName:
                                                '${model.planTierController.text} ${model.planTypeController.text} Plan',
                                            description: model
                                                .descriptionController
                                                .text,
                                            price: int.parse(
                                              model.priceController.text,
                                            ),
                                            duration: int.parse(
                                              model.durationController.text,
                                            ),

                                          hospitalNetworkIds:
                                              selectedHospitalIds.toList(),
                                            benefits: benefitListUpdate.isEmpty? null:benefitListUpdate,
                                          ),
                                        );
                                      }
                                    } else {
                                      model.isViewHmoPlans = true;
                                    }

                                    model.notifyListeners();
                                  },
                          )
                        : SizedBox.shrink(),
                    SizedBox(height: 22.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
