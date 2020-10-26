// import 'package:anucgpa/screens/AboutScreen.dart';
// import 'package:anucgpa/screens/CompareScreen.dart';
// import 'package:anucgpa/screens/LogOutScreen.dart';
// import 'package:anucgpa/screens/OverviewScreen.dart';
// import 'package:anucgpa/screens/ProfileScreen.dart';
// import 'package:anucgpa/screens/SyncScreen.dart';
// import 'package:flutter/material.dart';
// import 'YearsScreen.dart';
// class NavScreens extends StatefulWidget {
//
//   @override
//   _NavScreensState createState() => _NavScreensState();
// }
//
// class _NavScreensState extends State<NavScreens> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Drawer(
//         child: Scaffold(
//           drawer: NavScreens(
//             Container(
//               child: ListView(
//               children: [
//                 ListTile(
//                   contentPadding: EdgeInsets.only(top: 20),
//                   leading: Icon(
//                     Icons.person,
//                     size: 45,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'Owusu Victor',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         fontSize: 20),
//                   ),
//                   subtitle: Text(
//                     'vitech180@gmail.com',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         fontSize: 20),
//                   ),
//                 ),
//
//                 //Overview
//                 ListTile(
//                   contentPadding: EdgeInsets.only(top: 20),
//                   leading: Icon(
//                     Icons.trending_up,
//                     size: 45,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'Overview',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         fontSize: 20),
//                   ),
//                   onTap: () {},
//                 ),
//
//                 //years
//                 ListTile(
//                   contentPadding: EdgeInsets.only(top: 20),
//                   leading: Icon(
//                     Icons.school,
//                     size: 45,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'Year',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         fontSize: 20),
//                   ),
//                   onTap: () {},
//                 ),
//
//                 //Compare
//                 ListTile(
//                     contentPadding: EdgeInsets.only(top: 20),
//                     leading: Icon(
//                       Icons.compare_arrows,
//                       size: 45,
//                       color: Colors.white,
//                     ),
//                     title: Text(
//                       'Compare',
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                           fontSize: 20),
//                     ),
//                     onTap: () {}
//                 ),
//
//                 //Profile
//                 ListTile(
//                   contentPadding: EdgeInsets.only(top: 20),
//                   leading: Icon(
//                     Icons.person,
//                     size: 45,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'Profile',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         fontSize: 20),
//                   ),
//                   onTap: () {},
//                 ),
//
//                 //Synch
//                 ListTile(
//                   contentPadding: EdgeInsets.only(top: 20),
//                   leading: Icon(
//                     Icons.sync,
//                     size: 45,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'Synch',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         fontSize: 20),
//                   ),
//                   onTap: () {},
//                 ),
//
//                 //About
//                 ListTile(
//                   contentPadding: EdgeInsets.only(top: 20),
//                   leading: Icon(
//                     Icons.info_outline,
//                     size: 45,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'About',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         fontSize: 20),
//                   ),
//                   onTap: () {},
//                 ),
//
//                 //Logout
//                 ListTile(
//                   contentPadding: EdgeInsets.only(top: 20),
//                   leading: Icon(
//                     Icons.exit_to_app,
//                     size: 45,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'Logout',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         fontSize: 20),
//                   ),
//                   onTap: () {},
//                 )
//               ],
//             ),),
//
//               )
//           ),
//     );
//   }
// }
//
