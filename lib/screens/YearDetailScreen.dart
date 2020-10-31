import 'package:anucgpa/components/Drawer.dart';
import 'package:anucgpa/components/SemesterCgpaCard.dart';
import 'package:anucgpa/components/SemesterCourseList.dart';
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
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
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
            drawer: Drawer(
              child: DrawerWidget(),
            ),
            body: Container(
              color: Colors.white,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 230,
                          child: SemesterCgpaCard(
                            semestercgpa: semesters[0].grade,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          // Course List
                          child: SemesterCourseList(),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 230,
                          child: SemesterCgpaCard(
                            semestercgpa: semesters[1].grade,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          // Course List
                          child: SemesterCourseList(),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 230,
                          child: SemesterCgpaCard(
                            semestercgpa: semesters[2].grade,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          // Course List
                          child: SemesterCourseList(),
                        ),
                      ],
                    ),
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
