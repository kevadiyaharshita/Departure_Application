import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/MyRoutes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    Timer.periodic(
      Duration(seconds: 4),
      (timer) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.home);
        timer.cancel();
      },
    );
    return Scaffold(
      body: Center(
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/krishnacover.jpg'),
                fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                width: 270,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bhagvatfont.png'),
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
