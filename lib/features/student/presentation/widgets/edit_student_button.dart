import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditStudentButton extends StatelessWidget {
  const EditStudentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {} , icon: SvgPicture.asset(
      'assets/PenNewSquare.svg',
      semanticsLabel: 'edit student',
    ));
  }
}
