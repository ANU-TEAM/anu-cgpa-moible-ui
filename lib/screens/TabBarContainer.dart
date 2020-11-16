import 'package:anucgpa/screens/OverviewScreen.dart';
import 'package:anucgpa/screens/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TabBarContainer extends StatefulWidget {
  @override
  _TabBarContainerState createState() => _TabBarContainerState();
}

class _TabBarContainerState extends State<TabBarContainer> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  List<Widget> _screens = [
    OverviewScreen(),
    ProfileScreen(),
    Text(
      'Index 2: Search',
    ),
    Text(
      'Index 3: Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: _screens,
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                _pageController.jumpToPage(index);
              },
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.yellow[700],
              color: Colors.yellow[700],
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Overview',
                ),
                GButton(
                  icon: Icons.headset,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.verified_user,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
