import 'package:flutter/material.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';

class QuestionTypeDropdown extends StatefulWidget {
  const QuestionTypeDropdown({super.key});

  @override
  State<QuestionTypeDropdown> createState() => _QuestionTypeDropdownState();
}

class _QuestionTypeDropdownState extends State<QuestionTypeDropdown> {

  var questionTypes = {0: 'ترکیبی', 1: 'تشریحی', 2: 'تستی'};
  var questionType = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField(items: questionTypes.values.map((String item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(), onChanged: (String? newValue) {
          setState(() {
            questionType = questionTypes.keys.firstWhere((qt) => questionTypes[qt] == newValue, orElse: () => 0);
          });
        },
          value: questionTypes[questionType],
          onSaved: (value) {NewExamCache().type = questionType;},
          decoration: InputDecoration(
            helperText: '',
            labelText: 'نوع سوالات',
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 20),

          ),
          //borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
