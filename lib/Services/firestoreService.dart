// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:budgetapp/Models/expense.dart';
import 'package:budgetapp/Models/income.dart';
import 'package:budgetapp/Models/users.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class FirestoreServices {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  // UserModel
  Future<bool> registerUser(context) async {
    try {
      await _instance
          .collection('user')
          .doc(currentUser.id)
          .set(currentUser.toJSON());
      return true;
    } catch (e) {
      EasyLoading.showInfo(e.toString(), duration: const Duration(seconds: 3));
      return false;
    }
  }

  Future<String> getEmailFromUserName(String userName) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await _instance
          .collection('user')
          .where("username", isEqualTo: userName)
          .get();
      if (data.docs.isEmpty) return "";
      return data.docs.first.data()["email"];
    } catch (e) {
      return "";
    }
  }

  clearLocalData() {
    _instance.clearPersistence();
  }

  Future<bool> updateUser(context) async {
    try {
      await _instance
          .collection('user')
          .doc(currentUser.id)
          .set(currentUser.toJSON(), SetOptions(merge: true));

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getUser(String userId) async {
    UserModel user = UserModel();
    List<UserModel> temp =
        userList.where((element) => element.id == userId).toList();
    if (temp.isEmpty)
      try {
        DocumentSnapshot dsnap =
            await _instance.collection('user').doc(userId).get();
        if (dsnap.exists) {
          user = UserModel.toModel(dsnap.data() as Map<String, dynamic>);
          userList.add(user);
          currentUser = user;
          return currentUser;
        }
      } catch (e) {
        EasyLoading.showError(e.toString(),
            duration: const Duration(seconds: 3));
      }
    else
      user = temp.first;
    return user;
  }

  Future<bool> addIncome(IncomeModel income) async {
    EasyLoading.show(status: "Adding", dismissOnTap: true);
    try {
      String id = _instance.collection('income').doc().id;
      income.id = id;
      await _instance
          .collection('income')
          .doc(currentUser.id)
          .set(income.toJSON());
      EasyLoading.dismiss();
      Get.back();
      return true;
    } catch (e) {
      Get.snackbar("Try again", "Something went wrong");
      return false;
    }
  }

  Future<bool> addexpense(ExpenseModel income) async {
    EasyLoading.show(status: "Adding", dismissOnTap: true);
    try {
      String id = _instance.collection('expense').doc().id;
      income.id = id;
      await _instance
          .collection('expense')
          .doc(currentUser.id)
          .set(income.toJSON());
      EasyLoading.dismiss();
      Get.back();
      return true;
    } catch (e) {
      Get.snackbar("Try again", "Something went wrong");
      return false;
    }
  }

  checkexpense(userid) async {
    try {
      await FirebaseFirestore.instance
          .collection("expense")
          .where('user_id', isEqualTo: userid)
          .get();
      return true;
    } catch (e) {
      return false;
    }
  }

  checkIncome(userid) async {
    try {
      await FirebaseFirestore.instance
          .collection("income")
          .where('user_id', isEqualTo: userid)
          .get();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<IncomeModel>> getIncome(userid) async {
    List<IncomeModel> list = [];
    try {
      DocumentSnapshot<Map<String, dynamic>> incomeData =
          await FirebaseFirestore.instance
              .collection("income")
              .doc(userid)
              .get();
      if (incomeData.exists)
        list.add(IncomeModel.toModel(incomeData.data() as Map));

      return list;
    } catch (e) {
      print(e);
      return list;
    }
  }

  static Future<List<ExpenseModel>> getexpense(userid) async {
    List<ExpenseModel> list = [];
    DocumentSnapshot<Map<String, dynamic>> incomeData = await FirebaseFirestore
        .instance
        .collection("expense")
        .doc(userid)
        .get();
    if (incomeData.exists)
      list.add(ExpenseModel.toModel(incomeData.data() as Map));
    return list;
  }

  static Future<bool> getSingleExpense(userid) async {
    DocumentSnapshot<Map<String, dynamic>> incomeData = await FirebaseFirestore
        .instance
        .collection("expense")
        .doc(userid)
        .get();
    if (incomeData.exists) return true;
    return false;
    // .where('user_id', isEqualTo: userid)
    // .get();
    // for (QueryDocumentSnapshot<Object> item in incomeData.docs) {
    //   return item.exists;
    // }
    // return false;
  }

  static Future<bool> getSingleIncome(userid) async {
    QuerySnapshot<Map<String, dynamic>> incomeData = await FirebaseFirestore
        .instance
        .collection("income")
        .where('user_id', isEqualTo: userid)
        .get();
    for (QueryDocumentSnapshot<Object> item in incomeData.docs) {
      return item.exists;
    }
    return false;
  }

  static delExpense(userid) async {
    await FirebaseFirestore.instance.collection("expense").doc(userid).delete();
    EasyLoading.showSuccess("Deleted", duration: const Duration(seconds: 2));
    // Get.back();
  }

  static delIncome(userid) async {
    await FirebaseFirestore.instance.collection("income").doc(userid).delete();
    EasyLoading.showSuccess("Deleted", duration: const Duration(seconds: 2));
        // Get.back();

  }
}
