// ignore_for_file: constant_identifier_names

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/app_validation.dart';
import 'package:medicate_app/core/app_assets/image.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

enum SingingCharacter { fund_card, bank_transfer, mobile_money, USSD, none }

class FundScreen extends StatefulWidget {
  const FundScreen({super.key});

  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
  SingingCharacter? _character = SingingCharacter.none;
  String fundType = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          text: 'Fund Wallet',
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
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 16.20.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 12.w,
                  horizontal: 15.6.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.appWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Transfer to this account to fund your wallet',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15.2.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 23.0.w,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.skyBlue,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cardRow(
                            text1: 'Account number:',
                            text2: '1021213212',
                          ),
                          cardRow(
                            text1: 'Account name:',
                            text2: 'Medic-Eche Oji',
                          ),
                          cardRow(
                            text1: 'Bank name:',
                            text2: 'Wema Bank',
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Other Funding Methods',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 17.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 15.20.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 20.w,
                  horizontal: 15.6.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.appWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Enter Amount',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15.2.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormWidget(
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      label: '',
                      hintSize: 16.60.sp,
                      controller: amountController,
                      inputFormatters: [AmountFormatter()],
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: AppValidator.validateAmount(
                        minAmount: 5000.00,
                        maxAmount: 1000000000,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 20.w,
                            top: 30.w,
                            bottom: 6.w,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.skyBlue,
                                  borderRadius: BorderRadius.circular(7.10.r),
                                ),
                                child: SvgPicture.asset(
                                  AppImage.fund_card,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              TextView(
                                text: 'Fund with Card',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 20.w,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    radioTheme: RadioThemeData(
                                      fillColor:
                                          WidgetStateProperty.resolveWith<
                                            Color
                                          >((states) {
                                            if (states.contains(
                                              WidgetState.selected,
                                            )) {
                                              return AppColors.primary
                                                  .withOpacity(
                                                    0.7,
                                                  ); // active color (a bit faint)
                                            }
                                            return AppColors
                                                .fineGrey; // inactive color (fainter)
                                          }),
                                    ), // inactive color (faint)
                                  ),
                                  child: RadioListTile<SingingCharacter>(
                                    value: SingingCharacter.fund_card,
                                    groupValue: _character,
                                    activeColor: AppColors.primary,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                        fundType = 'Card';
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedLine(
                          direction: Axis.horizontal,
                          lineLength:
                              double.infinity, // To make it span the full width
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: AppColors.dottedGrey,
                          dashGapLength: 4.0,
                          dashGapColor:
                              Colors.transparent, // Or a background color
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 20.w,
                            bottom: 6.w,
                            top: 6.w,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.skyBlue,
                                  borderRadius: BorderRadius.circular(7.10.r),
                                ),
                                child: SvgPicture.asset(
                                  AppImage.bank,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              TextView(
                                text: 'Fund with Bank Transfer',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 20.w,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    radioTheme: RadioThemeData(
                                      fillColor:
                                          WidgetStateProperty.resolveWith<
                                            Color
                                          >((states) {
                                            if (states.contains(
                                              WidgetState.selected,
                                            )) {
                                              return AppColors.primary
                                                  .withOpacity(
                                                    0.7,
                                                  ); // active color (a bit faint)
                                            }
                                            return AppColors
                                                .fineGrey; // inactive color (fainter)
                                          }),
                                    ), // inactive color (faint)
                                  ),
                                  child: RadioListTile<SingingCharacter>(
                                    value: SingingCharacter.bank_transfer,
                                    groupValue: _character,
                                    activeColor: AppColors.primary,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                        fundType = 'Bank Transfer';
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedLine(
                          direction: Axis.horizontal,
                          lineLength:
                              double.infinity, // To make it span the full width
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: AppColors.dottedGrey,
                          dashGapLength: 4.0,
                          dashGapColor:
                              Colors.transparent, // Or a background color
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 20.w,
                            bottom: 6.w,
                            top: 6.w,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.skyBlue,
                                  borderRadius: BorderRadius.circular(7.10.r),
                                ),
                                child: SvgPicture.asset(
                                  AppImage.mobile_money,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              TextView(
                                text: 'Fund with Mobile Money',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 20.w,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    radioTheme: RadioThemeData(
                                      fillColor:
                                          WidgetStateProperty.resolveWith<
                                            Color
                                          >((states) {
                                            if (states.contains(
                                              WidgetState.selected,
                                            )) {
                                              return AppColors.primary
                                                  .withOpacity(
                                                    0.7,
                                                  ); // active color (a bit faint)
                                            }
                                            return AppColors
                                                .fineGrey; // inactive color (fainter)
                                          }),
                                    ), // inactive color (faint)
                                  ),
                                  child: RadioListTile<SingingCharacter>(
                                    value: SingingCharacter.mobile_money,
                                    groupValue: _character,
                                    activeColor: AppColors.primary,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                        fundType = 'Mobile Money';
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedLine(
                          direction: Axis.horizontal,
                          lineLength:
                              double.infinity, // To make it span the full width
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: AppColors.dottedGrey,
                          dashGapLength: 4.0,
                          dashGapColor:
                              Colors.transparent, // Or a background color
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 20.w,
                            top: 6.w,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.skyBlue,
                                  borderRadius: BorderRadius.circular(7.10.r),
                                ),
                                child: SvgPicture.asset(
                                  AppImage.ussd,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              TextView(
                                text: 'Fund with USSD',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 20.w,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    radioTheme: RadioThemeData(
                                      fillColor:
                                          WidgetStateProperty.resolveWith<
                                            Color
                                          >((states) {
                                            if (states.contains(
                                              WidgetState.selected,
                                            )) {
                                              return AppColors.primary
                                                  .withOpacity(
                                                    0.7,
                                                  ); // active color (a bit faint)
                                            }
                                            return AppColors
                                                .fineGrey; // inactive color (fainter)
                                          }),
                                    ), // inactive color (faint)
                                  ),
                                  child: RadioListTile<SingingCharacter>(
                                    value: SingingCharacter.USSD,
                                    groupValue: _character,
                                    activeColor: AppColors.primary,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                        fundType = 'USSD';
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              ButtonWidget(
                border: 100.r,
                buttonColor: AppColors.primary,
                buttonText: 'Fund Wallet',
                color: AppColors.white,
                buttonBorderColor: AppColors.primary,
                onPressed: () {
                  if (formKey.currentState!.validate() && fundType != '') {
                    navigate.navigateTo(
                      Routes.fundWalletPayScreen,
                      arguments: FundWalletPayScreenArguments(
                        screenName: fundType,
                        amount: amountController.text.trim(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 16.30.h),
            ],
          ),
        ),
      ),
    );
  }

  cardRow({
    required String text1,
    required String text2,
    bool isLast = false,
  }) => Container(
    padding: EdgeInsets.only(bottom: !isLast ? 20.w : 0.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          text: text1,
          textStyle: TextStyle(
            fontFamily: 'Arial',
            fontSize: 13.2.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.fineGrey,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextView(
              text: text2,
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 15.4.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(width: 12.w),
            SvgPicture.asset(AppImage.copy, height: 20.h, width: 20.w),
          ],
        ),
      ],
    ),
  );
}

class AmountFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,##0.00', 'en_US');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove any non-digits
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Parse to number and divide by 100 to insert decimal
    double value = double.parse(digits) / 100;

    // Format with commas and 2 decimal places
    String newText = _formatter.format(value);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
