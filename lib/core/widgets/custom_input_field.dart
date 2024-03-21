import 'package:flutter/material.dart';
import 'package:hope/core/resources/string_extensions.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.prefixIcon,
      this.helperText = '',
      this.isRequired = true,
      this.minAmountOfChars = 0, this.maxAmountOfChars = 50, this.isNumber = false});

  final controller = TextEditingController();
  final bool isRequired;
  final bool isNumber;
  final int minAmountOfChars;
  final int maxAmountOfChars;
  final String helperText;
  final String hintText;
  final String labelText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        validator: (s) {
          if (s!.isWhitespace() && isRequired) {
            return "این قسمت نمی‌تواند خالی باشد";
          }
          if (isRequired && isNumber && !RegExp(r'^[0-9]+$').hasMatch(s.toEnglishDigit())){
            return "در این قسمت تنها عدد مجاز است";
          }
          if (s.length > maxAmountOfChars){
            return 'تعداد کاراکتر وارد شده بیشتر از حد مجاز';
          }
          if (s.length < minAmountOfChars){
            return 'تعداد کاراکتر وارد شده کمتر از حد مجاز';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          helperText: helperText,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
        ),
        onChanged: (value) => ,
      ),
    );
  }
}
