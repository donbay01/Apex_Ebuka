// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:apex_ebuka/Authentication/loginScreen.dart';
import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70,),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: textColorBrown),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.chevron_left,color: primaryBlack,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Create a',style: boldText(primaryBlack)),
                        TextSpan(text: ' Smart pay',style: boldText(primaryOrange)),
                      ]

                )),
                Text('account',style: boldText(primaryBlack),),
                SizedBox(height: 30,),
                TextFormField(
                  style: small(),
                  controller: fullnameController,
                  autofillHints: [AutofillHints.email],
                  onEditingComplete: () => [TextInput.finishAutofillContext(), FocusScope.of(context).unfocus(),],
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Anabella Angela',
                    hintStyle: smallText(textColorBrown),
                    suffixIcon: fullnameController.text.isEmpty ?Container(width: 0,) :IconButton(
                      icon: Icon(Icons.close),
                      onPressed: (){
                        fullnameController.clear();
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
                      borderSide: BorderSide(
                          color: primaryOrange, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  style: small(),
                  controller: emailController,
                  autofillHints: [AutofillHints.email],
                  onEditingComplete: () => [TextInput.finishAutofillContext(), FocusScope.of(context).unfocus(),],
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'anabelangella@mail.com',
                    hintStyle: smallText(textColorBrown),
                    suffixIcon: emailController.text.isEmpty ?Container(width: 0,) :IconButton(
                      icon: Icon(Icons.close),
                      onPressed: (){
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
                      borderSide: BorderSide(
                          color: primaryOrange, width: 1.0),
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
                  onEditingComplete: () => [TextInput.finishAutofillContext(), FocusScope.of(context).unfocus(),],
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
                      borderSide: BorderSide(
                          color: primaryOrange, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'Sign Up',style: mediumText(primaryWhite),
                    ),
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        primary: primaryBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container(child: Divider(color: textColorBrown,))),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('OR'),
                    ),
                    Expanded(child: Container(child: Divider(color: textColorBrown,))),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: textColorBrown,width: 1)
                        ),
                        child: Image(
                          image: AssetImage('assets/google.png'),
                        )
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: textColorBrown,width: 1)
                        ),
                        child: Icon(
                            FontAwesomeIcons.apple
                        ),
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
                      "Already have an account?",
                      style: small(),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Sign In',
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
      ),
    );
  }
}
