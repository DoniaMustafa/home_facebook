import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData themeData()=> ThemeData(
  appBarTheme: AppBarTheme(
    // elevation: 1.0,
    backgroundColor: Colors.white,

    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,

);