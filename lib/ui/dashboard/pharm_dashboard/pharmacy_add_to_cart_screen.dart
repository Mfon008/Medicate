// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../widget/text.dart';

class PharmacyAddToCartScreen extends StatelessWidget {
  const PharmacyAddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {
        model.getWholesaleProductAddedToCart(context);
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, PharmViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.appWhite,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.22.w, vertical: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.60.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppImage.cart,
                      color: AppColors.reminder,
                      height: 28.0.h,
                      width: 28.0.w,
                    ),
                    SizedBox(width: 20.w),
                    TextView(
                      text: 'Your Cart ',
                      textStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 17.20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.reminder,
                        letterSpacing: -0.21,
                      ),
                    ),
                    model.wholesaleGetProductAddedToCartResponseModel != null &&
                            model
                                    .wholesaleGetProductAddedToCartResponseModel!
                                    .data!
                                    .cart!
                                    .itemCount! >
                                0
                        ? TextView(
                            text:
                                '(${model.wholesaleGetProductAddedToCartResponseModel!.data!.cart!.itemCount} item)s',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 17.20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                              letterSpacing: -0.1,
                            ),
                          )
                        : SizedBox.shrink(),
                    Spacer(),
                    GestureDetector(
                      onTap: () => navigate.back(),
                      child: SvgPicture.asset(
                        AppImage.x,
                        color: AppColors.success,
                        height: 23.0.h,
                        width: 23.0.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.10.h),
                Divider(color: AppColors.f1),
                SizedBox(height: 10.h),

                model.wholesaleGetProductAddedToCartResponseModel != null &&
                        model
                                .wholesaleGetProductAddedToCartResponseModel!
                                .data!
                                .cart!
                                .itemCount! >
                            0
                    ? Expanded(
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 150.h, // space for subtotal section
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...model.wholesaleGetProductAddedToCartResponseModel!.data!.cart!.items!.map((
                                      e,
                                    ) {
                                      final int mainQuantity = e.quantity ?? 1;
                                      final int currentQuantity =
                                          model.selectedQuantities[e
                                              .product
                                              ?.id] ??
                                          mainQuantity;
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(
                                                    12.40.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.grey2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.r,
                                                        ),
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      5.62.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          AppColors.infoGrey2,
                                                    ),
                                                    child: ClipOval(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            e
                                                                .product
                                                                ?.images?[0]
                                                                .url ??
                                                            '',
                                                        height:
                                                            isTablet(context)
                                                            ? 28.0.h
                                                            : 42.8.h,
                                                        width: isTablet(context)
                                                            ? 28.0.w
                                                            : 42.8.w,
                                                        errorWidget:
                                                            (
                                                              context,
                                                              url,
                                                              error,
                                                            ) => SvgPicture.asset(
                                                              AppImage.box_cart,
                                                              height:
                                                                  isTablet(
                                                                    context,
                                                                  )
                                                                  ? 28.0.h
                                                                  : 18.h,
                                                              width:
                                                                  isTablet(
                                                                    context,
                                                                  )
                                                                  ? 28.0.w
                                                                  : 18.w,
                                                              color: AppColors
                                                                  .infoGrey,
                                                            ),
                                                        fit: BoxFit.cover,
                                                      ),
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
                                                      TextView(
                                                        text:
                                                            e
                                                                .product
                                                                ?.productName
                                                                ?.capitalizeWords() ??
                                                            '',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 16.20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          TextView(
                                                            text:
                                                                'MOQ ${e.product?.minimumOrderQuantity ?? 0} carton(s) ',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize:
                                                                  13.20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                              letterSpacing:
                                                                  -0.21,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 130.w,
                                                            child: TextView(
                                                              text:
                                                                  '· ${formatNaira(e.unitPrice ?? 0)}/cartons',
                                                              maxLines: 2,
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize:
                                                                    13.20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .reminder,
                                                                letterSpacing:
                                                                    -0.21,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 4.w,
                                                              horizontal: 8.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                20.r,
                                                              ),
                                                          color: AppColors.grey,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            TextView(
                                                              text:
                                                                  'Manufacturer: ',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize:
                                                                    13.20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .infoGrey,
                                                                letterSpacing:
                                                                    -0.31,
                                                              ),
                                                            ),
                                                            TextView(
                                                              text:
                                                                  ' ${e.product?.manufacturerDistributorName?.capitalizeWords() ?? ''}',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize:
                                                                    13.20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .reminder,
                                                                letterSpacing:
                                                                    -0.31,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 30.h,
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    7.92.r,
                                                                  ),
                                                              border: Border.all(
                                                                color:
                                                                    const Color.fromARGB(
                                                                      255,
                                                                      236,
                                                                      237,
                                                                      237,
                                                                    ),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      currentQuantity <=
                                                                          e.product!.minimumOrderQuantity!
                                                                      ? null
                                                                      : () async {
                                                                          model.selectedQuantities[e.product!.id!] =
                                                                              currentQuantity -
                                                                              1;
                                                                          await Future.delayed(
                                                                            Duration(
                                                                              milliseconds: 50,
                                                                            ),
                                                                          );
                                                                          model.updateWholesaleProductToCart(
                                                                            context,
                                                                            wholesaleProductId:
                                                                                e.productId,
                                                                            quantity:
                                                                                model.selectedQuantities[e.product!.id!],
                                                                          );
                                                                          model
                                                                              .notifyListeners();
                                                                        },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    size:
                                                                        18.0.sp,
                                                                    color: AppColors
                                                                        .infoGrey,
                                                                  ),
                                                                ),
                                                                TextView(
                                                                  text:
                                                                      '$currentQuantity',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'GoogleSans',
                                                                    fontSize:
                                                                        16.80
                                                                            .sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed: () async {
                                                                    model.selectedQuantities[e
                                                                            .product!
                                                                            .id!] =
                                                                        currentQuantity +
                                                                        1;
                                                                    await Future.delayed(
                                                                      Duration(
                                                                        milliseconds:
                                                                            50,
                                                                      ),
                                                                    );
                                                                    model.updateWholesaleProductToCart(
                                                                      context,
                                                                      wholesaleProductId:
                                                                          e.productId,
                                                                      quantity:
                                                                          model
                                                                              .selectedQuantities[e
                                                                              .product!
                                                                              .id!],
                                                                    );
                                                                    model
                                                                        .notifyListeners();
                                                                  },
                                                                  icon: Icon(
                                                                    Icons.add,
                                                                    size:
                                                                        18.0.sp,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              model.eCartRemove =
                                                                  e;
                                                              model.removeWholesaleProductItemFromCart(
                                                                context,
                                                                wholesaleProductId:
                                                                    e
                                                                        .product!
                                                                        .id!,
                                                              );
                                                              model
                                                                  .notifyListeners();
                                                            },
                                                            child:
                                                                model.isLoadingRemoveItem &&
                                                                    model.eCartRemove ==
                                                                        e
                                                                ? SpinKitRing(
                                                                    color: AppColors
                                                                        .primaryLight,
                                                                    size: 20.sp,
                                                                    lineWidth:
                                                                        3,
                                                                  )
                                                                : SvgPicture.asset(
                                                                    AppImage
                                                                        .delete,
                                                                    height:
                                                                        isTablet(
                                                                          context,
                                                                        )
                                                                        ? 38.0.h
                                                                        : 20.8.h,
                                                                    width:
                                                                        isTablet(
                                                                          context,
                                                                        )
                                                                        ? 38.0.w
                                                                        : 20.8.w,
                                                                    color:
                                                                        AppColors
                                                                            .red,
                                                                  ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Divider(color: AppColors.f1),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(color: AppColors.f1),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextView(
                                        text: 'Subtotal',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 17.80.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                      TextView(
                                        text: formatNaira(
                                          model
                                                  .wholesaleGetProductAddedToCartResponseModel
                                                  ?.data
                                                  ?.cart
                                                  ?.subtotal ??
                                              0,
                                        ),
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 17.80.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.10.h),
                                  TextView(
                                    text:
                                        'Delivery fees calculated at checkout',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 13.30.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () => navigate.navigateTo(
                                        Routes.pharmacyWholeSaleCheckout,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.w,
                                          horizontal: 12.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(
                                            40.r,
                                          ),
                                        ),
                                        child: Center(
                                          child: TextView(
                                            text: 'Proceed to Checkout',
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 14.90.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.20.h),
                                  Center(
                                    child: TextView(
                                      text: 'Continue Shopping',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 14.90.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 160.w,
                          left: 30.w,
                          right: 30.w,
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey,
                                ),
                                child: SvgPicture.asset(
                                  AppImage.empty_cart,
                                  height: isTablet(context) ? 40.h : 24.h,
                                  width: isTablet(context) ? 40.w : 24.w,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                              SizedBox(height: 22.0.h),
                              TextView(
                                text: 'Your Cart is Empty',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 18.20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.reminder,
                                  letterSpacing: -0.21,
                                ),
                              ),
                              SizedBox(height: 6.10.h),
                              TextView(
                                text:
                                    "Looks like you haven't added anything to your cart yet.",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.90.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                              SizedBox(height: 22.h),
                              GestureDetector(
                                onTap: () => navigate.back(),
                                child: Container(
                                  width: 260.w,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.w,
                                    horizontal: 20.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(40.r),
                                  ),
                                  child: Center(
                                    child: TextView(
                                      text: 'Browse Markeplace',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 17.90.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
