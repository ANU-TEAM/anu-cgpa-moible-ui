import 'package:anucgpa/screens/OverviewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ANU CGPA CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.yellow[100],
        highlightColor: Colors.yellow[100],
        accentColor: Colors.yellow,
        primaryColor: Colors.yellow[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OverviewScreen(),
    );
  }
}
