import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(AttendanceTrackerApp());
}

class AttendanceTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
