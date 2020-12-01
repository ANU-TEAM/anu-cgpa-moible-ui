import 'dart:ui';

import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.yellow[700]),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "About",
          style: TextStyle(
            color: Colors.yellow[700],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child: Text(
              //     "Developed By ANU DSC",
              //     style: TextStyle(
              //       fontSize: 34,
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 50),
              //   child: Text(
              //     "More Updates coming soon.",
              //     style: TextStyle(
              //       fontSize: 24,
              //     ),
              //   ),
              // ),

              Container(
                child: Text(
                  "Cumulative Grade Point Average refers to the average "
                  "of all of a student's semester GPAs during tertiary education. "
                  "It is an average of averages that combines these semester GPAs "
                  "into one representative GPA. While a semester GPA refers to "
                  "your GPA for that one semester, a Cumulative GPA refers to "
                  "your GPA for all of your combined semesters. Tertiary Institutions "
                  "use your CGPA to determine your graduating class and in "
                  "addition to other determining factors, Employers use your "
                  "Cumulative GPA to determine if you would be a good fit for their "
                  "company as it allows them to make a direct comparison to other "
                  "applicants during their CV review process. To calculate your CGPA: "
                  "Calculating your CGPA is a hurdle for most student and this is "
                  "what the ANUCGPA App has come to help. The ANUCGPA App helps you to "
                  "determine your CGPA before hand. This way, you will know your"
                  "stand and make the right decision concerning your academics",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, left: 220),
                child: Row(
                  children: [
                    Image.asset("assets/images/finger.png",
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,),
                    SizedBox(width: 8,),
                    Container(
                      child: GestureDetector(
                        onTap: () =>
                            launch('https://dsc.community.dev/all-nations-university/'),
                        child: Text(
                          "Join Us",
                          style: TextStyle(color: Colors.yellow[700], fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
