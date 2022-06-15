// ignore_for_file: prefer_const_constructors

import 'package:budgetapp/Screens/bottom_bar.dart';
import 'package:budgetapp/Screens/home_page.dart';
import 'package:budgetapp/Screens/login_screen.dart';
import 'package:budgetapp/Services/Auth.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AuthController extends GetxController {
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
  bool showFab = false;
  bool showallinc = false;
  bool showaddinc = false;
  // bool showaddexp = false;
  bool showexpen = false;
  bool rep = false;

  bool expanse = false;
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

  shiftToHome(context) {
    signInWithEmail(context);
  }

  TextEditingController cPassword = TextEditingController();
  TextEditingController firstName = TextEditingController();

  final FirestoreServices _store = Get.find<FirestoreServices>();

  bool isAgree = false;
  String isEmailValidError = "";
  String isUserNameValidError = "";
  String isPasswordValidError = "";
  String isPasswordMatchError = "";

  @override
  void onInit() {
    super.onInit();
    isAgree = false;
    isEmailValidError = "";
    isUserNameValidError = "";
    isPasswordValidError = "";
    isPasswordMatchError = "";
  }

  signInWithEmail(context) async {
    isEmailValidError = "";
    isUserNameValidError = "";
    isPasswordValidError = "";
    isPasswordMatchError = "";
    update();
    String mail = email.text;
    String errorCode =
        await Get.find<AuthServices>().emailSignIn(email.text, password.text);
    if (errorCode == "") {
      currentUser =
          await Get.find<FirestoreServices>().getUser(currentUser.id, );
      if (currentUser.id != "") {
        Get.to(BottomNavv());
      } else {
        await _auth.logOut();
      }
    } else {
      Get.snackbar('Failed', errorCode,
          backgroundColor: Colors.black, colorText: Colors.white);
    }
    update();
  }

  resetPassword(context) async {
    isEmailValidError = "";
    isUserNameValidError = "";
    isPasswordValidError = "";
    isPasswordMatchError = "";
    update();
    String error = await Get.find<AuthServices>().forgetPassword(email.text);
    if (error == "") {
      // EasyLoading.showSuccess("Check your Email to Reset Password",
      //     duration: Duration(seconds: 3));
      Get.back();
    } else if (error == "invalid-email") {
      isEmailValidError = "Email is not Valid";
    } else if (error == "user-not-found") {
      isEmailValidError = "Email not found";
    }
    update();
  }

  signUp(context) async {
    isEmailValidError = "";
    isUserNameValidError = "";
    isPasswordValidError = "";
    isPasswordMatchError = "";
    update();
    String errorCode =
        await Get.find<AuthServices>().emailSignUp(email.text, password.text);
    if (errorCode == "") {
      currentUser.email = email.text;
      currentUser.firstName = fname.text;
      await _store.registerUser(context);
      Get.snackbar('Congratulations', 'Account Created');
      Get.to(SignIn());
    } else {
      if (errorCode == "invalid-email") {
        isEmailValidError = "Email is not Valid";
      } else if (errorCode == "email-already-in-use") {
        isEmailValidError = "Email is already Register";
      } else {
        update();
      }
    }
  }
  // }

}
