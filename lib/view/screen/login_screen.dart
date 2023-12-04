import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/firebase_auth_helper.dart';
import '../../utils/global.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Log in",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: signInformkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                TextFormField(
                  controller: signinemailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Enter your e-mail id"),
                    hintText: "Enter email here...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter email first...";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                TextFormField(
                  controller: signinpasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    label: Text("Enter your password"),
                    hintText: "Enter password here...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter password first...";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (signInformkey.currentState!.validate()) {
                        signInformkey.currentState!.save();
                        Map<String, dynamic> res = await Auth_Helper.auth_helper
                            .SignIn(email: email!, password: password!);
                        if (res['user'] != null) {
                          Get.offNamed('/home');
                          Get.snackbar(
                            'Todo App',
                            'Login Succesfully ',
                          );
                        } else if (res['error'] != null) {
                          Get.offNamed('/');
                          Get.snackbar(
                            'Todo App',
                            'Login Failed..',
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "or continue with",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      User? res =
                          await Auth_Helper.auth_helper.signInWithGoogle();
                      if (res != null) {
                        Get.offNamed('/home', arguments: res);
                        Get.snackbar(
                          "SUCCESSFULLY",
                          "Login Successfully with Google😊..",
                        );
                      } else {
                        Get.snackbar(
                          "FAILURE",
                          "Login Failed!!",
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In with Google",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "or continue with",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      User? res =
                          await Auth_Helper.auth_helper.SigninAnonymous();
                      if (res != null) {
                        Get.offNamed('/home', arguments: res);
                        Get.snackbar(
                          "SUCCESSFULLY",
                          "Login Successfully with Anonymous😊..",
                        );
                      } else {
                        Get.snackbar(
                          "FAILURE",
                          "Login Failed!!",
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          "Sign In with Anonymous",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed('/signup');
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account ?? ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up,",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
