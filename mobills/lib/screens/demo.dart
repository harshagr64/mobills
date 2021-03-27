import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "signin_screen.dart";
import "home_screen.dart";

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapShot) {
          if (!FirebaseAuth.instance.currentUser.emailVerified) {
            return SigninScreen();
          } else if (snapShot.hasData) {
            print("true");
            return MyHome();
          } else {
            print("false");
            return SigninScreen();
          }
        });
  }
}
