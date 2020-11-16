import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/FgpaCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OverviewScreen extends StatelessWidget {
  OverviewScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.yellow[700]),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: Text(
          "Overview",
          style: TextStyle(
            color: Colors.yellow[700],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 220,
                    color: Colors.white,
                    child: _buildOverallCgpa(context),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 220,
            child: _buildChart(context),
          )
        ],
      ),
    );
  }

  StreamBuilder<double> _buildOverallCgpa(BuildContext context) {
    final database = Provider.of<AppDb>(context, listen: false);
    return StreamBuilder(
      stream: database.watchOverallCgpa(),
      builder: (context, AsyncSnapshot<double> snapshot) {
        return snapshot.hasData
            ? FgpaCard(semestercgpa: snapshot.data)
            : FgpaCard(
                semestercgpa: 0,
              );
      },
    );
  }

  StreamBuilder<List<Semester>> _buildChart(BuildContext context) {
    final database = Provider.of<AppDb>(context, listen: false);
    return StreamBuilder(
      stream: database.watchAllSemesters(),
      builder: (context, AsyncSnapshot<List<Semester>> snapshot) {
        if (snapshot.hasData) {
          var seriesList = charts.Series<Semester, String>(
            id: 'Semesters',
            domainFn: (Semester semester, _) =>
                ((semester.semesterId + 1) - snapshot.data.first.semesterId)
                    .toString(),
            measureFn: (Semester semester, _) => semester.semesterCGPA,
            data: snapshot.data,
            fillColorFn: (Semester semester, _) {
              return charts.MaterialPalette.blue.shadeDefault;
            },
          );
          return charts.BarChart(
            [seriesList],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
