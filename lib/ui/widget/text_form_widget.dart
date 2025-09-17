import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/ui/widget/text.dart';

import '../../core/config/colors.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  final TextCapitalization? textCapitalization;
  final String? label;
  final String? floatingLabel;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPasswordToggle;
  final Function(String)? onChange;
  final Function(String)? onEditCompleted;
  final String? initialValue;
  final String? text;
  final FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final AutovalidateMode? autoValidateMode;
  final bool? obscureText;
  final bool? readOnly;
  final bool? isGender;
  final bool? isFeedback;
  final bool? isFilled;
  final bool? alignLabelWithHint;
  final Function()? onTapped;
  TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final Color? suffixIconColor;
  final Color? borderColor;
  final Color labelColor;
  final Color hintColor;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Key? formKey;
  final double? size;
  final int? maxline;
  final int? minline;
  final double? borderTopRight;
  double? hintSize;
  final double? borderTopLeft;
  final double? borderBottomRight;
  final double? borderBottomLeft;

  TextFormWidget({
    Key? key,
    this.textCapitalization,
    this.label,
    this.floatingLabel,
    this.hint,
    this.isFilled = false,
    this.alignLabelWithHint = false,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixWidget,
    this.prefixWidget,
    this.validator,
    this.onPasswordToggle,
    this.initialValue,
    this.inputFormatters,
    this.controller,
    this.autoValidateMode,
    this.obscureText = false,
    this.isGender = false,
    this.readOnly = false,
    this.isFeedback = false,
    this.onTapped,
    this.labelStyle,
    this.onEditCompleted,
    this.keyboardType,
    this.suffixIconColor,
    this.fillColor = AppColors.grey,
    this.prefixIconColor,
    this.onChange,
    this.formKey,
    this.size,
    this.text,
    this.hintSize = 18,
    this.borderColor = AppColors.transparent,
    this.labelColor = AppColors.black,
    this.maxline = 1,
    this.borderBottomLeft,
    this.borderBottomRight,
    this.borderTopLeft,
    this.borderTopRight,
    this.minline,
    this.focusNode,
    this.hintColor = AppColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hint != null
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  TextView(
                    text: hint ?? '',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: hintSize!.sp,
                      fontWeight: FontWeight.w500,
                      color: hintColor,
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
              )
            : const SizedBox.shrink(),
        SizedBox(height: hint != null ? 10.2.h : 0.h),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          keyboardType: keyboardType,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            labelText: label ?? '',
            labelStyle: labelStyle,
            filled: isFilled,
            fillColor: fillColor,
            focusColor: AppColors.black,
            alignLabelWithHint: alignLabelWithHint,
            contentPadding: EdgeInsets.fromLTRB(20.w, 12.60.w, 20.w, 12.60.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(width: 1.w, color: AppColors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderTopLeft!.r),
                topRight: Radius.circular(borderTopRight!.r),
                bottomLeft: Radius.circular(borderBottomLeft!.r),
                bottomRight: Radius.circular(borderBottomRight!.r),
              ),
              borderSide: BorderSide(width: 2.w, color: borderColor!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              borderSide: BorderSide(width: 1.w, color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderTopLeft!.r),
                topRight: Radius.circular(borderTopRight!.r),
                bottomLeft: Radius.circular(borderBottomLeft!.r),
                bottomRight: Radius.circular(borderBottomRight!.r),
              ),

              borderSide: BorderSide(width: 1.w, color: borderColor!),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(width: 1.w, color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(width: 1.w, color: Colors.redAccent),
            ),
            prefixIcon:
                prefixWidget ??
                (prefixIcon != null
                    ? IconButton(
                        onPressed: onPasswordToggle,
                        icon: Icon(prefixIcon, color: prefixIconColor),
                      )
                    : null),
            suffixIcon: Padding(
              padding: EdgeInsets.all(1.5.w),
              child:
                  suffixWidget ??
                  (suffixIcon != null
                      ? IconButton(
                          onPressed: onPasswordToggle,
                          iconSize: size,
                          icon: Icon(suffixIcon, color: suffixIconColor),
                        )
                      : null),
            ),
          ),
          obscureText: obscureText!,
          controller: controller,
          readOnly: readOnly!,
          onTap: onTapped,
          key: formKey,
          maxLines: maxline,
          minLines: minline,
          cursorColor: AppColors.black,
          onChanged: onChange,
          onFieldSubmitted: onEditCompleted,
          validator: validator,
          style: TextStyle(fontSize: 16.20.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
