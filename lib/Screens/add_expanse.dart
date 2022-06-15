// ignore_for_file: prefer_const_constructors

import 'package:budgetapp/Screens/profile.dart';
import 'package:budgetapp/Screens/total_expense.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:budgetapp/controllers/expenseCon.dart';
import 'package:budgetapp/widgets/incomes_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.person,color: Colors.deepPurpleAccent,size: 4.3.h,),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Add expense",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17.4.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
          ),
        ),
        body: GetBuilder<ExpenseController>(
            init: ExpenseController(),
            builder: (ExpenseController con) => con.addexpense
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Category",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1)),
                          ),
                          incomes_content(),
                          SizedBox(
                            height: 6.h,
                          ),
                          if (!con.expenseI)
                            TextFormField(
                              controller: con.desc,
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
                                contentPadding: EdgeInsets.all(17),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                label: Text(
                                  "Description(Optional)",
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 1.h,
                          ),
                          if (!con.expenseI)
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: con.amount,
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
                                contentPadding: EdgeInsets.all(17),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                label: Text(
                                  "Amount",
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          if (!con.expenseI) SizedBox(height: 3.h),
                          if (!con.expenseI)
                            InkWell(
                              onTap: () {
                                if (con.cate == 'r') {
                                  con.expenseM.rent = con.amount.text;
                                  con.expenseM.rent_description = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'sub') {
                                  con.expenseM.subscription = con.amount.text;
                                  con.expenseM.subscription_description =
                                      con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'f') {
                                  con.expenseM.food = con.amount.text;
                                  con.expenseM.food_description = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'o') {
                                  con.expenseM.other = con.amount.text;
                                  con.expenseM.other_description = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'sh') {
                                  con.expenseM.shopping = con.amount.text;
                                  con.expenseM.shopping_description = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 't') {
                                  con.expenseM.transportation = con.amount.text;
                                  con.expenseM.transportation_description =
                                      con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'g') {
                                  con.expenseM.gym = con.amount.text;
                                  con.expenseM.gym_description = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                }
                                print(con.expenseM.toJSON()); 
                              },
                              child: Container(
                                width: 90.w,
                                height: 6.5.h,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Center(
                                  child: Text(
                                    con.cate == 'r'
                                        ? 'Add Rent'
                                        : con.cate == 'sub'
                                            ? 'Add Subscription'
                                            : con.cate == 'f'
                                                ? 'Add food'
                                                : con.cate == 'o'
                                                    ? 'Add Other'
                                                    : con.cate == 'sh'
                                                        ? 'Add Shopping'
                                                        : con.cate == 'g'
                                                            ? 'Add Gym'
                                                            : con.cate == 't'
                                                                ? 'Add Transportation'
                                                                : 'Select Category',
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
                          // Spacer(),
                          SizedBox(
                            height: 6.h,
                          ),
                          if (!con.expenseI)
                            Center(
                              child: InkWell(
                                onTap: () async {
                                  FirestoreServices _store =
                                      FirestoreServices();
                                  con.expenseM.user_id = currentUser.id;
                                  con.expenseM.total_expense = (int.parse(
                                              con.expenseM.rent) +
                                          int.parse(con.expenseM.subscription) +
                                          int.parse(con.expenseM.food) +
                                          int.parse(con.expenseM.shopping) +
                                          int.parse(con.expenseM.other) +
                                          int.parse(con.expenseM.gym) +
                                          int.parse(con.expenseM.transportation))
                                      .toString();
                                  if (con.expenseM.rent == "" ||
                                      con.expenseM.subscription == "" ||
                                      con.expenseM.food == "" ||
                                      con.expenseM.shopping == "" ||
                                      con.expenseM.other == "" ||
                                      con.expenseM.gym == "" ||
                                      con.expenseM.transportation == "") {
                                    Get.snackbar("Information is missing",
                                        "Enter amount in all categories");
                                    // await _store.addIncome(con.expenseM);
                                  } else {
                                    await _store.addexpense(con.expenseM);
                                    Get.to(Totalexpense());
                                    con.update();
                                    // Phoenix.rebirth(context);
                                  }
                                  // Get.off(Confirmation());
                                },
                                child: Container(
                                  width: 90.w,
                                  height: 6.5.h,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Submit Total expense",
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
                          if (con.expenseI)
                            Center(
                              child: InkWell(
                                onTap: () {
                                  FirestoreServices.delExpense(currentUser.id);
                                  con.update();
                                  // Get.back();
                                  // Phoenix.rebirth(context);
                                },
                                child: Container(
                                  width: 90.w,
                                  height: 6.5.h,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Delete all Expense data",
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
                        ],
                      ),
                    ),
                  )
                : Profile()));
  }
}
