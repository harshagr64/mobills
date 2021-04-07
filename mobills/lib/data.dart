import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Blue', percent: 40, color: const Color(0xFFCD4FF7).withOpacity(0.9)),
    Data(name: 'Orange', percent: 30, color: const Color(0xFF6953F7)),
    Data(name: 'Bla', percent: 15, color: Color(0xFFB45B5D).withOpacity(0.9)),
    Data(name: 'Green', percent: 15, color: const Color(0xFFFD8450).withOpacity(0.9)),
  ];
}

class Data {
  final String name;

  final double percent;

  final Color color;

  Data({this.name, this.percent, this.color});
}