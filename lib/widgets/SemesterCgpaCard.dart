import 'package:flutter/material.dart';

class SemesterCgpaCard extends StatelessWidget {
  final double semestercgpa;
  SemesterCgpaCard({this.semestercgpa});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Card(
        elevation: 6,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow[700],
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Your CGPA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "${this.semestercgpa.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 72,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "SECOND CLASS UPPER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
