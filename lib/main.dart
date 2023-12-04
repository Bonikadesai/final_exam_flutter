import 'package:final_exam_flutter/firebase_options.dart';
import 'package:final_exam_flutter/view/screen/homepage.dart';
import 'package:final_exam_flutter/view/screen/login_screen.dart';
import 'package:final_exam_flutter/view/screen/second_page.dart';
import 'package:final_exam_flutter/view/screen/singup_screen.dart';
import 'package:final_exam_flutter/view/screen/splesh_screeen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/',
          page: () => Splesh_Screen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/second_page',
          page: () => Second_Screen(),
        ),
      ],
    ),
  );
}
