// ignore_for_file: must_be_immutable, deprecated_member_use, use_build_context_synchronously
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/constant.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import 'wallet_card_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        model.getWalletBalance(context);
        model.getWalletTransactionHistory(context);
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
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
              text: 'Wallet',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await model.getWalletBalance(context);
              await model.getWalletTransactionHistory(context);
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 32.0.w, horizontal: 20.w),
              child: Column(
                children: [
                  WalletCard(model: model),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Recent Transactions',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 17.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            navigate.navigateTo(Routes.transactionScreen),
                        child: TextView(
                          text: 'See all',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 13.9.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 4.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        
                        if (model.isLoading)
                          SpinKitThreeBounce(
                            color: AppColors.primary.withOpacity(.5),
                            size: 34,
                          ),

                        if (model.getWalletTransactionHistoryResponseModel !=
                                null &&
                            model
                                    .getWalletTransactionHistoryResponseModel!
                                    .data !=
                                null &&
                            model
                                    .getWalletTransactionHistoryResponseModel!
                                    .data!
                                    .transactions !=
                                null &&
                            model
                                .getWalletTransactionHistoryResponseModel!
                                .data!
                                .transactions!
                                .isNotEmpty)
                          ...model
                              .getWalletTransactionHistoryResponseModel!
                              .data!
                              .transactions!
                              .take(10)
                              .toList()
                              .asMap()
                              .entries
                              .map((entry) {
                                final index = entry.key;
                                final e = entry.value;

                                final isLast =
                                    index ==
                                    model
                                            .getWalletTransactionHistoryResponseModel!
                                            .data!
                                            .transactions!
                                            .length -
                                        1;
                                return GestureDetector(
                                  onTap: () => navigate.navigateTo(
                                    Routes.transactionScreen,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      color: AppColors.transparent,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10.0.w),
                                              decoration: BoxDecoration(
                                                color: e.type == 'DEBIT'
                                                    ? AppColors.appRed
                                                          .withOpacity(.1)
                                                    : AppColors.green
                                                          .withOpacity(.1),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: SvgPicture.asset(
                                                e.type == 'DEBIT'
                                                    ? AppImage.up_stroke
                                                    : AppImage.down_stroke,
                                                height: 13.90.h,
                                                width: 13.90.w,
                                              ),
                                            ),
                                            SizedBox(width: 20.w),
                                            SizedBox(
                                              width: 120.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextView(
                                                    text: e.type == 'DEBIT'
                                                        ? 'Debit Wallet'
                                                        : 'Wallet Funded',

                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.9.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                  TextView(
                                                    text:
                                                        DateFormat(
                                                          'dd MMM yyyy',
                                                        ).format(
                                                          DateTime.parse(
                                                            e.createdAt!,
                                                          ),
                                                        ),

                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 13.5.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.infoGrey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: TextView(
                                                  text: formatNaira(
                                                    int.parse(e.amount ?? "0"),
                                                  ),
                                                  textStyle: TextStyle(
                                                    fontFamily: 'GoogleSans',
                                                    fontSize: 13.5.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (!isLast) SizedBox(height: 10),
                                        if (!isLast)
                                          DottedLine(
                                            direction: Axis.horizontal,
                                            lineLength: double
                                                .infinity, // To make it span the full width
                                            lineThickness: 1.0,
                                            dashLength: 4.0,
                                            dashColor: AppColors.dottedGrey,
                                            dashGapLength: 4.0,
                                            dashGapColor: Colors
                                                .transparent, // Or a background color
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
