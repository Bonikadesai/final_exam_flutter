import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splesh_Screen extends StatelessWidget {
  const Splesh_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed("/signup");
    });
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/splesh_screen.jpg",
                ),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
