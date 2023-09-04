import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
   Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.brown,
          size: 50,
        ),
      ),
    );
  }
}