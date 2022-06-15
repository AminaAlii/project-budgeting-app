// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:budgetapp/Services/global.dart';
import 'package:budgetapp/controllers/homeCon.dart';
import 'package:budgetapp/Screens/profile.dart';
import 'package:budgetapp/widgets/expense_income_widget.dart';
import 'package:budgetapp/widgets/welcome_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomeController>(
            // id: 'aVeryUniqueID', // here
            init: HomeController(),
            builder: (HomeController con) => con.showProfile
                ? SafeArea(
                    child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    con.showProfile = !con.showProfile;
                                    con.update();
                                  },
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.deepPurpleAccent,
                                    size: 4.3.h,
                                  )),
                            ],
                          ),
                        ),
                        Text(
                          "Welcome",
                          style: GoogleFonts.cabin(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          currentUser.firstName,
                          style: GoogleFonts.cabin(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        welcomechart(),
                        SizedBox(height: 20),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        //   child: SizedBox(
                        //       height: 4.h,
                        //       width: 100.w,
                        //       // width: 1299,
                        //       child: ListView(
                        //           scrollDirection: Axis.horizontal,
                        //           children: [
                        //             day(Color(0xffF2F2F2), "Today "),
                        //             day(Color(0xffF2F2F2), "Week"),
                        //             day(Colors.black87, "Month"),
                        //             day(Color(0xffF2F2F2), "Year"),
                        //           ])),
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 100.w,
                          child:
                              con.incomelist.isEmpty || con.incomelist.isEmpty
                                  ? Column(
                                    children: [
                                      SizedBox(
                                          height: 100,
                                          child: Center(
                                              child: CircularProgressIndicator(
                                            color: Colors.purple.shade700,
                                          ))),
                                          Text("Set Income & expenses first")
                                    ],
                                  )
                                  : Row(
                                      children: [
                                        Spacer(),
                                        con.incomelist.first.total_income==''
                                            ?expense_income(
                                            "assets/images/inbg.png",
                                            "Income",
                                            "£0",
                                            Color(0xFF00a96b))  :expense_income(
                                            "assets/images/inbg.png",
                                            "Income",
                                            "£" +
                                                (con.incomelist.first
                                                    .total_income),
                                            Color(0xFF00a96b)),
                                        Spacer(),
                                        con.expenselist.first.total_expense==''
                                            ? expense_income(
                                                "assets/images/exbgg.png",
                                                'expense',
                                                "£0",
                                                Color(0xFFfb3c4a))
                                            : expense_income(
                                                "assets/images/exbgg.png",
                                                'expense',
                                                "£" +
                                                    (con.expenselist.first
                                                        .total_expense),
                                                Color(0xFFfb3c4a)),
                                        Spacer()
                                      ],
                                    ),
                        ),
                      ],
                    ),
                  ))
                : Profile()));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
