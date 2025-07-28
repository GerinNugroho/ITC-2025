import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/home')
    );
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'images/logo.png',
        width: 100,
        height: 100,
      ),
    );
  }
}