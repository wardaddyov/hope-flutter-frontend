import 'package:flutter/cupertino.dart';
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
      this.minAmountOfChars = 0,
      this.maxAmountOfChars = 50,
      this.isNumber = false,
      this.customController,
      this.onChanged,
      this.width = 400,
      this.height,});

  TextEditingController controller = TextEditingController();
  final bool isRequired;
  final bool isNumber;
  final int minAmountOfChars;
  final int maxAmountOfChars;
  final String helperText;
  final String hintText;
  final String labelText;
  final Icon prefixIcon;
  final double width;
  final double? height;
  TextEditingController? customController;
  Function? onChanged;
  void Function(String value)? onSaved;

  @override
  Widget build(BuildContext context) {

    if (customController != null) {
      controller = customController!;
    }

    if (onChanged != null) {
      controller.addListener(() => onChanged!());
    }

    String? Vaidator(String s){
      print('InBody');
      if (s!.isWhitespace() && isRequired) {
        print('notext');
        return "این قسمت نمی‌تواند خالی باشد";
      }
      if (isRequired &&
          isNumber &&
          !RegExp(r'^[0-9]+$').hasMatch(s.toEnglishDigit())) {
        return "در این قسمت تنها عدد مجاز است";
      }
      if (s.isLong(maxAmountOfChars)) {
        return 'تعداد کاراکتر وارد شده بیشتر از حد مجاز';
      }
      if (s.isShort(minAmountOfChars)) {
        return 'تعداد کاراکتر وارد شده کمتر از حد مجاز';
      }
      return null;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          validator: (s) => Vaidator(s!),
          onSaved: (value) {onSaved != null ? onSaved!(value!) : '';},
          controller: controller,
          decoration: InputDecoration(
            helperText: helperText,
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prefixIcon,
          ),
        ),
      ),
    );
  }
}
