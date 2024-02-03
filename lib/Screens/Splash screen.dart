import 'dart:async';

import 'package:finance_app/Screens/Login%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 5), (() {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) => Login())));
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFedfaff),
      body: Center(
          child: Lottie.network(
              "https://assets6.lottiefiles.com/private_files/lf30_hyt0pvbf.json")),
    );
  }
}
