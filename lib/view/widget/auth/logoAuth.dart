import 'package:flutter/material.dart';
import 'package:reefs_nav/core/constant/imageAssets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.logo,
      height: 170,
    );
  }
}
