import 'package:flutter/material.dart';
import 'package:hope/core/resources/field_validator.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';

class ExamScoreField extends StatelessWidget {
  const ExamScoreField({super.key});

  @override
  Widget build(BuildContext context) {
    FieldValidator fieldValidator = FieldValidator(isRequired: true);
    TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: TextFormField(
          controller: controller,
          validator: (s) => fieldValidator.validate(s!),
          onSaved: (value) {NewExamCache().availableScore = int.parse(controller.value.text);},
          decoration: InputDecoration(
            helperText: '',
            hintText: '۵',
            labelText: 'نمره آزمون',
            prefixIcon: Icon(Icons.calculate_outlined),
          ),
        ),
      ),
    );
  }
}
