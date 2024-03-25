import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hope/core/widgets/custom_input_field.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/core/widgets/dashboard_header_counter_text.dart';
import 'package:hope/features/student/dto/student_create_dto.dart';
import 'package:hope/features/student/presentation/providers/student_page_index_provider.dart';
import 'package:hope/features/student/presentation/providers/student_provider.dart';
import 'package:hope/features/student/presentation/widgets/description_input_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';

class CreateStudent extends StatelessWidget {
  const CreateStudent({super.key});

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

    var descriptionField = DescriptionInputWidget();

    Widget createButton() {
      return ElevatedButton(
        onPressed: () async {
          var isFormValid = _formKey.currentState!.validate();
          if (isFormValid) {
            StudentCreateDto studentCreateDto = StudentCreateDto(
                studentID: idField.controller.text.toEnglishDigit(),
                firstname: firstNameField.controller.text,
                lastname: lastNameField.controller.text,
                entryYear: int.parse(
                    entryYearField.controller.text.toEnglishDigit()),
                email: emailField.controller.text.toEnglishDigit(),
                phoneNumber: phoneNumberField.controller.text.toEnglishDigit(),
              description: descriptionField.controller.text,
            );
            context.read<StudentProvider>().createStudent(studentCreateDto);
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
          "ایجاد",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    /* Create Form */
    Widget form = Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [firstNameField, SizedBox(width: 40,), lastNameField],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [idField, SizedBox(width: 40,) , entryYearField],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [phoneNumberField, SizedBox(width: 40,), emailField],
          ),

          descriptionField,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CancelButton(),
              SizedBox(
                width: 10,
              ),
              createButton()
            ],
          )
        ],
      ),
    );


    int? studentCount = context
        .watch<StudentProvider>()
        .students
        ?.length;
    return Column(

      children: [
        DashboardContainerHeader(title: 'افزودن دانشجوی جدید',
            leftElement: DashboardHeaderCounterText(
              title: 'تعداد دانشجوهای شما',
              count: studentCount.toString(),
              unit: 'نفر',)),
        Expanded(child: form),
      ],
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
            .read<StudentPageIndexProvider>()
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
