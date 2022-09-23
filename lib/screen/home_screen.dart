import 'package:flutter/material.dart';
import 'package:signin_with_google/Utils/app_style.dart';
import 'package:signin_with_google/Utils/string_manager.dart';
import 'package:signin_with_google/screen/login_screen.dart';
import 'package:signin_with_google/screen/services/firebase_services.dart';
import 'package:signin_with_google/widgets/list_view.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.purpleAccent,
        centerTitle: true,
        title: const Text(
          StringManager.homeScreen,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyListview(),
                const Text(
                  StringManager.welcomeToMyApplication,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 5, backgroundColor: AppStyle.purpleAccent),
                  onPressed: () {
                    FirebaseServices().signOutGoogle();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyLoginScreen(),
                      ),
                    );
                  },
                  child: const Text(StringManager.logOut),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
