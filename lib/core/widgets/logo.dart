import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logo.svg',
      semanticsLabel: 'logo',
    );
  }
}