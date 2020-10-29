import 'package:anucgpa/screens/AboutScreen.dart';
import 'package:anucgpa/screens/CompareScreen.dart';
import 'package:anucgpa/screens/ProfileScreen.dart';
import 'package:anucgpa/screens/SyncScreen.dart';
import 'package:anucgpa/screens/YearsScreen.dart';
import 'package:flutter/material.dart';
import 'SearchScreen.dart';
import 'LogOutScreen.dart';

class OverviewScreen extends StatelessWidget {
  Color gradientStart = Colors.yellow[300];
  Color gradientEnd = Colors.yellow[600];
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
        drawer: Center(
          child: Container(
            child: (Container(
              padding: EdgeInsets.only(left: 50),
              decoration: new BoxDecoration(
                  // gradient: LinearGradient(colors: [
                  //   Colors.yellow[800], Colors.yellow[600],
                  // ],
                  //   begin: Alignment.topRight,
                  //   end:  Alignment.bottomRight,
                  //   stops: [0.1, 0.0],
                  // )
                  // gradient: LinearGradientStyle.linearGradient(
                  //   orientation: LinearGradientStyle.GRADIENT_TYPE_MANGO,
                  //
                  // )
                  gradient: new LinearGradient(
                colors: [gradientStart, gradientEnd],
                begin: new FractionalOffset(0.0, 0.0),
                end: new FractionalOffset(1.0, 1.0),
                //stops: [1.1, 0.1],
              )),
              child: ListView(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    leading: Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Owusu Victor',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      'vitech180@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),

                  //Overview
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    leading: Icon(
                      Icons.trending_up,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Overview',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => OverviewScreen(),
                        ),
                      );
                    },
                  ),

                  //years
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    leading: Icon(
                      Icons.school,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Year',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => YearsScreen(),
                        ),
                      );
                    },
                  ),

                  //Compare
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    leading: Icon(
                      Icons.compare_arrows,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Compare',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => CompareScreen(),
                        ),
                      );
                    },
                  ),

                  //Profile
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    leading: Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ProfileScreen(),
                        ),
                      );
                    },
                  ),

                  //Synch
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    leading: Icon(
                      Icons.sync,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Synch',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SyncScreen(),
                        ),
                      );
                    },
                  ),

                  //About
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    leading: Icon(
                      Icons.info_outline,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AboutScreen(),
                        ),
                      );
                    },
                  ),

                  //Logout
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    leading: Icon(
                      Icons.exit_to_app,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => LodOutScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            )),
          ),
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
