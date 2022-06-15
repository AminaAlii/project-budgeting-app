import 'package:budgetapp/controllers/expenseCon.dart';
import 'package:budgetapp/widgets/tiny_widget2.dart';
import 'package:budgetapp/widgets/tiny_widget3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget incomes_content() {
  return GetBuilder<ExpenseController>(
      // specify type as Controller
      init: ExpenseController(), // intialize with the Controller
      builder: (ExpenseController con) => Container(
            padding: con.addincome
                ? const EdgeInsets.symmetric(horizontal: 0.0)
                : const EdgeInsets.symmetric(horizontal: 18.0),
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                con.addincome
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              // Spacer(),
                              tinywidget3(
                                  "assets/images/homeg.png", "Rent", true,con,'r'),

                              tinywidget2("assets/images/subscribe.png",
                                  "Subscription",con,'sub'),
                              tinywidget2("assets/images/food.png", "Food",con,'f'),
                              tinywidget2("assets/images/shop.png", "Shopping",con,'sh'),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              tinywidget3(
                                  "assets/images/homeg.png", "Rent", true,con,'r'),
                              tinywidget2("assets/images/subscribe.png",
                                  "Subscription",con,'sub'),
                              tinywidget2("assets/images/food.png", "Food",con,'f'),
                              tinywidget2("assets/images/shop.png", "Shopping",con,'sh'),
                            ],
                          ),
                        ),
                      ),
                con.addincome
                    ? SizedBox(
                        width: 100.w,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: tinywidget2(
                                    "assets/images/food.png", "Gym",con,'g'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: tinywidget3(
                                    "assets/images/other.png", "Others", false,con,'o'),
                              ),
                              con.income
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: tinywidget2(
                                          "assets/images/transport.png",
                                          "Transport",con,'t'),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ))
                    : SizedBox(
                        width: 100.w,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: tinywidget2(
                                    "assets/images/food.png", "Gym",con,'g'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                child: tinywidget3(
                                    "assets/images/other.png", "Others", false,con,'o'),
                              ),
                              con.income
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: tinywidget2(
                                          "assets/images/transport.png",
                                          "Transport",con,'t'),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ))
              ],
            ),
          ));
}
