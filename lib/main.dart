import 'dart:io';

import 'package:flutter/material.dart';
import 'package:group_on_ui/helpers/themes.dart';
import 'package:group_on_ui/ui/home.dart';
import 'package:group_on_ui/ui/my_account.dart';
import 'package:group_on_ui/ui/notifications.dart';
import 'package:group_on_ui/ui/saved_deals.dart';
import 'package:group_on_ui/ui/search.dart';

import 'views/bottom_navigation_bar.dart';
import 'views/search_view_static.dart';

void main() => runApp(GroupOnApp());

class GroupOnApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: groupOnThemeData,
      home: GroupOnHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GroupOnHomePage extends StatefulWidget {
  GroupOnHomePage({Key key}) : super(key: key);

  @override
  _GroupOnHomePageState createState() => _GroupOnHomePageState();
}

class _GroupOnHomePageState extends State<GroupOnHomePage> {
  int currentTab = 0;
  String _title = "";
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    NotificationsScreen(),
    SavedDealsScreen(),
    AccountScreen()
  ];
  final List<String> screenTitle = [
    "",
    "",
    "",
    "Saved Deals",
    "My Stuff"
  ];
  Widget currentScreen = HomeScreen();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: Text(
              _title,
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
            actions: <Widget>[
              searchView(context)
            ],
          ),
        ),
        body: PageStorage(child: currentScreen, bucket: bucket),
        bottomNavigationBar: Material(
          child: Padding(
            padding: Platform.isIOS
                ? EdgeInsets.only(bottom: 20.0)
                : EdgeInsets.only(bottom: 0.0),
            child: GroupOnBottomNavigationBar(
              color: Colors.transparent,
              elevation: 0.0,
              index: currentTab,
              labelStyle: LabelStyle(visible: false),
              onTap: (i) {
                setState(() {
                  currentTab = i;
                  currentScreen = screens[i];
                  _title = screenTitle[i];
                });
              },
              items: [
                BottomNavItem(Icons.home, label: 'Featured'),
                BottomNavItem(Icons.search, label: 'Search'),
                BottomNavItem(Icons.notifications, label: 'Notifications'),
                BottomNavItem(Icons.favorite, label: 'Saved'),
                BottomNavItem(Icons.person, label: screenTitle[4])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
