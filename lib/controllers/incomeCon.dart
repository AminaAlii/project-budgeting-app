import 'package:budgetapp/Models/income.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeController extends GetxController {
  bool showaddincome = false;
  bool showallinc = false;
  bool addincome = true;
  bool income = true;
  bool showexpen = false;
  bool addexpense = true;
  bool showaddexp = false;
  bool addexpanse = true;
  bool incomeI = false;
    IncomeModel incomeM = IncomeModel();

  String cate = '';
  TextEditingController amount = TextEditingController();
  TextEditingController desc = TextEditingController();
  List<IncomeModel> incomelist = [];
  IncomeController() {
    FirestoreServices.getIncome(currentUser.id).then((value) {
      incomelist = value;
      update();
    });
    FirestoreServices.getSingleIncome(currentUser.id).then((value) {
      incomeI = value;
      update();
    });
  }
}

class AddIncomeController extends GetxController {
  bool showaddincome = false;
  bool showallinc = false;
  bool addincome = true;
  bool income = true;
  bool showexpen = false;
  bool addexpense = true;
  bool showaddexp = false;
  bool addexpanse = true;
  bool incomeI = false;
    IncomeModel incomeM = IncomeModel();

  String cate = '';
  TextEditingController amount = TextEditingController();
  TextEditingController desc = TextEditingController();
  List<IncomeModel> incomelist = [];
  IncomeController() {
    FirestoreServices.getIncome(currentUser.id).then((value) {
      incomelist = value;
      update();
    });
    FirestoreServices.getSingleIncome(currentUser.id).then((value) {
      incomeI = value;
      update();
    });
  }
}