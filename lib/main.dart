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

class MyApp extends StatelessWidget {
  final String locale;
  MyApp({
    required this.locale, Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageChangeControllerProvider(),
        ),

      ],
      child: Consumer<LanguageChangeControllerProvider>(
        builder: (context, provider, child) {
          if (locale.isEmpty) {
            provider.changeLanguage(const Locale('en'));
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
