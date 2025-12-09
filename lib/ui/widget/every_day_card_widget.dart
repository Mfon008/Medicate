import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/widget/medicate_enum.dart';
import 'package:medicate_app/ui/widget/text.dart';

// ignore: must_be_immutable
class EverydayUserCard extends StatelessWidget {
  EverydayUserCard({
    super.key,
    required this.imge,
    required this.text,
    required this.text2,
    required this.userType,
    required this.selectedUserType,
    required this.onTap,
  });
  String? imge;
  String? text;
  String? text2;
  final UserType userType;
  final UserType? selectedUserType;
  final ValueChanged<UserType> onTap;

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedUserType == userType;
    return GestureDetector(
      onTap: () => onTap(userType),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child:Column(
          children:[
             Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
                child: Center(
                  child: Image.asset(
                    imge ?? "", // Replace with your image path
                    height: 140.h,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),

            // Right text
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 2.20.w,
                  bottom: 2.20.w,
                  right: 10.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(
                      text: text ?? '',
                      letterSpacing: 0,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                        fontFamily: 'GoogleSans',
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 3.4),
                    TextView(
                      text: text2 ?? '',
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 12.82.sp,
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: isSelected && selectedUserType==UserType.healthCare? 20.h:0.h),
         isSelected && selectedUserType==UserType.healthCare?
         Column(
          children:[
            tapOnHealthCareProviderType(text:'Hospital & Clinic',onTap:()=>navigate.navigateTo(Routes.healthCareHospitalAndClinicSignUpScreen)),
            SizedBox(height:10.h),
            tapOnHealthCareProviderType(text:'Doctors/Specialist',onTap:(){}),
            SizedBox(height:12.h),
          ]
         ):SizedBox.shrink()

          ]
        )
      ),
    );
  }

  GestureDetector tapOnHealthCareProviderType({String? text, onTap})=>GestureDetector(onTap:onTap,child:Container(
          width:double.infinity,
          margin:EdgeInsets.only(
                  left: 14.w,
                  right: 14.w,
                ),
          padding:EdgeInsets.symmetric(vertical:12.w),
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(8.0),
                  border:Border.all(color:AppColors.infoGrey1)
                ),child:Center(child:TextView(
                      text: text!,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color:AppColors.reminder
                      ),
                    ),)));
}
