import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/rendering.dart';
import "package:google_sign_in/google_sign_in.dart";
import "package:fl_chart/fl_chart.dart";
import 'package:mobills/screens/add_expense_screen.dart';
import "../widgets/schedule_widget.dart";
import "../widgets/pie_chart_sections.dart";
import "../widgets/indicators_widget.dart";

class MyHome extends StatefulWidget {
  static const routeName = '/home';

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int touchIndex;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF362352).withOpacity(0.2),
      appBar: null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      'Hello, Harsh',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF6953F7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/images/avatar1_prev_ui.png',
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchIndex = -1;
                          } else {
                            touchIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      },
                    ),
                    borderData: FlBorderData(show: true),
                    sectionsSpace: 5,
                    centerSpaceRadius: 40,
                    sections: getSections(touchIndex),
                  ),
                ),
              ),
              ScheduleWdget(),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(16),
              //       child: IndicatorsWidget(),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6953F7),
        onPressed: () {
          Navigator.of(context).pushNamed(
            AddExpenseScreen.routeName,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
