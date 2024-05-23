import 'package:flutter/material.dart';
import 'package:hope/features/student/presentation/providers/student_provider.dart';
import 'package:provider/provider.dart';

class SortingOptionDropdown extends StatefulWidget {
  const SortingOptionDropdown({super.key});

  @override
  State<SortingOptionDropdown> createState() => _SortingOptionDropdownState();
}

class _SortingOptionDropdownState extends State<SortingOptionDropdown> {
  
  OutlineInputBorder _buildBorder(Color color, {double width = 1.0}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
            color: color,
            width: width
        )
    );
  }

  static var activationStatus = 'شماره دانشجویی';

  // todo: make it beautiful
  @override
  Widget build(BuildContext context) {

    var _items = ['حروف الفبا', 'شماره دانشجویی'];

    return SizedBox(
      width: 200,
      child: DropdownButtonFormField(items: _items.map((String item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(), onChanged: (String? newValue) {
        setState(() {
          if (newValue == 'شماره دانشجویی'){
            context.read<StudentProvider>().sortStudentsById();
          }
          if (newValue == 'حروف الفبا'){
            context.read<StudentProvider>().sortStudentsByName();
          }
          activationStatus = newValue!;
        });
      },
        value: activationStatus,
        style: TextStyle(color: Colors.white, fontFamily: 'Yekan'),
        iconEnabledColor: Colors.white,
        dropdownColor: Color(0xff0077c0),
        decoration: InputDecoration(
          enabledBorder: _buildBorder(Color(0xff4EBCFF)),
          focusedBorder: _buildBorder(Color(0xff4EBCFF)),
          helperText: '',
          labelStyle: TextStyle(color: Colors.black),
          fillColor: Color(0xff4EBCFF),
          filled: true,
          isDense: true
        ),
        //borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
