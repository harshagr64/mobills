import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:mobills/screens/home_screen.dart';

class Signin {
  static Future<void> signIn(
      String email, String password, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (!credential.user.emailVerified) {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error Occured'),
                content: Text('Please verify your Email Id first'),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Okay'),
                  ),
                ],
              );
            });
      } else {
        Navigator.of(context).pushReplacementNamed(MyHome.routeName);
      }
    } catch (error) {
      print(error);
    }
  }
}
