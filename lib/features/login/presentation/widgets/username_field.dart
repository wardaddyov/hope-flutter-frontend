import 'package:flutter/material.dart';
import 'package:hope/core/resources/string_extensions.dart';

class UsernameField extends StatelessWidget {
  UsernameField({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 20,
      validator: (s) {
        if (s!.isWhitespace()) {
          return "این قسمت نمی‌تواند خالی باشد";
        }
      },
      controller: controller,
      decoration: const InputDecoration(
        counterText: '',
        helperText: '',
        hintText: 'نام کاربری خود را وارد کنید',
        labelText: 'نام کاربری',
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
}
