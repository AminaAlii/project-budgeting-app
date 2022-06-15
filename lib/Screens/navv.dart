// ignore_for_file: prefer_const_constructors

import 'package:circular_menu/circular_menu.dart';
import 'package:budgetapp/controllers/expenseCon.dart';
import 'package:budgetapp/controllers/incomeCon.dart';
import 'package:budgetapp/controllers/navCon.dart';
import 'package:budgetapp/widgets/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavButton extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<BottomNavButton>
    with TickerProviderStateMixin {
  NavController con = Get.put(NavController());
  ExpenseController exp = Get.put(ExpenseController());
  IncomeController inc = Get.put(IncomeController());
  late Animation<double> _myAnimation;
  late AnimationController _controller;
  GlobalKey<CircularMenuState> key = GlobalKey<CircularMenuState>();

  final int _currentSelected = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _myAnimation =
        CurvedAnimation(curve: Curves.decelerate, parent: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Stack(
        children: [
          con.showFab
              ? Positioned(
                  bottom: 6.h,
                  left: 34.5.w,
                  child: SizedBox(
                    height: 4.5.h,
                    child: FloatingActionButton(
                      onPressed: () {
                        // Get.to(AddIncome());
                        // con.key.currentState!.reverseAnimation();
                        if (con.floatshow2 == true) {
                          con.floatshow2 = false;
                          con.update();
                        }
                        con.floatshow = true;
                        con.update();
                        // inc.showaddincome = false;
                        con.currentTab = 1;
                        con.showFab = false;
                        key.currentState!.reverseAnimation();
                        con.update();
                      },
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/images/incomebg.png",
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          con.showFab
              ? Positioned(
                  bottom: 6.h,
                  right: 36.w,
                  child: SizedBox(
                    height: 4.5.h,
                    child: FloatingActionButton(
                      onPressed: () {
                          if (con.floatshow == true) {
                          con.floatshow = false;
                          con.update();
                        }
                        con.floatshow2 = true;
                        con.update();

                        // co
                        // exp.showaddexp = false;

                        con.currentTab = 2;
                        con.showFab = false;
                        key.currentState!.reverseAnimation();
                        con.update();
                      },
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/images/expansebg.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(
            // height: 12.h,
            width: 100.w,
            child: CircularMenu(
              toggleButtonMargin: 0,
              toggleButtonPadding: 2.1.h,
              radius: 8.5.h,
              toggleButtonColor: Colors.deepPurpleAccent,
              toggleButtonAnimatedIconData: AnimatedIcons.add_event,
              toggleButtonIconColor: Colors.white,
              toggleButtonSize: 3.h,
              alignment: Alignment.bottomCenter,
              startingAngleInRadian: 1.25 * 3.14,
              endingAngleInRadian: 1.75 * 3.14,
              toggleButtonOnPressed: () {
                con.showFab = !con.showFab;
                con.update();

              },
              key: key,
              items: [
                CircularMenuItem(
                  iconSize: 2.5.h,
                  onTap: () {
                  },
                  boxShadow: const [],
                  color: Colors.transparent,
                  iconColor: Colors.transparent,
                ),
                CircularMenuItem(
                  margin: 0,
                  iconSize: 2.5.h,
                  boxShadow: const [],
                  onTap: () {
                  },
                  color: Colors.transparent,
                  iconColor: Colors.transparent,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

Positioned bottomNavBar(x) {
  return Positioned(
    bottom: 0.h,
    child: Container(
      height: 9.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: MyColors.boarding2,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                  },
                  child: Image.asset(MyIcons.menu1,
                      color: x == "home" ? MyColors.primary : Colors.grey,
                      height: 6.5.h)),
              InkWell(
                  onTap: () {
                  },
                  child: Image.asset(MyIcons.menu2,
                      color: x == "explore" ? MyColors.primary : Colors.grey,
                      height: 7.2.h)),
              Image.asset(MyIcons.menu3,
                  color: Colors.transparent, height: 3.h),
              InkWell(
                  onTap: () {
                  },
                  child: Image.asset(MyIcons.menu3,
                      color: x == "chat" ? MyColors.primary : Colors.grey,
                      height: 7.2.h)),
              InkWell(
                  onTap: () {
                  },
                  child: Image.asset(MyIcons.menu4,
                      color: x == "profile" ? MyColors.primary : Colors.grey,
                      height: 6.5.h)),
            ],
          ),
        ],
      ),
    ),
  );
}
