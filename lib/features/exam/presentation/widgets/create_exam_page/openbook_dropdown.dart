import 'package:flutter/material.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';

class OpenbookDropdown extends StatefulWidget {
  const OpenbookDropdown({super.key});

  @override
  State<OpenbookDropdown> createState() => _OpenbookDropdownState();
}

class _OpenbookDropdownState extends State<OpenbookDropdown> {

  var options = {0: 'خیر', 1: 'بله'};
  var isOpenbook = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField(items: options.values.map((String item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(), onChanged: (String? newValue) {
          setState(() {
            isOpenbook = options.keys.firstWhere((qt) => options[qt] == newValue, orElse: () => 0);
          });
        },
          value: options[isOpenbook],
          onSaved: (value) {NewExamCache().isOpenBook = isOpenbook == 0 ? false : true;},
          decoration: InputDecoration(
            helperText: '',
            labelText: 'کتاب باز',
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 20),

          ),
          //borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
