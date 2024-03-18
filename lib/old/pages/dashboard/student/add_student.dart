import 'package:flutter/material.dart';
import 'package:hope/components/custom_dialog_box.dart';
import 'package:hope/components/custom_input_field.dart';
import 'package:hope/models/student.dart';
import 'package:hope/providers/student_dashboard_index_provider.dart';
import 'package:hope/providers/student_list_provider.dart';
import 'package:hope/repository/student_repository.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';

class AddStudentBody extends StatelessWidget {
  AddStudentBody({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    /* Initialize fields */
    var firstNameField = CustomInputField(
        hintText: 'نام دانشجو را وارد کنید',
        labelText: 'نام دانشجو',
        prefixIcon: Icon(Icons.person));
    var lastNameField = CustomInputField(
        hintText: 'نام خانوادگی دانشجو را وارد کنید',
        labelText: 'نام خانوادگی دانشجو',
        prefixIcon: Icon(Icons.person));
    var idField = CustomInputField(
      hintText: '۹۹۱۷۰۲۳۱۰۰',
      labelText: 'شماره دانشجویی',
      prefixIcon: Icon(Icons.credit_card),
      isNumber: true,
      minAmountOfChars: 10,
      maxAmountOfChars: 11,
    );
    var entryYearField = CustomInputField(
      hintText: '۱۳۹۹',
      labelText: 'سال ورودی',
      prefixIcon: Icon(Icons.calendar_month),
      isNumber: true,
      minAmountOfChars: 4,
      maxAmountOfChars: 4,
    );
    var phoneNumberField = CustomInputField(
      hintText: '۰۹۱۸۹۹۹۹۹۹۹ (اختیاری)',
      labelText: 'شماره تماس',
      prefixIcon: Icon(Icons.phone_in_talk),
      isRequired: false,
      isNumber: true,
    );
    var emailField = CustomInputField(
      hintText: 'your@email.com (اختیاری)',
      labelText: 'ایمیل',
      prefixIcon: Icon(Icons.email),
      isRequired: false,
    );

    Future<void> onPressedCreate() async{

      /// Create the updated student
      Student updatedStudent = Student(
          studentID: idField.controller.text.toEnglishDigit(),
          firstname: firstNameField.controller.text,
          lastname: lastNameField.controller.text,
          entryYear: int.parse(
              entryYearField.controller.text.toEnglishDigit()),
          username: 'username',
          password: 'password',
          email: emailField.controller.text.isEmpty ? '-' : emailField.controller.text,
          phoneNumber: phoneNumberField.controller.text.isEmpty ? '-' : phoneNumberField.controller.text,);

      /// Request for update from the server
      var response = await StudentRepository.updateStudentRequest(
          updatedStudent);

      print(response.body);
      print(response.statusCode);

      /// Update the local studentList if the response is satisfactory
      if (response.statusCode == 204) {
        context
            .read<StudentListProvider>()
            .updateStudent(updatedStudent);
      }


      /// Give user feedback of how things went
      showDialog(
          context: context,
          builder: (_) => CustomDialogBox(message: response.statusCode.toString()));

      /// Quit to the list view of students
      context
          .read<StudentDashboardIndexProvider>()
          .changeSelectedIndex(newIndex: 0);
    }

    /* Create Form */
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [firstNameField, lastNameField],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [idField, entryYearField],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [phoneNumberField, emailField],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CancelButton(),
              SizedBox(
                width: 10,
              ),
              AddButton(formKey: _formKey, onPressed: () => onPressedCreate())
            ],
          )
        ],
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        context
            .read<StudentDashboardIndexProvider>()
            .changeSelectedIndex(newIndex: 0);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xffEA2A33)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        )),
      ),
      child: Text(
        "انصراف",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.onPressed
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var isFormValid = _formKey.currentState!.validate();
        if (isFormValid) {
          onPressed();
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff004DF6)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
      ),
      child: Text(
        "بروزرسانی",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
