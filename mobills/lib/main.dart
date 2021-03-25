import "package:flutter/material.dart";
import "screens/home_screen.dart";
import "screens/signup_screen.dart";
import "screens/signin_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobills',
      home: SigninScreen(),
      routes: {
        SignupScreen.routeName: (ctx) => SignupScreen(),
        SigninScreen.routeName: (ctx) => SigninScreen(),
      },
    );
  }
}
