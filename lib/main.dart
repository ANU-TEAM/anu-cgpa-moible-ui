import 'package:anucgpa/models/YearsListModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/YearsScreen.dart';

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
        accentColor: Colors.yellow,
        primaryColor: Colors.yellow[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => YearsListModel(),
        child: YearsScreen(),
      ),
    );
  }
}
