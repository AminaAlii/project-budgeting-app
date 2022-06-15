import 'package:budgetapp/Models/expense.dart';
import 'package:budgetapp/Models/income.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  bool showexpen = false;
  bool addexpense = true;
  bool showaddexp = false;
  bool addexpanse = true;
  bool showaddincome = false;
  bool showallinc = false;
  bool addincome = true;
  bool income = true;
  String cate = '';

  TextEditingController amount = TextEditingController();
  TextEditingController desc = TextEditingController();
  List<ExpenseModel> expenselist = [];
  List<IncomeModel> incomelist = [];
  ExpenseModel expenseM = ExpenseModel();

  bool expenseI = false;

  ExpenseController() {
    FirestoreServices.getSingleExpense(currentUser.id).then((value) {
      expenseI = value;
      update();
    });

    FirestoreServices.getexpense(currentUser.id).then((value) {
      expenselist = value;
      update();
    });
  }
}
class AddExpenseController extends GetxController {
  bool showexpen = false;
  bool addexpense = true;
  bool showaddexp = false;
  bool addexpanse = true;
  bool showaddincome = false;
  bool showallinc = false;
  bool addincome = true;
  bool income = true;
  String cate = '';

  TextEditingController amount = TextEditingController();
  TextEditingController desc = TextEditingController();
  List<ExpenseModel> expenselist = [];
  List<IncomeModel> incomelist = [];
  ExpenseModel expenseM = ExpenseModel();

  bool expenseI = false;

  ExpenseController() {
    FirestoreServices.getSingleExpense(currentUser.id).then((value) {
      expenseI = value;
      update();
    });

    FirestoreServices.getexpense(currentUser.id).then((value) {
      expenselist = value;
      update();
    });
  }
}
