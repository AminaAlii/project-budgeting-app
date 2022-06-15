import 'package:budgetapp/controllers/incomeCon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget tinywidget4(String img, String text, IncomeController con, cat) {
  return InkWell(
    onTap: () {
      con.cate = cat;
      con.update();
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/Rectangle.png",
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
                child: Image.asset(
                  img,
                  color: text == "Others"
                      ? Colors.blue
                      : text == "Gifts"
                          ? Colors.orange
                          : null,
                ),
              )
            ],
          ),
          SizedBox(height: 0.7.h),
          Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1),
            ),
          )
        ],
      ),
    ),
  );
}
