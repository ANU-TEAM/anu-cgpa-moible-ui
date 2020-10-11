import 'package:anucgpa/components/YearCard.dart';
import 'package:anucgpa/models/YearsListModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class YearsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final yearsList = context.watch<YearsListModel>();

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
            child: Text('Hello'),
          ),
          body: Container(
            child: Consumer<YearsListModel>(
              builder: (context, cart, child) {
                return ListView.builder(
                  itemCount: yearsList.years.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          closeOnScroll: false,
                          child: yearsList.years[index],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red[700],
                              icon: Icons.delete,
                              onTap: () {
                                yearsList.remove(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              yearsList.add(YearCard(
                  yearNumber: yearsList.years.length + 1, yearCgpa: 2));
              print(yearsList.numberOfYears);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
