import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn(
    clientId: "39261851557-ktevihr6ambjo7oki34fmj76i5jnm1ks.apps.googleusercontent.com"
  );
  Future<User?> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;

    // The `GoogleAuthProvider` can only be used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await _auth.signInWithPopup(authProvider);

      user = userCredential.user;
      log(user!.uid.toString());
    } catch (e) {
      // print(e);
    }

    // if (user != null) {
    //   uid = user.uid;
    //   name = user.displayName;
    //   userEmail = user.email;
    //   imageUrl = user.photoURL;

    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setBool('auth', true);
    // }

    return user;
  }

  // signInWithGoogle() async {

  //   // try {
  //   //   final GoogleSignInAccount? googleSignInAccount =
  //   //       await GoogleSignIn().signIn();
  //   //   if (googleSignInAccount != null) {
  //   //     final GoogleSignInAuthentication googleSignInAuthentication =
  //   //         await googleSignInAccount.authentication;
  //   //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //   //         accessToken: googleSignInAuthentication.accessToken,
  //   //         idToken: googleSignInAuthentication.idToken);
  //   //         await _auth.signInWithCredential(authCredential);
  //   //   }
  //   // }  catch (e) {
  //   //   print(e.toString());
  //   //   throw e;
  //   // }
  // }

 void signOutGoogle() async {
  await _googleSignIn.signOut();
  await _auth.signOut();
}
}
