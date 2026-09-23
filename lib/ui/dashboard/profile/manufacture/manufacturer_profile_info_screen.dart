import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/core_folder/manager/shared_preference.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/app_assets/state_lga_format.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/model/update_distributor_profile_entity_model.dart';
import '../../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class ManufacturerProfileInfoScreen extends StatefulWidget {
  const ManufacturerProfileInfoScreen({super.key});

  @override
  State<ManufacturerProfileInfoScreen> createState() =>
      _ManufacturerProfileInfoScreenState();
}

class _ManufacturerProfileInfoScreenState
    extends State<ManufacturerProfileInfoScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController licenceNoController = TextEditingController();
  TextEditingController businessAddController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController contactDetailsController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankNoController = TextEditingController();

  TextEditingController stateController = TextEditingController();
  TextEditingController lgaController = TextEditingController();

  bool isPhone = false;
  bool isPhoneValid = false;

  bool isSeeId = false;

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
          text: 'Profile Information',
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
        child: ViewModelBuilder<ManufacturerViewModel>.reactive(
          viewModelBuilder: () => ManufacturerViewModel(),
          onViewModelReady: (model) async {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getUserDetails(context);
              nameController.text =
                  model
                      .getDistributorDetailsResponseModel
                      ?.data
                      ?.distributorManufacturerName ??
                  '';
              phoneController.text =
                  SharedPreferencesService
                      .instance
                      .usersData['user']['phone'] ??
                  '';

              licenceNoController.text =
                  model
                      .getDistributorDetailsResponseModel
                      ?.data
                      ?.registrationNumber ??
                  '';
              businessAddController.text =
                  model
                      .getDistributorDetailsResponseModel
                      ?.data
                      ?.businessAddress ??
                  '';

              emailController.text =
                  model.getDistributorDetailsResponseModel?.data?.email ?? '';
              countryController.text =
                  model.getDistributorDetailsResponseModel?.data?.country ?? '';
              stateController.text =
                  model.getDistributorDetailsResponseModel?.data?.state ?? '';
              lgaController.text =
                  model.getDistributorDetailsResponseModel?.data?.lga ?? '';
            });
          },
          disposeViewModel: false,
          builder: (_, ManufacturerViewModel model, _) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 22.w,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        nameController.text.isEmpty ||
                                countryController.text.isEmpty
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.w,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.fadedyellow,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppImage.info),
                                    SizedBox(width: 10.w),
                                    TextView(
                                      text:
                                          'Complete your profile by updating the\nremaining fields.',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),

                        SizedBox(height: 10.h),
                        SizedBox(
                          height:
                              bankNameController.text.isEmpty ||
                                  bankNoController.text.isEmpty
                              ? 0.h
                              : 16.8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                TextView(
                                  text: 'Phone number',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),

                                Positioned(
                                  right: -12.10,
                                  child: TextView(
                                    text: '*',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            GestureDetector(
                              onTap: () => model.sendOtpManufacturer(
                                context,
                                phone: SharedPreferencesService
                                    .instance
                                    .usersData['user']['phone'],
                              ),

                              child: model.isLoading
                                  ? SpinKitCircle(
                                      color: AppColors.primary,
                                      size: 30.sp,
                                    )
                                  : TextView(
                                      text: 'Change',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.primary,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(13.8.w),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(0.r),
                                  bottomLeft: Radius.circular(10.r),
                                  bottomRight: Radius.circular(0.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImage.nigeria,
                                    width: 22.w,
                                    height: 22.h,
                                  ),
                                  SizedBox(width: 4.w),
                                  TextView(
                                    text: '+234',
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                      fontSize: 14.2.sp,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Container(
                                margin: isPhoneValid
                                    ? EdgeInsets.only(top: 20.w)
                                    : EdgeInsets.zero, // Add margin if invalid

                                child: TextFormWidget(
                                  hint: null,
                                  borderColor: AppColors.transparent,
                                  borderTopLeft: 0,
                                  borderTopRight: 10,
                                  borderBottomLeft: 0,
                                  borderBottomRight: 10,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: const Color.fromRGBO(
                                    245,
                                    246,
                                    248,
                                    1,
                                  ),
                                  isFilled: true,
                                  readOnly: true,
                                  label: phoneController.text,
                                  onChange: (p0) {
                                    if (p0.isEmpty) {
                                      isPhone = false;
                                    } else {
                                      isPhone = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Distributor/Manufacturer name',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 16.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: true,
                          controller: nameController,
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Business Registration Number',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: true,
                          label: licenceNoController.text,
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Email',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          validator: AppValidator.validateEmail(),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: emailController,
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Addresses',
                              textStyle: TextStyle(
                                fontSize: 15.86.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.reminder1,
                                fontFamily: 'DMSans',
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                model.stateController.clear();
                                model.lgaController.clear();
                                model.businessAddController.clear();
                                model.countryController.clear();
                                model.showBusinessAreaLGAAndStateCountryDialog(
                                  context,
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                color: AppColors.reminder1,
                                size: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColors.f1),

                        ...model.listOfAddedAddress.asMap().entries.map((
                          entry,
                        ) {
                          final index = entry.key;
                          final o = entry.value;

                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 12.w),
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.grey,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: o['businessAddress'],
                                  textStyle: TextStyle(
                                    fontSize: 13.86.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                                SizedBox(height: 5.2.h),
                                TextView(
                                  text:
                                      '${o['lga']}, ${o['state']} State, ${o['country']}',
                                  textStyle: TextStyle(
                                    fontSize: 12.86.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoGrey,
                                    fontFamily: 'DMSans',
                                  ),
                                ),

                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        model.stateController.text =
                                            o.keys.first;
                                        model
                                            .showBusinessAreaLGAAndStateCountryDialog(
                                              context,
                                              isEdit: true,
                                              editIndex: index,
                                            );
                                        model.notifyListeners();
                                      },
                                      child: SvgPicture.asset(
                                        AppImage.round_edit,
                                        height: 22.h,
                                        width: 22.h,
                                      ),
                                    ),
                                    SizedBox(width: 10.h),
                                    GestureDetector(
                                      onTap: () {
                                        model.listOfAddedAddress.remove(o);
                                        setState(() {});
                                        model.notifyListeners();
                                      },
                                      child: SvgPicture.asset(
                                        AppImage.delete,
                                        height: 20.h,
                                        width: 20.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),

                        TextFormWidget(
                          hint: 'Business address',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: businessAddController,
                          validator: AppValidator.validateString(),
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Country',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: '--Select--',
                          readOnly: true,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: countryController,
                          validator: AppValidator.validateString(),
                          suffixWidget: Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () async {
                                  final RenderBox button =
                                      context.findRenderObject() as RenderBox;

                                  final RenderBox overlay =
                                      Overlay.of(
                                            context,
                                          ).context.findRenderObject()
                                          as RenderBox;

                                  final Offset buttonPosition = button
                                      .localToGlobal(
                                        Offset.zero,
                                        ancestor: overlay,
                                      );

                                  final Size buttonSize = button.size;

                                  final selectedState = await showMenu<String>(
                                    context: context,

                                    position: RelativeRect.fromLTRB(
                                      buttonPosition.dx,
                                      buttonPosition.dy +
                                          buttonSize.height +
                                          5.h,
                                      overlay.size.width -
                                          buttonPosition.dx -
                                          buttonSize.width,
                                      0,
                                    ),

                                    constraints: BoxConstraints(
                                      minWidth: 200.w,
                                      maxWidth: 250.w,
                                      minHeight: 60.h,
                                      maxHeight: 450.h,
                                    ),

                                    color: AppColors.white,

                                    elevation: 4,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),

                                    items: ['Nigeria']
                                        .map<PopupMenuEntry<String>>((s) {
                                          final String country = s;

                                          return PopupMenuItem<String>(
                                            value: country,
                                            height: 38.h,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 14.w,
                                            ),
                                            child: TextView(
                                              text: country,
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 13.70.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          );
                                        })
                                        .toList(),
                                  );

                                  if (selectedState != null) {
                                    countryController.text = selectedState;

                                    // Reset LGA whenever state changes
                                    lgaController.clear();
                                    setState(() {});

                                    model.notifyListeners();
                                  }
                                },

                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.grey1,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormWidget(
                                hint: 'State',
                                label: 'Select State',
                                hintColor: AppColors.reminder,
                                hintSize: Platform.isAndroid ? 14.sp : 13.46.sp,
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                readOnly: true,
                                fillColor: AppColors.grey,
                                isFilled: true,
                                controller: stateController,
                                suffixWidget: Builder(
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () async {
                                        final RenderBox button =
                                            context.findRenderObject()
                                                as RenderBox;

                                        final RenderBox overlay =
                                            Overlay.of(
                                                  context,
                                                ).context.findRenderObject()
                                                as RenderBox;

                                        final Offset buttonPosition = button
                                            .localToGlobal(
                                              Offset.zero,
                                              ancestor: overlay,
                                            );

                                        final Size buttonSize = button.size;

                                        final selectedState =
                                            await showMenu<String>(
                                              context: context,

                                              position: RelativeRect.fromLTRB(
                                                buttonPosition.dx,
                                                buttonPosition.dy +
                                                    buttonSize.height +
                                                    5.h,
                                                overlay.size.width -
                                                    buttonPosition.dx -
                                                    buttonSize.width,
                                                0,
                                              ),

                                              constraints: BoxConstraints(
                                                minWidth: 200.w,
                                                maxWidth: 250.w,
                                                minHeight: 150.h,
                                                maxHeight: 450.h,
                                              ),

                                              color: AppColors.white,

                                              elevation: 4,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),

                                              items: stateLgaFormat
                                                  .map<PopupMenuEntry<String>>((
                                                    s,
                                                  ) {
                                                    final String state =
                                                        s['state']
                                                            ?.toString() ??
                                                        '';

                                                    return PopupMenuItem<
                                                      String
                                                    >(
                                                      value: state,
                                                      height: 38.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 14.w,
                                                          ),
                                                      child: TextView(
                                                        text: state,
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 13.70.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                  .toList(),
                                            );

                                        if (selectedState != null) {
                                          stateController.text = selectedState;

                                          // Reset LGA whenever state changes
                                          lgaController.clear();
                                          setState(() {});

                                          model.notifyListeners();
                                        }
                                      },

                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                        ),
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                validator: AppValidator.validateString(),

                                style: TextStyle(
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                ),

                                labelStyle: TextStyle(
                                  fontSize: 15.20.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                  color: AppColors.faintedGrey,
                                ),
                              ),
                            ),
                            SizedBox(width: 14.20.w),
                            Expanded(
                              child: TextFormWidget(
                                hint: 'LGA',
                                label: '-Select-',
                                hintColor: AppColors.reminder,
                                hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                                borderColor: AppColors.transparent,
                                borderTopLeft: 10.r,
                                borderTopRight: 10.r,
                                borderBottomLeft: 10.r,
                                borderBottomRight: 10.r,
                                fillColor: AppColors.grey,
                                isFilled: true,
                                readOnly: true,
                                controller: lgaController,
                                suffixWidget: Builder(
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () async {
                                        final RenderBox button =
                                            context.findRenderObject()
                                                as RenderBox;

                                        final RenderBox overlay =
                                            Overlay.of(
                                                  context,
                                                ).context.findRenderObject()
                                                as RenderBox;

                                        final Offset buttonPosition = button
                                            .localToGlobal(
                                              Offset.zero,
                                              ancestor: overlay,
                                            );

                                        final Size buttonSize = button.size;

                                        final selectedState = stateLgaFormat
                                            .firstWhere(
                                              (state) =>
                                                  state['state']
                                                      .toString()
                                                      .trim()
                                                      .toLowerCase() ==
                                                  stateController.text
                                                      .trim()
                                                      .toLowerCase(),
                                              orElse: () => <String, dynamic>{
                                                'state': '',
                                                'lgas': <String>[],
                                              },
                                            );

                                        final List<dynamic> lgas =
                                            selectedState['lgas'] ?? [];

                                        if (lgas.isEmpty) {
                                          return;
                                        }

                                        final selectedLga =
                                            await showMenu<String>(
                                              context: context,

                                              position: RelativeRect.fromLTRB(
                                                buttonPosition.dx,
                                                buttonPosition.dy +
                                                    buttonSize.height +
                                                    5.h,
                                                overlay.size.width -
                                                    buttonPosition.dx -
                                                    buttonSize.width,
                                                0,
                                              ),

                                              constraints: BoxConstraints(
                                                minWidth: 200.w,
                                                maxWidth: 250.w,
                                                minHeight: 110.h,
                                                maxHeight: 420.h,
                                              ),

                                              color: AppColors.white,

                                              elevation: 4,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),

                                              items: lgas
                                                  .map<PopupMenuEntry<String>>((
                                                    lga,
                                                  ) {
                                                    return PopupMenuItem<
                                                      String
                                                    >(
                                                      value: lga.toString(),
                                                      height: 38.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 14.w,
                                                          ),
                                                      child: TextView(
                                                        text: lga.toString(),
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 13.70.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                  .toList(),
                                            );

                                        if (selectedLga != null) {
                                          lgaController.text = selectedLga;
                                          setState(() {});
                                          model.notifyListeners();
                                        }
                                      },

                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                        ),
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                validator: AppValidator.validateString(),
                                style: TextStyle(
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                ),

                                labelStyle: TextStyle(
                                  fontSize: 15.20.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                  color: AppColors.faintedGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),

                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          border: 100.r,
                          buttonColor: AppColors.white,
                          buttonText: 'Discard',
                          fontSize: 14.sp,
                          color: AppColors.primary,
                          buttonBorderColor: AppColors.primary,
                          onPressed: () {
                            navigate.back();
                          },
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: ButtonWidget(
                          border: 100.r,
                          buttonColor: AppColors.primary,
                          fontSize: 14.sp,
                          buttonText: 'Save Changes',
                          color: AppColors.white,
                          isLoading: model.isLoading,
                          buttonBorderColor: AppColors.transparent,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              model.updateDistributorProfile(
                                context,
                                updateEntity:
                                    UpdateDistributorProfileEntityModel(
                                      distributorManufacturerName:
                                          nameController.text.trim(),
                                      registrationNumber: licenceNoController
                                          .text
                                          .trim(),
                                      email: emailController.text.trim(),
                                      businessAddress: businessAddController
                                          .text
                                          .trim(),
                                      country: countryController.text.trim(),
                                      state: stateController.text.trim(),
                                      lga: lgaController.text.trim(),
                                    ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
