import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  LoginForm(
      {super.key, required this.usernameField, required this.passwordField, required this.formKey});

  final Widget usernameField;
  final Widget passwordField;
  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
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
