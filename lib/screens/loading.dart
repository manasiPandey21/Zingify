import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Lottie.asset("https://lottie.host/b192be69-297a-46b1-b129-277da37c32a7/FTT7h7kSm3.lottie")
    );
  }
}