// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../core/app_assets/state_lga_format.dart';
import '../../../core/connect_end/model/quote_instant_delivery_entity_model.dart';
import '../../../core/connect_end/model/quote_schedule_delivery_eneity_model.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

// ignore: must_be_immutable
class PharmacyWholeSaleCheckout extends StatelessWidget {
  PharmacyWholeSaleCheckout({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      onDispose: (viewModel) {},
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
              text: 'Wholesale Checkout',
              textStyle: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 17.2.w, vertical: 24.w),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppImage.delivery),
                          SizedBox(width: 12.w),
                          TextView(
                            text: 'Delivery method',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15.42.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          model.delivery = Delivery.instance;
                          model.dateTimeController.clear();
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 24.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.delivery == Delivery.instance
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<Delivery>(
                                    value: Delivery.instance,
                                    groupValue: model.delivery,
                                    activeColor: AppColors.primary,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.delivery = value!;
                                      model.notifyListeners();
                                    },
                                  ),
                                  SizedBox(width: 6.12.w),
                                  SvgPicture.asset(
                                    AppImage.delivery,
                                    color: AppColors.reminder,
                                  ),
                                  SizedBox(width: 6.12.w),
                                  TextView(
                                    text: 'Instant delivery',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 13.62.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              TextView(
                                text: 'Same-day express dispatch. ',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 13.42.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          model.delivery = Delivery.schedule;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 24.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.delivery == Delivery.schedule
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<Delivery>(
                                    value: Delivery.schedule,
                                    groupValue: model.delivery,
                                    activeColor: AppColors.primary,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.delivery = value!;
                                      model.notifyListeners();
                                    },
                                  ),
                                  SizedBox(width: 6.12.w),
                                  SvgPicture.asset(
                                    AppImage.time,
                                    color: AppColors.reminder,
                                  ),
                                  SizedBox(width: 6.12.w),
                                  TextView(
                                    text: 'Scheduled block',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 13.62.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              TextView(
                                text:
                                    'Pick a reliable date and time window over the next week to fit your schedule.',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 13.42.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      model.delivery == Delivery.schedule
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(color: AppColors.infoGrey1),
                                SizedBox(height: 12.h),
                                TextFormWidget(
                                  hint: 'Select Delivery Date',
                                  label: 'Pick a date',
                                  hintWeight: FontWeight.w400,
                                  hintColor: AppColors.reminder,
                                  hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                                  borderColor: AppColors.infoGrey1,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  readOnly: true,
                                  fillColor: AppColors.white,
                                  isFilled: true,
                                  controller: model.dateTimeController,
                                  suffixWidget: Padding(
                                    padding: EdgeInsets.all(8.w),
                                    child: GestureDetector(
                                      onTap: () => model.selectDateCheckout(
                                        context: context,
                                        model: model,
                                      ),
                                      child: SvgPicture.asset(
                                        AppImage.calendar,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  validator: AppValidator.validateString(),
                                  style: TextStyle(
                                    fontSize: 16.20.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'DMSans',
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.20.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'DMSans',
                                    color: AppColors.faintedGrey,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            )
                          : SizedBox.shrink(),
                      model.dateTimeController.text != ''
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Select Time Window',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    TextView(
                                      text: '*',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.54.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),

                                GestureDetector(
                                  onTap: () {
                                    model.cartTimeAdded = CartAddedTime.morning;
                                    model.notifyListeners();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 12.4.w,
                                    ),
                                    margin: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            model.cartTimeAdded ==
                                                CartAddedTime.morning
                                            ? AppColors.primary
                                            : AppColors.infoGrey1,
                                        width: 1.22,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: 'Morning (8AM - 12PM)',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.82.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              model.cartTimeAdded ==
                                                  CartAddedTime.morning
                                              ? AppColors.primary
                                              : AppColors.infoGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.cartTimeAdded =
                                        CartAddedTime.afternoon;
                                    model.notifyListeners();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 12.4.w,
                                    ),
                                    margin: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            model.cartTimeAdded ==
                                                CartAddedTime.afternoon
                                            ? AppColors.primary
                                            : AppColors.infoGrey1,
                                        width: 1.22,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: 'Afternoon (12PM - 4PM)',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.82.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              model.cartTimeAdded ==
                                                  CartAddedTime.afternoon
                                              ? AppColors.primary
                                              : AppColors.infoGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.cartTimeAdded = CartAddedTime.evening;
                                    model.notifyListeners();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 12.4.w,
                                    ),
                                    margin: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            model.cartTimeAdded ==
                                                CartAddedTime.evening
                                            ? AppColors.primary
                                            : AppColors.infoGrey1,
                                        width: 1.22,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: 'Evening (4PM - 8PM)',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.82.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              model.cartTimeAdded ==
                                                  CartAddedTime.evening
                                              ? AppColors.primary
                                              : AppColors.infoGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.w,
                                    horizontal: 16.w,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.cooool,
                                    borderRadius: BorderRadius.circular(8.0.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            AppImage.calendar,
                                            fit: BoxFit.cover,
                                            color: AppColors.primary,
                                          ),
                                          SizedBox(width: 12.w),
                                          TextView(
                                            text: 'Select Window',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 14.w),
                                      TextView(
                                        text:
                                            '${model.dateTimeController.text} . ${model.returnCartAddedTime(model.cartTimeAdded)}',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                          letterSpacing: -0.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImage.locator),
                            SizedBox(width: 12.w),
                            TextView(
                              text: 'Delivery details',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 15.42.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'State',
                          label: 'Select State',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          readOnly: true,
                          fillColor: AppColors.white,
                          isFilled: true,
                          controller: model.stateController,
                          suffixWidget: Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () async {
                                  final RenderBox button =
                                      context.findRenderObject() as RenderBox;

                                  final RenderBox overlay =
                                      Overlay.of(
                                            context,
                                          ).context.findRenderObject()
                                          as RenderBox;

                                  final Offset buttonPosition = button
                                      .localToGlobal(
                                        Offset.zero,
                                        ancestor: overlay,
                                      );

                                  final Size buttonSize = button.size;

                                  final selectedState = await showMenu<String>(
                                    context: context,

                                    position: RelativeRect.fromLTRB(
                                      buttonPosition.dx,
                                      buttonPosition.dy +
                                          buttonSize.height +
                                          5.h,
                                      overlay.size.width -
                                          buttonPosition.dx -
                                          buttonSize.width,
                                      0,
                                    ),

                                    constraints: BoxConstraints(
                                      minWidth: 200.w,
                                      maxWidth: 250.w,
                                      minHeight: 150.h,
                                      maxHeight: 450.h,
                                    ),

                                    color: AppColors.white,

                                    elevation: 4,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),

                                    items: stateLgaFormat
                                        .map<PopupMenuEntry<String>>((s) {
                                          final String state =
                                              s['state']?.toString() ?? '';

                                          return PopupMenuItem<String>(
                                            value: state,
                                            height: 38.h,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 14.w,
                                            ),
                                            child: TextView(
                                              text: state,
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 13.70.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          );
                                        })
                                        .toList(),
                                  );

                                  if (selectedState != null) {
                                    model.stateController.text = selectedState;

                                    // Reset LGA whenever state changes
                                    model.lgaController.clear();

                                    model.notifyListeners();
                                  }
                                },

                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.grey1,
                                  ),
                                ),
                              );
                            },
                          ),

                          validator: AppValidator.validateString(),

                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),

                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'LGA',
                          label: '--',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.white,
                          isFilled: true,
                          readOnly: true,
                          controller: model.lgaController,
                          suffixWidget: Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () async {
                                  final RenderBox button =
                                      context.findRenderObject() as RenderBox;

                                  final RenderBox overlay =
                                      Overlay.of(
                                            context,
                                          ).context.findRenderObject()
                                          as RenderBox;

                                  final Offset buttonPosition = button
                                      .localToGlobal(
                                        Offset.zero,
                                        ancestor: overlay,
                                      );

                                  final Size buttonSize = button.size;

                                  final selectedState = stateLgaFormat
                                      .firstWhere(
                                        (state) =>
                                            state['state']
                                                .toString()
                                                .trim()
                                                .toLowerCase() ==
                                            model.stateController.text
                                                .trim()
                                                .toLowerCase(),
                                        orElse: () => <String, dynamic>{
                                          'state': '',
                                          'lgas': <String>[],
                                        },
                                      );

                                  final List<dynamic> lgas =
                                      selectedState['lgas'] ?? [];

                                  if (lgas.isEmpty) {
                                    return;
                                  }

                                  final selectedLga = await showMenu<String>(
                                    context: context,

                                    position: RelativeRect.fromLTRB(
                                      buttonPosition.dx,
                                      buttonPosition.dy +
                                          buttonSize.height +
                                          5.h,
                                      overlay.size.width -
                                          buttonPosition.dx -
                                          buttonSize.width,
                                      0,
                                    ),

                                    constraints: BoxConstraints(
                                      minWidth: 200.w,
                                      maxWidth: 250.w,
                                      minHeight: 110.h,
                                      maxHeight: 420.h,
                                    ),

                                    color: AppColors.white,

                                    elevation: 4,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),

                                    items: lgas.map<PopupMenuEntry<String>>((
                                      lga,
                                    ) {
                                      return PopupMenuItem<String>(
                                        value: lga.toString(),
                                        height: 38.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14.w,
                                        ),
                                        child: TextView(
                                          text: lga.toString(),
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 13.70.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );

                                  if (selectedLga != null) {
                                    model.lgaController.text = selectedLga;
                                    if (model.delivery == Delivery.instance) {
                                      model.quoteInstantDelivery(
                                        context: context,
                                        instantDelivery:
                                            QuoteInstantDeliveryEntityModel(
                                              deliveryMethod: 'INSTANT',
                                              stateCode:
                                                  model.stateController.text,
                                              lgaCode: model.lgaController.text,
                                            ),
                                      );
                                    } else {
                                      model.quoteScheduleDelivery(
                                        context: context,
                                        scheduleDelivery:
                                            QuoteScheduleDeliveryEneityModel(
                                              deliveryMethod: 'SCHEDULED_BLOCK',
                                              stateCode:
                                                  model.stateController.text,
                                              lgaCode: model.lgaController.text,
                                              deliveryDate: convertDate(
                                                model.dateTimeController.text,
                                              ),
                                              timeBlockStart: model
                                                  .getTimeBlockStart(),
                                              timeBlockEnd: model
                                                  .getTimeBlockEnd(),
                                            ),
                                      );
                                    }
                                    model.notifyListeners();
                                  }
                                },

                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.grey1,
                                  ),
                                ),
                              );
                            },
                          ),
                          validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),

                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'Delivery address',
                          label: 'Facility address, city, state',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.white,
                          isFilled: true,
                          controller: model.deliveryAddressController,
                          maxline: 4,
                          validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),
                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'Contact phone',
                          label: '+234',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.white,
                          isFilled: true,
                          controller: model.phoneController,
                          prefixWidget: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: SvgPicture.asset(
                              AppImage.phone,
                              color: AppColors.infoGrey,
                            ),
                          ),
                          validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),
                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'Order notes (Optional)',
                          isShowHint: true,
                          label: 'E.g. Call central storage clerk upon arrival',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.white,
                          isFilled: true,
                          controller: model.orderNotesController,
                          maxline: 4,
                          // validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),
                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                model.isLoading
                    ? SpinKitCircle(size: 48.sp, color: AppColors.primary1)
                    : model.quoteInstantDeliveryResponseModel != null ||
                          model.quoteScheduleDeliveryResponseModel != null
                    ? Container(
                        margin: EdgeInsets.only(bottom: 20.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppImage.order_summary),
                                SizedBox(width: 12.w),
                                TextView(
                                  text: 'Order Summary',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 15.42.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            if (model.quoteInstantDeliveryResponseModel != null)
                              ...model
                                  .quoteInstantDeliveryResponseModel!
                                  .data!
                                  .checkout!
                                  .items!
                                  .map(
                                    (p) => Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 210.w,
                                                  child: TextView(
                                                    maxLines: 1,
                                                    text:
                                                        p
                                                            .product
                                                            ?.productName ??
                                                        '',
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15.42.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.black,
                                                      letterSpacing: -0.1,
                                                    ),
                                                  ),
                                                ),
                                                TextView(
                                                  text:
                                                      'Qty: ${p.quantity} | ${formatNaira(p.product?.priceDetails?.displayPricePerUnit ?? 0)}',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 12.42.sp,
                                                    fontWeight: FontWeight.w300,
                                                    color: AppColors.infoGrey,
                                                    letterSpacing: -0.1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TextView(
                                              text: formatNairaDouble(
                                                p.lineTotal!,
                                              ),
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 14.42.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.reminder1,
                                                letterSpacing: -0.1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(color: AppColors.infoGrey1),
                                      ],
                                    ),
                                  )
                            else
                              ...model
                                  .quoteScheduleDeliveryResponseModel!
                                  .data!
                                  .checkout!
                                  .items!
                                  .map(
                                    (p) => Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 210.w,
                                                  child: TextView(
                                                    maxLines: 1,
                                                    text:
                                                        p
                                                            .product
                                                            ?.productName ??
                                                        '',
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15.42.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.black,
                                                      letterSpacing: -0.1,
                                                    ),
                                                  ),
                                                ),
                                                TextView(
                                                  text:
                                                      'Qty: ${p.quantity} | ${formatNaira(p.product?.priceDetails?.displayPricePerUnit ?? 0)}',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 12.42.sp,
                                                    fontWeight: FontWeight.w300,
                                                    color: AppColors.infoGrey,
                                                    letterSpacing: -0.1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TextView(
                                              text: formatNairaDouble(
                                                p.lineTotal!,
                                              ),
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 14.42.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.reminder1,
                                                letterSpacing: -0.1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(color: AppColors.infoGrey1),
                                      ],
                                    ),
                                  ),

                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Subtotal',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                TextView(
                                  text:
                                      model.quoteInstantDeliveryResponseModel !=
                                          null
                                      ? formatNairaDouble(
                                          model
                                              .quoteInstantDeliveryResponseModel!
                                              .data!
                                              .checkout!
                                              .subtotal!,
                                        )
                                      : formatNairaDouble(
                                          model
                                              .quoteScheduleDeliveryResponseModel!
                                              .data!
                                              .checkout!
                                              .subtotal!,
                                        ),
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14.42.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Delivery',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                TextView(
                                  text:
                                      model.quoteInstantDeliveryResponseModel !=
                                          null
                                      ? formatNaira(
                                          model
                                              .quoteInstantDeliveryResponseModel!
                                              .data!
                                              .checkout!
                                              .deliveryFee!,
                                        )
                                      : formatNaira(
                                          model
                                              .quoteScheduleDeliveryResponseModel!
                                              .data!
                                              .checkout!
                                              .deliveryFee!,
                                        ),
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14.42.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),

                            Divider(color: AppColors.infoGrey1),
                            SizedBox(height: 4.10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Total:',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                TextView(
                                  text:
                                      model.quoteInstantDeliveryResponseModel !=
                                          null
                                      ? formatNairaDouble(
                                          model
                                              .quoteInstantDeliveryResponseModel!
                                              .data!
                                              .checkout!
                                              .total!,
                                        )
                                      : formatNairaDouble(
                                          model
                                              .quoteScheduleDeliveryResponseModel!
                                              .data!
                                              .checkout!
                                              .total!,
                                        ),
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16.42.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Payment Method',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.56.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          model.payMethod = PayMethod.accelerate;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.6.w,
                            vertical: 16.20.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.payMethod == PayMethod.accelerate
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<PayMethod>(
                                    value: PayMethod.accelerate,
                                    groupValue: model.payMethod,
                                    fillColor: WidgetStateProperty.all(
                                      model.payMethod == PayMethod.accelerate
                                          ? AppColors.primary
                                          : AppColors.infoGrey,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.payMethod = value!;
                                      model.notifyListeners();
                                    },
                                  ),

                                  SizedBox(width: 6.12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AppImage.accelerate,
                                          height: 16.h,
                                          width: 90.w,
                                        ),
                                        SizedBox(height: 8.10.h),
                                        TextView(
                                          text:
                                              'Direct gateway payment with card, transfer or USSD..',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 13.62.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.faintedGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          model.payMethod = PayMethod.wallet;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.6.w,
                            vertical: 16.20.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.payMethod == PayMethod.wallet
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<PayMethod>(
                                    value: PayMethod.wallet,
                                    groupValue: model.payMethod,
                                    fillColor: WidgetStateProperty.all(
                                      model.payMethod == PayMethod.wallet
                                          ? AppColors.primary
                                          : AppColors.infoGrey,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.payMethod = value!;
                                      model.notifyListeners();
                                    },
                                  ),

                                  SizedBox(width: 6.12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: 'Wallet Balance',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14.56.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        SizedBox(height: 8.10.h),
                                        TextView(
                                          text:
                                              'Pay instantly from your Medicate wallet.',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 13.62.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.faintedGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          model.payMethod = PayMethod.paystack;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.6.w,
                            vertical: 16.20.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.payMethod == PayMethod.paystack
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<PayMethod>(
                                    value: PayMethod.paystack,
                                    groupValue: model.payMethod,
                                    fillColor: WidgetStateProperty.all(
                                      model.payMethod == PayMethod.paystack
                                          ? AppColors.primary
                                          : AppColors.infoGrey,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.payMethod = value!;
                                      model.notifyListeners();
                                    },
                                  ),

                                  SizedBox(width: 6.12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AppImage.paystack,
                                          height: 16.h,
                                          width: 90.w,
                                        ),
                                        SizedBox(height: 8.10.h),
                                        TextView(
                                          text:
                                              'Direct gateway payment with card, transfer or USSD..',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 13.62.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.faintedGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          model.payMethod = PayMethod.flutterwave;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.6.w,
                            vertical: 16.20.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.payMethod == PayMethod.flutterwave
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<PayMethod>(
                                    value: PayMethod.flutterwave,
                                    groupValue: model.payMethod,
                                    fillColor: WidgetStateProperty.all(
                                      model.payMethod == PayMethod.flutterwave
                                          ? AppColors.primary
                                          : AppColors.infoGrey,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.payMethod = value!;
                                      model.notifyListeners();
                                    },
                                  ),

                                  SizedBox(width: 6.12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AppImage.flutterwave,
                                          height: 16.h,
                                          width: 90.w,
                                        ),
                                        SizedBox(height: 8.10.h),
                                        TextView(
                                          text:
                                              'Card, mobile money and international payments.',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 13.62.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.faintedGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30.h),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              model.paymentMethodFlowWholesale(context);
                              model.notifyListeners();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 8.w,
                              horizontal: 12.w,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Center(
                              child: model.isLoadingWallet
                                  ? SpinKitFadingCircle(
                                      color: AppColors.appWhite,
                                      size: 40.sp,
                                    )
                                  : TextView(
                                      text: 'Place Order',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum Delivery { instance, schedule }

enum PayMethod { accelerate, wallet, paystack, flutterwave }

enum CartAddedTime { morning, afternoon, evening }
