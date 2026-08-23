// ignore_for_file: must_be_immutable, deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../core/app_assets/constant.dart';
import '../../../core/connect_end/model/wholesale_add_to_cart_entity_model.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class PharmacyWholesaleScreen extends StatefulWidget {
  const PharmacyWholesaleScreen({super.key});

  @override
  State<PharmacyWholesaleScreen> createState() =>
      _PharmacyWholesaleScreenState();
}

class _PharmacyWholesaleScreenState extends State<PharmacyWholesaleScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) async {
        await model.getListedMarketPlace(context);
        await model.getWholesaleProductAddedToCart(context);
        model.getWholesaleCategoryList(context);
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, PharmViewModel model, _) {
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
                      color: AppColors.inactive.withValues(alpha: .1),
                      border: Border.all(
                        color: AppColors.inactive.withValues(alpha: .4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.burger,
                        color: AppColors.primary,
                        height: isTablet(context) ? 32.h : 12.h,
                        width: isTablet(context) ? 32.w : 12.w,
                      ),
                      onPressed: () => navigate.navigateTo(
                        Routes.pharmMoreScreen,
                      ), // makes ripple effect round
                    ),
                  ),
                  SvgPicture.asset(
                    AppImage.applogoSvg,
                    height: 28.h,
                    width: 28.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2.4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.inactive.withOpacity(.1),
                          border: Border.all(
                            color: AppColors.inactive.withOpacity(.4),
                          ),
                        ),
                        child: Stack(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                AppImage.cart,
                                height: isTablet(context) ? 40.h : 20.h,
                                width: isTablet(context) ? 40.w : 20.w,
                                color: AppColors.primary,
                              ),
                              onPressed: () => navigate.navigateTo(
                                Routes.pharmacyAddToCartScreen,
                              ),
                              splashRadius: 28,
                            ),
                            model.wholesaleGetProductAddedToCartResponseModel !=
                                        null &&
                                    model
                                            .wholesaleGetProductAddedToCartResponseModel
                                            ?.data
                                            ?.cart
                                            ?.itemCount !=
                                        0
                                ? Positioned(
                                    right: 2,
                                    child: Container(
                                      padding: EdgeInsets.all(4.0.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.appRed,
                                      ),
                                      child: TextView(
                                        text:
                                            '${model.wholesaleGetProductAddedToCartResponseModel?.data?.cart?.itemCount}',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 11.0.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
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
                          // navigate.navigateTo(Routes.emptyNotification),
                          splashRadius: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Marketplace',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18.20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Order directly from partnered manufacturers and distributors. Tiered pricing, MOQ discounts, and scheduled or instant delivery.',
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 14.20.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: TextFormWidget(
                        label: 'Search products, manufactures, SKU...',
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
                        fillColor: AppColors.white,
                        prefixWidget: model.isLoading
                            ? SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: Center(
                                  child: SpinKitFadingCircle(
                                    color: AppColors.primary1,
                                    size: 18.sp,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 12.6.w,
                                ),
                                child: SvgPicture.asset(AppImage.search),
                              ),
                        onChange: (value) {
                          model.debouncer.run(() {
                            model.getListedMarketPlace(context);
                          });
                          model.searchProduct = value;
                        },
                      ),
                    ),
                    SizedBox(width: 22.40.w),
                    GestureDetector(
                      onTap: () => model.modalBottomSheetMenuHealthCareRadio(
                        context,
                        model,
                      ),
                      child: SvgPicture.asset(
                        AppImage.filter,
                        color: AppColors.grey1,
                        height: 15.20.h,
                        width: 15.20.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                if (model.getListedMarketPlaceResponseModel != null &&
                    model
                        .getListedMarketPlaceResponseModel!
                        .data!
                        .products!
                        .isNotEmpty)
                  ...model.getListedMarketPlaceResponseModel!.data!.products!.map((
                    m,
                  ) {
                    final int minimumQuantity = m.minimumOrderQuantity ?? 1;
                    final int currentQuantity =
                        model.selectedQuantities[m.id] ?? minimumQuantity;
                    return GestureDetector(
                      onTap: () => navigate.navigateTo(
                        Routes.pharmacyViewProductScreen,
                        arguments: PharmacyViewProductScreenArguments(
                          wholeSaleProductId: m.id,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8.10.w),
                        margin: EdgeInsets.only(bottom: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 198.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        236,
                                        237,
                                        237,
                                      ),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: CachedNetworkImage(
                                      imageUrl: m.images?[0].url ?? '',
                                      height: 262.h,
                                      width: 242.w,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: SpinKitRipple(
                                          color: AppColors.primary,
                                          size: 50.sp,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 17.20,
                                  left: 16.20,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.60.w,
                                      horizontal: 6.8.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.appWhite,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'Manufacturer: ',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 13.20.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        // SizedBox(width: 50.h),
                                        TextView(
                                          text:
                                              m.manufacturerDistributorName ??
                                              '',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 13.30.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 1,
                                  bottom: 1,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.80.w,
                                      vertical: 6.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(6.r),
                                        bottomLeft: Radius.circular(4.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        m.images!.length,
                                        (index) => AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 3.2.w,
                                          ),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: currentPage == index
                                                ? AppColors.primary
                                                : AppColors.infoGrey,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.all(12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //(Carton of ${m.packSize} packs)
                                  TextView(
                                    text: m.productName?.capitalize() ?? '',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 17.20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder,
                                      letterSpacing: -0.21,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Divider(color: AppColors.infoGrey1),
                                  SizedBox(height: 6.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Pack Size:',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      TextView(
                                        text: '${m.packSize} / (carton)s',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Available Stock:',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      TextView(
                                        text: '${m.stock} units',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.app_green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'MOQ:',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      TextView(
                                        text:
                                            '${m.minimumOrderQuantity} cartons',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'NAFDAC Reg No:',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 160.w,
                                        child: TextView(
                                          text:
                                              m
                                                  .nafdacVerification
                                                  ?.registrationNumber ??
                                              '',
                                          maxLines: 1,
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.right,
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 15.20.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Expiry Date:',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      TextView(
                                        text: DateFormat(
                                          'MM/yyyy',
                                        ).format(m.expiryDate!),
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 15.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.h),
                                  Divider(color: AppColors.infoGrey1),
                                  SizedBox(height: 10.h),
                                  if (m.volumePricing!.isNotEmpty)
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.grey,
                                        borderRadius: BorderRadius.circular(
                                          8.0.r,
                                        ),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                            255,
                                            236,
                                            237,
                                            237,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Volume Pricing',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.20.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ...m.volumePricing!.map(
                                                  (vol) => Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 6.60.w,
                                                          horizontal: 8.w,
                                                        ),
                                                    margin: EdgeInsets.only(
                                                      right: 10.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.appWhite,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20.r,
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,

                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextView(
                                                          text:
                                                              '≥ ${vol['quantity']}:',
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 15.60.sp,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                        ),
                                                        SizedBox(width: 10.h),
                                                        TextView(
                                                          text: formatNaira(
                                                            vol['pricePerUnit'],
                                                          ),
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 15.80.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(height: 5.10.w),
                                        ],
                                      ),
                                    ),
                                  SizedBox(
                                    height: m.volumePricing!.isNotEmpty
                                        ? 6.h
                                        : 0.h,
                                  ),
                                  m.volumePricing!.isNotEmpty
                                      ? Divider(color: AppColors.infoGrey1)
                                      : SizedBox.shrink(),
                                  SizedBox(
                                    height: m.volumePricing!.isNotEmpty
                                        ? 10.h
                                        : 0.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: formatNaira(
                                          m.displayPricePerUnit! *
                                              currentQuantity,
                                        ),
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 19.80.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      TextView(
                                        text: '/${m.unit}(s)',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 14.80.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            7.92.r,
                                          ),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                              255,
                                              236,
                                              237,
                                              237,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed:
                                                  currentQuantity <=
                                                      minimumQuantity
                                                  ? null
                                                  : () {
                                                      model.selectedQuantities[m
                                                              .id!] =
                                                          currentQuantity - 1;
                                                      model.notifyListeners();
                                                    },
                                              icon: Icon(
                                                Icons.remove,
                                                size: 14.0.sp,
                                                color:
                                                    currentQuantity <=
                                                        minimumQuantity
                                                    ? AppColors.infoGrey
                                                    : AppColors.reminder,
                                              ),
                                            ),
                                            TextView(
                                              text: '$currentQuantity',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 14.80.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                model.selectedQuantities[m
                                                        .id!] =
                                                    currentQuantity + 1;
                                                model.notifyListeners();
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                size: 14.0.sp,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 23.0.h),
                                  GestureDetector(
                                    onTap: () {
                                      model.addWholesaleProductToCart(
                                        context,
                                        wholesaleAddToCart:
                                            WholesaleAddToCartEntityModel(
                                              productId: m.id,
                                              quantity: currentQuantity,
                                            ),
                                      );
                                      model.notifyListeners();
                                    },
                                    child: Container(
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
                                      child: model.isLoading
                                          ? SpinKitRing(
                                              color: AppColors.appWhite,
                                              size: 22.0.sp,
                                              lineWidth: 2,
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.cart,
                                                  height: isTablet(context)
                                                      ? 38.40.h
                                                      : 20.h,
                                                  width: isTablet(context)
                                                      ? 38.40.w
                                                      : 20.w,
                                                  color: AppColors.white,
                                                ),
                                                SizedBox(width: 10.w),
                                                TextView(
                                                  text: 'Add to Cart',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'GoogleSans',
                                                    fontSize: 16.90.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                  SizedBox(height: 8.10.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Divider(thickness: .14, color: AppColors.infoGrey),
                ),
                if (model.getListedMarketPlaceResponseModel != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed:
                            model
                                    .getListedMarketPlaceResponseModel!
                                    .data!
                                    .meta!
                                    .page ==
                                1
                            ? () {}
                            : () {
                                model.page--;
                                model.getListedMarketPlace(context);
                              },
                        icon: Icon(
                          Icons.arrow_back,
                          color:
                              model
                                      .getListedMarketPlaceResponseModel!
                                      .data!
                                      .meta!
                                      .page ==
                                  1
                              ? AppColors.primary1.withOpacity(.4)
                              : AppColors.primary1,
                          size: 20.sp,
                        ),
                      ),

                      model.isLoading
                          ? SpinKitFadingCircle(
                              size: 20.sp,
                              color: AppColors.fineGrey,
                            )
                          : TextView(
                              text:
                                  'Page ${model.getListedMarketPlaceResponseModel!.data!.meta!.page} of ${model.getListedMarketPlaceResponseModel!.data!.meta!.totalPages}',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                      IconButton(
                        onPressed:
                            model
                                    .getListedMarketPlaceResponseModel!
                                    .data!
                                    .meta!
                                    .page ==
                                model
                                    .getListedMarketPlaceResponseModel!
                                    .data!
                                    .meta!
                                    .totalPages
                            ? () {}
                            : () {
                                model.page++;
                                model.getListedMarketPlace(context);
                              },
                        icon: Icon(
                          Icons.arrow_forward,
                          color:
                              model
                                      .getListedMarketPlaceResponseModel!
                                      .data!
                                      .meta!
                                      .page ==
                                  model
                                      .getListedMarketPlaceResponseModel!
                                      .data!
                                      .meta!
                                      .totalPages
                              ? AppColors.primary1.withOpacity(.4)
                              : AppColors.primary1,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum Price { all, high, low }

enum Category {
  all,
  analgesics,
  antibiotics,
  vitamins,
  medicaldevices,
  personalcare,
  firstaid,
}
