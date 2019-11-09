import 'dart:io';

import 'package:flutter/material.dart';
import 'package:group_on_ui/helpers/themes.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          appMenu(context, this),
          Text('Home', style: TextStyle(color: Colors.black, fontSize: 24.0)),
        ],
      ),
    );
  }
}

Widget appMenu(BuildContext context, TickerProvider provider) {
  AnimationController _controller = AnimationController(
    vsync: provider,
    duration: const Duration(milliseconds: 300),
  );
  final Animation<RelativeRect> relativeRectTween = RelativeRectTween(
    begin: RelativeRect.fromLTRB(300.0, 0, 0, 0),
    end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
  ).animate(
      new CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

  _controller.forward();
  return Container(
    width: MediaQuery.of(context).size.width,
    //height: Platform.isIOS ?  MediaQuery.of(context).size.height*0.055: MediaQuery.of(context).size.height*0.075 ,
    height: MediaQuery.of(context).size.width * 0.12,
    color: groupOnThemeData.primaryColor,
    child: Stack(
      children: <Widget>[
        PositionedTransition(
          rect: relativeRectTween,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, bottom: 8.0, top: 6.0, right: 8.0),
            child: ListView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 4.0, left: 2.0),
                  child: menuList(context, "Beauty & Spa", Icons.star_border),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 4.0, left: 2.0),
                  child: menuList(context, "Restaurants", Icons.restaurant),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 4.0, left: 2.0),
                  child: menuList(context, "Shopping", Icons.shopping_basket),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 4.0, left: 2.0),
                  child: menuList(
                      context, "Things to do", Icons.confirmation_number),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 4.0, left: 2.0),
                  child: menuList(context, "Travel", Icons.airplanemode_active),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 4.0, left: 2.0),
                  child: menuList(
                      context, "Health & Fitness", Icons.fitness_center),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget menuList(BuildContext context, String title, IconData icon) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(2.5),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Platform.isIOS ? Colors.white38 :Colors.white,
          width: MediaQuery.of(context).size.width * 0.003,
        ),
        color: Colors.transparent,
      ),
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.040,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.014,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.031),
                  ),
                ],
              ))),
    ),
  );
}
