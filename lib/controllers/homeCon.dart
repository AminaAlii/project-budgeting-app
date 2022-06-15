import 'package:budgetapp/Models/expense.dart';
import 'package:budgetapp/Models/income.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool showProfile = true;
List<IncomeModel> incomelist = [];
List<ExpenseModel> expenselist = [];
  HomeController() {
    FirestoreServices.getIncome(currentUser.id).then((value) {
      incomelist = value;
      update();
    }); 
    FirestoreServices.getexpense(currentUser.id).then((value) {
      expenselist = value;
      update();
    });
  }
}
