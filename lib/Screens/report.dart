import 'package:budgetapp/Screens/profile.dart';
import 'package:budgetapp/controllers/reportCon.dart';
import 'package:budgetapp/widgets/expense_chart.dart';
import 'package:budgetapp/widgets/expense_content.dart';
import 'package:budgetapp/widgets/income_chart.dart';
import 'package:budgetapp/widgets/incomes_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
   
    String currentValue = "";
    // String selectValue = "";

    Widget dropdown(List<String> arr, String hint) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          underline: const SizedBox(),

          enableFeedback: true,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
          isExpanded: true,
          iconSize: 0.h,
          // icon: Icon(Icons.arrow_drop_down_outlined),
          hint: Text(
            hint,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          items: arr
              .map((label) => DropdownMenuItem(
                    child: Text(
                      label.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: label,
                  ))
              .toList(),
          onChanged: (String? value) {
            setState(
              () {
                value = currentValue;
              },
            );
          },
        ),
      );
    }

    return Scaffold(
        body: GetBuilder<ReportController>(
            // specify type as Controller
            init: ReportController(), // intialize with the Controller
            builder: (ReportController con) => 
            con.incomelist.isEmpty|| con.expenselist.isEmpty
                                  ? Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 100,
                                          child: Center(
                                              child: CircularProgressIndicator(
                                            color: Colors.purple.shade700,
                                          ))),
                                          const Text("Set Income & expense first")
                                    ],
                                  )
                                  :con.rep == false
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    con.rep = true;
                                    con.update();
                                  },
                                  child: Icon(
                                    Icons.person,
                                    size: 4.3.h,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            
                              Text(
                                "Report",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.4.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1)),
                              ),
                              // const Spacer(),
                              const Spacer(),
                             Icon(
                                    Icons.person,
                                    size: 4.3.h,
                                    color: Colors.transparent
                                  ,
                                  ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            // SizedBox(width: 3.w,),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                height: 5.5.h,
                                width: 43.w,
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    if (con.income == false) {
                                      con.income = true;
                                      con.update();
                                    }
                                    con.update();
                                    if (con.expense = true) {
                                      con.expense = false;
                                      con.update();
                                    }
                                  },
                                  label: Text(
                                    "Income",
                                    style: TextStyle(
                                      color: con.income
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  backgroundColor: con.income
                                      ? Colors.deepPurpleAccent
                                      : Colors.white,
                                ),
                              ),
                            ),
                            // Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                height: 5.5.h,
                                width: 43.w,
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    con.expense = true;
                                    con.update();
                                    if (con.income = true) {
                                      con.income = false;
                                      con.update();
                                    }
                                  },
                                  label: Text(
                                    "expense",
                                    style: TextStyle(
                                      color: con.expense
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  backgroundColor: con.expense
                                      ? Colors.deepPurpleAccent
                                      : Colors.white,
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        if (con.income == true)  ExpanseChart(con.incomelist),
                        if (con.income == false)  IncomeChart(con.expenselist),
                        con.income
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: expanse_content(),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: incomes_content(),
                              ),
                      ],
                    ),
                  )
                : Profile()));
  }
}
