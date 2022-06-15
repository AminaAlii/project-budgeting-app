import 'package:budgetapp/Models/expense.dart';
import 'package:budgetapp/Models/income.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  List<IncomeModel> incomelist = [];
List<ExpenseModel> expenselist = [];
  ReportController() {
    FirestoreServices.getIncome(currentUser.id).then((value) {
      incomelist = value;
      update();
    }); 
    FirestoreServices.getexpense(currentUser.id).then((value) {
      expenselist = value;
      update();
    });
  }
  bool expense = false;
  bool income = true;
  bool rep = false;
}
