import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Image(image: AssetImage("assets/dating.png"), fit: BoxFit.fitWidth,
        height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
       ),
    );
  }
}