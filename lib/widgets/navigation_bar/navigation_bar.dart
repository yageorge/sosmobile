import 'package:flutter/material.dart';

import '../drawer/app_drawer.dart';
import '../../helpers/enums/coursesTabs.dart';

import '../../views/courses/list/courses.dart';

class NavigationBar extends StatefulWidget {
  static const routeName = '/navigation_bar';
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<Map<String, Object>> _views;
  int _selectedViewIndex = 0;

  // Set the selectedViewIndex
  void _selectScreen(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  // Load Navigation Bar Views
  void _setNavigationViews() {
    _views = [
      {'screen': Courses(coursesTabs.all), 'title': 'Modules'},
      {'screen': Courses(coursesTabs.inProgress), 'title': 'In Progress'},
      {'screen': Courses(coursesTabs.completed), 'title': 'Completed'},
    ];
  }

  @override
  void initState() {
    _setNavigationViews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: _views[_selectedViewIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedViewIndex,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 30),
        items: [
          // Courses Tab
          BottomNavigationBarItem(
            label: _views[0]['title'],
            icon: Icon(Icons.account_balance),
          ),

          // InProgress Courses
          BottomNavigationBarItem(
            label: _views[1]['title'],
            icon: Icon(Icons.widgets_outlined),
          ),

          // Completed Courses
          BottomNavigationBarItem(
            label: _views[2]['title'],
            icon: Icon(Icons.done_all),
          ),
        ],
      ),
    );
  }
}
