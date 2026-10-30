// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/app_utils.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../core/connect_end/model/checkout_delivery_option_entity_model.dart';
import '../../../core/connect_end/model/checkout_split_delivery_option_entity_model/checkout_split_delivery_option_entity_model.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../widget/auto_scroll_text.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';
import 'package:medicate_app/core/connect_end/model/checkout_split_delivery_option_entity_model/delivery.dart'
    as chk;

// ignore: must_be_immutable
class PharmacyWholeSaleCheckout extends StatefulWidget {
  const PharmacyWholeSaleCheckout({super.key});

  @override
  State<PharmacyWholeSaleCheckout> createState() =>
      _PharmacyWholeSaleCheckoutState();
}

class _PharmacyWholeSaleCheckoutState extends State<PharmacyWholeSaleCheckout> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySch = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySplit = GlobalKey<FormState>();

  final ScrollController _orderSummaryScrollController = ScrollController();
  final ScrollController _orderSummaryScrollController2 = ScrollController();

  @override
  void dispose() {
    _orderSummaryScrollController.dispose();
    _orderSummaryScrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) async {
        await model.getTenant(context);
        await model.getWholesaleProductAddedToCart(context);
        if (model.getTetantResponseModel != null &&
            model.getTetantResponseModel!.data!.businessAddresses!.isNotEmpty) {
          final primaryAddresses = model
              .getTetantResponseModel!
              .data!
              .businessAddresses!
              .where((test) => test.isPrimary!);
          if (primaryAddresses.isNotEmpty) {
            model.mapLocationAddressSelected = primaryAddresses.first;
            await Future.delayed(Duration(microseconds: 10));
            await model.getCheckoutDeliveryOption(
              context: context,
              checkoutDeliveryOption: CheckoutDeliveryOptionEntityModel(
                deliveryAddressId: model.mapLocationAddressSelected!.id,
              ),
            );
            if (model.getCheckoutDeliveryOptionResponseModel != null &&
                model
                    .getCheckoutDeliveryOptionResponseModel!
                    .data!
                    .methods!
                    .isNotEmpty &&
                model
                        .getCheckoutDeliveryOptionResponseModel!
                        .data!
                        .methods![0]
                        .deliveryFee !=
                    null) {
              if (model.delivery == Delivery.instance) {
                model.deliveryFeeAmount = model
                    .getCheckoutDeliveryOptionResponseModel!
                    .data!
                    .methods![0]
                    .deliveryFee!;
              }
            }
            model.approvedAddresses = model
                .getTetantResponseModel!
                .data!
                .businessAddresses!
                .where(
                  (address) =>
                      address.approvalStatus?.toLowerCase() == 'approved',
                )
                .toList();

            model.cartItems = model
                .wholesaleGetProductAddedToCartResponseModel!
                .data!
                .cart!
                .items!;
            await Future.delayed(Duration(seconds: 1));
            model.initializeSplitQuantities(
              approvedAddresses: model
                  .getTetantResponseModel!
                  .data!
                  .businessAddresses!
                  .where(
                    (address) =>
                        address.approvalStatus?.toLowerCase() == 'approved',
                  )
                  .toList(),
              cartItems: model
                  .wholesaleGetProductAddedToCartResponseModel!
                  .data!
                  .cart!
                  .items!,
            );
            model.notifyListeners();
          }
        }
      },
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
            padding: EdgeInsets.symmetric(horizontal: 16.2.w, vertical: 24.w),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.20.w,
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
                      model.isDeliveryAddressTap
                          ? Container(
                              constraints: BoxConstraints(
                                maxHeight:
                                    350.h, // Adjust to your preferred height
                              ),
                              child: ScrollbarTheme(
                                data: ScrollbarThemeData(
                                  thumbColor: WidgetStatePropertyAll(
                                    AppColors.grey,
                                  ),
                                  trackColor: WidgetStatePropertyAll(
                                    AppColors.transparent,
                                  ),
                                  thickness: WidgetStatePropertyAll(4.w),
                                  radius: Radius.circular(6.10.r),
                                ),
                                child: Scrollbar(
                                  controller: _orderSummaryScrollController,
                                  thumbVisibility: true,
                                  trackVisibility: true,
                                  child: SingleChildScrollView(
                                    controller: _orderSummaryScrollController,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),

                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Column(
                                        children: [
                                          ...model.approvedAddresses.asMap().entries.map((
                                            o,
                                          ) {
                                            final addressIndex = o.key;
                                            final e = o.value;
                                            model.getDeliveriesInList();
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 7.h,
                                                    horizontal: 8.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.grey,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                10.r,
                                                              ),
                                                          topRight:
                                                              Radius.circular(
                                                                10.r,
                                                              ),
                                                        ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: TextView(
                                                    text:
                                                        'Delivery ${addressIndex + 1}',
                                                    textStyle: TextStyle(
                                                      fontSize: 13.50.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          AppColors.reminder1,
                                                      fontFamily: 'DMSans',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                    10.w,
                                                    10.h,
                                                    10.w,
                                                    9.h,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                    bottom: 20.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.grey,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                10.r,
                                                              ),
                                                          bottomRight:
                                                              Radius.circular(
                                                                10.r,
                                                              ),
                                                        ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 12.w,
                                                            height: 12.w,
                                                            decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .green,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                color:
                                                                    const Color(
                                                                      0xFFB9E8D0,
                                                                    ),
                                                                width: 2.8,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 6.w),
                                                          Expanded(
                                                            child: TextView(
                                                              text:
                                                                  e.businessAddress ??
                                                                  '',
                                                              maxLines: 1,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),

                                                      ...List.generate(model.cartItems.length, (
                                                        index,
                                                      ) {
                                                        final product = model
                                                            .cartItems[index];

                                                        final distributedQuantity =
                                                            model
                                                                .getSplitQuantity(
                                                                  address: e,
                                                                  product:
                                                                      product,
                                                                );

                                                        // Do not display products with zero allocated quantity.
                                                        if (distributedQuantity ==
                                                            0) {
                                                          return const SizedBox.shrink();
                                                        }

                                                        final unitPrice =
                                                            product.unitPrice ??
                                                            0;

                                                        final distributedTotal =
                                                            unitPrice *
                                                            distributedQuantity;
                                                        return Padding(
                                                          padding: EdgeInsets.only(
                                                            bottom:
                                                                index <
                                                                    model
                                                                            .cartItems
                                                                            .length -
                                                                        1
                                                                ? 9.h
                                                                : 0,
                                                          ),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    TextView(
                                                                      text:
                                                                          product
                                                                              .product
                                                                              ?.productName ??
                                                                          '' ??
                                                                          '',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'DMSans',
                                                                        fontSize:
                                                                            13.80.sp,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: AppColors
                                                                            .reminder1,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          3.h,
                                                                    ),
                                                                    TextView(
                                                                      text:
                                                                          'Qty: $distributedQuantity | ${formatNaira(unitPrice)}',
                                                                      maxLines:
                                                                          1,
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'DMSans',
                                                                        fontSize:
                                                                            12.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .infoGrey,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 8.w,
                                                              ),
                                                              SizedBox(
                                                                width: 120,
                                                                child: TextView(
                                                                  text: formatNaira(
                                                                    distributedTotal ??
                                                                        0,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'DMSans',
                                                                    fontSize:
                                                                        13.50
                                                                            .sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),

                                                      SizedBox(height: 10.h),
                                                      Divider(
                                                        height: 1,
                                                        thickness: 0.8,
                                                        color:
                                                            AppColors.infoGrey1,
                                                      ),
                                                      SizedBox(height: 9.h),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: TextView(
                                                              text:
                                                                  'Delivery fee',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize:
                                                                    15.0.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                          ),
                                                          TextView(
                                                            text:
                                                                model.getCheckoutSplitDeliveryOptionResponseModel !=
                                                                    null
                                                                ? formatNaira(
                                                                    model.delivery ==
                                                                            Delivery.instance
                                                                        ? int.parse(
                                                                            model.getCheckoutSplitDeliveryOptionResponseModel!.data!.deliveries![addressIndex].methods!.isNotEmpty
                                                                                ? model.getCheckoutSplitDeliveryOptionResponseModel!.data!.deliveries![addressIndex].methods![0].deliveryFee.toString()
                                                                                : '0',
                                                                          )
                                                                        : int.parse(
                                                                            model.getCheckoutSplitDeliveryOptionResponseModel!.data!.deliveries![addressIndex].methods!.isNotEmpty
                                                                                ? model.getCheckoutSplitDeliveryOptionResponseModel!.data!.deliveries![addressIndex].methods![1].deliveryFee.toString()
                                                                                : '0',
                                                                          ),
                                                                  )
                                                                : formatNaira(
                                                                    0,
                                                                  ),
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize:
                                                                  14.42.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColors
                                                                  .reminder1,
                                                              letterSpacing:
                                                                  -0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                if (model
                                        .wholesaleGetProductAddedToCartResponseModel !=
                                    null)
                                  ...model
                                      .wholesaleGetProductAddedToCartResponseModel!
                                      .data!
                                      .cart!
                                      .items!
                                      .map(
                                        (c) => Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                            c
                                                                .product
                                                                ?.productName ??
                                                            '',
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 15.42.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              AppColors.black,
                                                          letterSpacing: -0.1,
                                                        ),
                                                      ),
                                                    ),
                                                    TextView(
                                                      text:
                                                          'Qty: ${c.quantity} | ${formatNaira(c.product?.priceDetails?.displayPricePerUnit ?? 0)}',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 12.42.sp,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            AppColors.infoGrey,
                                                        letterSpacing: -0.1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                TextView(
                                                  text: formatNairaNoDecimal(
                                                    c.lineTotal!,
                                                  ),
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Subtotal',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    model.isLoading ||
                                            model.wholesaleGetProductAddedToCartResponseModel ==
                                                null
                                        ? SpinKitRing(
                                            color: AppColors.primary,
                                            lineWidth: 2,
                                            size: 20.sp,
                                          )
                                        : TextView(
                                            text: formatNairaDouble(
                                              model
                                                  .wholesaleGetProductAddedToCartResponseModel!
                                                  .data!
                                                  .cart!
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Delivery',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    TextView(
                                      text: formatNaira(
                                        model.deliveryFeeAmount,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Total:',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    model.isLoading ||
                                            model.wholesaleGetProductAddedToCartResponseModel ==
                                                null
                                        ? SpinKitRing(
                                            color: AppColors.primary,
                                            lineWidth: 2,
                                            size: 20.sp,
                                          )
                                        : TextView(
                                            text: formatNairaDouble(
                                              model
                                                      .wholesaleGetProductAddedToCartResponseModel!
                                                      .data!
                                                      .cart!
                                                      .subtotal! +
                                                  model.deliveryFeeAmount,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppImage.delivery),
                          SizedBox(width: 12.w),
                          TextView(
                            text: 'Delivery Method',
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
                        onTap: () async {
                          model.delivery = Delivery.instance;
                          model.dateTimeController.clear();
                          await Future.delayed(Duration(microseconds: 10));

                          if (model.getCheckoutDeliveryOptionResponseModel !=
                                  null &&
                              model
                                  .getCheckoutDeliveryOptionResponseModel!
                                  .data!
                                  .methods!
                                  .isNotEmpty &&
                              model
                                      .getCheckoutDeliveryOptionResponseModel!
                                      .data!
                                      .methods![0]
                                      .deliveryFee !=
                                  null) {
                            model.deliveryFeeAmount = model
                                .getCheckoutDeliveryOptionResponseModel!
                                .data!
                                .methods![0]
                                .deliveryFee!;
                          } else {
                            model.deliveryFeeAmount = 0;
                          }

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
                                    text: 'Instant Delivery',
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
                        onTap: () async {
                          model.delivery = Delivery.schedule;
                          if (model.getCheckoutDeliveryOptionResponseModel !=
                                  null &&
                              model
                                  .getCheckoutDeliveryOptionResponseModel!
                                  .data!
                                  .methods!
                                  .isNotEmpty &&
                              model
                                      .getCheckoutDeliveryOptionResponseModel!
                                      .data!
                                      .methods![1]
                                      .deliveryFee !=
                                  null) {
                            model.deliveryFeeAmount = model
                                .getCheckoutDeliveryOptionResponseModel!
                                .data!
                                .methods![1]
                                .deliveryFee!;
                          } else {
                            model.deliveryFeeAmount = 0;
                          }
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
                                    text: 'Scheduled Block',
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
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.0.w,
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
                            SvgPicture.asset(
                              AppImage.locator,
                              height: 16.h,
                              width: 12.w,
                            ),
                            SizedBox(width: 12.w),
                            TextView(
                              text: 'Delivery Address',
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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (model
                                        .getTetantResponseModel!
                                        .data!
                                        .businessAddresses!
                                        .length >
                                    1) {
                                  model.isDeliveryAddressTap =
                                      !model.isDeliveryAddressTap;
                                  model.notifyListeners();
                                  if (model.isDeliveryAddressTap) {
                                    await Future.delayed(Duration(seconds: 1));
                                    model.getCheckoutSplitDeliveryOption(
                                      context: context,
                                      checkoutSplitDeliveryOption:
                                          CheckoutSplitDeliveryOptionEntityModel(
                                            splitOrder: true,
                                            deliveries: model.deliveries!.map((
                                              delivery,
                                            ) {
                                              return chk.Delivery.fromJson(
                                                delivery.toJson(),
                                              );
                                            }).toList(),
                                          ),
                                    );
                                  }
                                }
                              },
                              child: Container(
                                padding: model.isDeliveryAddressTap
                                    ? EdgeInsets.all(1.0.w)
                                    : EdgeInsets.all(6.0.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: model.isDeliveryAddressTap
                                      ? AppColors.primary
                                      : AppColors.transparent,
                                  border: Border.all(
                                    color: model.isDeliveryAddressTap
                                        ? AppColors.transparent
                                        : AppColors.infoGrey,
                                    width: .78,
                                  ),
                                ),
                                child: model.isDeliveryAddressTap
                                    ? Icon(
                                        Icons.check,
                                        size: 12.sp,
                                        color: AppColors.white,
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                            SizedBox(width: 6.10.w),
                            TextView(
                              text: 'Split order across multiple addresses',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        model.isDeliveryAddressTap
                            ? Container(
                                margin: EdgeInsets.only(top: 10.h),
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(
                                  12.w,
                                  12.r,
                                  5.0.w,
                                  12.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.nearDashboard,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: AppColors.infoGrey1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text:
                                          'Split each product quantity across delivery addresses.',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 12.60.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                    SizedBox(height: 7.0.h),

                                    Container(
                                      constraints: BoxConstraints(
                                        maxHeight: 350
                                            .h, // Adjust to your preferred height
                                      ),
                                      child: ScrollbarTheme(
                                        data: ScrollbarThemeData(
                                          thumbColor: WidgetStatePropertyAll(
                                            AppColors.grey,
                                          ),
                                          trackColor: WidgetStatePropertyAll(
                                            AppColors.transparent,
                                          ),
                                          thickness: WidgetStatePropertyAll(
                                            2.w,
                                          ),
                                          radius: Radius.circular(6.10.r),
                                        ),
                                        child: Scrollbar(
                                          controller:
                                              _orderSummaryScrollController2,
                                          thumbVisibility: true,
                                          trackVisibility: true,
                                          child: SingleChildScrollView(
                                            controller:
                                                _orderSummaryScrollController2,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 12.w,
                                              ),
                                              child: Column(
                                                children: [
                                                  ...model.approvedAddresses.asMap().entries.map((
                                                    entry,
                                                  ) {
                                                    final productIndex =
                                                        entry.key;
                                                    final e = entry.value;
                                                    final addressCount =
                                                        model
                                                            .getTetantResponseModel
                                                            ?.data
                                                            ?.businessAddresses
                                                            ?.length ??
                                                        0;

                                                    model
                                                        .initializeAddressControllers(
                                                          addressCount,
                                                        );
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SvgPicture.asset(
                                                              AppImage.locator,
                                                              height: 14.h,
                                                              width: 12.w,
                                                            ),
                                                            SizedBox(
                                                              width: 7.10.w,
                                                            ),
                                                            SizedBox(
                                                              width: 180.w,
                                                              child: TextView(
                                                                text:
                                                                    e.businessAddress ??
                                                                    '',
                                                                maxLines: 2,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .fade,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'DMSans',
                                                                  fontSize:
                                                                      14.42.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                ),
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            GestureDetector(
                                                              onTap: () {
                                                                if (model
                                                                        .businessAddressInfo ==
                                                                    e) {
                                                                  model.businessAddressInfo =
                                                                      null;
                                                                } else {
                                                                  model.businessAddressInfo =
                                                                      e;
                                                                }
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                    color:
                                                                        model.businessAddressInfo ==
                                                                            e
                                                                        ? AppColors
                                                                              .bblack
                                                                        : AppColors
                                                                              .infoGrey,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        4,
                                                                      ),
                                                                ),
                                                                child: Icon(
                                                                  model.businessAddressInfo ==
                                                                          e
                                                                      ? Icons
                                                                            .keyboard_arrow_up_sharp
                                                                      : Icons
                                                                            .keyboard_arrow_down_sharp,
                                                                  color:
                                                                      model.businessAddressInfo ==
                                                                          e
                                                                      ? AppColors
                                                                            .bblack
                                                                      : AppColors
                                                                            .infoGrey,
                                                                  size: 14.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        model.businessAddressInfo ==
                                                                e
                                                            ? Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        6.10.h,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      TextView(
                                                                        text:
                                                                            'Products',
                                                                        textStyle: TextStyle(
                                                                          fontFamily:
                                                                              'DMSans',
                                                                          fontSize:
                                                                              12.60.sp,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color:
                                                                              AppColors.fineGrey,
                                                                        ),
                                                                      ),
                                                                      TextView(
                                                                        text:
                                                                            'Quantity',
                                                                        textStyle: TextStyle(
                                                                          fontFamily:
                                                                              'DMSans',
                                                                          fontSize:
                                                                              12.60.sp,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color:
                                                                              AppColors.fineGrey,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        6.10.h,
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          10.w,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      color: AppColors
                                                                          .white,
                                                                      border: Border.all(
                                                                        color: AppColors
                                                                            .infoGrey1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            6.r,
                                                                          ),
                                                                    ),
                                                                    child: Column(
                                                                      children: [
                                                                        ...model.cartItems.asMap().entries.map((
                                                                          entry,
                                                                        ) {
                                                                          final index =
                                                                              entry.key;
                                                                          final cartItem =
                                                                              entry.value;
                                                                          final items = model
                                                                              .wholesaleGetProductAddedToCartResponseModel!
                                                                              .data!
                                                                              .cart!
                                                                              .items!;

                                                                          final quantity = model.getSplitQuantity(
                                                                            address:
                                                                                e,
                                                                            product:
                                                                                cartItem,
                                                                          );

                                                                          // Hide this product when this address has no allocated units.
                                                                          if (quantity ==
                                                                              0) {
                                                                            return const SizedBox.shrink();
                                                                          }

                                                                          return Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: 180.w,
                                                                                    child: TextView(
                                                                                      text:
                                                                                          cartItem.product?.productName ??
                                                                                          '',
                                                                                      textOverflow: TextOverflow.ellipsis,
                                                                                      textStyle: TextStyle(
                                                                                        fontFamily: 'DMSans',
                                                                                        fontSize: 14.42.sp,
                                                                                        fontWeight: FontWeight.w400,
                                                                                        color: AppColors.reminder,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      GestureDetector(
                                                                                        onTap: () {
                                                                                          model.updateSplitQuantity(
                                                                                            address: e,
                                                                                            product: cartItem,
                                                                                            delta: -1,
                                                                                            approvedAddresses: model.approvedAddresses,
                                                                                          );
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 18.w,
                                                                                          height: 18.w,
                                                                                          decoration: BoxDecoration(
                                                                                            color:
                                                                                                quantity >
                                                                                                    0
                                                                                                ? AppColors.buttonGrey1
                                                                                                : AppColors.infoGrey1,
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Icon(
                                                                                            Icons.remove,
                                                                                            color: AppColors.white,
                                                                                            size: 15.sp,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 10.w,
                                                                                      ),
                                                                                      TextView(
                                                                                        text: quantity.toString(),
                                                                                        textOverflow: TextOverflow.ellipsis,
                                                                                        textStyle: TextStyle(
                                                                                          fontFamily: 'DMSans',
                                                                                          fontSize: 14.42.sp,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          color: AppColors.reminder,
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 10.w,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                        onTap: () {
                                                                                          final updated = model.updateSplitQuantity(
                                                                                            address: e,
                                                                                            product: cartItem,
                                                                                            delta: 1,
                                                                                            approvedAddresses: model.approvedAddresses,
                                                                                          );

                                                                                          if (!updated) {
                                                                                            // No units are available to transfer from another address.
                                                                                            // Optionally show a SnackBar explaining this.
                                                                                          }
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 18.w,
                                                                                          height: 18.w,
                                                                                          decoration: BoxDecoration(
                                                                                            color: AppColors.primary,
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Icon(
                                                                                            Icons.add,
                                                                                            color: AppColors.white,
                                                                                            size: 15.sp,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                              // Show divider only when this is NOT the last item.
                                                                              if (index !=
                                                                                  items.length -
                                                                                      1)
                                                                                Divider(
                                                                                  color: AppColors.infoGrey1,
                                                                                ),
                                                                            ],
                                                                          );
                                                                        }),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        12.h,
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          10.w,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      color: AppColors
                                                                          .white,
                                                                      border: Border.all(
                                                                        color: AppColors
                                                                            .infoGrey1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            6.r,
                                                                          ),
                                                                    ),
                                                                    child: Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            TextView(
                                                                              text: 'Contact Person',
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'DMSans',
                                                                                fontSize: 14.42.sp,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                model.isSeeMore = !model.isSeeMore;
                                                                                model.notifyListeners();
                                                                              },
                                                                              child: TextView(
                                                                                text:
                                                                                    model.isSeeMore &&
                                                                                        model.businessAddressInfo ==
                                                                                            e
                                                                                    ? 'Hide'
                                                                                    : 'Show',
                                                                                textStyle: TextStyle(
                                                                                  fontFamily: 'DMSans',
                                                                                  decoration: TextDecoration.underline,
                                                                                  decorationColor: AppColors.lightBlue,
                                                                                  fontSize: 13.90.sp,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  color: AppColors.lightBlue,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        model.isSeeMore &&
                                                                                model.businessAddressInfo ==
                                                                                    e
                                                                            ? Form(
                                                                                key: formKeySplit,
                                                                                child: Column(
                                                                                  children: [
                                                                                    Divider(
                                                                                      color: AppColors.infoGrey1,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 2.0.h,
                                                                                    ),
                                                                                    TextFormWidget(
                                                                                      hint: 'Name',
                                                                                      label: 'Full Name',
                                                                                      hintWeight: FontWeight.w500,
                                                                                      hintColor: AppColors.reminder,
                                                                                      hintSize: Platform.isAndroid
                                                                                          ? 14.sp
                                                                                          : 12.sp,
                                                                                      borderColor: AppColors.infoGrey1,
                                                                                      borderTopLeft: 10.r,
                                                                                      borderTopRight: 10.r,
                                                                                      borderBottomLeft: 10.r,
                                                                                      borderBottomRight: 10.r,
                                                                                      fillColor: AppColors.white,
                                                                                      isFilled: true,
                                                                                      controller: model.nameOfPersonControllerList[productIndex],
                                                                                      prefixWidget: Padding(
                                                                                        padding: EdgeInsets.all(
                                                                                          12.w,
                                                                                        ),
                                                                                        child: SvgPicture.asset(
                                                                                          AppImage.profile,
                                                                                          color: AppColors.infoGrey,
                                                                                          height: Platform.isAndroid
                                                                                              ? 10.h
                                                                                              : 14.h,
                                                                                          width: Platform.isAndroid
                                                                                              ? 10.w
                                                                                              : 14.w,
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
                                                                                    SizedBox(
                                                                                      height: 12.h,
                                                                                    ),
                                                                                    TextFormWidget(
                                                                                      hint: 'Phone Number',
                                                                                      label: '+234',
                                                                                      hintWeight: FontWeight.w500,
                                                                                      hintColor: AppColors.reminder,
                                                                                      hintSize: Platform.isAndroid
                                                                                          ? 14.sp
                                                                                          : 12.sp,
                                                                                      borderColor: AppColors.infoGrey1,
                                                                                      borderTopLeft: 10.r,
                                                                                      borderTopRight: 10.r,
                                                                                      borderBottomLeft: 10.r,
                                                                                      borderBottomRight: 10.r,
                                                                                      fillColor: AppColors.white,
                                                                                      isFilled: true,
                                                                                      controller: model.phoneControllerList[productIndex],
                                                                                      inputFormatters: [
                                                                                        LengthLimitingTextInputFormatter(
                                                                                          11,
                                                                                        ),
                                                                                        FilteringTextInputFormatter.digitsOnly,
                                                                                      ],
                                                                                      prefixWidget: Padding(
                                                                                        padding: EdgeInsets.all(
                                                                                          12.w,
                                                                                        ),
                                                                                        child: SvgPicture.asset(
                                                                                          AppImage.phone,
                                                                                          color: AppColors.infoGrey,
                                                                                          height: Platform.isAndroid
                                                                                              ? 10.h
                                                                                              : 14.h,
                                                                                          width: Platform.isAndroid
                                                                                              ? 10.w
                                                                                              : 14.w,
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
                                                                                    SizedBox(
                                                                                      height: 12.h,
                                                                                    ),
                                                                                    TextFormWidget(
                                                                                      hint: 'ID',
                                                                                      label: 'Select ID',
                                                                                      hintWeight: FontWeight.w500,
                                                                                      hintColor: AppColors.reminder,
                                                                                      hintSize: Platform.isAndroid
                                                                                          ? 14.sp
                                                                                          : 12.sp,
                                                                                      borderColor: AppColors.infoGrey1,
                                                                                      borderTopLeft: 10.r,
                                                                                      borderTopRight: 10.r,
                                                                                      borderBottomLeft: 10.r,
                                                                                      borderBottomRight: 10.r,
                                                                                      fillColor: AppColors.white,
                                                                                      isFilled: true,
                                                                                      readOnly: true,
                                                                                      controller: model.formIDControllerList[productIndex],
                                                                                      suffixWidget: model.getPopUpFormIdDialogList(
                                                                                        context: context,
                                                                                        index: productIndex,
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
                                                                                    SizedBox(
                                                                                      height: 12.h,
                                                                                    ),
                                                                                    TextFormWidget(
                                                                                      hint: 'Order notes (Optional)',
                                                                                      isShowHint: true,
                                                                                      label: 'E.g. Call central storage clerk upon arrival',
                                                                                      hintWeight: FontWeight.w500,
                                                                                      hintColor: AppColors.reminder,
                                                                                      hintSize: Platform.isAndroid
                                                                                          ? 14.sp
                                                                                          : 12.sp,
                                                                                      borderColor: AppColors.infoGrey1,
                                                                                      borderTopLeft: 10.r,
                                                                                      borderTopRight: 10.r,
                                                                                      borderBottomLeft: 10.r,
                                                                                      borderBottomRight: 10.r,
                                                                                      fillColor: AppColors.white,
                                                                                      isFilled: true,
                                                                                      controller: model.orderNotesControllerList[productIndex],
                                                                                      maxline: 4,
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
                                                                              )
                                                                            : SizedBox.shrink(),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        5.0.h,
                                                                  ),
                                                                ],
                                                              )
                                                            : SizedBox.shrink(),
                                                        if (productIndex <
                                                            model
                                                                    .approvedAddresses
                                                                    .length -
                                                                1)
                                                          Divider(
                                                            color: AppColors
                                                                .infoGrey1,
                                                          ),
                                                        SizedBox(height: 10.h),
                                                      ],
                                                    );
                                                  }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  if (model.getTetantResponseModel != null &&
                                      model
                                          .getTetantResponseModel!
                                          .data!
                                          .businessAddresses!
                                          .isNotEmpty)
                                    ...model
                                        .getTetantResponseModel!
                                        .data!
                                        .businessAddresses!
                                        .where(
                                          (w) =>
                                              w.approvalStatus?.toLowerCase() ==
                                              'approved',
                                        )
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () async {
                                              model.mapLocationAddressSelected =
                                                  e;
                                              await Future.delayed(
                                                Duration(microseconds: 10),
                                              );
                                              await model
                                                  .updatePrimaryBusinessAddress(
                                                    context: context,
                                                    id: model
                                                        .mapLocationAddressSelected!
                                                        .id!,
                                                    isCheckout: true,
                                                  );
                                              await model.getCheckoutDeliveryOption(
                                                context: context,
                                                checkoutDeliveryOption:
                                                    CheckoutDeliveryOptionEntityModel(
                                                      deliveryAddressId: model
                                                          .mapLocationAddressSelected!
                                                          .id,
                                                    ),
                                              );
                                              if (model.getCheckoutDeliveryOptionResponseModel !=
                                                      null &&
                                                  model
                                                      .getCheckoutDeliveryOptionResponseModel!
                                                      .data!
                                                      .methods!
                                                      .isNotEmpty) {
                                                if (model.delivery ==
                                                        Delivery.instance &&
                                                    model
                                                            .getCheckoutDeliveryOptionResponseModel!
                                                            .data!
                                                            .methods![0]
                                                            .deliveryFee !=
                                                        null) {
                                                  model
                                                      .deliveryFeeAmount = model
                                                      .getCheckoutDeliveryOptionResponseModel!
                                                      .data!
                                                      .methods![0]
                                                      .deliveryFee!;
                                                } else if (model.delivery ==
                                                        Delivery.schedule &&
                                                    model
                                                            .getCheckoutDeliveryOptionResponseModel!
                                                            .data!
                                                            .methods![1]
                                                            .deliveryFee !=
                                                        null) {
                                                  model
                                                      .deliveryFeeAmount = model
                                                      .getCheckoutDeliveryOptionResponseModel!
                                                      .data!
                                                      .methods![1]
                                                      .deliveryFee!;
                                                } else {
                                                  model.deliveryFeeAmount = 0;
                                                }
                                                model.notifyListeners();
                                              } else {
                                                model.deliveryFeeAmount = 0;
                                              }
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(
                                                top: 12.w,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10.w,
                                                horizontal: 12.w,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      model.mapLocationAddressSelected ==
                                                          e
                                                      ? AppColors.primary
                                                      : AppColors.infoGrey1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                children: [
                                                  model.mapLocationAddressSelected ==
                                                          e
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                2.6.w,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .primary,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                  3.2.w,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                          ),
                                                        )
                                                      : Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                6.w,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .infoGrey1,
                                                              width: 2,
                                                            ),
                                                          ),
                                                        ),

                                                  SizedBox(width: 10.w),

                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AutoScrollingText(
                                                          text:
                                                              e.businessAddress ??
                                                              '',
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 14.20.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                        ),

                                                        SizedBox(height: 3.h),

                                                        AutoScrollingText(
                                                          text:
                                                              '${e.lga}, ${e.state}, ${e.country}',
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 13.20.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .infoGrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                        model.delivery == Delivery.schedule
                            ? Form(
                                key: formKeySch,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 12.h),
                                    TextFormWidget(
                                      hint: 'Select Delivery Date',
                                      label: 'Pick a date',
                                      hintWeight: FontWeight.w400,
                                      hintColor: AppColors.reminder,
                                      hintSize: Platform.isAndroid
                                          ? 14.sp
                                          : 12.sp,
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
                                          onTap: () async {
                                            await model.selectDateCheckout(
                                              context: context,
                                              model: model,
                                            );
                                            model.notifyListeners();
                                          },
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
                                ),
                              )
                            : SizedBox.shrink(),
                        model.dateTimeController.text != ''
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (model
                                          .getCheckoutDeliveryOptionResponseModel !=
                                      null)
                                    ...model
                                        .getCheckoutDeliveryOptionResponseModel!
                                        .data!
                                        .methods!
                                        .where(
                                          (test) =>
                                              test.method!.toLowerCase() ==
                                              "SCHEDULED_BLOCK".toLowerCase(),
                                        )
                                        .map(
                                          (e) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text: 'Select Time Window',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 13.78.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors.reminder,
                                                    ),
                                                  ),
                                                  TextView(
                                                    text: '*',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15.54.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              if (e.timeBlocks!.isNotEmpty)
                                                ...e.timeBlocks!.map(
                                                  (time) => GestureDetector(
                                                    onTap: () async {
                                                      model.time = time;
                                                      model.notifyListeners();
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 12.4.w,
                                                          ),
                                                      margin: EdgeInsets.only(
                                                        bottom: 12.w,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              model.time == time
                                                              ? AppColors
                                                                    .primary
                                                              : AppColors
                                                                    .infoGrey1,
                                                          width: 1.22,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10.r,
                                                            ),
                                                      ),
                                                      child: Center(
                                                        child: TextView(
                                                          text:
                                                              '${time.name} (${formatTime(time.startTime!)} - ${formatTime(time.endTime!)})',
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 14.82.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                model.time ==
                                                                    time
                                                                ? AppColors
                                                                      .primary
                                                                : AppColors
                                                                      .infoGrey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),

                                  SizedBox(height: 10.w),
                                  model.time != null
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12.w,
                                            horizontal: 16.w,
                                          ),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColors.cooool,
                                            borderRadius: BorderRadius.circular(
                                              8.0.r,
                                            ),
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
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors.reminder,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 14.w),
                                              TextView(
                                                text:
                                                    '${model.dateTimeController.text} . ${model.time?.name ?? ''} (${formatTime(model.time?.startTime ?? '')} - ${formatTime(model.time?.endTime ?? '')})',
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
                                        )
                                      : SizedBox.shrink(),
                                ],
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 12.h),

                        model.isDeliveryAddressTap
                            ? SizedBox.shrink()
                            : Column(
                                children: [
                                  TextFormWidget(
                                    hint: 'Name',
                                    label: 'Full Name',
                                    hintWeight: FontWeight.w400,
                                    hintColor: AppColors.reminder,
                                    hintSize: Platform.isAndroid
                                        ? 14.sp
                                        : 12.sp,
                                    borderColor: AppColors.infoGrey1,
                                    borderTopLeft: 10.r,
                                    borderTopRight: 10.r,
                                    borderBottomLeft: 10.r,
                                    borderBottomRight: 10.r,
                                    fillColor: AppColors.white,
                                    isFilled: true,
                                    controller: model.nameOfPersonController,
                                    prefixWidget: Padding(
                                      padding: EdgeInsets.all(12.w),
                                      child: SvgPicture.asset(
                                        AppImage.profile,
                                        color: AppColors.infoGrey,
                                        height: Platform.isAndroid
                                            ? 10.h
                                            : 14.h,
                                        width: Platform.isAndroid ? 10.w : 14.w,
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
                                    hint: 'Phone Number',
                                    label: '+234',
                                    hintWeight: FontWeight.w400,
                                    hintColor: AppColors.reminder,
                                    hintSize: Platform.isAndroid
                                        ? 14.sp
                                        : 12.sp,
                                    borderColor: AppColors.infoGrey1,
                                    borderTopLeft: 10.r,
                                    borderTopRight: 10.r,
                                    borderBottomLeft: 10.r,
                                    borderBottomRight: 10.r,
                                    fillColor: AppColors.white,
                                    isFilled: true,
                                    controller: model.phoneController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(11),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    prefixWidget: Padding(
                                      padding: EdgeInsets.all(12.w),
                                      child: SvgPicture.asset(
                                        AppImage.phone,
                                        color: AppColors.infoGrey,
                                        height: Platform.isAndroid
                                            ? 10.h
                                            : 14.h,
                                        width: Platform.isAndroid ? 10.w : 14.w,
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
                                    hint: 'ID',
                                    label: 'Select ID',
                                    hintWeight: FontWeight.w400,
                                    hintColor: AppColors.reminder,
                                    hintSize: Platform.isAndroid
                                        ? 14.sp
                                        : 12.sp,
                                    borderColor: AppColors.infoGrey1,
                                    borderTopLeft: 10.r,
                                    borderTopRight: 10.r,
                                    borderBottomLeft: 10.r,
                                    borderBottomRight: 10.r,
                                    fillColor: AppColors.white,
                                    isFilled: true,
                                    readOnly: true,
                                    controller: model.formIDController,
                                    suffixWidget: model.getPopUpFormIdDialog(
                                      context,
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
                                    label:
                                        'E.g. Call central storage clerk upon arrival',
                                    hintWeight: FontWeight.w400,
                                    hintColor: AppColors.reminder,
                                    hintSize: Platform.isAndroid
                                        ? 14.sp
                                        : 12.sp,
                                    borderColor: AppColors.infoGrey1,
                                    borderTopLeft: 10.r,
                                    borderTopRight: 10.r,
                                    borderBottomLeft: 10.r,
                                    borderBottomRight: 10.r,
                                    fillColor: AppColors.white,
                                    isFilled: true,
                                    controller: model.orderNotesController,
                                    maxline: 4,
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
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.w, top: 10.w),
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
                        onTap: () async {
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
                      SizedBox(height: 30.h),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (model.isDeliveryAddressTap) {
                              if (formKeySplit.currentState!.validate()) {
                                model.paymentMethodFlowWholesale(
                                  context,
                                  formKeySch: formKeySch,
                                  amount:
                                      model
                                          .quoteInstantSplitDeliveryResponseModel
                                          ?.data
                                          ?.checkout
                                          ?.total ??
                                      model
                                          .quoteScheduleSplitDeliveryResponseModel
                                          ?.data
                                          ?.checkout
                                          ?.total ??
                                      model
                                              .wholesaleGetProductAddedToCartResponseModel!
                                              .data!
                                              .cart!
                                              .subtotal! +
                                          model.deliveryFeeAmount,
                                  deliveries: model.deliveries,
                                  nameOfPersonControllerList:
                                      model.nameOfPersonControllerList,
                                  orderNotesControllerList:
                                      model.orderNotesControllerList,
                                  formIDControllerList:
                                      model.formIDControllerList,
                                  phoneControllerList:
                                      model.phoneControllerList,
                                );
                              } else {
                                AppUtils.snackbar(
                                  context,
                                  message: 'Kindly fill all neccessary info.',
                                  error: true,
                                );
                              }
                            } else {
                              if (formKey.currentState!.validate()) {
                                model.paymentMethodFlowWholesale(
                                  context,
                                  amount:
                                      model
                                          .wholesaleGetProductAddedToCartResponseModel!
                                          .data!
                                          .cart!
                                          .subtotal! +
                                      model.deliveryFeeAmount,
                                );
                              }
                            }
                            model.notifyListeners();
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
                              child: model.isLoadingWallet || model.isLoading
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

enum PayMethod { accelerate, wallet, flutterwave }

enum CartAddedTime { morning, afternoon, evening }
