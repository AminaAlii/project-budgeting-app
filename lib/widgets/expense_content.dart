import 'package:budgetapp/controllers/incomeCon.dart';
import 'package:budgetapp/widgets/tiny_widget4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget expanse_content() {
  return GetBuilder<IncomeController>(
          init: IncomeController(), 
          builder: (IncomeController con) =>Container(
             padding: con.addexpanse? const EdgeInsets.symmetric(horizontal:0.0):const EdgeInsets.symmetric(horizontal:18.0), 

    width: 100.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
               
                tinywidget4("assets/images/Salary.png", "Salary",con,'s' ),
                tinywidget4("assets/images/intrest.png", "Intrest",con,'i' ),
                tinywidget4("assets/images/invest.png", "Investment",con,'in' ),
                tinywidget4("assets/images/other.png", "Others",con ,'o'),
              ],
            ),
          ),
        ),

        SizedBox(
          width: 100.w,
          child:
          con.addexpanse? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: tinywidget4("assets/images/Salary.png", "Gifts",con,'g'),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child:
                      tinywidget4("assets/images/other.png", "Business",con,'b' ),
                ),
                 ],
            ),
          ):Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child:
                        tinywidget4("assets/images/other.png", "Others", con,'o'),
                  ),
                  ],
              ),
            ),
          ),
        ),
      ],
    ),
  ));
}
