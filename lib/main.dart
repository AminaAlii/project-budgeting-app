import 'package:budgetapp/Screens/bottom_bar.dart';
import 'package:budgetapp/Screens/splash.dart';
import 'package:budgetapp/Services/Auth.dart';
import 'package:budgetapp/Services/firestoreService.dart';
import 'package:budgetapp/Services/global.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  // void initApp(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthServices());
  Get.put(FirestoreServices());
  Get.put(GetStorage());
  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
  bool userExist = AuthServices.checkUser();
  currentUser = await Get.find<FirestoreServices>().getUser(
    currentUser.id,
  );

  userExist ? Get.off(const BottomNavv()) : null;
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const Splash();
        },
      ),
      builder: EasyLoading.init(),
    );
  }
}
