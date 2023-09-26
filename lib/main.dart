import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mixfoodapp/Page/Bottombar.dart';
import 'package:mixfoodapp/class/lang.dart';
import 'package:mixfoodapp/controller/lan_change_controller.dart';
import 'package:mixfoodapp/local_notidication.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  tz.initializeTimeZones();
  await initializeTimeZone();

  WidgetsFlutterBinding.ensureInitialized();


  var sp = await SharedPreferences.getInstance();
  final languageCode = sp.getString('language_code') ?? '';
  runApp(
    DevicePreview(
      builder: (context) => MyApp(
        locale: languageCode,
      ),
    ),
  );


  await LocalNotification.initilization();

}

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// Future<void> scheduleMorningNotification() async {
//   tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   var scheduledTime = tz.TZDateTime(
//     tz.local,
//     now.year,
//     now.month,
//     now.day,
//     11, // 9 AM
//     30, // Minutes
//     0, // Seconds
//   );

  // if (scheduledTime.isBefore(now)) {
  //   scheduledTime = scheduledTime.add(const Duration(milliseconds:2 ));
  // }
  //
  // var androidPlatformChannelSpecifics =
  //     AndroidNotificationDetails(
  //   'channel_id',
  //   'channel_name',
  // //  'channel_description',
  //   importance: Importance.high,
  //   priority: Priority.high,
  // );

 // IOSNotificationDetails iosPlatformChannelSpecifics = IOSNotificationDetails();

  //  final  NotificationDetails platformChannelSpecifics = NotificationDetails(
  //   android: androidPlatformChannelSpecifics,
  //  // iOS: iosPlatformChannelSpecifics,
  // );

  // await flutterLocalNotificationsPlugin.zonedSchedule(
  //   0, // Unique ID for the notification
  //   'Good Morning!',
  //   "It's 9 AM, time to start your day!", // Message
  //   scheduledTime,
  //   platformChannelSpecifics,
  //   androidAllowWhileIdle: true,
  //   uiLocalNotificationDateInterpretation:
  //       UILocalNotificationDateInterpretation.absoluteTime,
  //   payload: 'MorningNotificationPayload',
  // );
//}

class MyApp extends StatelessWidget {
  final String locale;
  MyApp({
    Key? key,
    required this.locale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => LanguageChangeControllerProvider()),
      ],
      child: Consumer<LanguageChangeControllerProvider>(
        builder: (context, provider, child) {
          if (locale.isEmpty) {
            provider.changeLanguage(Locale('en'));
          }
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,

            locale: locale == ''
                ? const Locale('en')
                : provider.appLocale == null
                    ? const Locale('en')
                    : provider.appLocale,
            supportedLocales: const [
              Locale('en'),
              Locale('hi'),
              Locale('gu'), // Spanish
            ],

            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,

            home: Bottomtabbar(),
          );
        },
      ),
    );
  }
}
