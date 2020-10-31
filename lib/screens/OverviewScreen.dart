import 'package:anucgpa/components/Drawer.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Overview',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Padding(padding: EdgeInsets.all(15)),
        ],
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: Container(
        child: SafeArea(
          child: Container(
            child: Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(left: 25, right: 25, top: 20),
              alignment: Alignment.topCenter,
              color: Colors.yellow[800],
              height: 200,
              width: 300,
              child: Text(
                'Your CGPA',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ,
//     );
//   }
//}
