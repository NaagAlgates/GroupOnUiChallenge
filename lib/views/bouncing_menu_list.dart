import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_on_ui/helpers/constants.dart';

class BouncingMenuList extends StatelessWidget{
  final title, icon;
  BouncingMenuList(this.title,this.icon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0,right: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Platform.isIOS ? Colors.white38 : Colors.white,
              width: Constants.getWidth(context) * 0.003,
            ),
            color: Colors.transparent,
          ),
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 4.0,bottom: 4.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        color: Colors.white,
                        size: Constants.getWidth(context) * 0.040,
                      ),
                      SizedBox(
                        width: Constants.getWidth(context) * 0.014,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Constants.getWidth(context) * 0.031),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

}