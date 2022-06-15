import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget tinywidget3(String img,String text,bool home,con,cat) {
  return InkWell(onTap:() {
      con.cate = cat;
      con.update();
    },
    child: Column(
      children: [
        Stack(
          children: [
            Image.asset("assets/images/Rectangle.png"),
           home? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
              child: Image.asset(img),
            ):Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0,vertical: 10),
              child: Image.asset(img),
            ),
          ],
        ),
        SizedBox(height:0.7.h),
        Text(text,
        style: GoogleFonts.poppins(
          textStyle:TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1
          ),
        ),)
      ],
    ),
  );
}
