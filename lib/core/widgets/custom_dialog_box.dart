import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      titlePadding: EdgeInsets.fromLTRB(40, 20, 40, 20),
    );
  }
}
