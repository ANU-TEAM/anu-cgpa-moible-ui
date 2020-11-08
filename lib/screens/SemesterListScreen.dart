import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/Drawer.dart';
import 'package:anucgpa/widgets/SemesterCardTile.dart';
import 'package:anucgpa/screens/SemesterDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SemesterListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int semesterLength = 0;
    return Drawer(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.yellow[700]),
            backgroundColor: Color(0xFFF5F5F5),
            elevation: 0,
            title: Text(
              "Semesters",
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
            child: _buildSemesterList(context),
          ),
          floatingActionButton: Builder(builder: (BuildContext context) {
            final database = Provider.of<AppDb>(context);
            return FloatingActionButton(
              backgroundColor: Colors.yellow[600],
              onPressed: () {
                database
                    .getSemesterLength()
                    .getSingle()
                    .then((value) => semesterLength = value);
                if (semesterLength < 13) {
                  final semester =
                      Semester(semesterId: null, semesterCGPA: 0.0);
                  database.insertSemester(semester);
                } else {
                  print(semesterLength);
                  final laddSnackBar = SnackBar(
                    backgroundColor: Colors.yellow[800],
                    content: Container(
                      child: Text(
                        "Oops! You can't add any more semesters.",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                  Scaffold.of(context).showSnackBar(laddSnackBar);
                }
              },
              tooltip: 'Add a new academic Semester.',
              child: Icon(
                Icons.add,
                size: 32,
                color: Colors.white,
              ),
            );
          }),
        ),
      ),
    );
  }

  StreamBuilder<List<Semester>> _buildSemesterList(BuildContext context) {
    final database = Provider.of<AppDb>(context);
    return StreamBuilder(
        stream: database.watchAllSemesters(),
        builder: (context, AsyncSnapshot<List<Semester>> snapshot) {
          final semesters = snapshot.data ?? List();
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: semesters.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final semester = semesters[index];
                return _buildListItem(semester, database, context, index);
              });
        });
  }

  Widget _buildListItem(
      Semester semester, AppDb database, BuildContext context, int index) {
    int semesterCount;
    database
        .getSemesterLength()
        .getSingle()
        .then((value) => semesterCount = value);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SemesterDetailScreen(
                displayId: index + 1,
                currentSemester: semester,
              ),
            ),
          );
        },
        child: Container(
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red[700],
                  icon: Icons.delete,
                  onTap: () {
                    if (index < semesterCount - 1) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.yellow[800],
                        content: Container(
                          child: Text(
                            "Semester ${index + 1} can't be deleted before Semester ${semesterCount}",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                    } else {
                      database.deleteSemester(semester);
                    }
                  },
                ),
              ),
            ],
            child: SemesterCardTile(
              semesterNumber: index + 1,
              semesterCgpa: semester.semesterCGPA,
            ),
          ),
        ),
      ),
    );
  }
}
