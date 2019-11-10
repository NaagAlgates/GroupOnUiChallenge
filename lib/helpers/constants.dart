library Constants;

import 'dart:convert';

import 'package:flutter/services.dart';

const String APP_NAME="GroupOn";


Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  print('--- Parse json from: $assetsPath');
  return rootBundle.loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
}
