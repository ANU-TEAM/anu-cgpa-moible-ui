import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/FgpaCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatelessWidget {
  // In the constructor, require a Todo.
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
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
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
    );
  }

  StreamBuilder<double> _buildOverallCgpa(BuildContext context) {
    final database = Provider.of<AppDb>(context);
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
}
