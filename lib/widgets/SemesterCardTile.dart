import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SemesterCardTile extends StatelessWidget {
  final String graduateSvgPath = 'assets/images/graduate.svg';

  final int semesterNumber;
  final double semesterCgpa;

  SemesterCardTile({this.semesterNumber, this.semesterCgpa});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.25, top: 10),
              child: SvgPicture.asset(
                graduateSvgPath,
                height: 140,
                color: Color.fromRGBO(255, 193, 4, 0.3),
              ),
            ),
            Container(
              color: Color.fromRGBO(255, 193, 4, 0.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.yellow[700],
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Semester",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${this.semesterNumber}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CGPA",
                        style: TextStyle(
                          color: Colors.yellow[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${this.semesterCgpa.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 54,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
