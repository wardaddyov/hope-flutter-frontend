import 'package:flutter/material.dart';
import 'package:hope/core/resources/field_validator.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';

class ExamNameField extends StatelessWidget {
  const ExamNameField({super.key});

  @override
  Widget build(BuildContext context) {
    FieldValidator fieldValidator = FieldValidator(isRequired: true);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          onSaved: (value) {NewExamCache().name = value;},
          validator: (s) => fieldValidator.validate(s!),
          decoration: InputDecoration(
            helperText: '',
            hintText:  'نام آزمون را وارد کنید',
            labelText: 'نام آزمون',
            prefixIcon: Icon(Icons.question_mark),
          ),
        ),
      ),
    );
  }
}


