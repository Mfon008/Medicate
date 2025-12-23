import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/config/colors.dart';

// ignore: must_be_immutable
class AiTextFormWidget extends StatelessWidget {
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
  final double? borderTopLeft;
  final double? borderBottomRight;
  final double? borderBottomLeft;

  AiTextFormWidget({
    super.key,
    this.textCapitalization,
    this.label,
    this.floatingLabel,
    this.hint,
    this.isFilled = false,
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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label ?? '',
        labelStyle: labelStyle,
        filled: isFilled,
        fillColor: fillColor,
        focusColor: AppColors.primary,
        contentPadding: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
        // 👇 Remove underline
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      obscureText: obscureText!,
      controller: controller,
      readOnly: readOnly!,
      onTap: onTapped,
      key: formKey,
      maxLines: maxline,
      minLines: minline,
      cursorColor: AppColors.infoGrey,
      onChanged: onChange,
      onFieldSubmitted: onEditCompleted,
      validator: validator,
    );
  }
}
