import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapido_clone/utills/app_color.dart';
import 'package:rapido_clone/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rapido Clone',
      theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primaryColor
        ),
        primaryColor: AppColor.primaryColor,
        secondaryHeaderColor: AppColor.primaryColor,
        buttonColor: AppColor.primaryColor,
        backgroundColor: AppColor.white
      ),
      home: SplashScreen()
    );
  }
}

