// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_declarations, body_might_complete_normally_nullable, unused_local_variable, avoid_print, use_build_context_synchronously, unnecessary_string_interpolations

import 'dart:io';

import 'package:apex_ebuka/Authentication/RegisterScreen.dart';
import 'package:apex_ebuka/Screens/Onboarding/onboarding_screen.dart';
import 'package:apex_ebuka/Screens/home_screen.dart';
import 'package:apex_ebuka/Screens/loadingPage.dart';
import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/model/loginModel.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Future<LoginModel?> loginUser(String email, String password) async {
  final Uri apiUrl =
      Uri.parse("https://smart-pay-mobile.herokuapp.com/api/v1/auth/login");

  final response = await http.post(apiUrl,
      body: {"email": email, "password": password, "device_name": "web"});
  await Future.delayed(Duration(seconds: 5));
  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(responseString);
    return loginModelFromJson(responseString);
  } else {
    print("error");
  }
  print(response);
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  bool loading = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  LoginModel? _user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: primaryWhite,
        body: loading == false
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: textColorBrown),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                color: primaryBlack,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => OnboardingScreen()));
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Image(image: AssetImage('assets/hello.png')),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Welcome back, Sign in to your account',
                          style: mediumText(primaryBrown),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          style: small(),
                          controller: emailController,
                          autofillHints: [AutofillHints.email],
                          onEditingComplete: () => [
                            TextInput.finishAutofillContext(),
                            FocusScope.of(context).unfocus(),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'anabelangella@mail.com',
                            hintStyle: smallText(textColorBrown),
                            suffixIcon: emailController.text.isEmpty
                                ? Container(
                                    width: 0,
                                  )
                                : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      emailController.clear();
                                    },
                                  ),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: primaryOrange, width: 1.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                          style: small(),
                          controller: passwordController,
                          obscureText: _obscureText,
                          autofillHints: [AutofillHints.password],
                          onEditingComplete: () => [
                            TextInput.finishAutofillContext(),
                            FocusScope.of(context).unfocus(),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'xxxxxxxxxx',
                            hintStyle: smallText(textColorBrown),
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                _toggle();
                              },
                              icon: _obscureText
                                  ? Icon(
                                      FontAwesomeIcons.eyeSlash,
                                      color: textColorBrown,
                                      size: 15,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye,
                                      color: textColorBrown,
                                      size: 20,
                                    ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: primaryOrange, width: 1.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             ForgotPassword()));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: medium(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text(
                              'Sign In',
                              style: mediumText(primaryWhite),
                            ),
                            onPressed: () async {
                              if (emailController.text.isEmpty) {
                                displayToastMessage(
                                    "Kindly Provide an email address",
                                    primaryOrange,
                                    context);
                              } else if (passwordController.text.isEmpty) {
                                displayToastMessage("Kindly Provide a Password",
                                    primaryOrange, context);
                              } else if (!emailController.text.contains("@")) {
                                displayToastMessage(
                                    "Enter a valid email address",
                                    primaryOrange,
                                    context);
                              }
                              setState(() {
                                loading = true;
                              });

                              final LoginModel? user = await loginUser(
                                  emailController.text,
                                  passwordController.text);
                              setState(() {
                                _user = user;
                              });
                              setState(() {
                                loading = false;
                              });
                              _user == null
                                  ? displayToastMessage(
                                      "Invalid Username or Password", primaryOrange, context)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => HomeScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: primaryBlack,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                    child: Divider(
                              color: textColorBrown,
                            ))),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('OR'),
                            ),
                            Expanded(
                                child: Container(
                                    child: Divider(
                              color: textColorBrown,
                            ))),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: textColorBrown, width: 1)),
                                  child: Image(
                                    image: AssetImage('assets/google.png'),
                                  )),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: textColorBrown, width: 1)),
                                child: Icon(FontAwesomeIcons.apple),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account ?",
                              style: small(),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: LoadingPage(),
              ),
      ),
    );
  }
}

displayToastMessage(String message, Color color, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 1),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: primaryBlack, fontSize: 15),
    ),
    backgroundColor: color,
  ));
}
