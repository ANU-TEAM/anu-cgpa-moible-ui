import 'package:anucgpa/components/YearCard.dart';
import 'package:anucgpa/models/SemesterModel.dart';
import 'package:flutter/material.dart';

class YearDetailScreen extends StatelessWidget {
  // Declare a field that holds the year
  final YearCard year;

  final List<SemesterModel> semesters = [
    SemesterModel(id: 1, grade: 3),
    SemesterModel(id: 2, grade: 3.5),
    SemesterModel(id: 3, grade: 3.84),
  ];

  // In the constructor, require a Todo.
  YearDetailScreen({Key key, @required this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                labelColor: Colors.yellow[700],
                unselectedLabelColor: Colors.grey[600],
                // Check for physics to control splash color duration
                tabs: [
                  Tab(
                    child: Text(
                      "Semester ${semesters[0].id}".toUpperCase(),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Semester ${semesters[1].id}".toUpperCase(),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Summer".toUpperCase(),
                    ),
                  ),
                ],
              ),
              iconTheme: new IconThemeData(color: Colors.yellow[700]),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Year ${year.yearNumber}",
                style: TextStyle(color: Colors.yellow[700]),
              ),
            ),
            body: Container(
              color: Colors.white,
              child: TabBarView(
                children: [
                  Center(
                    child: Text("${semesters[0].grade}"),
                  ),
                  Center(
                    child: Text("${semesters[1].grade}"),
                  ),
                  Center(
                    child: Text("${semesters[2].grade}"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
