import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Center(child: CircularProgressIndicator())
    );
  }
}