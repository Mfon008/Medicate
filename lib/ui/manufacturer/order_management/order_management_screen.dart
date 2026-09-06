// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class OrderManagementScreen extends StatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  State<OrderManagementScreen> createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  List<String> statusList = [
    'All',
    'Pending',
    'Confirmed',
    'Packaging',
    'In Transit',
    'Delivered',
    'Cancelled',
  ];

  String s = 'All';

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<ManufacturerViewModel>.reactive(
      viewModelBuilder: () => ManufacturerViewModel(),
      onViewModelReady: (model) {
        model.listIncomingOrder(context, status: s);
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, ManufacturerViewModel model, _) {
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
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Order management',
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
                      "Track incoming orders and move them through fulfilment. Status changes update the customer's dashboard in real time.",
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 14.20.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet(context) ? 16.w : 13.0.w,
                    vertical: isTablet(context) ? 12.w : 9.2.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppImage.download_icon,
                        height: 13.8.h,
                        width: 14.8.w,
                      ),
                      SizedBox(width: 6.w),
                      TextView(
                        text: 'Export CSV',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.22.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.w,
                    horizontal: 12.4.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.infoGrey1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormWidget(
                        label: 'Search by products',
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
                        controller: model.searchProductController,
                        prefixWidget: model.isLoading
                            ? SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: Center(
                                  child: SpinKitFadingCircle(
                                    color: AppColors.infoGrey,
                                    size: 18.sp,
                                  ),
                                ),
                              )
                            : Padding(
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
                          model.debouncer.run(() {
                            model.listIncomingOrder(
                              context,
                              status: s,
                              search: value.trim(),
                            );
                          });
                          model.searchProductController!.text = value;
                          model.notifyListeners();
                        },
                      ),
                      SizedBox(height: 14.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 2.w,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 4.w),
                            TextView(
                              text: 'Status: ',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14.22.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                            TextView(
                              text: s,
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14.22.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                _showStatusListMenu(context:context, model:model);
                                model.notifyListeners();
                                
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 20.0.sp,
                                color: AppColors.infoGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 14.h),

                      if (model.listIncomingOrdersResponseModel != null &&
                          model
                              .listIncomingOrdersResponseModel!
                              .data!
                              .orders!
                              .isEmpty)
                        Center(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(14.w),
                                decoration: BoxDecoration(
                                  color: AppColors.infoGrey1,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  AppImage.manu_order,
                                  color: AppColors.infoGrey,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextView(
                                text: 'No orders yet',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 14.90.sp,
                                  color: AppColors.infoGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                      if (model.listIncomingOrdersResponseModel != null &&
                          model
                              .listIncomingOrdersResponseModel!
                              .data!
                              .orders!
                              .isNotEmpty)
                        ...model.listIncomingOrdersResponseModel!.data!.orders!.map(
                          (ord) => GestureDetector(
                            onTap: () => navigate.navigateTo(
                              Routes.viewOrderManagementScreen,
                              arguments: ViewOrderManagementScreenArguments(
                                id: ord.id.toString(),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 14.w),
                              padding: EdgeInsets.symmetric(
                                vertical: 15.22.w,
                                horizontal: 13.0.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(color: AppColors.infoGrey1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicWidth(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.w,
                                        horizontal: 12.0.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.fadedyellow,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: TextView(
                                          text: 'Pending',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 12.2.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.yellow,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.2.h),
                                  TextView(
                                    text: ord.orderNumber ?? '',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 16.22.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                  SizedBox(height: 8.2.h),
                                  TextView(
                                    text:
                                        '${ord.customer?.address}, ${ord.customer?.lga}, ${ord.customer?.state}'
                                            .capitalizeWords(),
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.22.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder,
                                      letterSpacing: -0.52,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextView(
                                            text: 'No of items',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 15.22.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.infoGrey,
                                              letterSpacing: -0.92,
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          TextView(
                                            text: '${ord.itemsOrdered}',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 15.22.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextView(
                                              text: 'Total',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.22.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.infoGrey,
                                                letterSpacing: -0.92,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            TextView(
                                              text: formatNaira(
                                                ord.orderTotal!.toDouble(),
                                              ),
                                              maxLines: 1,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.22.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextView(
                                            text: 'Date',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 15.22.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.infoGrey,
                                              letterSpacing: -0.92,
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          TextView(
                                            text: formatDateNoTime(
                                              ord.dateOrdered!.toString(),
                                            ),
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 15.22.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.20.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Payment Status',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 15.22.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.infoGrey,
                                          letterSpacing: -0.92,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),

                                      IntrinsicWidth(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 2.w,
                                            horizontal: 12.0.w,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.fadedyellow,
                                            borderRadius: BorderRadius.circular(
                                              12.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: TextView(
                                              text: 'Pending',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 12.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.yellow,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.20.h),
                                  GestureDetector(
                                    onTap: () => navigate.navigateTo(
                                      Routes.viewOrderManagementScreen,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.42,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          40.r,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            AppImage.van,
                                            height: isTablet(context)
                                                ? 28.40.h
                                                : 14.20.h,
                                            width: isTablet(context)
                                                ? 28.40.w
                                                : 14.20.w,
                                            color: AppColors.primary,
                                          ),
                                          SizedBox(width: 7.10.w),
                                          TextView(
                                            text: 'Advance',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.0.h),
                                ],
                              ),
                            ),
                          ),
                        ),

                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 6.w, right: 6.w),
                        child: Divider(
                          color: AppColors.infoGrey,
                          height: 1.h,
                          thickness: 0.2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      model.listIncomingOrdersResponseModel != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed:
                                      model
                                              .listIncomingOrdersResponseModel!
                                              .data!
                                              .meta!
                                              .page ==
                                          1
                                      ? () {}
                                      : () {
                                          model.page--;
                                          model.listIncomingOrder(
                                            context,
                                            status: s,
                                          );
                                          model.notifyListeners();
                                        },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color:
                                        model
                                                .listIncomingOrdersResponseModel!
                                                .data!
                                                .meta!
                                                .page ==
                                            1
                                        ? AppColors.primary1.withOpacity(.3)
                                        : AppColors.primary,
                                    size: 20.sp,
                                  ),
                                ),
                                model.isLoading
                                    ? SpinKitRing(
                                        color: AppColors.primary,
                                        size: 22.90.sp,
                                        lineWidth: 4,
                                      )
                                    : TextView(
                                        text:
                                            'Page ${model.listIncomingOrdersResponseModel?.data?.meta?.page} of ${model.listIncomingOrdersResponseModel?.data?.meta?.totalPages}',
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
                                              .listIncomingOrdersResponseModel!
                                              .data!
                                              .meta!
                                              .page ==
                                          model
                                              .listIncomingOrdersResponseModel!
                                              .data!
                                              .meta!
                                              .totalPages
                                      ? () {}
                                      : () {
                                          model.page++;

                                          model.listIncomingOrder(
                                            context,
                                            status: s,
                                          );
                                          model.notifyListeners();
                                        },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color:
                                        model
                                                .listIncomingOrdersResponseModel!
                                                .data!
                                                .meta!
                                                .page ==
                                            model
                                                .listIncomingOrdersResponseModel!
                                                .data!
                                                .meta!
                                                .totalPages
                                        ? AppColors.primary1.withOpacity(.3)
                                        : AppColors.primary,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            )
                          : SizedBox.shrink(),
                      SizedBox(height: 2.0.h),
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

  void _showStatusListMenu({BuildContext? context, ManufacturerViewModel? model}) async {
    final RenderBox overlay =
        Overlay.of(context!).context.findRenderObject() as RenderBox;

    final double popupWidth = 250.w;
    final double rightMargin = 10.w;

    // Approximate height of the popup
    final double popupHeight = 300.h;

    // Vertically center the popup
    final double top = (overlay.size.height - popupHeight) / 2;

    final RelativeRect menuPosition = RelativeRect.fromLTRB(
      overlay.size.width - popupWidth - rightMargin,
      top,
      rightMargin,
      top,
    );

    // Keep the currently selected value
    String selectedStatus = s;

    await showMenu(
      context: context,
      position: menuPosition,
      color: AppColors.white,
      elevation: .8,

      items: [
        PopupMenuItem(
          enabled: false,
          padding: EdgeInsets.zero,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // HEADER
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextView(
                        text: 'Status',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.infoGrey,
                        ),
                      ),
                    ),
                  ),

                  // STATUS LIST
                  ...statusList.map((e) {
                    final bool isSelected = selectedStatus == e;

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        // Update ONLY the local popup state first
                        menuSetState(() {
                          selectedStatus = e;
                        });

                        // Update your actual page state
                        setState(() {
                          s = e;
                        });

                        model!.listIncomingOrder(context, status: model.getFilterTextOrder(s),search: model.searchProductController!.text.trim());
                        model.notifyListeners();

                        // Allow the user to see the selected state
                        await Future.delayed(const Duration(milliseconds: 300));

                        // Close popup
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8.w,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.skyBlue
                              : AppColors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.cool_blue
                                : AppColors.transparent,
                          ),
                        ),
                        child: TextView(
                          text: e,
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.reminder,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
