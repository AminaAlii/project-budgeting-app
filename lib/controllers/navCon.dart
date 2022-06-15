import 'package:budgetapp/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  bool showFab = false;
  bool floatshow = false;
  int currentTab = 0;
  bool floatshow2 = false;
  Widget currentScreen = HomePage();
}
