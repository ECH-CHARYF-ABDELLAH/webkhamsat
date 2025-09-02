import 'package:flutter/material.dart';
import 'package:khamsat/store/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: "INAIQ",
      
    );
  }
}

