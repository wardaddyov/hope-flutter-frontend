import 'package:flutter/material.dart';
import 'package:hope/components/password_field.dart';
import 'package:hope/components/username_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm(
      {super.key, required this.usernameField, required this.passwordField});

  final Widget usernameField;
  final Widget passwordField;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(32.0),
          children: [usernameField, passwordField]
              .map((child) =>
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: child,
              ))
              .toList(),
        )
    );
  }
}
