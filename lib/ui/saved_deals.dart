import 'package:flutter/material.dart';

class SavedDealsScreen extends StatefulWidget {
  @override
  SavedDealsScreenState createState() => SavedDealsScreenState();
}

class SavedDealsScreenState extends State<SavedDealsScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
        child: Text('Saved Deals', style: TextStyle(color: Colors.white, fontSize: 24.0)),
    );
  }
}