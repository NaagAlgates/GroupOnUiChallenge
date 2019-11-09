import 'package:flutter/material.dart';

class SavedDealsScreen extends StatefulWidget {
  @override
  SavedDealsScreenState createState() => SavedDealsScreenState();
}

class SavedDealsScreenState extends State<SavedDealsScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(50.0),
        child: Text('Saved Deals', style: TextStyle(color: Colors.white, fontSize: 24.0)),
      ),
    );
  }
}