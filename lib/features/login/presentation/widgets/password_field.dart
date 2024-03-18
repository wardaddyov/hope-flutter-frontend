import 'package:flutter/material.dart';
import 'package:hope/core/resources/string_extensions.dart';

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
      maxLength: 20,
      validator: (s) {
        if (s!.isWhitespace())
          {
            return "این قسمت نمی‌تواند خالی باشد";
          }
      },
      controller: widget.controller,
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        counterText: '',
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
