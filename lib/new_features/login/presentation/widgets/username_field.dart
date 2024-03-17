import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  UsernameField({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        helperText: '',
        hintText: 'نام کاربری خود را وارد کنید',
        labelText: 'نام کاربری',
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
}
