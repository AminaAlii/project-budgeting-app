// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:budgetapp/controllers/authCon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



Widget transactionType(String img,String txt1,String txt2,String subtxt1,String subtxt2) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Container(
      // height: 9.h,
      width: 90.w,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
              backgroundColor: Color(0xffFEEEEE),
              radius: 26,
              child: Image.asset(
                img,
                height: 30,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  txt1,
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 0.4.h,
                ),
                Text(
                  subtxt1,
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                        color: Color(0xffB5BCD8),
                        fontSize: 12.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "-",
                      style: GoogleFonts.cabin(
                        textStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Text(
                      txt2,
                      style: GoogleFonts.cabin(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.4.h,
                ),
                Text(
                  subtxt2,
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                        color: Color(0xffB5BCD8),
                        fontSize: 11.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

day(color, label,) {
  return GetBuilder<AuthController>(
          // id: 'aVeryUniqueID', // here
          init: AuthController(),
          builder: (AuthController con) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      // height: 1.2.h,
      width: 20.w,
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.cabin(
            letterSpacing: 1,
            textStyle: TextStyle(
                color: color == Colors.black87
                    ? Colors.deepPurpleAccent
                    : Colors.grey.shade700,
                fontSize: color == Colors.black87? 17.sp:15,
                letterSpacing: 1,
                fontWeight: color == Colors.black87? FontWeight.bold:FontWeight.normal),
          ),
        ),
      ),
      decoration:
          BoxDecoration(border: Border.all(
            color: color,
            width:color==Colors.black87? 1.5:0,
          ), borderRadius: BorderRadius.circular(30)),
    ),
  ));
}
