// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:budgetapp/Models/users.dart';
import 'package:budgetapp/Screens/splash.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:budgetapp/Services/sessions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> emailSignIn(String user, password) async {
    try {
      UserCredential fbUser = await _auth.signInWithEmailAndPassword(
          email: user, password: password);
      if (fbUser.user != null) {
        currentUser.id = fbUser.user!.uid;
        // FirestoreServices.getUser(currentUser.id);
        return "";
      }
      return "error";
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
  }

  phoneAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: '+923226253655',
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = '123456';
        // Create a PhoneAuthCredential with the code
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(
        //     verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        // await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Get.snackbar('TimeOut', '');
      },
      verificationFailed: (FirebaseAuthException error) {
        Get.snackbar('Verification failed', error.code);
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        Get.snackbar('Verification completed', '');
      },
    );
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
    await clearBoxStorage();
    Get.offAll(Splash());
    return;
  }

  getCurrentUser() {
    var value = getBoxStorage("user");
    if (value != null) currentUser = UserModel.toModel(value);
  }

  static bool checkUser() {
    User? fbUser = FirebaseAuth.instance.currentUser;
    if (fbUser != null) {
      currentUser.id = fbUser.uid;
      // currentUser.email = fbUser.email ?? "";
      return true;
    }
    return false;
  }

  Future<String> emailSignUp(String user, password) async {
    try {
      UserCredential fbUser = await _auth.createUserWithEmailAndPassword(
          email: user, password: password);
      if (fbUser.user != null) {
        currentUser.id = fbUser.user!.uid;
        // await fbUser.user!.sendEmailVerification();
        return "";
      }
      return "error";
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
  }

  static bool emailVarification() {
    try {
      return FirebaseAuth.instance.currentUser!.emailVerified;
    } catch (e) {
      return false;
    }
  }

  Future<String> forgetPassword(String mail) async {
    try {
      await _auth.sendPasswordResetEmail(email: mail);
      return "";
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
  }

}
