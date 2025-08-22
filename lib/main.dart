import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:stacked_services/stacked_services.dart';
import 'core/core_folder/app/app.locator.dart';
import 'core/core_folder/app/app.router.dart';


final navigate = locator<NavigationService>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Lock orientation early
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Medicate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        ),
        initialRoute: Routes.splashScreen,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
