import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CloudMessages {
  static final CloudMessages instance = CloudMessages();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel androidNotificationChannel =
      const AndroidNotificationChannel(
          'high_importance_channel', 'high_importance_Notification',
          description: 'high_importance_channel',
          importance: Importance.high,
          showBadge: false);

  Future<String?> getNotificationToken() async {
    final messageToken = await messaging.getToken();
    // ignore: avoid_print
    print('messageToken: $messageToken');

    return messageToken;
  }

  Future<void> initializeLocalNotification() async =>
      flutterLocalNotificationsPlugin.initialize(const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/notification_logo'),
          iOS: IOSInitializationSettings()));

  Future<void> createNotificationChannelAndroid() async =>
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidNotificationChannel);

  Future<void> permissionFirebaseNotification() async {
    if (Platform.isIOS) {
      final permission = await messaging.requestPermission();
      switch (permission.authorizationStatus) {
        case AuthorizationStatus.authorized:
        case AuthorizationStatus.denied:
        case AuthorizationStatus.notDetermined:
        case AuthorizationStatus.provisional:
      }
    }
  }

  Future<void> setForegroundNotificationShowOption() async {
    await messaging.setForegroundNotificationPresentationOptions(
        alert: true, sound: true);
  }

  Future<void> terminatedNotification() async {
    await messaging.getInitialMessage();
  }

  Future<void> listenToForegroundMessages() async {
    FirebaseMessaging.onMessage.listen((message) async {
      final notification = message.notification;
      final android = message.notification?.android;
      if (message.notification != null) {
        await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
              android: setAndroidNotificationDetail(icon: android?.smallIcon),
              iOS: const IOSNotificationDetails(),
            ));
      }
    });
  }

  AndroidNotificationDetails setAndroidNotificationDetail({String? icon}) =>
      AndroidNotificationDetails(
          androidNotificationChannel.id, androidNotificationChannel.name,
          icon: icon
          //icon: '@mipmap/ic_launcher'
          );
}

/*

  Future<void> createNotificationChannelAndroid222() async =>
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions();*/

