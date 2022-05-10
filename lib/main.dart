import 'package:awsomeapp/screens/t3.dart';
import 'package:awsomeapp/screens/t4.dart';
import 'package:awsomeapp/screens/t4Fb.dart';
import 'package:awsomeapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login_page.dart';
import 'screens/t1.dart';
import 'screens/t2.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    title: "Flutter App",
    home: Constants.prefs.getBool("LoggedIn") == true ? Task4Fb() : LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    debugShowCheckedModeBanner: false,
    routes: {"/login": (context) => LoginPage(), "/home": (context) => Task4()},
  ));
}
