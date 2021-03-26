import "package:flutter/material.dart";
import 'package:mobills/screens/signin_screen.dart';
import "../widgets/signup_widget.dart";
import "home_screen.dart";

class SignupScreen extends StatefulWidget {
  static const routeName = '/sign-up';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String name;
    String password;
    String email;
    String cpass;
    bool _isLoading = false;

    void signup() {
      setState(() {
        _isLoading = true;
      });

      final isValid = _key.currentState.validate();
      if (!isValid) {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      _key.currentState.save();
      print(password);
      if (password != cpass) {
        setState(() {
          _isLoading = false;
        });
        print("hello $cpass");
        _key.currentState.reset();
        print("reset");
      } else {
        Signup.signUp(name, email, password);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushReplacementNamed(MyHome.routeName);
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF362352).withOpacity(0.2),
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Account,",
                    // style:
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign up to get started!",
                    // style:
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_semNode),
                        validator: (value) {
                          print('hello $value');
                          if (value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Full Name*',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF6953F7),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xFF6953F7),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_semNode),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter email';
                          } else if (!value.contains(RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                            return "Enter a valid Email Id";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email Id*',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF6953F7),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xFF6953F7),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Colors.white,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                        ),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_semNode),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Title';
                          } else if (value.length < 8 || value.length > 10) {
                            return 'Password must be in range of 8 to 10 characters';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password*',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF6953F7),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xFF6953F7),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_semNode),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please confirm the password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          cpass = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Confirm Password*',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF6953F7),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xFF6953F7),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                        ),
                      ),
                      InkWell(
                        onTap: _isLoading ? null : signup,
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFF6953F7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: _isLoading
                              ? CircularProgressIndicator()
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(SigninScreen.routeName),
                      child: Text(
                        " Sign In",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
