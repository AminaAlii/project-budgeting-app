// ignore_for_file: prefer_const_constructors

import 'package:budgetapp/Screens/profile.dart';
import 'package:budgetapp/Screens/total_incoms.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:budgetapp/controllers/incomeCon.dart';
import 'package:budgetapp/widgets/expense_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddIncome extends StatelessWidget {
  const AddIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<IncomeController>(
            init: IncomeController(),
            builder: (IncomeController con) => con.showaddincome == false
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    con.showaddincome = true;
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
                                  "Add Income",
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
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Select Category",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1)),
                          ),
                          expanse_content(),
                          SizedBox(
                            height: 6.h,
                          ),
                          if (!con.incomeI)
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
                          if (!con.incomeI)
                            TextFormField(
                              controller: con.amount,
                              keyboardType: TextInputType.number,
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
                          if (!con.incomeI) SizedBox(height: 3.h),
                          if (!con.incomeI)
                            InkWell(
                              onTap: () {
                                if (con.cate == 's') {
                                  con.incomeM.salary = con.amount.text;
                                  con.incomeM.salary_desc = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'i') {
                                  con.incomeM.interest = con.amount.text;
                                  con.incomeM.interest_desc = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'in') {
                                  con.incomeM.investment = con.amount.text;
                                  con.incomeM.investment_desc = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'o') {
                                  con.incomeM.other = con.amount.text;
                                  con.incomeM.other_desc = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'b') {
                                  con.incomeM.business = con.amount.text;
                                  con.incomeM.business_desc = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                } else if (con.cate == 'g') {
                                  con.incomeM.gifts = con.amount.text;
                                  con.incomeM.gifts_desc = con.desc.text;
                                  con.amount.text = "";
                                  con.desc.text = "";
                                }
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
                                    con.cate == 's'
                                        ? 'Add Salary'
                                        : con.cate == 'i'
                                            ? 'Add Interest'
                                            : con.cate == 'in'
                                                ? 'Add Investment'
                                                : con.cate == 'o'
                                                    ? 'Add Other'
                                                    : con.cate == 'b'
                                                        ? 'Add Business'
                                                        : con.cate == 'g'
                                                            ? 'Add Gifts'
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
                          SizedBox(height: 6.h),
                          if (!con.incomeI)
                            Center(
                              child: InkWell(
                                onTap: () async {
                                  FirestoreServices _store =
                                      FirestoreServices();
                                  con.incomeM.user_id = currentUser.id;
                                  con.incomeM.total_income = (int.parse(
                                              con.incomeM.salary) +
                                          int.parse(con.incomeM.interest) +
                                          int.parse(con.incomeM.investment) +
                                          int.parse(con.incomeM.gifts) +
                                          int.parse(con.incomeM.business) +
                                          int.parse(con.incomeM.other))
                                      .toString();
                                  if (con.incomeM.salary == "" ||
                                      con.incomeM.interest == "" ||
                                      con.incomeM.investment == "" ||
                                      con.incomeM.gifts == "" ||
                                      con.incomeM.business == "" ||
                                      con.incomeM.other == "") {
                                    Get.snackbar("Information is missing",
                                        "Enter amount in all categories");
                                    // await _store.addIncome(con.incomeM);
                                  } else {
                                    await _store.addIncome(con.incomeM);
                                    Get.to(TotalIncome());

                                    con.update();
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
                                      "Submit Total Income",
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
                          if (con.incomeI)
                            Center(
                              child: InkWell(
                                onTap: () {
                                  FirestoreServices.delIncome(currentUser.id);
                                  con.update();
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
                                      "Delete all Income data",
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
