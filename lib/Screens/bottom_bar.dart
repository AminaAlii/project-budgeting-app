// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:budgetapp/Screens/add_expanse.dart';
import 'package:budgetapp/Screens/add_income.dart';
import 'package:budgetapp/Screens/home_page.dart';
import 'package:budgetapp/Screens/navv.dart';
import 'package:budgetapp/Screens/report.dart';
import 'package:budgetapp/Screens/total_expense.dart';
import 'package:budgetapp/Screens/total_incoms.dart';
import 'package:budgetapp/controllers/expenseCon.dart';
import 'package:budgetapp/controllers/homeCon.dart';
import 'package:budgetapp/controllers/incomeCon.dart';
import 'package:budgetapp/controllers/navCon.dart';
import 'package:budgetapp/controllers/reportCon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavv extends StatefulWidget {
  const BottomNavv({Key? key}) : super(key: key);

  @override
  State<BottomNavv> createState() => _BottomNavvState();
}

class _BottomNavvState extends State<BottomNavv> {
    HomeController hom = Get.put(HomeController());
    IncomeController inc = Get.put(IncomeController());

  ExpenseController exp = Get.put(ExpenseController());
  // report
  ReportController report = Get.put(ReportController());
bool keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  final List<Widget> screens = [
    HomePage(),
    TotalIncome(),
    AddIncome(),
    AddExpense(),
    Totalexpense(),
    Report(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
        // id: 'aVeryUniqueID', // here
        init: NavController(),
        builder: (NavController con) => Scaffold(
              resizeToAvoidBottomInset: true,
              body: PageStorage(
                  bucket: bucket,
                  child: Stack(
                    children: [
                      con.floatshow
                          ? AddIncome()
                          : con.floatshow2
                              ? AddExpense()
                              : con.currentScreen,
                    ],
                  )),
              floatingActionButton: keyboardIsVisible()?Container():BottomNavButton(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: BottomAppBar(
                      shape: CircularNotchedRectangle(),
                      notchMargin: 20,
                      child: SizedBox(
                        height: 70,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Spacer(),
                                  MaterialButton(
                                    minWidth: 10,
                                    onPressed: () {
                                      con.currentScreen = HomePage();
                                      con.floatshow2 = false;
                                      con.floatshow = false;
                                      con.currentTab = 0;
                                      con.update();
                                      hom.showProfile = true;
                                      hom.update();
                                      report.rep = false;
                                      report.update();
                                      exp.showexpen = false;
                                      exp.update();
                                      inc.showallinc = false;

                                      inc.update();
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/homeg.png",
                                          color: con.currentTab == 0
                                              ? Colors.deepPurpleAccent
                                              : Colors.black54,
                                          height: 4.h,
                                        ),
                                        Text(
                                          "Home",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                            color: con.currentTab == 0
                                                ? Colors.deepPurpleAccent
                                                : Colors.black54,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // FloatingActionButton(onPressed: onPressed),

                                  MaterialButton(
                                    minWidth: 10,
                                    onPressed: () {
                                      con.currentScreen = TotalIncome();
                                      con.currentTab = 1;
                                      con.floatshow2 = false;
                                      con.floatshow = false;
                                      con.update();
                                      hom.showProfile = true;
                                      hom.update();
                                      report.rep = false;
                                      report.update();
                                      exp.showexpen = false;
                                      exp.update();
                                      inc.showallinc = false;

                                      inc.update();
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/handbag.png",
                                          color: con.currentTab == 1
                                              ? Colors.deepPurpleAccent
                                              : Colors.black54,
                                          height: 4.h,
                                        ),
                                        Text(
                                          "Income",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                            color: con.currentTab == 1
                                                ? Colors.deepPurpleAccent
                                                : Colors.black54,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(height: 10.h,child: float()),
                                  // Icon(),

                                  MaterialButton(
                                    minWidth: 10,
                                    onPressed: () {
                                      // setState(() {
                                      //   // con.currentScreen = AddIncome();
                                      //   // con.currentTab = 2;
                                      // },

                                      // );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/inbg.png",
                                          height: 0.h,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Add Income",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 0.sp)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                    minWidth: 10,
                                    onPressed: () {
                                      con.currentScreen = Totalexpense();
                                      con.currentTab = 2;
                                      con.floatshow2 = false;
                                      con.floatshow = false;
                                      con.update();
                                      hom.showProfile = true;
                                      hom.update();
                                      report.rep = false;
                                      report.update();
                                      exp.showexpen = false;
                                      exp.update();
                                      inc.showallinc = false;

                                      inc.update();
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/transaction.png",
                                          color: con.currentTab == 2
                                              ? Colors.deepPurpleAccent
                                              : Colors.black54,
                                        ),
                                        Text(
                                          "expense",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                            color: con.currentTab == 2
                                                ? Colors.deepPurpleAccent
                                                : Colors.black54,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(height: 10.h,child: float()),
                                  // Icon(),
                                  MaterialButton(
                                    minWidth: 10,
                                    onPressed: () {
                                      con.currentScreen = Report();
                                      con.currentTab = 3;
                                      con.floatshow2 = false;
                                      con.floatshow = false;
                                      con.update();
                                      hom.showProfile = true;
                                      hom.update();
                                      report.rep = false;
                                      report.update();
                                      exp.showexpen = false;
                                      exp.update();
                                      inc.showallinc = false;

                                      inc.update();
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.report,
                                          color: con.currentTab == 3
                                              ? Colors.deepPurpleAccent
                                              : Colors.black54,
                                          size: 4.h,
                                        ),
                                        Text(
                                          "Report",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                            color: con.currentTab == 3
                                                ? Colors.deepPurpleAccent
                                                : Colors.black54,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                    minWidth: 10,
                                    onPressed: () {
                                      // setState(() {
                                      //   con.currentScreen = Report();
                                      //   con.currentTab = 3;
                                      // },

                                      // );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.dashboard,
                                          color: Colors.white,
                                          // size: 2.h,
                                        ),
                                        Text(
                                          "Report",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.sp)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
