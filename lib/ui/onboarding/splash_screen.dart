// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'dart:async';

import '../../core/config/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading for 2 seconds, then go to Home
    Timer(Duration(seconds: 5), () {
      navigate.navigateTo(Routes.getStartedOnboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // same as your native bg color
      body: Center(
        child: Image.asset(
          AppImage.applogo,
          width:
              MediaQuery.of(context).size.width * 0.5, // 👈 exact size control
        ),
      ),
    );
  }
}
