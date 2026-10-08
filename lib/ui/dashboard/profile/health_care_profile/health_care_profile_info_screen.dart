// ignore_for_file: use_build_context_synchronously

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/app_assets/state_lga_format.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/model/update_business_owner_profile_entity_model/update_business_owner_profile_entity_model.dart';
import '../../../../core/connect_end/model/update_business_owner_profile_entity_model/upload_means_of_id.dart';
import '../../../../core/connect_end/view_model/health_care_view_model.dart';
import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class HealthCareProfileInfoScreen extends StatefulWidget {
  const HealthCareProfileInfoScreen({super.key});

  @override
  State<HealthCareProfileInfoScreen> createState() =>
      _HealthCareProfileInfoScreenState();
}

class _HealthCareProfileInfoScreenState
    extends State<HealthCareProfileInfoScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController authFullNameController = TextEditingController();
  TextEditingController authPhoneNoController = TextEditingController();
  TextEditingController authEmailController = TextEditingController();
  TextEditingController registrationNoController = TextEditingController();
  TextEditingController businessAddController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  bool isPhone = false;
  bool isPhoneValid = false;

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
        child: ViewModelBuilder<HealthCareViewModel>.reactive(
          viewModelBuilder: () => HealthCareViewModel(),
          onViewModelReady: (model) async {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getTenant(context);
              await model.getHealthCareProviderKyc(context);
              nameController.text =
                  model.getTetantResponseModel?.data?.name ?? '';
              phoneController.text = SharedPreferencesService
                  .instance
                  .usersData['user']['phone']
                  .toString()
                  .substring(4);

              registrationNoController.text =
                  model.getTetantResponseModel?.data?.registrationNumber ?? '';
              businessAddController.text =
                  model.getTetantResponseModel?.data?.businessAddress ?? '';
              businessEmailController.text =
                  model.getTetantResponseModel?.data?.businessEmail ?? '';
              emailController.text =
                  model.getTetantResponseModel?.data?.email ?? '';
              model.countryController.text =
                  model.getTetantResponseModel?.data?.country?.capitalize() ??
                  '';
              model.stateController.text =
                  model.getTetantResponseModel?.data?.state?.capitalize() ?? '';
              model.lgaController.text =
                  model.getTetantResponseModel?.data?.lga?.capitalize() ?? '';
              model.selectService =
                  model.getTetantResponseModel?.data?.servicesOffered ?? [];
              websiteController.text =
                  model.getTetantResponseModel?.data?.website ?? '';
              authFullNameController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.authorizedRepInfo
                      ?.fullName ??
                  '';
              authPhoneNoController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.authorizedRepInfo
                      ?.phone ??
                  '';
              authEmailController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.authorizedRepInfo
                      ?.email ??
                  '';
              model.selectService =
                  model.getTetantResponseModel?.data?.servicesOffered ?? [];
              model.meansIdController.text = model.getMeansOFIDApp(
                model
                        .getTetantResponseModel
                        ?.data
                        ?.authorizedRepInfo
                        ?.meansOfIdType ??
                    '',
              );
            });
          },
          disposeViewModel: false,
          builder: (_, HealthCareViewModel model, _) {
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
                        SizedBox(height: 16.8.h),
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
                              onTap: () => model.sendOtpHealthCare(
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
                          hint: 'Type of healthcare provider',
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
                          label: 'Hospital/Clinic',
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Healthcare facility name',
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
                          label: nameController.text,
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Registration number',
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
                          label: registrationNoController.text,
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
                          controller: model.countryController,
                          validator: AppValidator.validateString(),
                          suffixWidget: GestureDetector(
                            onTap: () =>
                                model.modalBottomSheetMenuCountry(context),

                            child: Padding(
                              padding: EdgeInsets.all(14.20.w),
                              child: SvgPicture.asset(AppImage.arrow_down),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormWidget(
                                hint: 'State',
                                hintSize: 14,
                                label: '',
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
                                readOnly: model.isProfileUpdated,
                                controller: model.stateController,
                                validator: AppValidator.validateString(),
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
                                          model.stateController.text =
                                              selectedState;
                                          final selectedStateLga =
                                              stateLgaFormat.firstWhere(
                                                (state) =>
                                                    state['state']
                                                        .toString()
                                                        .trim()
                                                        .toLowerCase() ==
                                                    model.stateController.text
                                                        .trim()
                                                        .toLowerCase(),
                                                orElse: () => <String, dynamic>{
                                                  'state': '',
                                                  'lgas': <String>[],
                                                },
                                              );

                                          final selectedLgas =
                                              List<String>.from(
                                                selectedStateLga['lgas'] ??
                                                    <String>[],
                                              );

                                          model.lgaList = List<String>.from(
                                            selectedLgas,
                                          );
                                          model.lgaListCopy = List<String>.from(
                                            selectedLgas,
                                          );

                                          // Optional: reset previously selected LGAs
                                          model.lgaAddedList.clear();
                                        }
                                        setState(() {});
                                        model.notifyListeners();
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

                                onChange: (p0) {
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: TextFormWidget(
                                hint: 'LGA',
                                hintSize: 14,
                                label: '',
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
                                readOnly: model.isProfileUpdated,
                                controller: model.lgaController,
                                validator: AppValidator.validateString(),
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
                                                  model.stateController.text
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
                                          model.lgaController.text =
                                              selectedLga;
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
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Website',
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
                          isShowHint: true,
                          readOnly: model.isProfileUpdated,
                          controller: websiteController,
                          validator: AppValidator.validateString(),
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),

                        TextView(
                          text: 'Select service',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),

                        SizedBox(height: 20.h),
                        ...List.generate(model.services.length, (index) {
                          return model.chooseNotChannelWidget(
                            context,
                            text: model.services[index],
                            isTapped: model.selectService.contains(
                              model.services[index],
                            ), // ✅ reflect state
                            onTap: () {
                              if (model.selectService.contains(
                                model.services[index],
                              )) {
                                // unselect
                                model.selectService.remove(
                                  model.services[index],
                                );
                              } else {
                                // select
                                model.selectService.add(model.services[index]);
                              } // ✅ update selection

                              model.notifyListeners();
                            },
                          );
                        }),
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
                              onPressed:
                                  model.getTetantResponseModel != null &&
                                      model
                                              .getTetantResponseModel!
                                              .data!
                                              .businessAddresses!
                                              .length <
                                          3
                                  ? () async {
                                      model.stateBusController.clear();
                                      model.lgaBusController.clear();
                                      model.businessAddController.clear();
                                      model.countryBusController.clear();
                                      final result = await model
                                          .showBusinessAreaLGAAndStateCountryDialog(
                                            context,
                                          );
                                      if (result == true) {
                                        model.getTenant(context);
                                      }
                                    }
                                  : () {},
                              icon: Icon(
                                Icons.add,
                                color: AppColors.reminder1,
                                size: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColors.f1),
                        if (model.getTetantResponseModel != null &&
                            model
                                .getTetantResponseModel!
                                .data!
                                .businessAddresses!
                                .isNotEmpty)
                          ...model
                              .getTetantResponseModel!
                              .data!
                              .businessAddresses!
                              .asMap()
                              .entries
                              .map((entry) {
                                // final index = entry.key;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      o.isPrimary!
                                          ? Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 14.w,
                                                  height: 14.w,
                                                  margin: EdgeInsets.only(
                                                    top: 1.h,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.app_green,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 9.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(width: 4.w),
                                                TextView(
                                                  text: 'Primary',
                                                  textStyle: TextStyle(
                                                    fontSize: 13.86.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.reminder,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),
                                              ],
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                model.profileUpdate = o;
                                                model
                                                    .updatePrimaryBusinessAddress(
                                                      context: context,
                                                      id: o.id,
                                                    );
                                                model.notifyListeners();
                                              },
                                              child:
                                                  model.isLoading &&
                                                      model.profileUpdate == o
                                                  ? SizedBox(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      child: SpinKitRing(
                                                        color:
                                                            AppColors.primary,
                                                        lineWidth: 2,
                                                      ),
                                                    )
                                                  : TextView(
                                                      text: 'Make Primary',
                                                      textStyle: TextStyle(
                                                        fontSize: 14.96.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.primary,
                                                        decorationColor:
                                                            AppColors.primary,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationThickness:
                                                            1.42,
                                                        fontFamily: 'DMSans',
                                                      ),
                                                    ),
                                            ),
                                      SizedBox(height: 6.2.h),
                                      TextView(
                                        text: o.businessAddress ?? '',
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
                                            '${o.lga}, ${o.state} State, ${o.country}',
                                        textStyle: TextStyle(
                                          fontSize: 12.86.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.infoGrey,
                                          fontFamily: 'DMSans',
                                        ),
                                      ),

                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                );
                              }),

                        SizedBox(height: 30.h),
                        TextView(
                          text: 'Contact Details',
                          textStyle: TextStyle(
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Divider(
                          color: const Color.fromARGB(255, 227, 227, 228),
                        ),
                        SizedBox(height: 6.h),
                        TextFormWidget(
                          hint: 'Business address',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.text,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: model.isProfileUpdated,
                          controller: businessAddController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Business email',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.text,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: businessEmailController,
                          readOnly: model.isProfileUpdated,
                        ),
                        
                        SizedBox(height: 30.h),
                        TextView(
                          text: 'Authorized Representative Information',
                          textStyle: TextStyle(
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Divider(
                          color: const Color.fromARGB(255, 227, 227, 228),
                        ),
                        SizedBox(height: 6.h),
                        TextFormWidget(
                          hint: 'Full Name',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.text,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: model.isProfileUpdated,
                          controller: authFullNameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Phone Number',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.number,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: model.isProfileUpdated,
                          controller: authPhoneNoController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Position/Designation',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.text,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          readOnly: model.isProfileUpdated,
                          fillColor: AppColors.grey,
                          isFilled: true,
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
                          keyboardType: TextInputType.emailAddress,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          readOnly: model.isProfileUpdated,
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: authEmailController,
                          validator: AppValidator.validateEmail(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Means of ID',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          keyboardType: TextInputType.number,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          readOnly: true,
                          controller: model.meansIdController,
                          validator: AppValidator.validateString(),
                          suffixWidget: model.getPopUpMenuDialog(context),
                        ),
                        SizedBox(height: 20.h),
                        model.getTetantResponseModel != null &&
                                    model.getTetantResponseModel!.data !=
                                        null &&
                                    model
                                            .getTetantResponseModel!
                                            .data!
                                            .authorizedRepInfo !=
                                        null &&
                                    model
                                            .getTetantResponseModel!
                                            .data!
                                            .authorizedRepInfo!
                                            .meansOfId !=
                                        null ||
                                model.filenameMeansId != null
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.w,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.grey,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppImage.kyc_file),
                                    SizedBox(width: 8.w),
                                    SizedBox(
                                      width: 140.w,
                                      child: TextView(
                                        text: model.filenameMeansId != null
                                            ? '${model.filenameMeansId}.png'
                                            : model.getMeansOFIDApp(
                                                model
                                                    .getTetantResponseModel!
                                                    .data!
                                                    .authorizedRepInfo!
                                                    .meansOfIdType,
                                              ),
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 16.2.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () =>
                                          model.pickImageMeansId(context),
                                      child: SvgPicture.asset(AppImage.upload),
                                    ),
                                    SizedBox(width: 10.w),
                                    GestureDetector(
                                      onTap: () {
                                        model.filenameMeansId = null;
                                        model
                                                .getTetantResponseModel!
                                                .data!
                                                .authorizedRepInfo!
                                                .meansOfId =
                                            null;
                                        model.notifyListeners();
                                      },
                                      child: SvgPicture.asset(AppImage.delete),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: double.infinity,
                                child: DottedBorder(
                                  options: RoundedRectDottedBorderOptions(
                                    dashPattern: [10, 10],
                                    strokeWidth: .94,
                                    radius: Radius.circular(10),
                                    color: AppColors.primary,
                                  ),
                                  child: GestureDetector(
                                    onTap: () =>
                                        model.pickImageMeansId(context),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 24.30.w,
                                        horizontal: 22.0.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        color: AppColors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(AppImage.upload_doc),
                                          SizedBox(height: 16.0.w),
                                          TextView(
                                            text: 'Upload Document',
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                          TextView(
                                            text:
                                                '(.jpg, .jpeg, png, or .pdf supported)',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                          TextView(
                                            text: 'Max file size: 2MB',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
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

                  SizedBox(height: 50.h),
                  model.isProfileUpdated
                      ? ButtonWidget(
                          border: 100.r,
                          buttonColor: AppColors.primary1,
                          buttonText: 'Update',
                          fontSize: 16.sp,
                          color: AppColors.white,
                          buttonBorderColor: AppColors.primary,
                          onPressed: () {
                            model.isProfileUpdated = false;
                            model.notifyListeners();
                          },
                        )
                      : Row(
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
                                onPressed: model.isLoading
                                    ? () {}
                                    : () {
                                        if (formKey.currentState!.validate()) {
                                          model.updateHealthCareBusinessOwner(
                                            context,
                                            updateBusinessOwner:
                                                UpdateBusinessOwnerProfileEntityModel(
                                                  logo: null,
                                                  typeOfHealthcareProvider:
                                                      'HOSPITAL',
                                                  healthcareFacilityName:
                                                      nameController.text
                                                          .trim(),
                                                  registrationNumber:
                                                      registrationNoController
                                                          .text
                                                          .trim(),
                                                  country: model
                                                      .countryController
                                                      .text
                                                      .trim(),
                                                  state: model
                                                      .stateController
                                                      .text
                                                      .trim(),
                                                  lga: model.lgaController.text
                                                      .trim(),
                                                  website: websiteController
                                                      .text
                                                      .trim(),
                                                  servicesOffered:
                                                      model.selectService,
                                                  businessAddress:
                                                      businessAddController.text
                                                          .trim(),
                                                  businessEmail:
                                                      businessEmailController
                                                          .text
                                                          .trim(),
                                                  fullName:
                                                      authFullNameController
                                                          .text
                                                          .trim(),
                                                  phoneNumber:
                                                      authPhoneNoController.text
                                                          .trim(),
                                                  email: authEmailController
                                                      .text
                                                      .trim(),
                                                  meansOfId: model
                                                      .getMeansOFIDAppReverse(
                                                        model
                                                            .meansIdController
                                                            .text,
                                                      ),
                                                  uploadMeansOfId:
                                                      model
                                                          .authDocumentsList
                                                          .isEmpty
                                                      ? null
                                                      : UploadMeansOfId.fromJson(
                                                          model
                                                              .authDocumentsList[0]
                                                              .toJson(),
                                                        ),
                                                  // UploadMeansOfId(
                                                  //     url: model
                                                  //         .authDocumentsList[0]
                                                  //         .url,
                                                  //     mimeType: model
                                                  //         .authDocumentsList[0]
                                                  //         .mimeType,
                                                  //     width: model
                                                  //         .authDocumentsList[0]
                                                  //         .width,
                                                  //     size: model
                                                  //         .authDocumentsList[0]
                                                  //         .size,
                                                  //     height: model
                                                  //         .authDocumentsList[0]
                                                  //         .height,
                                                  //     format: model
                                                  //         .authDocumentsList[0]
                                                  //         .format,
                                                  //   ),
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
