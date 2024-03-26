import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  CustomTextBox({super.key, required this.title, this.width = 250});

  final String title;
  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0,0,5,0),
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff0077C0),
                fontWeight: FontWeight.w500
            ),),
        ),
      ),
    );
  }
}
