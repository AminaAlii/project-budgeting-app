import 'package:budgetapp/Models/users.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserModel user = UserModel();
  ProfileController() {
    fun();
    
  }
  fun() async {
    user = await Get.find<FirestoreServices>().getUser(
      currentUser.id,);
  }
}
