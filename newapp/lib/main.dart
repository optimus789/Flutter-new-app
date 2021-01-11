import 'package:flutter/material.dart';

import 'package:newapp/pages/home_page.dart';
import 'package:newapp/pages/login_page.dart';
import 'package:newapp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool("loggedIn") == true
          ? HomePage()
          : LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
