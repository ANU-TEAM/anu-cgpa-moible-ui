import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/EditCourseModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCourseOptionsModal extends StatelessWidget {
  final Course course;
  final int courseDisplayIndex;

  const EditCourseOptionsModal({
    this.course,
    this.courseDisplayIndex,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              course.title == null
                  ? "Course ${courseDisplayIndex + 1}"
                  : "${course.title}",
              style: TextStyle(
                fontSize: 19,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          EditButton(
            currentCourse: course,
            displayIndex: courseDisplayIndex,
          ),
          DeleteButton(
            currentCourse: course,
          ),
          CancelButton(),
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  final Course currentCourse;
  final int displayIndex;
  const EditButton({
    this.currentCourse,
    this.displayIndex,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                  child: EditCourseModal(
                    currentCourse: currentCourse,
                    courseDisplayIndex: displayIndex,
                  ),
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.5),
        margin: EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Icon(
              Icons.edit,
              color: Colors.yellow[700],
              size: 25,
            ),
            SizedBox(width: 25),
            Text(
              "Edit",
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final Course currentCourse;
  const DeleteButton({
    this.currentCourse,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final database = Provider.of<AppDb>(context, listen: false);
        database.deleteCourse(currentCourse);
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.5),
        margin: EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: Colors.yellow[700],
              size: 25,
            ),
            SizedBox(width: 25),
            Text(
              "Delete",
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.5),
        margin: EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Icon(
              Icons.close,
              color: Colors.red,
              size: 25,
            ),
            SizedBox(width: 25),
            Text(
              "Cancel",
              style: TextStyle(
                color: Colors.red,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
