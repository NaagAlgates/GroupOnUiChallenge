import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(50.0),
        child: Text('Notifications', style: TextStyle(color: Colors.white, fontSize: 24.0)),
      ),
    );
  }
}