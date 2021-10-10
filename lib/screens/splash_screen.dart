import 'package:flutter/material.dart';
import 'dart:async';
import 'choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4C748B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HOMEBREW",
              style: TextStyle(
                  fontFamily: 'Norwester',
                  fontSize: 48,
                  fontWeight: FontWeight.normal,
                  color: Color(0xffFFFFFFB)),
            ),
            Text("Great Coffee at Home",
                style: TextStyle(
                    fontFamily: 'Norwester',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffFFFFFFB)))
          ],
        ),
      ),
    );
  }
}
