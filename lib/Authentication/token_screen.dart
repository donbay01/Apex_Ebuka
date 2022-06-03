// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sized_box_for_whitespace

import 'package:apex_ebuka/Authentication/confirmedScreen.dart';
import 'package:apex_ebuka/Authentication/loginScreen.dart';
import 'package:apex_ebuka/Screens/loadingPage.dart';
import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/model/confirmation_model.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TokenScreen extends StatefulWidget {
  const TokenScreen({Key? key}) : super(key: key);

  @override
  _TokenScreenState createState() => _TokenScreenState();
}

Future<ConfirmedModel?> confirmUser(String email, String token) async {
  final Uri apiUrl =
  Uri.parse("https://smart-pay-mobile.herokuapp.com/api/v1/auth/email/verify");

  final response = await http.post(apiUrl,
      body: {
        "email": email,
        "token": token
      });
  await Future.delayed(Duration(seconds: 3));
  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(responseString);
    return confirmedModelFromJson(responseString);
  } else {
    print("error");
  }
  print(response);
}

class _TokenScreenState extends State<TokenScreen> {

  bool loading = false;
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Theme.of(context).hintColor,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            elevation: 1,
            backgroundColor: primaryWhite,
            title: Text('Enter Your Token',style: mediumBold(Theme.of(context).hintColor),),
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
                      SizedBox(height: 20,),
                      TextField(
                        style: small(),
                        keyboardType: TextInputType.number,
                        controller: tokenController,
                        decoration: InputDecoration(
                          labelText: 'Enter Token',
                          hintText: 'XXXXXX',
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
                            if (tokenController.text.isEmpty) {
                              displayToastMessage("Kindly Provide the Token",primaryOrange, context);
                            }else if (emailController.text.contains("@")) {
                              displayToastMessage("Enter a valid email address",primaryOrange, context);
                            }
                            else if (emailController.text.isEmpty) {
                              displayToastMessage("Enter a valid email address",primaryOrange, context);
                            }
                            setState(() {
                              loading = true;
                            });
                            confirmUser(emailController.text, tokenController.text);
                            await Future.delayed(Duration(seconds: 3));
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>ConfirmedScreen()));
                            setState(() {
                              loading = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: primaryBlack,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: Text(
                            'Confirm',
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
