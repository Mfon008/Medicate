import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/widget/button.dart';
import '../widget/text.dart';

class GetStartedOnboarding extends StatelessWidget {
  const GetStartedOnboarding({super.key});

  Future<Uint8List> loadImageWithoutExif(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();
    final image = img.decodeImage(bytes)!;

    // Bake orientation into pixel data
    final baked = img.bakeOrientation(image);

    return Uint8List.fromList(img.encodePng(baked));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 56.w,
            horizontal: 16.w,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImage.applogoSvg,
                    width: 116.w,
                    height: 28.h,
                  ),
                  SizedBox(height: 54.h),
                  FutureBuilder<Uint8List>(
                    future: loadImageWithoutExif(AppImage.mc),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return ClipOval(
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 110, 120, 133),
                                Color.fromARGB(255, 110, 120, 133),
                              ],
                            ).createShader(bounds),
                            blendMode: BlendMode.color,
                            child: Image.asset(
                              AppImage.mc,
                              fit: BoxFit.cover,
                              width: 260.w,
                              height: 280.h,
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  SizedBox(height: 30.h),
                  TextView(
                    text: '👋 Hi there, Welcome to Medicate!',
                    textStyle: TextStyle(
                      // fontFamily: 'GoogleSans',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.0.sp,
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  TextView(
                    text:
                        'Your personal health companion here to remind you about your medications, help you order trusted health products at great prices, and guide you toward everyday wellness. Let’s take care of your health, together. ',
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0.sp,
                    ),
                  ),
                  SizedBox(height: 40.0.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.primary,
                    buttonText: 'Get Started',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    onPressed: () => navigate.navigateTo(Routes.roleOnboarding),
                  ),
                  SizedBox(height: 12.20.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.grey,
                    buttonText: 'Sign In',
                    color: AppColors.black,
                    buttonBorderColor: AppColors.transparent,
                    onPressed: () => navigate.navigateTo(Routes.loginScreen),
                  ),
                  SizedBox(height: 16.20.h),
                  TextView(
                    text: 'Powered by Infostrategy Technology Limited',
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: AppColors.infoGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
