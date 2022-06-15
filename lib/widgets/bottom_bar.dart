// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:budgetapp/controllers/authCon.dart';
import 'package:budgetapp/Screens/navv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget float() {
  return GetBuilder<AuthController>(
      // id: 'aVeryUniqueID', // here
      init: AuthController(),
      builder: (AuthController con) => Container(
            // height: 10.h,
            // color: Colors.transparent,
            // width: 100.w,
            child: Stack(
              children: [
                con.showFab
                    ? Positioned(
                        bottom: 10.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 120),
                          child: FloatingActionButton(
                            onPressed: () {
                              // Get.to(AddIncome());
                              // con.key.currentState!.reverseAnimation();
                              con.floatshow = true;
                              con.currentTab = 1;
                              con.showFab = false;
                              con.update();
                            },
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/images/incomebg.png",
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                Positioned(
                  bottom: 10.h,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      con.showFab
                          ? Padding(
                              padding: const EdgeInsets.only(right: 140.0),
                              child: FloatingActionButton(
                                onPressed: () {
                                  con.floatshow2 = true;
                                  con.currentTab = 2;
                                  con.update();
                                },
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  "assets/images/expansebg.png",
                                ),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
                BottomNavButton(),
                
              ],
            ),
          ));
}
