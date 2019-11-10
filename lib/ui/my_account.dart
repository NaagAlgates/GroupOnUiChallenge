import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          header(context, 'My Purchases'),
          menuItems(Icons.confirmation_number, 'My Purchases', context),
          header(context, 'My Settings'),
          menuItems(Icons.location_on, 'My Subscriptions', context),
          plainDivider(),
          menuItems(Icons.credit_card, 'Payment Menthods', context),
          plainDivider(),
          menuItems(Icons.notifications, 'Notification Settings', context),
          plainDivider(),
          menuItems(Icons.help, 'Customer Support', context),
          plainDivider(),
          menuItems(Icons.business, 'Advertise on Groupon', context),
          plainDivider(),
          menuItems(Icons.info_outline, 'About Groupon', context),
          plainDivider(),
          menuItems(Icons.cancel, 'Sign Out', context),
        ],
      ),
    );
  }
}

Widget header(BuildContext context, String title) {
  return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.width * 0.10,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0, left: 8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
        ),
      ));
}

Widget menuItems(IconData icon, String title, BuildContext context) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0,top: 8.0,right: 10.0),
            child: Icon(
              icon,
              size: MediaQuery.of(context).size.width*0.055,
              color: Colors.grey[400],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
          )
        ],
      ),
    ),
  );
}

Widget plainDivider(){
  return Padding(
    padding: const EdgeInsets.only(left: 55.0),
    child: Divider(color: Colors.grey[600],),
  );
}
