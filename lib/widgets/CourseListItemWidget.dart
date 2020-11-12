import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/EditCourseModal.dart';
import 'package:flutter/material.dart';

class CourseListItemWidget extends StatelessWidget {
  final Course courseItem;
  final int index;
  final Semester currentSemester;
  const CourseListItemWidget({
    this.courseItem,
    this.index,
    this.currentSemester,
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
                    currentSemester: currentSemester,
                    currentCourse: courseItem,
                    courseDisplayIndex: index,
                  ),
                ),
              );
            });
      },
      child: Container(
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: index % 2 == 0 ? Colors.white : Colors.yellow[50],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
          child: Container(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    courseItem.title == null
                        ? "Course ${index + 1}"
                        : "${courseItem.title}",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "${courseItem.credits}",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${courseItem.courseGrade.toStringAsFixed(2)}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
