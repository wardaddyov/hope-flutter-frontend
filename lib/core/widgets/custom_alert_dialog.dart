import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      backgroundColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      titlePadding: EdgeInsets.fromLTRB(40, 20, 40, 20),
    );
  }
}