import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeleteStudentButton extends StatelessWidget {
  const DeleteStudentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {} , icon: SvgPicture.asset(
      'assets/closeSquare.svg',
      semanticsLabel: 'delete student',
    ));
  }
}
