import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData darkTheme =  ThemeData(
    scaffoldBackgroundColor: const Color(0xFF333739),
    primarySwatch: defaultColor,
/*    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange),*/
    appBarTheme: const AppBarTheme(
        backwardsCompatibility: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF333739),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Color(0xFF333739),
        elevation: 0,
        titleTextStyle: TextStyle(
            fontFamily: 'Jannah',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        selectedItemColor: Colors.deepOrange,
        backgroundColor: Color(0xFF333739),
        unselectedItemColor: Colors.grey
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white)),
    fontFamily: 'Jannah'
);

ThemeData lightTheme = ThemeData(
    primarySwatch: defaultColor,
    primaryTextTheme: const TextTheme(
        headline6: TextStyle(color: Colors.black,
            fontWeight: FontWeight.w600,
        ),

    ),
    scaffoldBackgroundColor: Colors.white,
/*    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange),*/
    appBarTheme: const AppBarTheme(
        backwardsCompatibility: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontFamily: 'Jannah',
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        selectedItemColor: Colors.deepOrange,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black)),
    fontFamily: 'Jannah'
);