import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';

class ExamDescriptionField extends StatelessWidget {
  ExamDescriptionField({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: 400,
      child: TextFormField(
        onSaved: (value) {NewExamCache().description = value!;},
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        maxLength: 200,
        controller: controller,
        decoration: InputDecoration(
          helperText: '',
          hintText: 'توضیحات دانشجو را در این قسمت بنویسید (اختیاری)',
          labelText: 'توضیحات',
          prefixIcon: Icon(Icons.description),
        ),
      ),
    );
  }
}
