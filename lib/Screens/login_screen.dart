// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budgetapp/Screens/SignUp_screen.dart';
import 'package:budgetapp/controllers/authCon.dart';
import 'package:budgetapp/widgets/auth_fileds.dart';
import 'package:budgetapp/widgets/auth_pass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (AuthController con) => Scaffold(
              backgroundColor: Color(0xFFfaf9fe),
              body: SingleChildScrollView(
                  child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "Sign In ",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                      height: 42.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/signn.jpeg"),
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 0.5,
                    ),
                    Container(
                      width: 100.w,
                      // height: 2.h,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8),
                        child: Column(
                          children: [
                            auth_fields("Email Address", con.email),
                            SizedBox(
                              height: 1.h,
                            ),
                            authpass("Password", con),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // Spacer(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  con.signInWithEmail(context);
                                  
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
                                      "Sign In",
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
                            SizedBox(
                              height: 1.5.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(SignUpScreen());
                              },
                              child: RichText(
                                text: TextSpan(
                                    text: 'Don\'t have an account?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Create',
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 17.sp),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ));
  }
}
