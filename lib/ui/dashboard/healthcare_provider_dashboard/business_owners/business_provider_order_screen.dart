import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/health_care_view_model.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class BusinessProviderOrderScreen extends StatelessWidget {
  const BusinessProviderOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HealthCareViewModel>.reactive(
      viewModelBuilder: () => HealthCareViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, HealthCareViewModel model, _) {
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
              text: 'My Orders',
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
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.w),
            child: Column(
              children: [
                Wrap(
                  spacing: 16.20,
                  runSpacing: 15.20,
                  children: [
                    ...model.myOrderListCategory.map(
                      (e) => GestureDetector(
                        onTap: () {
                          model.orderCategory = e;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.64.w,
                            vertical: 7.2.w,
                          ),
                          decoration: BoxDecoration(
                            color: model.orderCategory == e
                                ? AppColors.primary
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextView(
                            text: e,
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w500,
                              color:model.orderCategory == e
                                ? AppColors.white:AppColors.infoGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
