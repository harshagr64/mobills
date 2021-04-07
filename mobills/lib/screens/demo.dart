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
          if (snapShot.hasData) {
            if (!FirebaseAuth.instance.currentUser.emailVerified) {
              return SigninScreen();
            }
            print("true");
            return MyHome();
          } else {
            print("false");
            return SigninScreen();
          }
        });
  }
}
