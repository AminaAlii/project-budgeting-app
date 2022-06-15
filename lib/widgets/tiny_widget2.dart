import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget tinywidget2(String img,String text,con,cat) {
  return InkWell(onTap: () {
      con.cate = cat;
      con.update();
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
         
               Image.asset(img),
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
    ),
  );
}
