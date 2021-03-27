import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "home_screen.dart";

class EmailVerification extends StatelessWidget {
  static const routeName = '/email';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          children: [
            Icon(Icons.email_outlined),
            Text("A verification link has been sent to your Email Id"),
          ],
        ),
      ),
    );
  }
}
