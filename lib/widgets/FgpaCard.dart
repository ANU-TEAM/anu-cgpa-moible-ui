import 'package:flutter/material.dart';

class FgpaCard extends StatelessWidget {
  final double semestercgpa;
  FgpaCard({this.semestercgpa});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 8.0,
        shadowColor: Colors.grey[200],
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
                "Your FGPA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "${this.semestercgpa.toStringAsFixed(4)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 72,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                _calculateCgpaClass(this.semestercgpa),
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

  String _calculateCgpaClass(double cgpa) {
    if (cgpa >= 3.60 && cgpa <= 4.00) {
      return "FIRST CLASS";
    } else if (cgpa >= 3.20 && cgpa <= 3.59) {
      return "SECOND CLASS UPPER";
    } else if (cgpa >= 2.80 && cgpa <= 3.19) {
      return "SECOND CLASS LOWER";
    } else if (cgpa >= 2.40 && cgpa <= 2.79) {
      return "THIRD CLASS";
    } else if (cgpa >= 2.00 && cgpa <= 2.39) {
      return "PASS";
    } else if (cgpa >= 1.00 && cgpa < 2.00) {
      return "FAIL";
    } else if (cgpa == 0) {
      return "- - -";
    } else {
      return "ATTEMPTED DEGREE";
    }
  }
}
