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
      child: Card(
        elevation: 8.0,
        child: Container(
          height: 140,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.25, top: 10),
                child: SvgPicture.asset(
                  graduateSvgPath,
                  height: 130,
                  color: Color.fromRGBO(255, 193, 4, 0.3),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 193, 4, 0.2),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(4),
                    right: Radius.circular(4),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(4),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.23,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Semester",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
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
                          "${this.semesterCgpa.toStringAsFixed(3)}",
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
      ),
    );
  }
}
