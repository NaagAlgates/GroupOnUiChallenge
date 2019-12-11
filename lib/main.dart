import 'dart:io';

import 'package:flutter/material.dart';
import 'package:group_on_ui/helpers/constants.dart';
import 'package:group_on_ui/helpers/themes.dart';
import 'package:group_on_ui/ui/home.dart';

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
          preferredSize: Size.fromHeight(Constants.getHeight(context)*0.07),
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
                  currentScreen = Constants.screens[i];
                  _title = Constants.screenTitle[i];
                });
              },
              items: [
                BottomNavItem(Icons.home,label: Constants.bottomMenuName[currentTab]),
                BottomNavItem(Icons.search, label: Constants.bottomMenuName[currentTab]),
                BottomNavItem(Icons.notifications, label: Constants.bottomMenuName[currentTab]),
                BottomNavItem(Icons.favorite, label: Constants.bottomMenuName[currentTab]),
                BottomNavItem(Icons.person, label: Constants.bottomMenuName[currentTab])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
