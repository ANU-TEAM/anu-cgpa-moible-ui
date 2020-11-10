import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<AppDb>(
        create: (context) => AppDb(),
        child: MyApp(),
        dispose: (context, db) => db.close()),
  );
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
      home: HomeScreen(),
    );
  }
}
