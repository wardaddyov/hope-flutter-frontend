import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:hope/custom_colors.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/home_title.svg',
      semanticsLabel: 'title',
    );
  }
}
class EnterButton extends StatelessWidget {
  const EnterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/enterButton.svg',
      semanticsLabel: 'title',
    );
  }
}

class HomeScreenBoy extends StatelessWidget {
  const HomeScreenBoy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        border: Border.all(
          width: 1,
          color: CustomColors.borderColor,
          style: BorderStyle.solid,
        ),
      ),
      child: SvgPicture.asset(
        'assets/loginboy.svg',
        semanticsLabel: 'student studying',
      ),
    );
  }
}