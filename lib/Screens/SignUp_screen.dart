// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budgetapp/controllers/authCon.dart';
import 'package:budgetapp/widgets/auth_fileds.dart';
import 'package:budgetapp/widgets/auth_pass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool check = false;
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (AuthController con) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 2.5.h,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(
                      Icons.close,
                      size: 2.5.h,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        "Sign Up ",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "To Continue",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    // SizedBox()
                    Container(
                      height: 32.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/sign.jpeg"),
                          )),
                    ),
                    SizedBox(
                      height: 0.5,
                    ),
                    auth_fields("First Name", con.fname),
                    SizedBox(
                      height: 1.h,
                    ),
                    auth_fields("Email", con.email),

                    SizedBox(
                      height: 1.h,
                    ),
                    authpass("Password", con),

                    SizedBox(
                      height: 2.h,
                    ),
                    CheckboxListTile(
                      activeColor: Colors.deepPurpleAccent,
                      // tileColor: Colors.red,
                      side: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 2,
                      ),
                      contentPadding: EdgeInsets.all(0),
                      title: RichText(
                        text: TextSpan(
                            text: 'By signing up, ypu agree to the ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Terms of Services and Privacy Policy',
                                style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                      value: con.check,
                      onChanged: (newValue) {
                        con.check = newValue!;
                        con.update();
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          con.signUp(context);
                        },
                        child: Container(
                          width: 85.w,
                          height: 6.5.h,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h,)
                  ],
                ),
              )),
            ));
  }
}
