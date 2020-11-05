import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/Drawer.dart';
import 'package:anucgpa/widgets/SemesterCgpaCard.dart';
import 'package:anucgpa/widgets/CourseListWidget.dart';
import 'package:flutter/material.dart';

class SemesterDetailScreen extends StatelessWidget {
  // Declare a field that holds the year
  final Semester currentSemester;
  final int displayId;

  // In the constructor, require a Todo.
  SemesterDetailScreen(
      {Key key, @required this.displayId, @required this.currentSemester})
      : super(key: key);

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
                "Semester $displayId",
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
                      semestercgpa: currentSemester.semesterCGPA,
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
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Add Course",
                                  style: TextStyle(
                                    color: Colors.yellow[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text("Enter the course details below"),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              tooltip: 'Add a course',
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
