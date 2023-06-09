import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Page/Bottombar.dart';

import 'Page/createrecipe.dart';
import 'Page/notification.dart';
import 'Page/saverecipe.dart';

void main() {
  runApp( DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>MyApp()),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const Bottomtabbar(),
    );
  }
}
