import 'dart:js';

import 'package:awsomeapp/screens/t3.dart';
import 'package:awsomeapp/screens/t4.dart';
import 'package:flutter/material.dart';

import 'screens/login_page.dart';
import 'screens/t1.dart';
import 'screens/t2.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter App",
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    debugShowCheckedModeBanner: false,
    // home: LoginPage(),
    routes: {
      "/login": (context) => LoginPage(),
      "/home": (context) => Task4(),
    },
  ));
}
