// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_string_interpolations

import 'dart:async';

import 'package:apex_ebuka/Screens/Onboarding/onboarding_screen.dart';
import 'package:apex_ebuka/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // bool hasInternet = false;

  Timer? _timer;
  @override

  void initState() {
    _timer = Timer(
        Duration(seconds: 3),
            ()=> Navigator.of(context).push(_createRoute()));
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryWhite,
        child: Center(child: SvgPicture.asset(
          'assets/logo.svg',
          semanticsLabel: 'App Logo',
          fit: BoxFit.cover,

        ))
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => OnboardingScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

displayToastMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 1),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.deepOrange,
  ));
}
