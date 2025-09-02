import 'package:flutter/material.dart';
import 'dart:async';

import 'package:khamsat/store/viewStore.dart'; // For the timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the Home screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown, // Set background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              'assets/logo.jpeg',
              width: 200, // Adjust width
              height: 200,
              fit: BoxFit.contain,
              // Adjust height
            ),
          ),
        ),
      ),
    );
  }
}
