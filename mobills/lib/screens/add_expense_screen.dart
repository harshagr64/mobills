import "package:flutter/material.dart";

class AddExpenseScreen extends StatefulWidget {
  static const routeName = '/add-expense';
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  bool _isNotes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF362352).withOpacity(0.2),
      appBar: null,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          left: 10,
          right: 10,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    splashRadius: 25,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Add Expenses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  // key: _key,
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
                          // email = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Description',
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
                          // password = value;
                        },
                        decoration: InputDecoration(
                          hintText: '₹ 0.00',
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
                      DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return 'please choose semester';
                          }
                          return null;
                        },
                        onSaved: (value) {},
                        decoration: InputDecoration(
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
                              vertical: 13, horizontal: 10),
                        ),
                        hint: Text(
                          'Type*',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text('Food & Drinks'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('Clothes'),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('Daily Needs'),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text('Others'),
                            value: 3,
                          ),
                        ],
                        onChanged: (value) {
                          setState(
                            () {
                              // value = _value;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          InkWell(
                            splashColor: Color(0xFF6953F7).withOpacity(0.1),
                            highlightColor: Color(0xFF6953F7).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              setState(() {
                                _isNotes = !_isNotes;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFF6953F7),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Notes",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                  Icon(
                                   _isNotes ? Icons.arrow_drop_up :Icons.arrow_drop_down,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (_isNotes)
                        TextFormField(
                          minLines: 6,
                          maxLines: 6,
                          cursorColor: Colors.white,
                          textInputAction: TextInputAction.newline,
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
                            // password = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Write your notes here',
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
                              vertical: 16,
                              horizontal: 10,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
