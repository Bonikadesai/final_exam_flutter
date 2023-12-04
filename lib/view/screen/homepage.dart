import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/global.dart';

class HomePage extends StatefulWidget {
  //User? user = Get.arguments as User;
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map map = {
    "$a": "$a",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: Drawer(
          // child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     const SizedBox(
          //       height: 70,
          //     ),
          //     CircleAvatar(
          //       radius: 60,
          //       foregroundImage: (user!.isAnonymous)
          //           ? const AssetImage("assets/images/user.png") as ImageProvider
          //           : NetworkImage("${user!.photoURL}"),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     const Divider(),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     // (user!.isAnonymous)
          //     //     ? const Text("")
          //     //     : (user.displayName == null)
          //     //         ? const Text("")
          //     //         : Text("${user.displayName}"),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text((user!.isAnonymous)
          //             ? ""
          //             : (user?.displayName == null)
          //                 ? ""
          //                 : "Name: "),
          //         // const Text("Name :"),
          //         Text((user!.isAnonymous)
          //                 ? ""
          //                 : (user?.displayName == null)
          //                     ? ""
          //                     : "johndeo@gmail.com"
          //             // : FirebaseAuthHelper.firebaseAuth.currentUser?.email
          //             //     ?.split('@')[0] as String,
          //             ),
          //       ],
          //     ),
          //
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text((user!.isAnonymous) ? "" : "E-mail: "),
          //         Text((user!.isAnonymous) ? "" : "${user!.email}")
          //       ],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text((user!.isAnonymous)
          //             ? ""
          //             : (user?.displayName == null)
          //                 ? ""
          //                 : "PhoneNumber:  "),
          //         Text((user!.isAnonymous)
          //             ? ""
          //             : (user?.phoneNumber == null)
          //                 ? ""
          //                 : "${user!.phoneNumber}"),
          //       ],
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     (user!.isAnonymous)
          //         ? const ListTile()
          //         : ListTile(
          //             onTap: () {
          //               Get.toNamed('/update_emailpage');
          //             },
          //             title: const Text(
          //               "Update E-mail",
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             ),
          //             trailing: const Icon(Icons.email_outlined),
          //           ),
          //     (user!.isAnonymous)
          //         ? const ListTile()
          //         : ListTile(
          //             onTap: () {
          //               Get.toNamed('/update_passwordpage');
          //             },
          //             title: const Text(
          //               "Update Password",
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             ),
          //             trailing: const Icon(Icons.password),
          //           ),
          //     (user!.isAnonymous)
          //         ? const ListTile()
          //         : ListTile(
          //             onTap: () {
          //               Get.toNamed('/delete_accountpage');
          //             },
          //             title: const Text(
          //               "Delete Account",
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             ),
          //             trailing: const Icon(Icons.delete),
          //           ),
          //     ListTile(
          //       title: const Text(
          //         "Theme Mode",
          //         style: TextStyle(fontWeight: FontWeight.w500),
          //       ),
          //       // trailing: Switch(
          //       //   value: themeController.darkModeModel.isdark,
          //       //   onChanged: (val) {
          //       //     setState(() {
          //       //       themeController.darkThemeUDF(val: val);
          //       //     });
          //       //     // Get.changeTheme(Get.isDarkMode
          //       //     //     ? ThemeData.light()
          //       //     //     : ThemeData.dark());
          //       //     print("2");
          //       //   },
          //       // ),
          //     ),
          //   ],
          // ),
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
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                e.key,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
