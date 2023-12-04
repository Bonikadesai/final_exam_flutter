import 'package:flutter/material.dart';

final GlobalKey<FormState> signUpformkey = GlobalKey<FormState>();
final GlobalKey<FormState> signInformkey = GlobalKey<FormState>();

TextEditingController signupemailController = TextEditingController();
TextEditingController signuppasswordController = TextEditingController();

TextEditingController signinemailController = TextEditingController();
TextEditingController signinpasswordController = TextEditingController();
TextEditingController signinconfirmpasswordController = TextEditingController();
GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> addInFormKey = GlobalKey<FormState>();

TextEditingController todoController = TextEditingController();
String? email;
String? password;
String? signupEmail;
String? signupPassword;
String? signupConfirmPass;

int i = 9;
String text = "AM";
String text1 = "PM";
String a = "";
