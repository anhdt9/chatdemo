import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ScanLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/scan.json',
      height: Get.height /3,
      fit: BoxFit.fill,
    );
  }
}
