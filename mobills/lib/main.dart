import "package:flutter/material.dart";
import 'package:mobills/screens/demo.dart';
import 'package:mobills/screens/email_verification.dart';
import "screens/home_screen.dart";
import "screens/signup_screen.dart";
import "screens/signin_screen.dart";
import "package:firebase_core/firebase_core.dart";
import "screens/add_expense_screen.dart";

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
      home: Demo(),
      routes: {
        SignupScreen.routeName: (ctx) => SignupScreen(),
        SigninScreen.routeName: (ctx) => SigninScreen(),
        MyHome.routeName: (ctx) => MyHome(),
        EmailVerification.routeName: (ctx) => EmailVerification(),
        AddExpenseScreen.routeName: (ctx) => AddExpenseScreen(),
      },
    );
  }
}
