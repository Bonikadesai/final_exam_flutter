import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/global.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map map = {
    "$a": "$a",
  };
  User? user = Get.arguments as User;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 70,
            ),
            CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/dpimage.png"),
                foregroundImage: AssetImage("assets/dpimage.png")),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Name: boni",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Email: boni@gmail.com",
              style: TextStyle(fontSize: 20),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/second_page');
            },
            icon: Icon(
              CupertinoIcons.left_chevron,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          "Todo App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        onPressed: () async {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Todo App"),
                content: Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: addInFormKey,
                      child: Column(
                        children: [
                          TextField(
                            controller: todoController,
                            onChanged: (val) {
                              a = val;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Your To-Do here..",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (addInFormKey.currentState!.validate()) {
                                  addInFormKey.currentState!.save();
                                  todoController.text = "";
                                  Get.toNamed('/home');
                                }
                                ;
                              },
                              child: Center(
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );

          if (i < 12) {
            map["${i++}:00 $text"] = a;
          } else {
            i = 1;
            text1 = "PM";
            map["${i++}:00 $text1"] = a;
          }
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: map.entries.map((e) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "i am flutter developer",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "9:39 PM",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recently flutter completed",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "9:47 PM",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
