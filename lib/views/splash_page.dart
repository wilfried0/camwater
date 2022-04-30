import 'dart:async';

import 'package:camwater/theme/camwater_dimens.dart';
import 'package:camwater/views/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), goto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/camwater.jpg"),
            SizedBox(height: CamwaterDimens().space),
            Text("L'eau, un service public", style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Waterfall'
            ),)
          ],
        ),
      ),
    );
  }

  goto() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingPage()));
  }
}
