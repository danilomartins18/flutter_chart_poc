import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/components/progress_line_chart.dart';

const double minX = 2.0;
const double maxX = 31.0;
const List<double> list = [1.9, 1.9, 2.0, 1.9, 1.9, 1.9, 2.0, 2.0, 2.1, 1.9, 1.9];
List<FlSpot> spots = [
  FlSpot(2.0, 1.9),
  FlSpot(4.0, 1.9),
  FlSpot(9.0, 2.0),
  FlSpot(11.0, 1.9),
  FlSpot(14.0, 1.9),
  FlSpot(16.0, 1.9),
  FlSpot(21.0, 2.0),
  FlSpot(23.0, 2.0),
  FlSpot(25.0, 2.1),
  FlSpot(28.0, 1.9),
  FlSpot(30.0, 1.9),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1125, 2000),
      builder: () => MaterialApp(
        title: 'Chart Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  double? getMax(List<double> list) {
    if (list.isNotEmpty) {
      return list.reduce(max).toDouble();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Chart')),
      body: ProgressLineChartWidget(
        title: "Distance",
        minX: minX,
        maxX: maxX,
        minY: 0,
        maxY: this.getMax(list)! + 1.0,
        spots: spots,
      ),
    );
  }
}
