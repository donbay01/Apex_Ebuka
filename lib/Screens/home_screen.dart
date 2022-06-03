// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:apex_ebuka/Screens/Onboarding/onboarding_screen.dart';
import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/model/loginModel.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LoginModel? userToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Logout',style: mediumText(primaryWhite),),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> OnboardingScreen()));
                },
                style: ElevatedButton.styleFrom(primary: primaryBlack,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
