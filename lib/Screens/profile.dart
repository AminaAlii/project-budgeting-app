// ignore_for_file: prefer_const_constructors

import 'package:budgetapp/Screens/home_page.dart';
import 'package:budgetapp/Services/Auth.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:budgetapp/controllers/expenseCon.dart';
import 'package:budgetapp/controllers/homeCon.dart';
import 'package:budgetapp/controllers/incomeCon.dart';
import 'package:budgetapp/controllers/profileController.dart';
import 'package:budgetapp/controllers/reportCon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/profile_filed.dart';

class Profile extends StatelessWidget {
  HomeController home = Get.put(HomeController());
  IncomeController inc = Get.put(IncomeController());
  ExpenseController exp = Get.put(ExpenseController());

  ReportController report = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (ProfileController con) => Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  // if()
                  home.showProfile = true;
                  home.update();
                  inc.showallinc = false;
                  inc.update();
                  // con.showaddinc = false;
                  // con.update();
                  exp.showexpen = false;
                  exp.update();
                  report.rep = false;
                  report.update();
                  exp.showaddexp = false;
                  exp.update();
                  inc.showaddincome = false;
                  inc.update();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 2.5.h,
                    color: Colors.black,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.edit,
                    size: 3.h,
                    color: Colors.black,
                  ),
                ),
              ],
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: home.showProfile == false ||
                    inc.showallinc == true ||
                    exp.showexpen == true ||
                    inc.showaddincome == true ||
                    exp.showaddexp == true ||
                    report.rep == true
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 7.5.h,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 7.3.h,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    size: 8.h,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Center(
                            child: SizedBox(
                              width: 37.w,
                              child: Divider(thickness: 1, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            "About",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 0.1),
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                            child: Divider(
                                thickness: 3, color: Colors.deepPurpleAccent),
                          ),
                          SizedBox(
                            height: 1.7.h,
                          ),
                          profilefield(currentUser.firstName, true, con.fname),
                          SizedBox(
                            height: 1.7.h,
                          ),
                          profilefield(currentUser.email, true, con.email),
                          SizedBox(
                            height: 1.7.h,
                          ),
                          profilefield("01/12/1999", false,con.dateofbirth),
                          SizedBox(
                            height: 1.7.h,
                          ),
                          profilefield("07973652876", false, con.phoneNumber),
                          SizedBox(
                            height: 6.h,
                          ),
                          SizedBox(
                            height: 5.5.h,
                            child: InkWell(
                              onTap: () {
                                showBottom(context);
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/logout.png",
                                    height: 7.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Logout",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : HomePage()));
  }

  showBottom(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 25.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 15.w,
                  child: Divider(
                    color: Colors.deepPurpleAccent,
                    thickness: 4,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Are You Sure Want To Log Out?",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.6,
                  )),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            Get.close(1);
                          },
                          label: Text("No"),
                          backgroundColor: Colors.blueGrey,
                        ),
                      ),
                    ),
                    // Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            AuthServices _auth = AuthServices();

                            _auth.logOut();
                          },
                          label: Text("Yes"),
                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
