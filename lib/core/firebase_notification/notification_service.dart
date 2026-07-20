import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicate_app/main.dart';

import '../../fire_base.dart';
import '../core_folder/app/app.router.dart';

class NotificationService {
  final FirebaseMessaging _fm = FirebaseMessaging.instance;
  // final ApiClient api; // your authed HTTP client
  NotificationService();

  final AndroidNotificationChannel _androidChannel =
      const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title// description
        description: 'This channel is used for important notification',
        importance: Importance.defaultImportance,
        playSound: true,
      );
  AppleNotificationSound appleNotificationSound = const AppleNotificationSound(
    critical: true,
    name: 'default.aiff',
    volume: 3,
  );

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    print('serious fb ${message?.data}');
    if (message == null) return;
    // if (message.data['message'] != null &&
    //     message.data['sender_type'] == 'Doctor') {
    navigate.navigateTo(Routes.welcomeScreenNotification);
    // }

    // navigation to screens when push notification pops should be implemented here
  }

  Future initLocalNotification() async {
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings("@drawable/logo");
    const settings = InitializationSettings(android: android, iOS: ios);
    await flutterLocalNotificationsPlugin.initialize(
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      settings: settings,
    );
    final platform = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    platform?.createNotificationChannel(_androidChannel);
  }

  void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse, {
    context,
  }) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      print('notification payload: $payload');
      final message = RemoteMessage.fromMap(jsonDecode(payload!));
      handleMessage(message);
    }
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      flutterLocalNotificationsPlugin.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: "@drawable/logo",
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            sound: 'default.aiff',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> _initNotification() async {
    // Request permission
    NotificationSettings settings = await _fm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('settings.authorizationStatus::::: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      await _fm.setAutoInitEnabled(true);

      // Get APNs token (iOS only)
      String? apnsToken = await _fm.getAPNSToken();
      if (apnsToken != null) {
        print("APNs Token: $apnsToken");
      } else {
        print(
          "APNs token is still null. Ensure push notifications are enabled.",
        );
      }

      // Get FCM token
      String? fcmToken = await _fm.getToken();
      print("FCM Token: $fcmToken");
    } else {
      print('User declined or has not accepted notification permissions');
    }
  }

  Future<void> initNotification() async {
    await _fm.requestPermission();
    globalfCMToken = await _fm.getToken();
    initPushNotification();
    initLocalNotification();
    _initNotification();
  }
}
