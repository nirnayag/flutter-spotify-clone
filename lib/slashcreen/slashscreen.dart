import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_clone/views/home.dart';

import '../login/login.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => splashscreenState();
}

class splashscreenState extends State<splashscreen> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    wherToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Container(
        width: 150,
        child: Image.asset('assets/logo.png'),
      )),
    );
  }

  void wherToGo() async {
    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 10), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeView()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyForm()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyForm()));
      }
    });
  }
}
