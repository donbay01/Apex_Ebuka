// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:apex_ebuka/Authentication/loginScreen.dart';
import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';

class ConfirmedScreen extends StatelessWidget {
  const ConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200,),
              Center(child: Image(image: AssetImage('assets/confirm.png'))),
              SizedBox(height: 20,),
              Center(child: Text('Your account has been\nsuccessfully created 👋 ')),
              SizedBox(height: 150,),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                  },
                  child: Text('Proceed to Login',style: mediumText(primaryWhite),),
                  style: ElevatedButton.styleFrom(
                    primary: primaryBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
