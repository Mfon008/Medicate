// ignore_for_file: deprecated_member_use, strict_top_level_inference
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/ui/dashboard/reminder/med_type.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  TextEditingController medNameController = TextEditingController();
  TextEditingController medDosageController = TextEditingController();
  TextEditingController medDurationController = TextEditingController();
  TextEditingController medDailyInTakenController = TextEditingController();
  TextEditingController drugNameController = TextEditingController();
  TextEditingController medTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController endDateController = TextEditingController(text: '');
  bool isTapped = false;
  bool isTappedCon = false;

  String medTypeResult = '';
  String medTypeResultImage = '';
  int? index;
  int? indexDuration;
  int? indexDaily;

  DateFormat inputFormat = DateFormat("dd MMM, yyyy");
  DateTime? dateTimeObject;

  List<MedType> medTypeList = [
    MedType(medType: 'Pills', medTypeImage: AppImage.pill),
    MedType(medType: 'Syrups', medTypeImage: AppImage.syrup),
    MedType(medType: 'Injection', medTypeImage: AppImage.syringe),
    MedType(medType: 'Drips', medTypeImage: AppImage.drip),
    MedType(medType: 'Ointments', medTypeImage: AppImage.ointment),
    MedType(medType: 'Inhalers', medTypeImage: AppImage.inhaler),
    MedType(medType: 'Others', medTypeImage: AppImage.other_meds),
  ];

  int? _duration;
  List<int> intList = [];

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Container(
          margin: EdgeInsets.only(left: isTablet(context) ? 5.2.w : 12.4.w),
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
            onPressed: () => navigate.navigateTo(Routes.moreScreen),
          ),
        ),
        title: TextView(
          text: 'Reminder',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(isTablet(context) ? 2.0.w : 6.8.w),
            child: Container(
              margin: EdgeInsets.only(right: 4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.inactive.withOpacity(.1),
                border: Border.all(color: AppColors.inactive..withOpacity(.4)),
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 130.h),
              SvgPicture.asset(AppImage.reminder),
              SizedBox(height: 20.h),
              TextView(
                text: 'Here you’ll see your schedule for the day',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 2.10.h),
              TextView(
                text: 'Tap on the plus button to add one',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () => setState(() {
                  isTapped = !isTapped;
                }),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: !isTapped
                      ? Icon(Icons.add, color: AppColors.white, size: 20.sp)
                      : SvgPicture.asset(
                          AppImage.x,
                          color: AppColors.white,
                          height: 20.h,
                          width: 20.w,
                        ),
                ),
              ),
              SizedBox(height: 30.h),
              !isTapped
                  ? SizedBox.shrink()
                  : Container(
                      width: 156.0.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.22.w,
                        vertical: 18.20.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => showReminderModal(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppImage.person_plus),
                                SizedBox(width: 6.10.w),
                                TextView(
                                  text: 'Set up Yourself',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 13.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.reminder,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(AppImage.ai_star),
                              SizedBox(width: 6.10.w),
                              TextView(
                                text: 'AI Setup',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 13.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> showDailyInTakeMenu(BuildContext context) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setMenuState) {
            return Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'No of Times to be taken daily',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    for (int i = 1; i < 6; i++)
                      GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            indexDaily = i;
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, indexDaily.toString());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: indexDaily == i
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: indexDaily == i
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              TextView(
                                text: i.toString(),
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (indexDaily == i)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<String?> showMedDurationMenu(BuildContext context) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setMenuState) {
            return Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'Duration',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    for (int i = 1; i < 15; i++)
                      GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            indexDuration = i;
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, indexDuration.toString());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: indexDuration == i
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: indexDuration == i
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              TextView(
                                text: i > 1 ? '$i days' : '$i day',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (indexDuration == i)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<String?> showMedDosageMenu(BuildContext context) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setMenuState) {
            return Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'Dosage',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    for (int i = 1; i < 11; i++)
                      GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            index = i;
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, index.toString());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == i
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: index == i
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              TextView(
                                text: i > 1 ? '$i tablets' : '$i tablet',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (index == i)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<Map<String, String>?> showMedTypeMenu(BuildContext context) async {
    return await showModalBottomSheet<Map<String, String>>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        String? localSelected = medTypeResult;

        return StatefulBuilder(
          builder: (ctx, setMenuState) {
            return Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'Medication Type',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.60.sp,
                        color: AppColors.greyee,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    ...medTypeList.map((e) {
                      final isSelected = localSelected == e.medType;

                      return GestureDetector(
                        onTap: () {
                          setMenuState(() {
                            localSelected = e.medType;
                          });

                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.pop(ctx, {
                              "type": e.medType!,
                              "icon": e.medTypeImage!,
                            });
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isSelected
                                ? AppColors.skyBlue
                                : AppColors.white,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary1
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                e.medTypeImage!,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(width: 12.w),
                              TextView(
                                text: e.medType!,
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              if (isSelected)
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary1,
                                  size: 15.60.sp,
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showReminderModal(context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    constraints: BoxConstraints(maxWidth: double.infinity),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.7, // Initial height as percentage of screen
            minChildSize: 0.5, // Minimum height
            maxChildSize: 0.88, // Maximum height
            expand: true, // Set to true for full height initially
            builder: (BuildContext context, ScrollController scrollController) {
              return ViewModelBuilder<AuthViewModel>.reactive(
                viewModelBuilder: () => locator<AuthViewModel>(),
                onViewModelReady: (model) {},
                disposeViewModel: false,
                onDispose: (viewModel) {
                  // for (final c in viewModel.doseControllers) {
                  //   c.clear();
                  // }
                },
                builder: (_, AuthViewModel model, _) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color: AppColors.white,
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 20.w,
                      ),
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 20, width: 20),
                              TextView(
                                text: 'Add Medication',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 16.70.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.deep,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 4.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    AppImage.cancel,
                                    height: 14.20,
                                    width: 14.20,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 13.60.h),
                          Row(
                            children: [
                              SizedBox(
                                width: 300.w,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0),
                                  ), // Adjust radius as needed
                                  child: LinearProgressIndicator(
                                    minHeight: 4.0, // Adjust height as needed
                                    value: 0.59,
                                    color:
                                        AppColors.primary, // Progress bar color
                                    backgroundColor: Colors
                                        .grey[300], // Background track color
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.2.h),
                              TextView(
                                text: '1/4',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 13.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Medication Name',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            label: '',
                            hintSize: 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: medNameController,
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 16.h),
                          TextFormWidget(
                            hint: 'Drug Name',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            label: '',
                            hintSize: 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: drugNameController,
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 16.h),
                          TextView(
                            text: 'Medication Type',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16.60.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          TextFormWidget(
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            label: '',
                            hintSize: 16.60.sp,
                            readOnly: true,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            prefixWidget: medTypeResultImage.isNotEmpty
                                ? Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: SvgPicture.asset(medTypeResultImage),
                                  )
                                : SizedBox.shrink(),
                            suffixWidget: IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.greyee,
                              ),
                              onPressed: () async {
                                final result = await showMedTypeMenu(context);

                                if (result != null) {
                                  setModalState(() {
                                    medTypeResultImage = result["icon"] ?? '';
                                    medTypeController.text =
                                        result["type"] ?? '';
                                  });
                                }
                              },
                            ),
                            controller: medTypeController,
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 16.h),
                          TextView(
                            text: 'Description',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16.60.sp,
                              fontWeight: FontWeight.w500,
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
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: descriptionController,
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 16.h),
                          TextView(
                            text: 'Medication picture upload',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16.60.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: double.infinity,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [3, 3],
                                strokeWidth: .94,
                                radius: Radius.circular(10),
                                color: AppColors.infoGrey1,
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.20.w,
                                  horizontal: 16.0.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 140.w,
                                      height: 84.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: model.imageDrug != null
                                            ? Image.file(
                                                model.imageDrug!,
                                                height: 75.80.h,
                                                width: 70.80.w,
                                              )
                                            : SvgPicture.asset(
                                                AppImage.image_icon,
                                              ),
                                      ),
                                    ),
                                    model.imageDrug != null
                                        ? Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  model.imageDrug = null;
                                                  model.notifyListeners();
                                                },
                                                child: SvgPicture.asset(
                                                  AppImage.delete,
                                                  height: 16.68.h,
                                                  width: 15.2.w,
                                                ),
                                              ),
                                              SizedBox(width: 18.30.w),
                                              GestureDetector(
                                                onTap: () => model
                                                    .pickDrugImage(context),
                                                child: SvgPicture.asset(
                                                  AppImage.upload,
                                                  height: 17.0.h,
                                                  width: 16.68.w,
                                                ),
                                              ),
                                            ],
                                          )
                                        : GestureDetector(
                                            onTap: () =>
                                                model.pickDrugImage(context),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 22.w,
                                                vertical: 10.10.w,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                color: AppColors.grey,
                                              ),
                                              child: TextView(
                                                text: 'Upload',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.40.sp,
                                                  color: AppColors.deep,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.0.h),
                          TextView(
                            text: 'SET SCHEDULE AND DOSAGE',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 14.80.sp,
                              color: AppColors.grey1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Divider(color: AppColors.grey),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              TextView(
                                text: 'Dosage ',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextView(
                                text: '(mg)',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  color: AppColors.grey1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.0.h),
                          TextFormWidget(
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            label: model.getStringFrLabel(
                              medDosageController.text,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 16.80.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            readOnly: true,
                            suffixWidget: IconButton(
                              onPressed: () async {
                                final result = await showMedDosageMenu(context);
                                if (result != null) {
                                  setModalState(() {
                                    medDosageController.text = result;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.grey1,
                                size: 20.sp,
                              ),
                            ),
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 24.0.h),
                          TextFormWidget(
                            hint: 'Start Date & Time',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            label: '',
                            readOnly: true,
                            hintSize: 14.60.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            controller: model.dateTimeController,
                            suffixWidget: Padding(
                              padding: EdgeInsets.all(8.w),
                              child: GestureDetector(
                                onTap: () => model.selectDate(context),
                                child: SvgPicture.asset(
                                  AppImage.calendar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 24.0.h),
                          TextFormWidget(
                            hint: 'Duration',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            label: '',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            readOnly: true,
                            controller: medDurationController,
                            suffixWidget: IconButton(
                              onPressed: () async {
                                final result = await showMedDurationMenu(
                                  context,
                                );
                                if (result != null) {
                                  setModalState(() {
                                    medDurationController.text = model
                                        .getStringFrDuration(result);
                                    _duration = int.parse(result);
                                    intList = List.generate(
                                      _duration!,
                                      (index) => index,
                                    );
                                  });
                                  setState(() {
                                    dateTimeObject = inputFormat.parse(
                                      model.pickedDate!,
                                    );
                                    endDateController.text = dateTimeObject!
                                        .add(Duration(days: int.parse(result)))
                                        .toString();
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.grey1,
                                size: 20.sp,
                              ),
                            ),
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 24.0.h),
                          Row(
                            children: [
                              TextView(
                                text: 'End Date ',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.60.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.info_outline,
                                color: AppColors.yellow,
                                size: 20.sp,
                              ),
                            ],
                          ),
                          SizedBox(height: 14.0.h),
                          TextFormWidget(
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            label: endDateController.text.isNotEmpty
                                ? DateFormat('dd MMM yyyy').format(
                                    DateTime.parse(endDateController.text),
                                  )
                                : '',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 16.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            readOnly: true,

                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 24.0.h),
                          TextFormWidget(
                            hint: 'No of Times to be taken daily',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            label: '',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            readOnly: true,
                            controller: medDailyInTakenController,
                            suffixWidget: IconButton(
                              onPressed: () async {
                                final result = await showDailyInTakeMenu(
                                  context,
                                );
                                if (result != null) {
                                  setModalState(() {
                                    medDailyInTakenController.text = result;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.grey1,
                                size: 20.sp,
                              ),
                            ),
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 24.0.h),
                          if (intList.isNotEmpty &&
                              medDailyInTakenController.text.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...intList.map(
                                  (e) => model.dosageWidgetContainer(
                                    context: context,
                                    callback: e,
                                    listOfTimes: List.generate(
                                      int.parse(medDailyInTakenController.text),
                                      (index) => index,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14.0.h),
                                TextView(
                                  text: 'Add Note',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.60.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                TextFormWidget(
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 16.80.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.grey,
                                  isFilled:
                                      true, // Minimum number of lines visible
                                  maxline:
                                      3, // Maximum number of lines visible before scrolling
                                  keyboardType: TextInputType.multiline,
                                  validator: AppValidator.validateString(),
                                ),

                                SizedBox(height: 20.h),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: TextView(
                                      text: 'Add Another Medication',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 17.2.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.primary,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationThickness: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                ButtonWidget(
                                  border: 100.r,
                                  buttonColor: AppColors.primary,
                                  buttonText: 'Preview',
                                  color: AppColors.white,
                                  buttonBorderColor: AppColors.transparent,
                                  onPressed: () {
                                    for (
                                      var day = 0;
                                      day < model.doseControllers.length;
                                      day++
                                    ) {
                                      print("Day ${day + 1}:");
                                      for (var dose
                                          in model.doseControllers[day]) {
                                        print("  ${dose.text}");
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: 30.h),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      );
    },
  );
}
