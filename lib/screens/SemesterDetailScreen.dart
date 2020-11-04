import 'package:anucgpa/widgets/Drawer.dart';
import 'package:anucgpa/widgets/SemesterCgpaCard.dart';
import 'package:anucgpa/widgets/CourseListWidget.dart';
import 'package:flutter/material.dart';

class SemesterDetailScreen extends StatelessWidget {
  // Declare a field that holds the year
  final int semesterId;

  // In the constructor, require a Todo.
  SemesterDetailScreen({Key key, @required this.semesterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: new IconThemeData(color: Colors.yellow[700]),
              backgroundColor: Color(0xFFF5F5F5),
              elevation: 0,
              title: Text(
                "Semester $semesterId",
                style: TextStyle(color: Colors.yellow[700]),
              ),
              actions: [
                Icon(
                  Icons.info_outline,
                  color: Colors.yellow[700],
                ),
              ],
            ),
            drawer: Drawer(
              child: DrawerWidget(),
            ),
            body: Center(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 230,
                    child: SemesterCgpaCard(
                      semestercgpa: 3.92,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // Course List
                    child: CourseListWidget(),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.yellow[600],
              onPressed: () {},
              tooltip: 'Increment',
              child: Icon(
                Icons.add,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
