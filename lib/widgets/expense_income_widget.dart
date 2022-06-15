import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget expense_income(String img,String title,String amount,Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:10.0,),
    child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical:4.0),
              child: Row(
                children: [
                  Image.asset(img),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      
                      children: [
                         Text(
                title,
                style: GoogleFonts.poppins(
                    letterSpacing: 1,
                    textStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 17.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300),
                ),
              ),
               Text(
                amount,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize:20.sp,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500),
                ),
              ),
                      ],
                      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        )),
  );
}
