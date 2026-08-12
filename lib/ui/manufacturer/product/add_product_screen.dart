import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/ui/manufacturer/product/custom_switch_widget.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<TextEditingController> vPriceController = [TextEditingController()];

  List<TextEditingController> ppuController = [TextEditingController()];

  bool isSwitched = false;
  List<String> categoryList = [
    'All',
    'Prescription',
    'Over the Counter',
    'Vitamins & Supplements',
    'First Aid',
    'Personal Care',
    'Medical Devices',
  ];
  String c = '';

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
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
          text: 'Add New product',
          textStyle: TextStyle(
            fontFamily: 'DMSans',
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.deep,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 13.20.w, vertical: 23.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.20.w, vertical: 23.0.w),
          decoration: BoxDecoration(
            color: AppColors.appWhite,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormWidget(
                hint: 'Product Name',
                label: 'Enter product name',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.0.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Description',
                label: 'Enter product description',
                maxline: 4,
                alignLabelWithHint: true,
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.grey,
                isFilled: true,
                validator: AppValidator.validateString(),
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Category',
                label: '--Select--',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: c == '' ? AppColors.infoGrey:AppColors.reminder,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(text: c),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
                suffixWidget: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.48.w),
                    child: GestureDetector(
                      onTap: () => _showCategoryMenu(context),
                      child: SvgPicture.asset(AppImage.arrow_down),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'SKU',
                label: '',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Pack size',
                label: '',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Unit',
                label: '',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'MOQ (Minimum Order Quantity)',
                label: '',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Price / unit (₦)',
                label: '',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Stock',
                label: '',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 30.h),
              TextView(
                text: 'Batch & Registration Details',
                textStyle: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.reminder,
                  letterSpacing: -0.12,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(color: AppColors.infoGrey, height: 1.h, thickness: 0.2),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 21.w, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(11.0.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImage.validate,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 5.10.h),
                        TextView(
                          text: 'NAFDAC Registration Number',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(width: 5.10.h),
                        TextView(
                          text: '*',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.68.h),
                    Padding(
                      padding: EdgeInsets.only(right: 13.0.w),
                      child: TextFormWidget(
                        label: 'e.g. 04-9214, 01-9981..',
                        borderColor: AppColors.transparent,
                        borderTopLeft: 22.r,
                        borderTopRight: 22.r,
                        borderBottomLeft: 22.r,
                        borderBottomRight: 22.r,
                        hintSize: isTablet(context) ? 6.82.sp : 14.60.sp,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'DMSans',
                          fontSize: 14.sp,
                          color: AppColors.infoGrey,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'DMSans',
                          fontSize: 16.sp,
                          color: AppColors.infoGrey,
                        ),
                        fillColor: AppColors.white,
                        isFilled: true,
                        readOnly: true,
                        controller: TextEditingController(),
                        validator: AppValidator.validateString(),
                        onChange: (p0) {},
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 13.0.w,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Center(
                        child: TextView(
                          text: 'Verify ID',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.90.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Batch Number',
                label: '',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                hintWeight: FontWeight.w500,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              TextFormWidget(
                hint: 'Serial Number',
                label: '',
                borderColor: AppColors.transparent,
                borderTopLeft: 10.r,
                borderTopRight: 10.r,
                borderBottomLeft: 10.r,
                borderBottomRight: 10.r,
                hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 14.sp,
                  color: AppColors.infoGrey,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  fontSize: 16.sp,
                  color: AppColors.infoGrey,
                ),
                fillColor: AppColors.dashboard,
                isFilled: true,
                readOnly: true,
                controller: TextEditingController(),
                validator: AppValidator.validateString(),
                onChange: (p0) {},
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormWidget(
                      hint: 'Manufactured Date',
                      label: '',
                      letterSpacing: -0.2,
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintWeight: FontWeight.w500,
                      hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 14.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 14.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      readOnly: true,
                      controller: TextEditingController(),
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                      suffixWidget: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(AppImage.calendar),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.60.w),
                  Expanded(
                    child: TextFormWidget(
                      hint: 'Expiry Date',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 6.82.sp : 16.80.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 14.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      readOnly: true,
                      controller: TextEditingController(),
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},

                      suffixWidget: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(AppImage.calendar),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: 'Product Image',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(width: 5.10.h),
                  TextView(
                    text: '*',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    dashPattern: [10, 10],
                    strokeWidth: .94,
                    radius: Radius.circular(10),
                    color: AppColors.primary,
                  ),
                  child: GestureDetector(
                    // onTap: () => model.pickImageMeansIdPractitioner(context),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 19.30.w,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.white,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.upload_doc,
                            height: 20.h,
                            width: 20.h,
                          ),
                          SizedBox(width: 12.20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Upload image',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 14.2.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.reminder,
                                ),
                              ),
                              SizedBox(height: 2.0.h),
                              SizedBox(
                                width: 220.w,
                                child: TextView(
                                  text:
                                      'Max file size: 2MB (.jpg, .jpeg, .png, or .pdf supported)',
                                  maxLines: 2,
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 13.6.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.fineGrey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.0.h),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: 'Volume Pricing',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(width: 5.10.h),
                  TextView(
                    text: '*',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 21.w, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(11.0.r),
                ),
                child: Column(
                  children: [
                    ...List.generate(
                      vPriceController.length,
                      (index) => Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.grey,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextFormWidget(
                                hint: 'Volume Quantity',
                                label: '',
                                letterSpacing: -0.21,
                                hintSize: 16.80.sp,
                                hintWeight: FontWeight.w300,
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                  fontSize: 14.sp,
                                  color: AppColors.infoGrey,
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                  fontSize: 16.sp,
                                  color: AppColors.infoGrey,
                                ),
                                // readOnly:
                                fillColor: AppColors.appWhite,
                                isFilled: true,
                                controller: vPriceController[index],
                                validator: AppValidator.validateString(),
                                onChange: (p0) {},
                              ),
                            ),
                            SizedBox(width: 13.20.w),
                            Expanded(
                              child: TextFormWidget(
                                hint: 'Price per Unit(₦)',
                                label: '0.00',
                                letterSpacing: -0.21,
                                hintSize: 16.80.sp,
                                hintWeight: FontWeight.w300,
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                  fontSize: 14.sp,
                                  color: AppColors.infoGrey,
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                  fontSize: 16.sp,
                                  color: AppColors.infoGrey,
                                ),
                                fillColor: AppColors.appWhite,
                                isFilled: true,
                                controller: ppuController[index],
                                validator: AppValidator.validateString(),
                                onChange: (p0) {},
                              ),
                            ),
                            SizedBox(
                              width: ppuController.length > 1 ? 10.h : 0.h,
                            ),
                            ppuController.length > 1
                                ? Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 20.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            vPriceController.removeAt(index);
                                            ppuController.removeAt(index);
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          AppImage.delete,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        vPriceController.add(TextEditingController());
                        ppuController.add(TextEditingController());
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary1,
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20.sp,
                          color: AppColors.white,
                          weight: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomSwitch(
                    value: isSwitched,
                    onChanged: (bool val) {
                      setState(() {
                        isSwitched = val;
                      });
                    },
                  ),
                  SizedBox(width: 6.10.h),
                  TextView(
                    text: 'Published (visible on markplace)',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.reminder,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 14.30.w,
                  horizontal: 20.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(52.r),
                ),
                child: Center(
                  child: TextView(
                    text: 'Create Product',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 17.90.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.30.h),
            ],
          ),
        ),
      ),
    );
  }

  void _showCategoryMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final Offset position = button.localToGlobal(
      Offset.zero,
      ancestor: overlay,
    );

    final double buttonRight = position.dx + button.size.width;

    final RelativeRect menuPosition = RelativeRect.fromLTRB(
      buttonRight - 250.w, // popup width
      position.dy + button.size.height,
      overlay.size.width - buttonRight,
      0,
    );

    String? selectedCategory = c;

    await showMenu(
      context: context,
      position: menuPosition,
      color: AppColors.white,
      elevation: 0,
      items: [
        PopupMenuItem(
          enabled: false,
          padding: EdgeInsets.zero,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextView(
                        text: 'Category',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.infoGrey,
                        ),
                      ),
                    ),
                  ),

                  ...categoryList.map((e) {
                     final bool isSelected = selectedCategory == e;
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        // Update the main screen immediately
                        setState(() {
                          c = e;
                        });

                        // Rebuild the popup itself
                        menuSetState(() {
                          selectedCategory = e;
                        });

                        // Keep popup open so user can see the selection
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
