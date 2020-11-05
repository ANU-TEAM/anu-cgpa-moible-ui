import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/CourseListItemWidget.dart';
import 'package:anucgpa/widgets/Drawer.dart';
import 'package:anucgpa/widgets/SemesterCgpaCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anucgpa/widgets/NewCourseModal.dart';

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
            body: Container(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: _buildCourseList(context),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.yellow[600],
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: NewCourseInputWidget(
                              semesterId: currentSemester.semesterId),
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

  StreamBuilder<List<Course>> _buildCourseList(BuildContext context) {
    final database = Provider.of<AppDb>(context);
    return StreamBuilder(
        stream: database.watchSemesterCourses(currentSemester.semesterId),
        builder: (context, AsyncSnapshot<List<Course>> snapshot) {
          final courses = snapshot.data ?? List();
          print(courses);
          return snapshot.data.length == 0
              ? Text('NOTHING')
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 230,
                      child: SemesterCgpaCard(
                        semestercgpa: currentSemester.semesterCGPA,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 6.0,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow[700],
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(4),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Course",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 40.0),
                                      child: Text(
                                        "Unit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Grade",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              physics: ScrollPhysics(),
                              child: Column(
                                children: [
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: courses.length,
                                      itemBuilder: (context, index) {
                                        final course = courses[index];
                                        return _buildCourseItem(
                                            course, database, context, index);
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        });
  }

  Widget _buildCourseItem(
      Course course, AppDb database, BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: CourseListItemWidget(
        index: index,
        courseItem: course,
      ),
    );
  }
}
