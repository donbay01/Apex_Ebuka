// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:apex_ebuka/Screens/Onboarding/onboarding_screen.dart';
import 'package:apex_ebuka/Screens/loadingPage.dart';
import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController emailController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Theme.of(context).hintColor,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen()));
              },
            ),
            elevation: 1,
            backgroundColor: primaryWhite,
            title: Text('Verify Your email',style: mediumBold(Theme.of(context).hintColor),),
          ),
          body: loading == false ? (
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        style: small(),
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Enter verification Token  ',
                          hintText: 'angella@gmail.com',
                          hintStyle: smallText(textColorBrown),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.deepOrange, width: 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            primary: primaryBlack,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: Text(
                            'Verify Email',
                            style: mediumText(primaryWhite),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ) : Center(child: LoadingPage(),)
      ),
    );
  }
}
