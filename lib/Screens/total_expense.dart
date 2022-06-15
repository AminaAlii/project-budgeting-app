import 'package:budgetapp/Screens/profile.dart';
import 'package:budgetapp/controllers/expenseCon.dart';
import 'package:budgetapp/widgets/Expense_tile.dart';
import 'package:budgetapp/widgets/expense_income_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Totalexpense extends StatelessWidget {
  const Totalexpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ExpenseController>(
            init: ExpenseController(),
      builder: (ExpenseController con) => con.expenselist.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.purple.shade700,
                    ))),
                const Text("Set expenses first")
              ],
            )
          : con.showexpen == false
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
                                  con.showexpen = true;
                                  con.update();
                                },
                                child: Icon(
                                  Icons.person,
                                  size: 4.3.h,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "expense",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.4.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1)),
                              ),
                              const Spacer(),
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
                              "assets/images/exbgg.png",
                              "expenses",
                              "£" + con.expenselist.first.total_expense,
                              const Color(0xFFfb3c4a)),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      expense_tile(
                          "assets/images/homeg.png",
                          "Rent",
                          con.expenselist.first.rent_description,
                          "£" + con.expenselist.first.rent),
                      expense_tile(
                          "assets/images/gym.png",
                          "Gym",
                          con.expenselist.first.gym_description,
                          "£" + con.expenselist.first.gym),
                      expense_tile(
                          "assets/images/shop.png",
                          "Shopping",
                          con.expenselist.first.shopping_description,
                          "£" + con.expenselist.first.shopping),
                      expense_tile(
                          "assets/images/food.png",
                          "Food",
                          con.expenselist.first.food_description,
                          "£" + con.expenselist.first.food),
                      expense_tile(
                          "assets/images/transport.png",
                          "Transportation",
                          con.expenselist.first.transportation_description,
                          "£" + con.expenselist.first.transportation),
                      expense_tile(
                          "assets/images/subscribe.png",
                          "Subscription",
                          con.expenselist.first.subscription_description,
                          "£" + con.expenselist.first.subscription),
                      expense_tile(
                          "assets/images/other.png",
                          "Others",
                          con.expenselist.first.other_description,
                          "£" + con.expenselist.first.other),
                    ],
                  ),
                )
              : Profile(),
    ));
  }
}
