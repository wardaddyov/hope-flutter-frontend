import 'package:flutter/material.dart';
import 'package:hope/core/widgets/activation_status_dropdown.dart';
import 'package:hope/core/widgets/custom_input_field.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:provider/provider.dart';

class CreationForm extends StatefulWidget {
  const CreationForm({super.key});

  @override
  State<CreationForm> createState() => _CreationFormState();
}

class _CreationFormState extends State<CreationForm> {

  var nameField = CustomInputField(
      hintText: 'نام درس را وارد کنید',
      labelText: 'نام درس',
      prefixIcon: Icon(Icons.book));
  var groupField = CustomInputField(
      hintText: 'گروه درس را وارد کنید',
      labelText: 'گروه درس',
      prefixIcon: Icon(Icons.discount));

  NewCourseCache cache = NewCourseCache();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    // Todo: Implement the actual widget after Behdad designed it
    var selectStudentButton = Container(width: 400, child: ElevatedButton(onPressed: (){context.read<CoursePageIndexProvider>().changeSelectedIndex(newIndex: 2);}, child: Text('انتخاب دانشجویان')));
    nameField.controller.text = cache.name;
    groupField.controller.text = cache.group;

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [nameField, ActivationStatusDropdown()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [groupField, selectStudentButton],
          ),
        ],
      ),
    );
  }
}
