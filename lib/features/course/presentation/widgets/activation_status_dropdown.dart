import 'package:flutter/material.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';

class ActivationStatusDropdown extends StatefulWidget {
  const ActivationStatusDropdown({super.key});

  @override
  State<ActivationStatusDropdown> createState() => _ActivationStatusDropdownState();
}

class _ActivationStatusDropdownState extends State<ActivationStatusDropdown> {

  var activationStatus = 'فعال';

  @override
  Widget build(BuildContext context) {


    List<String> _items = ['فعال', 'غیرفعال'];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: DropdownButtonFormField(items: _items.map((String item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(), onChanged: (String? newValue) {
          setState(() {
            NewCourseCache.activationStatus = newValue!;
            activationStatus = newValue;
          });
        },
          value: activationStatus,
          decoration: InputDecoration(
            helperText: '',
            labelText: 'وضعیت درس',
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 20),

          ),
          //borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
