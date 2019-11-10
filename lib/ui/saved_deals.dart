import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:group_on_ui/helpers/themes.dart';

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
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.favorite,
            color: Colors.grey[400],
            size: MediaQuery.of(context).size.width*0.3,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text('You haven\'t added any deals',
                      style: TextStyle(color: Colors.grey[700], fontSize: 22.0,fontWeight: FontWeight.bold)),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            child: Text('Tap the hear icon on any deal to add it into your saved deals!',
                style: TextStyle(color: Colors.grey[500], fontSize: 18.0,fontWeight: FontWeight.normal)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: groupOnThemeData.primaryColor,
              onPressed: (){
                log("Browse Clicked");
              },
              child: new Text("Browse"),
            ),
          ),
        ],
      )
    );
  }
}
