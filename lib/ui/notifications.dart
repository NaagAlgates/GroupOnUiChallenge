import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        color: Colors.purple,
        child: Text('Notifications', style: TextStyle(color: Colors.white, fontSize: 24.0)),
    );
  }
}