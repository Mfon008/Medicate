// ignore_for_file: invalid_use_of_visible_for_testing_member, deprecated_member_use, use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import '../../ui/widget/text.dart';
import '../config/colors.dart';

enum ProfileOptionAction { viewImage, profileCamera, library, remove }

class ImagePickerHandler {
  File? file;

  Future<void> pickImage({
    @required BuildContext? context,
    Function(File file)? file,
  }) async {
    ProfileOptionAction? action;
    action = await showModalBottomSheet(
      context: context!,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
      builder: (context) => BottomSheet(
        backgroundColor: AppColors.white,
        onClosing: () {},
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.33,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextView(
                      text: 'Choose Upload Type',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.deep,
                      ),
                    ),
                    SizedBox(width: 80.w),
                    InkWell(
                      onTap: () =>
                          Navigator.pop(context, ProfileOptionAction.remove),
                      child: SvgPicture.asset(
                        AppImage.cancel,
                        height: 18.2.h,
                        width: 18.2.w,
                        color: AppColors.deep,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),
                InkWell(
                  onTap: () =>
                      Navigator.pop(context, ProfileOptionAction.profileCamera),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.w,
                      horizontal: 16.20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color: AppColors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImage.camera,
                          height: 18.2.h,
                          width: 18.2.w,
                          color: AppColors.deep,
                        ),
                        SizedBox(width: 6.w),
                        TextView(
                          text: 'Take a Photo',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.6.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.deep,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                InkWell(
                  onTap: () =>
                       Navigator.pop(context, ProfileOptionAction.library),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.w,
                      horizontal: 16.20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color: AppColors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImage.upload_icon,
                          height: 18.2.h,
                          width: 18.2.w,
                          color: AppColors.deep,
                        ),
                        SizedBox(width: 6.w),
                        TextView(
                          text: 'Upload Photo',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.6.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.deep,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (action == null) return;
    File? getFile = await handleProfileAction(context, action: action);
    file!(getFile!);
  }

  Future<File?>? handleProfileAction(
    BuildContext context, {
    @required ProfileOptionAction? action,
  }) {
    switch (action!) {
      case ProfileOptionAction.viewImage:
      case ProfileOptionAction.library:
        return _getImage(context, ImageSource.gallery);
      case ProfileOptionAction.profileCamera:
        return _getImage(context, ImageSource.camera);
      case ProfileOptionAction.remove:
        break;
    }
    return null;
  }

  Future<File?> _getImage(BuildContext context, ImageSource source) async {
    try {
      final pickedFile = await ImagePicker.platform.pickImage(source: source);
      if (pickedFile != null) {
        return await _cropImage(context, pickedFile);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<File?> _cropImage(BuildContext context, PickedFile imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Medicate',
          toolbarColor: AppColors.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Medicate'),
      ],
    );

    return File(croppedFile!.path);
  }
}

class AppColor {}
