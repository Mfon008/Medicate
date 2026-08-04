

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 40.w,
            height: 22.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0.r),
              color: _circleAnimation!.value == Alignment.centerLeft
                  ? AppColors.infoGrey
                  : AppColors.app_green,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 2.0.w, bottom: 2.0.w, right: 2.0.w, left: 2.0.w),
              child: Container(
                alignment:
                    widget.value ? ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerLeft : Alignment.centerRight ) : ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerRight : Alignment.centerLeft),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
