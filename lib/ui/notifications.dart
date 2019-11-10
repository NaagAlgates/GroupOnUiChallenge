import 'package:flutter/material.dart';
import 'package:group_on_ui/helpers/themes.dart';
import 'package:group_on_ui/helpers/themes.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color:Colors.grey[300],
      child: ListView(
        children: <Widget>[
          header(context),
          listItems(context,'https://homepages.cae.wisc.edu/~ece533/images/airplane.png'),
          listItems(context,'https://homepages.cae.wisc.edu/~ece533/images/monarch.png'),
          listItems(context,'https://homepages.cae.wisc.edu/~ece533/images/mountain.png'),
          listItems(context,'https://homepages.cae.wisc.edu/~ece533/images/tulips.png'),
          listItems(context,'https://homepages.cae.wisc.edu/~ece533/images/pool.png'),
          listItems(context,'https://homepages.cae.wisc.edu/~ece533/images/peppers.png'),
        ],
      ),
    );
  }
}

Widget header(BuildContext context) {
  return Container(
      color: Colors.grey[200],
      height: MediaQuery
          .of(context)
          .size
          .width * 0.10,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0,left: 8.0),
          child: Text(
            'Notifications',
            style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width * 0.04,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ));
}

Widget listItems(BuildContext context, String url) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0,bottom: 8.0),
    child: Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              url,
              fit: BoxFit.fill,
              height: MediaQuery
                  .of(context)
                  .size
                  .width * 0.2,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.2,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 3.0, right: 8.0, left: 8.0),
                child: Text(
                  'Wow! You\'ve earned this!',
                  style: TextStyle(
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.045,
                      color: groupOnThemeData.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 3.0, right: 8.0, left: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Text(
                      'HOORAY! We\'re treating you to upto an extra 15% off',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .width * 0.035,
                          color: Colors.black),
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 3.0, right: 8.0, left: 8.0),
                child: Text(
                  '2d ago',
                  style: TextStyle(
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.025,
                      color: Colors.grey[400]),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
