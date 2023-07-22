import 'package:flutter/material.dart';
import 'package:zingify/screens/dashboard.dart';
import 'package:zingify/screens/login.dart';
import 'package:zingify/screens/signup.dart';
import 'package:zingify/screens/splash.dart';
import 'package:zingify/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a custom MaterialColor based on your desired color
    MaterialColor zingifyColor = MaterialColor(0xFFFF528C, {
      50: Color(0xFFFF528C),
      100: Color(0xFFFF528C),
      200: Color(0xFFFF528C),
      300: Color(0xFFFF528C),
      400: Color(0xFFFF528C),
      500: Color(0xFFFF528C),
      600: Color(0xFFFF528C),
      700: Color(0xFFFF528C),
      800: Color(0xFFFF528C),
      900: Color(0xFFFF528C),
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zingify',
      theme: ThemeData(
        primarySwatch: zingifyColor, // Use the custom MaterialColor
      ),
      home: DashBoard(),
    );
  }
}
