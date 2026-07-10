// ignore_for_file: must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/constant.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) async {
        await model.getWalletTransactionHistory(context);
        model.transactions =
            model.getWalletTransactionHistoryResponseModel!.data!.transactions!;

        model.groupedTransactions = model.groupTransactionsByDate(
          model.transactions,
        );
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.grey,
          appBar: AppBar(
            backgroundColor: AppColors.appWhite,
            surfaceTintColor: Colors.transparent, // removes Material3 tint
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(14.w),
              child: GlobalNavigator(),
            ),
            title: TextView(
              text: 'Transaction History',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.isLoading)
                  SpinKitThreeBounce(
                    color: AppColors.primary.withOpacity(.5),
                    size: 34,
                  ),
                if (model.groupedTransactions != null)
                  ...model.groupedTransactions.entries.map((group) {
                    final date = DateTime.parse(group.key);
                    final txList = group.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 📅 Date Header
                        Padding(
                          padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
                          child: TextView(
                            text: DateFormat('dd MMM, yyyy').format(date),
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.infoGrey,
                            ),
                          ),
                        ),

                        // Transactions for that date
                        ...txList.asMap().entries.map((entry) {
                          final index = entry.key;
                          final e = entry.value;
                          final isFirst = index == 0;
                          final isLast = index == txList.length - 1;

                          return profileContainer(
                            topLeft: isFirst ? 12 : 0,
                            topRight: isFirst ? 12 : 0,
                            bottomLeft: isLast ? 12 : 0,
                            bottomRight: isLast ? 12 : 0,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0.w),
                                  decoration: BoxDecoration(
                                    color: e.type == 'DEBIT'
                                        ? AppColors.appRed.withOpacity(.1)
                                        : AppColors.green.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: SvgPicture.asset(
                                    e.type == 'DEBIT'
                                        ? AppImage.up_stroke
                                        : AppImage.down_stroke,
                                    height: 13.9.h,
                                    width: 13.9.w,
                                  ),
                                ),
                                SizedBox(width: 20.w),

                                // Title + Time
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: e.type == 'DEBIT'
                                          ? 'Debit Wallet'
                                          : 'Wallet Funded',
                                      textStyle: TextStyle(
                                        fontSize: 14.9.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    TextView(
                                      text: DateFormat(
                                        'hh:mm a',
                                      ).format(DateTime.parse(e.createdAt!)),
                                      textStyle: TextStyle(
                                        fontSize: 13.5.sp,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                  ],
                                ),

                                Spacer(),

                                TextView(
                                  text: formatNaira(int.parse(e.amount ?? "0")),
                                  textStyle: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.reminder,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    );
                  }),
              ],
            ),
          ),
        );
      },
    );
  }

  GestureDetector profileContainer({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    Widget? child,
    Function()? onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(15.8.w),
      margin: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft.r),
          topRight: Radius.circular(topRight.r),
          bottomLeft: Radius.circular(bottomLeft.r),
          bottomRight: Radius.circular(bottomRight.r),
        ),
      ),
      child: child,
    ),
  );
}
