import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScanLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/scan.json',
      height: 300,
      fit: BoxFit.fill,
    );
  }
}
