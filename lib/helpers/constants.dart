library Constants;

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_on_ui/ui/home.dart';
import 'package:group_on_ui/ui/my_account.dart';
import 'package:group_on_ui/ui/notifications.dart';
import 'package:group_on_ui/ui/saved_deals.dart';
import 'package:group_on_ui/ui/search.dart';
import 'package:group_on_ui/views/bouncing_menu_list.dart';
import 'package:group_on_ui/views/delas_list.dart';

class Constants {
  final appName = "GroupOn";

  static getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  static List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    NotificationsScreen(),
    SavedDealsScreen(),
    AccountScreen()
  ];

  static List<String> screenTitle = [
    "",
    "",
    "",
    "Saved Deals",
    "My Stuff"
  ];

  static List<String> bottomMenuName = [
    "Featured",
    "Search",
    "Notifications",
    "Saved",
    "My Stuff"
  ];

  static List<Widget> bouncingMenuList = [
    BouncingMenuList("Beauty & Spa", Icons.star_border),
    BouncingMenuList("Restaurants", Icons.restaurant),
    BouncingMenuList("Shopping", Icons.shopping_basket),
    BouncingMenuList("Things to do", Icons.confirmation_number),
    BouncingMenuList("Travel", Icons.airplanemode_active),
    BouncingMenuList("Health & Fitness", Icons.fitness_center),
  ];

  static List<Widget> dealsList = [
    DealsList(
        "https://homepages.cae.wisc.edu/~ece533/images/monarch.png",
        "Butterfly",
        "Sydney \u00B7 1.4 km",
        3.5,
        6408,
        240,
        13,
        '38% off - Large Fruit or Veggie Juice',
        'NEW'),
    DealsList(
        "https://homepages.cae.wisc.edu/~ece533/images/mountain.png",
        "Mountain Trips",
        "Sydney \u00B7 0.4 km",
        4.5,
        78,
        20,
        13,
        null,
        'ALMOST GONE'),
    DealsList(
        "https://homepages.cae.wisc.edu/~ece533/images/tulips.png",
        "Tulips",
        "Sydney \u00B7 0.9 km",
        3.0,
        1248,
        70,
        53,
        'Valid on all flowers',
        "TRENDING"),
    DealsList("https://homepages.cae.wisc.edu/~ece533/images/pool.png",
        "Pool Games", "Sydney \u00B7 1.9 km", 5.0, 8996, -1, 99, null, null),
    DealsList(
        "https://homepages.cae.wisc.edu/~ece533/images/peppers.png",
        "Cheap Peppers",
        "Sydney \u00B7 0.0 km",
        2.5,
        14796,
        -1,
        3,
        'Valid only on Fridays',
        'FAST SELLING'),
    DealsList(
        "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
        "Fly Above",
        "Sydney \u00B7 30.0 km",
        2.5,
        3629,
        788,
        707,
        'Valid only on all packages above 15,000 feet',
        "TRENDING"),
  ];
}
