import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget tinywidget(String img,String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(img),
          ),
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
