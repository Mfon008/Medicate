// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';

class HmoPortalScreen extends StatefulWidget {
  const HmoPortalScreen({super.key});

  @override
  State<HmoPortalScreen> createState() => _HmoPortalScreenState();
}

class _HmoPortalScreenState extends State<HmoPortalScreen> {
  List<HMOPortalClass> hmoPortalList = [
    HMOPortalClass(
      title: 'Applications',
      call: () => navigate.navigateTo(Routes.hmoApplicationPortalScreen),
      image: AppImage.portal_app,
    ),
    HMOPortalClass(
      title: 'Subscribers',
      call: () => navigate.navigateTo(Routes.hmoSubscribersPortalScreen),
      image: AppImage.subscription,
    ),
    HMOPortalClass(
      title: 'Hospital Network',
      call: () => navigate.navigateTo(Routes.hmoHospitalNetworkPortalScreen),
      image: AppImage.hospital_net,
    ),
    HMOPortalClass(title: 'Renewals', call: () =>navigate.navigateTo(Routes.hmoRenewalPortalScreen), image: AppImage.renew),
    HMOPortalClass(title: 'Claims', call: () =>navigate.navigateTo(Routes.hmoClaimsPortalScreen), image: AppImage.light_claims),
    HMOPortalClass(
      title: 'Settlements',
      call: ()=>navigate.navigateTo(Routes.hmoSettlementPortalScreen),
      image: AppImage.settlements,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
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
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.burger,
                    color: AppColors.primary,
                    height: isTablet(context) ? 32.h : 12.h,
                    width: isTablet(context) ? 32.w : 12.w,
                  ),
                  onPressed: () => navigate.navigateTo(
                    Routes.hMOMoreScreen,
                  ), // makes ripple effect round
                ),
              ),
              TextView(
                text: 'HMO Portal',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deep,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 2.4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.bell,
                    height: isTablet(context) ? 40.h : 20.h,
                    width: isTablet(context) ? 40.w : 20.w,
                    color: AppColors.primary,
                  ),
                  onPressed: () {},
                  splashRadius: 28,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 16.0.w),
        child: Column(
          children: [
            ...hmoPortalList.map(
              (e) => GestureDetector(
                onTap: () {
                  e.call();
                  setState(() {});
                },
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.only(bottom: 12.w),
                  shadowColor: AppColors.grey,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 26.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          e.image,
                          color: AppColors.primary,
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(width: 12.w),
                        TextView(
                          text: e.title,
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.reminder,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          AppImage.arrow,
                          width: 10.w,
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HMOPortalClass {
  final String title;
  final Function() call;
  final String image;

  HMOPortalClass({
    required this.title,
    required this.call,
    required this.image,
  });
}
