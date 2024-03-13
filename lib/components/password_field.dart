import 'package:flutter/material.dart';
import 'package:hope/string_extensions.dart';

class PasswordField extends StatefulWidget {
  PasswordField({super.key});
  final controller = TextEditingController();

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscurePassword = true;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (s) {
        if (s!.isWhitespace())
          {
            return "This is a required field";
          }
        else if (s.length < 8)
          {
            return "The password must be at least 8 characters";
          }
      },
      controller: widget.controller,
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        helperText: '',
        hintText: 'رمز عبور خود را وارد کنید',
        labelText: 'رمز عبور',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
            onPressed: () => setState(() {
                  obscurePassword = !obscurePassword;
                }),
            icon: Icon(
                obscurePassword ? Icons.visibility : Icons.visibility_off)),
      ),
    );
  }
}
