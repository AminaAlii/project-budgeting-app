// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:budgetapp/Screens/bottom_bar.dart';
import 'package:budgetapp/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () async {
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          bool userExist = AuthServices.checkUser();
          Get.off(userExist ? BottomNavv() : SignIn());
        }
      } on SocketException catch (_) {
        Get.snackbar("No Internet Connection", "Please connect your internet");
        Get.off(SignIn());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          "assets/images/splash.jpeg",
        ))),
      ),
    );
  }
}
