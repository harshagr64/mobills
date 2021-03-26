import "package:flutter/material.dart";
import "screens/home_screen.dart";
import "screens/signup_screen.dart";
import "screens/signin_screen.dart";
import "package:firebase_core/firebase_core.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        MyHome.routeName: (ctx) => MyHome(),
      },
    );
  }
}
