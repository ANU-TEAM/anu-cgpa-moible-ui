import 'package:anucgpa/database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        onChanged: (courseTitle) {
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
        onChanged: (courseCode) {
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
        onChanged: (courseCreditHour) {
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
        onChanged: (courseGrade) {
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
          final database = Provider.of<AppDb>(context, listen: false);
          final course = Course(
            courseId: null,
            title: inputCourseTitle,
            code: inputCourseCode,
            credits: inputCourseCreditHours,
            courseGrade: inputCourseGrade,
            semesterId: currentSemesterId,
          );
          database.insertCourse(course);
          print(course.toJson());
          resetValuesAfterSubmit();
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
        onPressed: () {
          resetValuesAfterSubmit();
          Navigator.pop(context);
        },
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
