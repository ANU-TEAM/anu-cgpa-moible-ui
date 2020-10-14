import 'package:animated_splash/animated_splash.dart';
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
        splashColor: Colors.yellow[100],
        highlightColor: Colors.yellow[100],
        accentColor: Colors.yellow,
        primaryColor: Colors.yellow[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplash(
        imagePath: 'assets/images/anulogo.png',
        duration: 2500,
        type: AnimatedSplashType.StaticDuration,
        home: ChangeNotifierProvider(
          create: (context) => YearsListModel(),
          child: YearsScreen(),
        ),
      ),
    );
  }
}
