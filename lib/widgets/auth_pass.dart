// ignore_for_file: prefer_const_constructors

import 'package:budgetapp/controllers/authCon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget authpass(String label,AuthController con) {
  return TextFormField(controller: con.password,
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
    obscureText: !con.visible,
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(17),
      enabledBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      label: Text(
        label,
      ),
      labelStyle: TextStyle(
        color: Colors.black,
      ),
      suffixIcon: InkWell(
        onTap: () {
          con.showPass();
        },
        child: Icon(
          con.visible ? Icons.lock_open : Icons.lock_outline,
        ),
      ),
      // : Icon(Icons.lock_open),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
