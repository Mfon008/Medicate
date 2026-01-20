// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text.dart';

class HMOKycScreen extends StatelessWidget {
  const HMOKycScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          text: 'KYC',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
        child: ViewModelBuilder<HMOViewModel>.reactive(
          viewModelBuilder: () => HMOViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getTenant(context);
              await model.getHMOKyc(context);
              model.hmoKycStatus();
              model.bankNameController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .bankName ??
                  '';
              model.accountNameController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .accountName ??
                  '';
              model.accountNumberController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .accountNumber ??
                  '';
            });
          },
          disposeViewModel: false,
          builder: (_, HMOViewModel model, _) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 22.w,
                    horizontal: 24.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      model.kycLevelWidget(
                        level: '1',
                        onTap: () {
                          model.levelKyc = 1;
                          model.firstLevelKyc = !model.firstLevelKyc;
                          model.secondLevelKyc = false;
                          model.thirdLevelKyc = false;
                          model.notifyListeners();
                        },
                        contxt: context,
                      ),
                      model.kycLevelWidget(
                        level: '2',
                        onTap: () {
                          model.levelKyc = 2;
                          model.secondLevelKyc = !model.secondLevelKyc;
                          model.thirdLevelKyc = false;
                          model.firstLevelKyc = false;
                          model.notifyListeners();
                        },
                        contxt: context,
                      ),
                      model.kycLevelWidget(
                        level: '3',
                        onTap: () {
                          model.levelKyc = 3;
                          model.thirdLevelKyc = !model.thirdLevelKyc;
                          model.secondLevelKyc = false;
                          model.firstLevelKyc = false;
                          model.notifyListeners();
                        },
                        contxt: context,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
