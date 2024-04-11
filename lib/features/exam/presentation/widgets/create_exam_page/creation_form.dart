import 'package:flutter/material.dart';
import 'package:hope/core/widgets/custom_input_field.dart';

class ExamCreationForm extends StatelessWidget {
  ExamCreationForm({super.key});

  var nameField = CustomInputField(
      hintText: 'عنوان آزمون را وارد کنید',
      labelText: 'عنوان آزمون',
      prefixIcon: Icon(Icons.device_unknown_outlined));

  @override
  Widget build(BuildContext context) {
    return Column(children: [nameField],);
  }
}
