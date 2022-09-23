import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_with_google/screen/home_screen.dart';
import 'package:signin_with_google/screen/listview_screen.dart';
import 'package:signin_with_google/screen/services/firebase_services.dart';

import '../Utils/app_style.dart';
import '../Utils/string_manager.dart';
import '../Utils/utils.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.purpleAccent,
        centerTitle: true,
        title: const Text(
          StringManager.loginInWithGmail,
          style: TextStyle(color: AppStyle.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: Utils.getWidth(context) / 2,
                height: Utils.getHight(context) / 15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    // maximumSize: const Size(350, 300),
                    backgroundColor: AppStyle.white,
                  ),
                  onPressed: () async {
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyHomeScreen()));
                    User? user = await FirebaseServices().signInWithGoogle();
                    if (user != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyHomeScreen()));
                    } else {
                      log("Some thing went wrong");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/google.png",
                        width: 30,
                        height: 30,
                      ),
                      const Text(
                        StringManager.loginInWithGmail,
                        style: TextStyle(color: AppStyle.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 5, backgroundColor: AppStyle.purpleAccent),
              onPressed: () {
                // FirebaseServices().signOutGoogle();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyListviewScreen(),
                  ),
                );
              },
              child: const Text(StringManager.listviewScreen),
            ),
          ],
        ),
      ),
    );
  }
}
