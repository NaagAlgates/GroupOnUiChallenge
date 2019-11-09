import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(50.0),
        child: Text('My Stuff', style: TextStyle(color: Colors.black, fontSize: 24.0)),
      ),
    );
  }
}