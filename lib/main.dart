import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Page/Bottombar.dart';
import 'package:mixfoodapp/Page/home.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {


  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: Bottomtabbar(
    ),
    );
  }
}
