// ignore_for_file: prefer_const_constructors

import 'package:budgetapp/controllers/incomeCon.dart';
import 'package:budgetapp/Screens/profile.dart';
import 'package:budgetapp/widgets/expense_income_widget.dart';
import 'package:budgetapp/widgets/income_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TotalIncome extends StatelessWidget {
  const TotalIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<IncomeController>(
      // id: 'aVeryUniqueID', // here
      init: IncomeController(),
      builder: (IncomeController con) => con.incomelist.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.purple.shade700,
                    ))),
                const Text("Set Income first")
              ],
            )
          : con.showallinc == false
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  con.showallinc = true;

                                  con.update();
                                },
                                child: Icon(
                                  Icons.person,
                                  size: 4.3.h,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Income",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.4.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1)),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 5.w,
                              )
                              // Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          expense_income(
                              "assets/images/inbg.png",
                              "Income",
                              "£" + con.incomelist.first.total_income,
                              Color(0xFF00a96b)),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      incometile("assets/images/Salary.png", "Salary",
                          "£" + con.incomelist.first.salary),
                      incometile("assets/images/other.png", "Business",
                          "£" + con.incomelist.first.business),
                      incometile("assets/images/intrest.png", "Intrest",
                          "£" + con.incomelist.first.interest),
                      incometile("assets/images/invest.png", "Investment",
                          "£" + con.incomelist.first.investment),
                      incometile("assets/images/gift.png", "Gifts",
                          "£" + con.incomelist.first.gifts),
                      incometile("assets/images/other.png", "Others",
                          "£" + con.incomelist.first.other),
                    ],
                  ),
                )
              : Profile(),
    ));
  }
}
