import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/CourseListItemWidget.dart';
import 'package:anucgpa/widgets/SemesterCgpaCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:anucgpa/widgets/NewCourseModal.dart';

class SemesterDetailScreen extends StatelessWidget {
  // Declare a field that holds the year
  final Semester currentSemester;
  final int displayId;
  final String noentrySvgPath = 'assets/images/noentries.svg';

  // In the constructor, require a Todo.
  SemesterDetailScreen(
      {Key key, @required this.displayId, @required this.currentSemester})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.yellow[700]),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            title: Text(
              "Semester $displayId",
              style: TextStyle(color: Colors.yellow[700]),
            ),
          ),
          body: Container(
            alignment: Alignment.topCenter,
            color: Colors.white,
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [_buildCourseList(context)],
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
                        child: NewCourseInputWidget(semester: currentSemester),
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
    );
  }

  StreamBuilder<List<Course>> _buildCourseList(BuildContext context) {
    final database = Provider.of<AppDb>(context);

    return StreamBuilder(
        stream: database.watchSemesterCourses(currentSemester.semesterId),
        builder: (context, AsyncSnapshot<List<Course>> snapshot) {
          final courses = snapshot.data ?? List();
          return courses.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        noentrySvgPath,
                        height: 180,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "You have not added any course for this semester yet. \nClick on the button below to add one.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      child: _buildSemesterCgpa(context),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 8.0,
                        shadowColor: Colors.grey[200],
                        child: Container(
                          margin: EdgeInsets.all(5),
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
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Course",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "Unit",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Grade",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
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
                                              course,
                                              currentSemester,
                                              database,
                                              context,
                                              index);
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        });
  }

  StreamBuilder<double> _buildSemesterCgpa(BuildContext context) {
    final database = Provider.of<AppDb>(context);
    return StreamBuilder(
      stream: database.watchSemesterCgpa(currentSemester.semesterId),
      builder: (context, AsyncSnapshot<double> snapshot) {
        return snapshot.hasData
            ? SemesterCgpaCard(semestercgpa: snapshot.data)
            : SemesterCgpaCard(
                semestercgpa: 0,
              );
      },
    );
  }

  Widget _buildCourseItem(Course course, Semester semester, AppDb database,
      BuildContext context, int index) {
    return CourseListItemWidget(
      currentSemester: semester,
      index: index,
      courseItem: course,
    );
  }
}
