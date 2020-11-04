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
                final semester = Semester(semesterId: null, semesterCGPA: 0.0);
                database.insertSemester(semester);
                print("Value inserted");
                // final laddSnackBar = SnackBar(
                //   backgroundColor: Colors.yellow[800],
                //   content: Container(
                //     child: Text(
                //       "Oops! You can't add any more semesters.",
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                // );
                // Scaffold.of(context).showSnackBar(laddSnackBar);
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
              itemCount: semesters.length,
              itemBuilder: (context, index) {
                final semester = semesters[index];
                return _buildListItem(semester, database, context, index);
              });
        });
  }

  Widget _buildListItem(
      Semester semester, AppDb database, BuildContext context, int index) {
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
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red[700],
                icon: Icons.delete,
                onTap: () {
                  database.deleteSemester(semester);
                },
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
