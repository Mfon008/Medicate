// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

// import '../../../core/app_assets/constant.dart';
// import '../../../core/app_assets/image.dart';
// import '../../../core/config/colors.dart';
// import '../../dashboard/profile/wallet/wallet_card_widget.dart';
// import '../../widget/button.dart';
// import '../../widget/text.dart';

// class ProductWalletScreen extends StatelessWidget {
//   const ProductWalletScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     bool isTablet(BuildContext context) =>
//         MediaQuery.of(context).size.shortestSide >= 600;
//     // return ViewModelBuilder<AuthViewModel>.reactive(
//     //   viewModelBuilder: () => AuthViewModel(),
//     //   onViewModelReady: (model) {
//     //     model.getWalletBalance(context);
//     //     model.getWalletTransactionHistory(context);
//     //   },
//     //   disposeViewModel: false,
//     //   builder: (_, AuthViewModel model, _) {
//         return Scaffold(
//           backgroundColor: AppColors.dashboard,
//           appBar: AppBar(
//         backgroundColor: AppColors.white,
//         automaticallyImplyLeading: false,
//         toolbarHeight: 80.0,
//         title: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 1.0.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: AppColors.inactive.withValues(alpha: .1),
//                   border: Border.all(
//                     color: AppColors.inactive.withValues(alpha: .4),
//                   ),
//                 ),
//                 child: IconButton(
//                   icon: SvgPicture.asset(
//                     AppImage.burger,
//                     color: AppColors.primary,
//                     height: isTablet(context) ? 32.h : 12.h,
//                     width: isTablet(context) ? 32.w : 12.w,
//                   ),
//                   onPressed: () {},
//                   // onPressed: () => navigate.navigateTo(
//                   //   Routes.moreScreen,
//                   // ), // makes ripple effect round
//                 ),
//               ),
//               SvgPicture.asset(AppImage.applogoSvg, height: 28.h, width: 28.w),
//               Container(
//                 margin: EdgeInsets.only(right: 2.4.w),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: AppColors.inactive.withValues(alpha: .1),
//                   border: Border.all(
//                     color: AppColors.inactive.withValues(alpha: .4),
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     IconButton(
//                       icon: SvgPicture.asset(
//                         AppImage.bell,
//                         height: isTablet(context) ? 40.h : 20.h,
//                         width: isTablet(context) ? 40.w : 20.w,
//                         color: AppColors.primary,
//                       ),
//                       onPressed: () {},
//                       // onPressed: () =>
//                       //     navigate.navigateTo(Routes.notificationScreen),
//                       splashRadius: 28,
//                     ),
//                     // model.getUnreadNotificationCountModel != null &&
//                     //         model
//                     //                 .getUnreadNotificationCountModel!
//                     //                 .data!
//                     //                 .count! >
//                     //             0
//                     //     ? Positioned(
//                     //         left: 28,
//                     //         top: 8,
//                     //         child: Container(
//                     //           padding: EdgeInsets.all(3.14.w),
//                     //           decoration: BoxDecoration(
//                     //             color: AppColors.appRed.withOpacity(.88),
//                     //             shape: BoxShape.circle,
//                     //           ),
//                     //         ),
//                     //       )
//                     //     : SizedBox.shrink(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//           body: RefreshIndicator(
//             onRefresh: () async {
//               // await model.getWalletBalance(context);
//               // await model.getWalletTransactionHistory(context);
//             },
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(vertical: 32.0.w, horizontal: 20.w),
//               child: Column(
//                 children: [
//                   WalletCard(),
//                   SizedBox(height: 20.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextView(
//                         text: 'Recent Transactions',
//                         textStyle: TextStyle(
//                           fontFamily: 'GoogleSans',
//                           fontSize: 17.2.sp,
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.black,
//                         ),
//                       ),
//                       GestureDetector(
//                         // onTap: () =>
//                         //     navigate.navigateTo(Routes.transactionScreen),
//                         child: TextView(
//                           text: 'See all',
//                           textStyle: TextStyle(
//                             fontFamily: 'GoogleSans',
//                             fontSize: 13.9.sp,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 4.w),
//                     decoration: BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(12.r),
//                         topRight: Radius.circular(12.r),
//                         bottomLeft: Radius.circular(12.r),
//                         bottomRight: Radius.circular(12.r),
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         // if (model.isLoading)
//                         //   SpinKitThreeBounce(
//                         //     color: AppColors.primary.withOpacity(.5),
//                         //     size: 34,
//                         //   ),

//                         if (model.getWalletTransactionHistoryResponseModel !=
//                                 null &&
//                             model
//                                     .getWalletTransactionHistoryResponseModel!
//                                     .data !=
//                                 null &&
//                             model
//                                     .getWalletTransactionHistoryResponseModel!
//                                     .data!
//                                     .transactions !=
//                                 null &&
//                             model
//                                 .getWalletTransactionHistoryResponseModel!
//                                 .data!
//                                 .transactions!
//                                 .isNotEmpty)
//                           ...model
//                               .getWalletTransactionHistoryResponseModel!
//                               .data!
//                               .transactions!
//                               .take(10)
//                               .toList()
//                               .asMap()
//                               .entries
//                               .map((entry) {
//                                 final index = entry.key;
//                                 final e = entry.value;

//                                 final isLast =
//                                     index ==
//                                     model
//                                             .getWalletTransactionHistoryResponseModel!
//                                             .data!
//                                             .transactions!
//                                             .length -
//                                         1;
//                                 return GestureDetector(
//                                   // onTap: () => navigate.navigateTo(
//                                   //   Routes.transactionScreen,
//                                   // ),
//                                   child: Container(
//                                     padding: EdgeInsets.only(bottom: 12.w),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.transparent,
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Container(
//                                               padding: EdgeInsets.all(10.0.w),
//                                               decoration: BoxDecoration(
//                                                 color: e.type == 'DEBIT'
//                                                     ? AppColors.appRed
//                                                           .withValues(alpha: .1)
//                                                     : AppColors.green
//                                                           .withValues(alpha: .1),
//                                                 borderRadius:
//                                                     BorderRadius.circular(8.r),
//                                               ),
//                                               child: SvgPicture.asset(
//                                                 e.type == 'DEBIT'
//                                                     ? AppImage.up_stroke
//                                                     : AppImage.down_stroke,
//                                                 height: 13.90.h,
//                                                 width: 13.90.w,
//                                               ),
//                                             ),
//                                             SizedBox(width: 20.w),
//                                             SizedBox(
//                                               width: 120.w,
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   TextView(
//                                                     text: e.type == 'DEBIT'
//                                                         ? 'Debit Wallet'
//                                                         : 'Wallet Funded',

//                                                     textStyle: TextStyle(
//                                                       fontFamily: 'Arial',
//                                                       fontSize: 14.9.sp,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       color: AppColors.black,
//                                                     ),
//                                                   ),
//                                                   TextView(
//                                                     text:
//                                                         DateFormat(
//                                                           'dd MMM yyyy',
//                                                         ).format(
//                                                           DateTime.parse(
//                                                             e.createdAt!,
//                                                           ),
//                                                         ),

//                                                     maxLines: 1,
//                                                     textOverflow:
//                                                         TextOverflow.ellipsis,
//                                                     textStyle: TextStyle(
//                                                       fontFamily: 'Arial',
//                                                       fontSize: 13.5.sp,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       color: AppColors.infoGrey,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Align(
//                                                 alignment: Alignment.topRight,
//                                                 child: TextView(
//                                                   text: formatNaira(
//                                                     int.parse(e.amount ?? "0"),
//                                                   ),
//                                                   textStyle: TextStyle(
//                                                     fontFamily: 'GoogleSans',
//                                                     fontSize: 13.5.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: AppColors.reminder,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         if (!isLast) SizedBox(height: 10),
//                                         if (!isLast)
//                                           DottedLine(
//                                             direction: Axis.horizontal,
//                                             lineLength: double
//                                                 .infinity, // To make it span the full width
//                                             lineThickness: 1.0,
//                                             dashLength: 4.0,
//                                             dashColor: AppColors.dottedGrey,
//                                             dashGapLength: 4.0,
//                                             dashGapColor: Colors
//                                                 .transparent, // Or a background color
//                                           ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               }),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//     //   },
//     // );
//   }
// }
