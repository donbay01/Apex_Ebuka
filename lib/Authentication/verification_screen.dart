// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, library_private_types_in_public_api, avoid_print, unnecessary_string_interpolations

import 'package:apex_ebuka/Authentication/loginScreen.dart';
import 'package:apex_ebuka/Authentication/token_screen.dart';
import 'package:apex_ebuka/Screens/Onboarding/onboarding_screen.dart';
import 'package:apex_ebuka/Screens/loadingPage.dart';
import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/model/verify_model.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

Future<VerifyModel?> verifyUser(String email) async {
  final Uri apiUrl =
  Uri.parse("https://smart-pay-mobile.herokuapp.com/api/v1/auth/email");

  final response = await http.post(apiUrl,
      body: {
    "email": email,
  });
  await Future.delayed(Duration(seconds: 3));
  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(responseString);
    return verifyModelFromJson(responseString);
  } else {
    print("error");
  }
  print(response);
}



class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController emailController = TextEditingController();
  bool loading = false;
  VerifyModel? _user;
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
                          labelText: 'Email',
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
                          onPressed: () async {
                            if (emailController.text.isEmpty) {
                              displayToastMessage("Kindly Provide an email address",primaryOrange, context);
                            }
                            else if (!emailController.text.contains("@")) {
                              displayToastMessage("Enter a valid email address",primaryOrange, context);
                            }setState(() {
                              loading = true;
                            });
                            final VerifyModel? user = await verifyUser(emailController.text);
                            setState(() {
                              _user = user;
                              loading = false;
                            });
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
                      SizedBox(height: 50,),
                      _user == null ? Container():
                          Center(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Your Token is ${_user!.data.token}',style: mediumBold(primaryBlack),),
                              IconButton(
                                icon: Icon(Icons.copy,color: primaryOrange,),
                                onPressed: (){
                                  final data = ClipboardData(text: '${_user!.data.token}');
                                  Clipboard.setData(data);
                                  displayToastMessage(
                                      "Token Copied", primaryOrange, context);

                                },
                              )
                            ],
                          )),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>TokenScreen()));
                      }, child: Text('Continue')),
                    ],
                  ),
                ),
              )
          ) : Center(child: LoadingPage(),)
      ),
    );
  }
}
