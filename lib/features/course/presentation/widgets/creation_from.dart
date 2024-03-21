import 'package:flutter/material.dart';
import 'package:hope/core/widgets/activation_status_dropdown.dart';
import 'package:hope/core/widgets/custom_input_field.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:provider/provider.dart';

import 'confirm_course_details_button.dart';

class CreationForm extends StatefulWidget {
  CreationForm({super.key, required this.formKey});
  GlobalKey<FormState> formKey;
  @override
  State<CreationForm> createState() => _CreationFormState();
}

class _CreationFormState extends State<CreationForm> {

  final nameFieldCustomController = TextEditingController();
  final groupFieldCustomController = TextEditingController();
  final semesterFieldCustomController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void cacheName(){
      NewCourseCache.name = nameFieldCustomController.text;
    }
    void cacheGroup(){
      NewCourseCache.group = groupFieldCustomController.text;
    }
    void cacheSemester(){
      NewCourseCache.semester = semesterFieldCustomController.text;
    }

    var nameField = CustomInputField(
        hintText: 'نام درس را وارد کنید',
        labelText: 'نام درس',
        customController: nameFieldCustomController,
        onChanged: () => cacheName(),
        prefixIcon: Icon(Icons.book));
    var groupField = CustomInputField(
        hintText: 'گروه درس را وارد کنید',
        labelText: 'گروه درس',
        isNumber: true,
        customController: groupFieldCustomController,
        onChanged: () => cacheGroup(),
        prefixIcon: Icon(Icons.discount));
    var semesterField = CustomInputField(
        hintText: 'ترم درس را وارد کنید',
        labelText: 'ترم درس',
        isNumber: true,
        isRequired: true,
        maxAmountOfChars: 4,
        minAmountOfChars: 4,
        customController: semesterFieldCustomController,
        onChanged: () => cacheSemester(),
        prefixIcon: Icon(Icons.clear_all));
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [nameField, ActivationStatusDropdown()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [groupField, semesterField],
          ),
        ],
      ),
    );
  }
}
