import 'package:anucgpa/database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCourseInputWidget extends StatefulWidget {
  final Semester? semester;
  const NewCourseInputWidget({
    this.semester,
    Key? key,
  }) : super(key: key);

  @override
  _NewCourseInputWidgetState createState() =>
      _NewCourseInputWidgetState(currentSemester: semester);
}

class _NewCourseInputWidgetState extends State<NewCourseInputWidget> {
  final Semester? currentSemester;
  _NewCourseInputWidgetState({this.currentSemester});
  final List<DropdownMenuItem> gradeOptions = [
    DropdownMenuItem(value: 4.0, child: Container(child: Text("A"))),
    DropdownMenuItem(value: 3.75, child: Container(child: Text("A-"))),
    DropdownMenuItem(value: 3.50, child: Container(child: Text("B+"))),
    DropdownMenuItem(value: 3.25, child: Container(child: Text("B"))),
    DropdownMenuItem(value: 3.0, child: Container(child: Text("B-"))),
    DropdownMenuItem(value: 2.75, child: Container(child: Text("C+"))),
    DropdownMenuItem(value: 2.50, child: Container(child: Text("C"))),
    DropdownMenuItem(value: 2.25, child: Container(child: Text("C-"))),
    DropdownMenuItem(value: 2.0, child: Container(child: Text("D+"))),
    DropdownMenuItem(value: 1.75, child: Container(child: Text("D"))),
    DropdownMenuItem(value: 1.50, child: Container(child: Text("D-"))),
    DropdownMenuItem(value: 1.0, child: Container(child: Text("F"))),
  ];

  TextEditingController? courseTitleController;
  TextEditingController? courseCreditHourController;
  late TextEditingController courseGradeController;

  String inputCourseTitle = "";
  int inputCourseCreditHours = 3;
  double inputCourseGrade = 4.0;
  int semesterCoursesLength = 0;

  @override
  void initState() {
    super.initState();
    courseTitleController = TextEditingController();
    courseCreditHourController =
        TextEditingController(text: inputCourseCreditHours.toString());
    courseGradeController = TextEditingController();
    final database = Provider.of<AppDb>(context, listen: false);
    database
        .getSemesterCoursesLength(currentSemester!.semesterId)
        .getSingle()
        .then((value) => semesterCoursesLength = value);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // padding: EdgeInsets.only(bottom: 100),
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
              color: Colors.yellow[700]!,
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
          if (courseTitle.isNotEmpty) {
            setState(() {
              inputCourseTitle = courseTitle;
            });
          }

          print(inputCourseTitle);
        },
      ),
    );
  }

  _buildCourseCreditHourInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
      child: TextField(
        keyboardType: TextInputType.number,
        cursorWidth: 1.5,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow[700]!,
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
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 193, 4, 0.1),
        border: Border(
          bottom: BorderSide(
            color: Colors.yellow[700]!,
            style: BorderStyle.solid,
            width: 3,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
          itemHeight: 54,
          icon: Icon(
            Icons.arrow_drop_down_circle_rounded,
            color: Colors.yellow[700],
            size: 36,
          ),
          hint: Text("GRADE"),
          value: inputCourseGrade,
          dropdownColor: Colors.yellow[50],
          items: gradeOptions,
          isExpanded: true,
          onChanged: (dynamic value) {
            setState(() {
              inputCourseGrade = value;
            });
          },
        ),
      ),
    );
  }

  _buildAddCourseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlatButton(
        highlightColor: Colors.yellow[800],
        height: 55,
        color: Colors.yellow[700],
        onPressed: () {
          final database = Provider.of<AppDb>(context, listen: false);

          final course = Course(
            courseId: semesterCoursesLength,
            title: inputCourseTitle,
            credits: inputCourseCreditHours,
            courseGrade: inputCourseGrade,
            semesterId: currentSemester!.semesterId,
          );
          database.insertCourse(course);
          print(course.toJson());
          resetValuesAfterSubmit();
          database
              .getSemesterCgpa(currentSemester!.semesterId)
              .getSingle()
              .then((value) {
            database.updateSemester(
              currentSemester!.copyWith(semesterCGPA: value),
            );
          });
          Navigator.pop(context);
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
        highlightColor: Colors.red[100],
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
      inputCourseTitle = "";
      inputCourseCreditHours = 0;
      inputCourseGrade = 4.0;
      courseTitleController!.clear();
      courseCreditHourController!.clear();
      courseGradeController.clear();
    });
  }
}
