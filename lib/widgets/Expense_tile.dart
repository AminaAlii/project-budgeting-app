import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget expense_tile(String img, String title, String subtitle, String amount) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: title == "Gym" || title == "Rent"||title == "Others"
          ? Stack(
              children: [
                Image.asset("assets/images/Rectangle.png"),
                title == "Gym"||title == "Others"
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: Image.asset(img),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 10),
                        child: Image.asset(img),
                      )
              ],
            )
          : Image.asset(img),
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
      subtitle: Text(
        // "Housing Bills:Rent, Water, Electricity",
        subtitle,
        maxLines: 4,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.grey.shade500,
            letterSpacing: 1,
            fontSize: 13.5.sp,
            fontWeight: FontWeight.w500,
            // height: 0.6
          ),
        ),
      ),
      // isThreeLine: true,
      trailing: Padding(
        padding: const EdgeInsets.only(bottom: 35.0, right: 10),
        child: Text(
          // "-£1500",
          amount,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: title == "Gym"
                  ? Colors.pink
                  : title == "Shopping"
                      ? Colors.amber
                      : title == 'Rent'
                          ? Colors.green
                          : title == "Food"
                              ? Colors.red
                              : title == "Transportaion"
                                  ? Colors.blue
                                  : title == "Subscription"
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
