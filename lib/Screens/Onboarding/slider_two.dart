// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:apex_ebuka/constraints.dart';
import 'package:apex_ebuka/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import '../../constraint.dart';

class Slider2 extends StatelessWidget {
  const Slider2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                    child: Image(
                      image: AssetImage('assets/sliderTwo.png',),
                    )
                ),
              ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The fastest transaction\nprocess only here',
            style: boldText(primaryBlack),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Get easy to pay all your bills with just a few\nsteps. Paying your bills become fast and\nefficient.',
            style: small(),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
