import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_profile_entity_model/bank_detail.dart';
import 'package:medicate_app/core/connect_end/model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
// import 'package:intl/intl.dart';
import 'package:medicate_app/core/connect_end/view_model/pharm_auth_view_model.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/app_assets/state_lga_format.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class PharmacyProfileInfoScreen extends StatefulWidget {
  const PharmacyProfileInfoScreen({super.key});

  @override
  State<PharmacyProfileInfoScreen> createState() =>
      _PharmacyProfileInfoScreenState();
}

class _PharmacyProfileInfoScreenState extends State<PharmacyProfileInfoScreen> {
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
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 17.20.h),
        child: ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => PharmViewModel(),
          onViewModelReady: (model) async {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getTenant(context);
              nameController.text =
                  model.getTetantResponseModel?.data?.name ?? '';
              phoneController.text = SharedPreferencesService
                  .instance
                  .usersData['user']['phone']
                  .toString()
                  .substring(4);

              licenceNoController.text =
                  model.getTetantResponseModel?.data?.licenseNumber ?? '';
              businessAddController.text =
                  model.getTetantResponseModel?.data?.businessAddress ?? '';
              bankNameController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .bankName ??
                  "";
              bankNoController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .accountNumber ??
                  '';
              emailController.text =
                  model.getTetantResponseModel?.data?.email ?? '';
              model.countryController.text =
                  model.getTetantResponseModel?.data?.country ?? '';
              model.stateController.text =
                  model.getTetantResponseModel?.data?.state ?? '';
              model.lgaController.text =
                  model.getTetantResponseModel?.data?.lga ?? '';
              model.selectService =
                  model.getTetantResponseModel?.data?.servicesOffered ?? [];
              contactDetailsController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .accountName ??
                  '';
              bankNameController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .bankName ??
                  '';
              bankNoController.text =
                  model
                      .getTetantResponseModel
                      ?.data
                      ?.bankDetails?[0]
                      .accountNumber ??
                  '';
            });
          },
          disposeViewModel: false,
          builder: (_, PharmViewModel model, _) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 22.w,
                      horizontal: 16.20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bankNameController.text.isEmpty ||
                                bankNoController.text.isEmpty
                            ? Container(
                                margin: EdgeInsets.only(bottom: 16.w),
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
                              onTap: () => model.sendOtpPharmacy(
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
                          hint: 'Pharmacy ID',
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
                          obscureText: isSeeId ? false : true,
                          controller: TextEditingController(
                            text: model.getTetantResponseModel?.data?.id ?? '',
                          ),
                          onChange: (p0) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Pharmacy name',
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
                          hint: 'Pharmacy license number',
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
                          controller: model.countryController,
                          validator: AppValidator.validateString(),
                          suffixWidget: GestureDetector(
                            onTap: () =>
                                model.modalBottomSheetMenuCountry(context),

                            child: Padding(
                              padding: EdgeInsets.all(14.20.w),
                              child: SvgPicture.asset(
                                AppImage.arrow_down,
                                height: 10.h,
                                width: 10.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Email Address',
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
                          controller: emailController,
                          validator: AppValidator.validateEmail(),
                          onChange: (p0) {
                            setState(() {});
                          },
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
                                readOnly: true,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  fontSize: 14.2.sp,
                                  color: AppColors.infoGrey,
                                ),
                                fillColor: AppColors.grey,
                                isFilled: true,
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
                                readOnly: true,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  fontSize: 14.2.sp,
                                  color: AppColors.infoGrey,
                                ),
                                fillColor: AppColors.grey,
                                isFilled: true,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              final result = await model
                                                  .showBusinessAreaLGAAndStateCountryDialog(
                                                    context,
                                                    isEdit: true,
                                                    editIndex: index,
                                                    businessAddresses: o,
                                                  );
                                              if (result == true) {
                                                model.getTenant(context);
                                              }
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
                                            onTap: () async {
                                              bool? delete = await model
                                                  .showRemoveBusinessAddressDialog(
                                                    context: context,
                                                    businessAddressId: o.id,
                                                  );
                                              if (delete == true) {
                                                await Future.delayed(
                                                  Duration(seconds: 1),
                                                );
                                                model.getTenant(
                                                  context,
                                                ); // refresh roles after modal closes
                                              } else {}

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
                          hint: 'Contact person name',
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
                          controller: contactDetailsController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Contact email',
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
                          controller: emailController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp("[a-z]")),
                          ],
                          // validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 30.h),
                        TextView(
                          text: 'Bank Information',
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
                          hint: 'Bank name',
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
                          controller: bankNameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextFormWidget(
                          hint: 'Account number',
                          hintSize: 14,
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: 'Enter account number',
                          keyboardType: TextInputType.number,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          controller: bankNoController,
                          validator: AppValidator.validateString(),
                          // ),
                        ),
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
                              model.updatePharmacy(
                                context,
                                update: UpdatePharmacyProfileEntityModel(
                                  country: model.countryController.text,
                                  state: model.stateController.text,
                                  lga: model.lgaController.text,
                                  businessAddress: businessAddController.text,
                                  servicesOffered: model.selectService,
                                  contactPersonName:
                                      contactDetailsController.text,
                                  contactEmail: emailController.text,
                                  bankDetails: [
                                    BankDetail(
                                      bankName: bankNameController.text,
                                      accountName:
                                          contactDetailsController.text,
                                      accountNumber: bankNoController.text,
                                    ),
                                  ],
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
