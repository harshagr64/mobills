import "package:flutter/material.dart";
import "signup_screen.dart";
import "../widgets/sign_in.dart";
// import "package:google_fonts/google_fonts.dart";

class SigninScreen extends StatefulWidget {
  static const routeName = '/sign-in';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String email;
    String password;

    void trysign() {
      final validate = _key.currentState.validate();
      if (!validate) {
        return;
      }
      _key.currentState.save();
      Signin.signIn(email, password, context);
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
                children: [
                  Text(
                    "Welcome,",
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
                    "Sign in to continue!",
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
                        validator: (value) {
                          print('hello $value');
                          if (value.isEmpty) {
                            return 'Please enter Email Id';
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
                        validator: (value) {
                          // print('hello $value');
                          if (value.isEmpty) {
                            return 'Please enter password';
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
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: trysign,
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFF6953F7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Sign In",
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
              SizedBox(
                height: 40,
              ),
              // Center(
              //   child: Text(
              //     "OR",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 20,
              //       color: Colors.white,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 40,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       alignment: Alignment.center,
              //       width: 100,
              //       height: 50,
              //       decoration: BoxDecoration(
              //           // color: Color(0xFF6953F7),
              //           borderRadius: BorderRadius.circular(16)),
              //       child: InkWell(
              //           onTap: googleSign,
              //           child: Image.asset('assets/images/googlelogo.png')),
              //     ),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.25,
              //     ),
              //     Container(
              //       alignment: Alignment.center,
              //       width: 100,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         // color: Color(0xFF6953F7),
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //       child: Image.asset('assets/images/facebook.png'),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(SignupScreen.routeName),
                      child: Text(
                        " Sign Up",
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
