import 'package:flutter/material.dart';
import 'package:group_on_ui/helpers/themes.dart';

void main() => runApp(GroupOnApp());

class GroupOnApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  groupOnThemeData,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(),
    );
  }
}
