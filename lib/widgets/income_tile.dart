import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget incometile(String img, String title,  String amount) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: ListTile(
      contentPadding: EdgeInsets.all(10),
      leading:Stack(
              children: [
                Image.asset("assets/images/Rectangle.png"),
              Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: Image.asset(img),
                      )
              ],
            ),
          
      horizontalTitleGap: 4,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      trailing: Padding(
        padding: const EdgeInsets.only(bottom: 0.0, right: 10),
        child: Text(
          // "-£1500",
          amount,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color:  title == "Bussiness"
                  ? Colors.pink
                  : title == "Intrest"
                      ? Colors.amber
                      : title == 'Salary'
                          ? Colors.green
                          : title == "Investment"
                              ? Colors.red
                              : title == "Gifts"
                                  ? Colors.blue
                                  : title == "Others"
                                      ? Colors.deepPurpleAccent
                                      : null,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}
