import 'package:flutter/material.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';

class ExamTypeDropdown extends StatefulWidget {
  const ExamTypeDropdown({super.key});

  @override
  State<ExamTypeDropdown> createState() => _ExamTypeDropdownState();
}

class _ExamTypeDropdownState extends State<ExamTypeDropdown> {

  var examTypes = {0: 'تمرین', 1: 'آزمون'};
  var isExam = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField(items: examTypes.values.map((String item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(), onChanged: (String? newValue) {
          setState(() {
            isExam = examTypes.keys.firstWhere((et) => examTypes[et] == newValue, orElse: () => 1);
          });
        },
          onSaved: (value) {NewExamCache().isExercise = isExam == 1 ? false : true;},
          value: examTypes[isExam],
          decoration: InputDecoration(
            helperText: '',
            labelText: 'نوع',
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 20),

          ),
          //borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
