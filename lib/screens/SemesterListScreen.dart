import 'package:anucgpa/widgets/Drawer.dart';
import 'package:anucgpa/widgets/YearCard.dart';
import 'package:anucgpa/models/YearsListModel.dart';
import 'package:anucgpa/screens/SemesterDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SemesterListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var yearsList = Provider.of<YearsListModel>(context);

    return Drawer(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.yellow[700]),
            backgroundColor: Color(0xFFF5F5F5),
            elevation: 0,
            title: Text(
              "Years",
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
            child: Consumer<YearsListModel>(
              builder: (context, data, child) {
                return ListView.builder(
                  itemCount: yearsList.years.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SemesterDetailScreen(
                                  year: yearsList.years[index]),
                            ),
                          );
                        },
                        child: Container(
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            child: yearsList.years[index],
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red[700],
                                icon: Icons.delete,
                                onTap: () {
                                  yearsList.remove(index);
                                  if (index != yearsList.years.length) {
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.yellow[800],
                                      content: Container(
                                        child: Text(
                                          "Year ${index + 1} can't be deleted before Year ${yearsList.years.length}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          floatingActionButton: Builder(builder: (BuildContext context) {
            return FloatingActionButton(
              backgroundColor: Colors.yellow[600],
              onPressed: () {
                if (yearsList.years.length < 5) {
                  yearsList.add(
                    YearCard(
                        yearNumber: yearsList.years.length + 1, yearCgpa: 0),
                  );
                } else {
                  final laddSnackBar = SnackBar(
                    backgroundColor: Colors.yellow[800],
                    content: Container(
                      child: Text(
                        "Oops! You can't add any more years.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                  Scaffold.of(context).showSnackBar(laddSnackBar);
                }
              },
              tooltip: 'Add a new academic year.',
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
}
