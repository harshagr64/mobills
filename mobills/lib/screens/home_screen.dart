import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";

class MyHome extends StatefulWidget {
  static const routeName = '/home';

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF362352).withOpacity(0.2),
      appBar: null,
    );
  }
}
