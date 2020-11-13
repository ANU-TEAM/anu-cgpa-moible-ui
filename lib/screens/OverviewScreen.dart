import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/Drawer.dart';
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
    return Drawer(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.yellow[700]),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            title: Text(
              "Overview",
              style: TextStyle(color: Colors.yellow[700]),
            ),
            actions: [
              Icon(
                Icons.info_outline,
                color: Colors.yellow[700],
              ),
            ],
          ),
          drawer: Drawer(
            child: DrawerWidget(),
          ),
          body: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 230,
                    color: Colors.white,
                    child: _buildOverallCgpa(context),
                  ),
                ],
              ),
            ),
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
