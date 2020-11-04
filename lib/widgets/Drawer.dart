import 'package:flutter/material.dart';
import 'package:anucgpa/screens/SemesterListScreen.dart';
import 'package:anucgpa/screens/AboutScreen.dart';
import 'package:anucgpa/screens/CompareScreen.dart';
import 'package:anucgpa/screens/LogOutScreen.dart';
import 'package:anucgpa/screens/OverviewScreen.dart';
import 'package:anucgpa/screens/ProfileScreen.dart';
import 'package:anucgpa/screens/SyncScreen.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.yellow[700], Colors.yellow[800]],
          begin: new FractionalOffset(0.0, 0.0),
          end: new FractionalOffset(1.0, 1.0),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.only(left: 30),
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(top: 50, bottom: 30),
            leading: Icon(
              Icons.person_outline,
              size: 60,
              color: Colors.white,
            ),
            title: Text(
              'Owusu Victor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            subtitle: Text(
              'vitech180@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),

          //Overview
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => OverviewScreen(),
                ),
              );
            },
            contentPadding: EdgeInsets.only(top: 20),
            leading: Icon(
              Icons.stacked_bar_chart,
              size: 35,
              color: Colors.white,
            ),
            title: Text(
              'Overview',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          //semesters

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SemesterListScreen(),
                ),
              );
            },
            contentPadding: EdgeInsets.only(top: 20),
            leading: Icon(
              Icons.school,
              size: 35,
              color: Colors.white,
            ),
            title: Text(
              'Semesters',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          //Compare
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CompareScreen(),
                ),
              );
            },
            contentPadding: EdgeInsets.only(top: 20),
            leading: Icon(
              Icons.compare_arrows,
              size: 35,
              color: Colors.white,
            ),
            title: Text(
              'Comapare',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          //Profile
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfileScreen(),
                ),
              );
            },
            contentPadding: EdgeInsets.only(top: 20),
            leading: Icon(
              Icons.person,
              size: 35,
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          //Sync
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SyncScreen(),
                ),
              );
            },
            contentPadding: EdgeInsets.only(top: 20),
            leading: Icon(
              Icons.sync,
              size: 35,
              color: Colors.white,
            ),
            title: Text(
              'Sync',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          //About
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AboutScreen(),
                ),
              );
            },
            contentPadding: EdgeInsets.only(top: 20),
            leading: Icon(
              Icons.info_outline,
              size: 35,
              color: Colors.white,
            ),
            title: Text(
              'About',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          //Logout
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LogOutScreen(),
                ),
              );
            },
            contentPadding: EdgeInsets.only(top: 20),
            leading: Icon(
              Icons.logout,
              size: 35,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
