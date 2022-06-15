import 'package:budgetapp/Screens/home_page.dart';
import 'package:budgetapp/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
   bool check = false;

  TextEditingController dateofbirth = TextEditingController();
  dateChange(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime(2050),
    ).then((value) {
      dateofbirth.text = DateFormat('yMMMd').format(value!);
      // dateofbirth.text = value.toString();
    });
    update();
  }

  bool visible = false;
  showPass() {
    visible = !visible;
    update();
  }

  int currentTab = 0;
  Widget currentScreen = HomePage();

  bool floatshow = false;
  bool floatshow2 = false;

  bool showProfile = true;
  bool addexpanse = true;
  // bool addincome = true;
  // bool showFab = false;
  // bool showallinc = false;
  // bool showaddinc = false;
  // bool showaddexp = false;
  // bool showexpen = false;
  // bool rep = false;

  // bool income = true;
  // bool expanse = false;
  // update(),
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  bool suffix = false;
  TextEditingController confirmPass = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController mname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pemail = TextEditingController();
  TextEditingController pPasswrod = TextEditingController();
  TextEditingController pconfirmPass = TextEditingController();
  TextEditingController pname = TextEditingController();
  TextEditingController pPhone = TextEditingController();
  final AuthServices _auth = AuthServices();
  TextEditingController dateofbirth1 = TextEditingController();
  dateChange1(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime(2050),
    ).then((value) {
      dateofbirth.text = DateFormat('yMMMd').format(value!);
      // dateofbirth.text = value.toString();
    });
    update();
  }

  visible1() {
    suffix = !suffix;
    update();
  }

}
