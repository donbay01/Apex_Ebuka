// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace


import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Slider1 extends StatelessWidget {
  const Slider1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Image(
                  image: AssetImage('assets/sliderOne.png',),
                )
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            'Finance app the safest\nand most trusted',
            style: boldText(primaryBlack),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Your finance work starts here. We are here to help\n you track and deal with speeding up your\ntransactions.',
            style: small(),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
