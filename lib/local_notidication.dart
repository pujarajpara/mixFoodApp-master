import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final _localNotification = FlutterLocalNotificationsPlugin();

class LocalNotification {
  static Future<void> initilization() async {
    await _localNotification
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();

    const androidInitilze =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initializationSettingsDarwin = DarwinInitializationSettings();

    const initializationSetting = InitializationSettings(
        android: androidInitilze, iOS: initializationSettingsDarwin);
  //  await _localNotification.initialize(initializationSettings,onSelectNotification:selectNotification);
    await _localNotification.initialize(initializationSetting);

  }

  static Future<void> showBigTextNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidNotificationDetails = AndroidNotificationDetails(
        'channel_name', 'channel_name',
        importance: Importance.max, priority: Priority.high);

    const darwinNotificationDetails =
        DarwinNotificationDetails(presentSound: false);
    const not = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    await _localNotification.show(id, title, body, not);

  }
}
