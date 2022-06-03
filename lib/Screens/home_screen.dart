// ignore_for_file: prefer_const_constructors

import 'package:apex_ebuka/Screens/Onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('Logout'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> OnboardingScreen()));
            },
          ),
        ),
      ),
    );
  }
}
