import 'package:anucgpa/components/YearCard.dart';
import 'package:flutter/material.dart';

class YearsPage extends StatelessWidget {
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              YearCard(
                yearNumber: 1,
                yearCgpa: 3.7,
              ),
              YearCard(
                yearNumber: 2,
                yearCgpa: 3.9,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
