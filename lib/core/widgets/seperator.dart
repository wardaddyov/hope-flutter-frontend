import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/Line.svg',
      semanticsLabel: 'delete student',
    );
  }
}