import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(50.0),
        child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 24.0)),
      ),
    );
  }
}