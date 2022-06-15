import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget profilefield(
    String label, bool keyboardtype, TextEditingController con) {
  // String label=""; 
   con.text=label;
  return SizedBox(
    width: 75.w,
    child: TextFormField(enabled: false,
      controller: con,
      keyboardType:
          keyboardtype ? TextInputType.emailAddress : TextInputType.phone,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
      ),
      cursorHeight: 3.h,
      cursorWidth: 0.4.w,
      cursorColor: Colors.black26,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(17),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: label,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              const BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
