import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/firebase_auth_helper.dart';
import '../../utils/global.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: signUpformkey,
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
                    signupEmail = value;
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
                  height: 30,
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
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Enter your password"),
                    hintText: "Enter password here...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    signupPassword = value;
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
                  height: 30,
                ),
                Text(
                  "Confirm password",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                TextFormField(
                  controller: signinconfirmpasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    label: Text("Enter your confirm password"),
                    hintText: "Enter password here...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    signupConfirmPass = value;
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter confirm password...";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Auth_Helper.auth_helper.SignUp(
                          email: signupEmail!, password: signupPassword!);
                      Get.offNamed('/home');
                      Get.snackbar(
                        "SUCCESSFULLY",
                        "Create Account Successfully with Email..",
                      );
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
                          "Sign Up",
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
                    Get.offNamed('/login');
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account ?? ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Log In",
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
