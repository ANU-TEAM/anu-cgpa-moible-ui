import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/Drawer.dart';
import 'package:anucgpa/widgets/SemesterCgpaCard.dart';
import 'package:anucgpa/widgets/CourseListWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
}

class NewCourseInputWidget extends StatefulWidget {
  final int semesterId;
  const NewCourseInputWidget({
    this.semesterId,
    Key key,
  }) : super(key: key);

  @override
  _NewCourseInputWidgetState createState() =>
      _NewCourseInputWidgetState(currentSemesterId: semesterId);
}

class _NewCourseInputWidgetState extends State<NewCourseInputWidget> {
  final int currentSemesterId;
  _NewCourseInputWidgetState({this.currentSemesterId});

  TextEditingController courseTitleController;
  TextEditingController courseCodeController;
  TextEditingController courseCreditHourController;
  TextEditingController courseGradeController;

  String inputCourseTitle;
  String inputCourseCode;
  int inputCourseCreditHours;
  double inputCourseGrade;

  @override
  void initState() {
    super.initState();
    courseTitleController = TextEditingController();
    courseCodeController = TextEditingController();
    courseCreditHourController = TextEditingController();
    courseGradeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: Text(
                "Add Course",
                style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 25),
              child: Text(
                "Enter the course details below",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            _buildCourseTitleInput(context),
            _buildCourseCodeInput(context),
            _buildCourseCreditHourInput(context),
            _buildCourseGradeInput(context),
            _buildAddCourseButton(context),
            _buildCancelButton(context),
          ],
        ),
      ),
    );
  }

  _buildCourseTitleInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        cursorWidth: 1.5,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow[700],
            ),
          ),
          border: OutlineInputBorder(),
          hintStyle: TextStyle(
            color: Colors.black54,
          ),
          filled: true,
          fillColor: Color.fromRGBO(255, 193, 4, 0.1),
          hintText: 'COURSE TITLE',
          alignLabelWithHint: true,
        ),
        controller: courseTitleController,
        onSubmitted: (courseTitle) {
          setState(() {
            inputCourseTitle = courseTitle;
          });
          print(inputCourseTitle);
        },
      ),
    );
  }

  _buildCourseCodeInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        cursorWidth: 1.5,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow[700],
            ),
          ),
          border: OutlineInputBorder(),
          hintStyle: TextStyle(
            color: Colors.black54,
          ),
          filled: true,
          fillColor: Color.fromRGBO(255, 193, 4, 0.1),
          hintText: 'COURSE CODE',
          alignLabelWithHint: true,
        ),
        controller: courseCodeController,
        onSubmitted: (courseCode) {
          setState(() {
            inputCourseCode = courseCode;
          });
          print(inputCourseCode);
        },
      ),
    );
  }

  _buildCourseCreditHourInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        keyboardType: TextInputType.number,
        cursorWidth: 1.5,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow[700],
            ),
          ),
          border: OutlineInputBorder(),
          hintStyle: TextStyle(
            color: Colors.black54,
          ),
          filled: true,
          fillColor: Color.fromRGBO(255, 193, 4, 0.1),
          hintText: 'CREDIT HOUR',
          alignLabelWithHint: true,
        ),
        controller: courseCreditHourController,
        onSubmitted: (courseCreditHour) {
          setState(() {
            inputCourseCreditHours = int.parse(courseCreditHour);
          });
          print(inputCourseCreditHours);
        },
      ),
    );
  }

  _buildCourseGradeInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        cursorWidth: 1.5,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow[700],
            ),
          ),
          border: OutlineInputBorder(),
          hintStyle: TextStyle(
            color: Colors.black54,
          ),
          filled: true,
          fillColor: Color.fromRGBO(255, 193, 4, 0.1),
          hintText: 'GRADE',
          alignLabelWithHint: true,
        ),
        controller: courseGradeController,
        onSubmitted: (courseGrade) {
          setState(() {
            inputCourseGrade = double.parse(courseGrade);
          });
          print(inputCourseGrade);
        },
      ),
    );
  }

  _buildAddCourseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlatButton(
        height: 55,
        color: Colors.yellow[700],
        onPressed: () {
          final database = Provider.of<AppDb>(context);
          final course = Course(
            title: inputCourseTitle,
            code: inputCourseCode,
            credits: inputCourseCreditHours,
            courseGrade: inputCourseGrade,
            semesterId: currentSemesterId,
          );
          database.insertCourse(course);
          print(inputCourseTitle);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Text(
              "ADD COURSE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlatButton(
        height: 55,
        color: Colors.red.withAlpha(50),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
            Text(
              "CANCEL",
              style: TextStyle(
                color: Colors.red,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      inputCourseTitle = null;
      inputCourseCode = null;
      inputCourseCreditHours = null;
      inputCourseGrade = null;
      courseTitleController.clear();
      courseCodeController.clear();
      courseCreditHourController.clear();
      courseGradeController.clear();
    });
  }
}
