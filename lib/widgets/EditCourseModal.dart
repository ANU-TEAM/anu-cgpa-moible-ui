import 'package:anucgpa/database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCourseModal extends StatefulWidget {
  final Semester currentSemester;
  final Course currentCourse;
  final int courseDisplayIndex;
  const EditCourseModal({
    this.currentSemester,
    this.currentCourse,
    this.courseDisplayIndex,
    Key key,
  }) : super(key: key);

  @override
  _EditCourseModalState createState() => _EditCourseModalState(
      currentSemester: currentSemester,
      currentCourse: currentCourse,
      displayIndex: courseDisplayIndex);
}

class _EditCourseModalState extends State<EditCourseModal> {
  final Semester currentSemester;
  final Course currentCourse;
  final int displayIndex;
  _EditCourseModalState(
      {this.currentSemester, this.currentCourse, this.displayIndex});
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

  TextEditingController courseTitleController;
  TextEditingController courseCreditHourController;
  TextEditingController courseGradeController;

  String inputCourseTitle;
  int inputCourseCreditHours;
  double inputCourseGrade;

  @override
  void initState() {
    super.initState();
    inputCourseTitle = currentCourse.title;
    inputCourseCreditHours = currentCourse.credits;
    inputCourseGrade = currentCourse.courseGrade;
    courseTitleController = TextEditingController(
        text: currentCourse.title == null
            ? "Course ${displayIndex + 1}"
            : "${currentCourse.title}");
    courseCreditHourController =
        TextEditingController(text: currentCourse.credits.toString());
    courseGradeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: Text(
                "Edit Course",
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
            _buildEditCourseButton(context, currentSemester),
            _buildDeleteButton(context),
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
          if (courseTitle.isNotEmpty) {
            setState(() {
              inputCourseTitle = courseTitle;
            });
          } else {
            setState(() {
              inputCourseTitle = null;
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
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 193, 4, 0.1),
        border: Border(
          bottom: BorderSide(
            color: Colors.yellow[700],
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
          onChanged: (value) {
            setState(() {
              inputCourseGrade = value;
            });
            print("$inputCourseGrade");
          },
        ),
      ),
    );
  }

  _buildEditCourseButton(BuildContext context, Semester currentSemester) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlatButton(
        highlightColor: Colors.yellow[800],
        height: 55,
        color: Colors.yellow[700],
        onPressed: () {
          final database = Provider.of<AppDb>(context, listen: false);
          Course editedCourse = currentCourse.copyWith(
            title: inputCourseTitle,
            credits: inputCourseCreditHours,
            courseGrade: inputCourseGrade,
          );
          database.updateCourse(editedCourse);
          database
              .getSemesterCgpa(currentSemester.semesterId)
              .getSingle()
              .then((value) {
            database.updateSemester(
              currentSemester.copyWith(semesterCGPA: value),
            );
          });
          resetValuesAfterSubmit();
          print("$inputCourseTitle");
          print(editedCourse.toJson());
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
              "EDIT COURSE",
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

  _buildDeleteButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlatButton(
        highlightColor: Colors.red[100],
        height: 55,
        color: Colors.red.withAlpha(50),
        onPressed: () {
          final database = Provider.of<AppDb>(context, listen: false);
          database.deleteCourse(currentCourse);
          database.getSemesterCgpa(currentSemester.semesterId).getSingle().then(
            (value) {
              if (value == null) {
                database.updateSemester(
                  currentSemester.copyWith(semesterCGPA: 0),
                );
                print(value);
              } else {
                database.updateSemester(
                  currentSemester.copyWith(semesterCGPA: value),
                );
                print(value);
              }
            },
          );
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            Text(
              "DELETE",
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
      courseTitleController.clear();
      courseCreditHourController.clear();
      courseGradeController.clear();
    });
  }
}
