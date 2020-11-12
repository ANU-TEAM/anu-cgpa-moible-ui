import 'package:anucgpa/database/database.dart';
import 'package:anucgpa/widgets/Drawer.dart';
import 'package:anucgpa/widgets/SemesterCardTile.dart';
import 'package:anucgpa/screens/SemesterDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SemesterListScreen extends StatelessWidget {
  final String noentrySvgPath = 'assets/images/noentries.svg';
  @override
  Widget build(BuildContext context) {
    int semesterLength = 0;
    return Drawer(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.yellow[700]),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
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
          body: _buildSemesterList(context),
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
          return snapshot.data.length != 0
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: semesters.length,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final semester = semesters[index];
                    return _buildListItem(semester, database, context, index);
                  })
              : Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        noentrySvgPath,
                        height: 180,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "You have not added any semester yet. \nClick on the button below to add one.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
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
        child: Theme(
          data: ThemeData(
            highlightColor: Colors.red.withAlpha(60),
          ),
          child: Container(
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              secondaryActions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Card(
                    color: Colors.red[100],
                    elevation: 8.0,
                    shadowColor: Colors.grey[200],
                    child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 193, 4, 0.2),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4),
                          right: Radius.circular(4),
                        ),
                      ),
                      child: IconSlideAction(
                        iconWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red[600],
                              size: 32,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.red[600]),
                            ),
                          ],
                        ),
                        color: Colors.red[100],
                        // icon: Icons.delete,
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
      ),
    );
  }
}
