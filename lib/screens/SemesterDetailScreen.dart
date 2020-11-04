import 'package:anucgpa/widgets/Drawer.dart';
import 'package:anucgpa/widgets/SemesterCgpaCard.dart';
import 'package:anucgpa/widgets/CourseListWidget.dart';
import 'package:anucgpa/widgets/YearCard.dart';
import 'package:flutter/material.dart';

class SemesterDetailScreen extends StatelessWidget {
  // Declare a field that holds the year
  final YearCard year;

  // In the constructor, require a Todo.
  SemesterDetailScreen({Key key, @required this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
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
