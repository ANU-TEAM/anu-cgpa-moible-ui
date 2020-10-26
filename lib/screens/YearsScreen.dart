import 'package:anucgpa/components/YearCard.dart';
import 'package:anucgpa/models/YearsListModel.dart';
import 'package:anucgpa/screens/YearDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'OverviewScreen.dart';
import 'AboutScreen.dart';
import 'CompareScreen.dart';
import 'LogOutScreen.dart';
import 'NavScreens.dart';
import 'OverviewScreen.dart';
import 'ProfileScreen.dart';
import 'SyncScreen.dart';


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
            //body: list[index],
          drawer:(
          Container(
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>OverviewScreen(),),);
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
                  onTap: () { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>YearsScreen(),),);},
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
                        fontSize: 20),
                  ),
                  onTap: ()  { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CompareScreen(),),);},
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
                  onTap: ()  { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProfileScreen(),),);},
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
                  onTap: ()  { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SyncScreen(),),);},
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
                  onTap: ()  { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AboutScreen(),),);},
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
                  onTap: () { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>LodOutScreen(),),);},
                )
              ],
            ),
          )
          ),
          body: Container(
            child: Consumer<YearsListModel>(
              builder: (context, cart, child) {
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
                              builder: (context) => YearDetailScreen(
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              yearsList.add(YearCard(
                  yearNumber: yearsList.years.length + 1, yearCgpa: 0));
            },
            tooltip: 'Increment',
            child: Icon(
              Icons.add,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// class MyDrawer extends StatefulWidget {
//
//   @override
//   _MyDrawerState createState() => _MyDrawerState();
// }

// class _MyDrawerState extends State<MyDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.8,
//       child: Drawer(
//         child: Scaffold(
//           drawer: Drawer(
//             child: Container(
//               color: Colors.green[300],
//               child: ListView(
//                 children: [
//                   ListTile(
//                     contentPadding: EdgeInsets.only(top: 20),
//                     leading: Icon(
//                       Icons.person,
//                       size: 45,
//                       color: Colors.white,
//                     ),
//                     title: Text(
//                       'Owusu Victor',
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                           fontSize: 20),
//                     ),
//                     subtitle: Text(
//                       'vitech180@gmail.com',
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                           fontSize: 20),
//                     ),
//                   ),
//
//                   //Overview
//                   ListTile(
//                       contentPadding: EdgeInsets.only(top: 20),
//                       leading: Icon(
//                         Icons.trending_up,
//                         size: 45,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         'Overview',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>OverviewScreen(),),);
//                       },
//                   ),
//
//                   //years
//                   ListTile(
//                       contentPadding: EdgeInsets.only(top: 20),
//                       leading: Icon(
//                         Icons.school,
//                         size: 45,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         'Year',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                       onTap: () {},
//                   ),
//
//                   //Compare
//                   ListTile(
//                       contentPadding: EdgeInsets.only(top: 20),
//                       leading: Icon(
//                         Icons.compare_arrows,
//                         size: 45,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         'Compare',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                       onTap: ()  {},
//                   ),
//
//                   //Profile
//                   ListTile(
//                       contentPadding: EdgeInsets.only(top: 20),
//                       leading: Icon(
//                         Icons.person,
//                         size: 45,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         'Profile',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                       onTap: ()  {},
//                   ),
//
//                   //Synch
//                   ListTile(
//                       contentPadding: EdgeInsets.only(top: 20),
//                       leading: Icon(
//                         Icons.sync,
//                         size: 45,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         'Synch',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                       onTap: ()  {},
//                   ),
//
//                   //About
//                   ListTile(
//                       contentPadding: EdgeInsets.only(top: 20),
//                       leading: Icon(
//                         Icons.info_outline,
//                         size: 45,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         'About',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                       onTap: ()  {},
//                   ),
//
//                   //Logout
//                   ListTile(
//                     contentPadding: EdgeInsets.only(top: 20),
//                     leading: Icon(
//                       Icons.exit_to_app,
//                       size: 45,
//                       color: Colors.white,
//                     ),
//                     title: Text(
//                       'Logout',
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                           fontSize: 20),
//                     ),
//                     onTap: () {},
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
