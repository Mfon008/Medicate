import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/route_class.dart';
import 'package:medicate_app/firebase_options.dart';
import 'package:stacked_services/stacked_services.dart';
import 'core/core_folder/app/app.locator.dart';
import 'core/core_folder/app/app.router.dart';
import 'core/core_folder/manager/shared_preference.dart';
import 'core/firebase_notification/notification_service.dart';

final navigate = locator<NavigationService>();
var globalfCMToken;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await NotificationService().initNotification();
  }

  setupLocator();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const AppBootstrap());
}

class AppBootstrap extends StatefulWidget {
  const AppBootstrap({super.key});

  @override
  State<AppBootstrap> createState() => _AppBootstrapState();
}

class _AppBootstrapState extends State<AppBootstrap> {
  bool initialized = false;

  @override
  void initState() {
    _initAsync();
    super.initState();
  }

  Future<void> _initAsync() async {
    await locator<SharedPreferencesService>().initilize();
    setState(() => initialized = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
    }

    // Move to real app
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Medicate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        ),
        initialRoute: AppRoutes().returnAppRoutes(
          SharedPreferencesService.instance,
        ),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
