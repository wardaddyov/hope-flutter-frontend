import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/course/presentation/widgets/activation_status_dropdown.dart';
import 'package:hope/core/widgets/custom_input_field.dart';
import 'package:hope/core/widgets/custom_text_box.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:hope/features/student/data/models/student.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';


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


    nameFieldCustomController.text = NewCourseCache.name;
    groupFieldCustomController.text = NewCourseCache.group;
    semesterFieldCustomController.text = NewCourseCache.semester;

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

    // On widget build set the values of the fields because when you go to select
    // student page the values are gone
    // you can also set the cache for updating the student




    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [nameField, SizedBox(width: 40,),ActivationStatusDropdown()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [groupField, SizedBox(width: 40,), semesterField],
          ),
          AddEnrolmentButton(),
          SizedBox(height: 20,),
          ListHeader(),

          Expanded(child: SizedBox(width: 860, child: ListBody()))
        ],
      ),
    );
  }
}

class ListBody extends StatelessWidget {
  const ListBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    List<Student> students = context.watch<EnrolmentProvider>().enrolments;
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return StudentItem(
          student: students[index],
          index: index,
        );
      },
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
      child: Container(
        height: 42,
        width: 860,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: Color(0xff95D7FF),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          ///Todo: Make it scrollable so that it fits different screens
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            CustomTextBox(title: 'نام و نام‌خانوادگی'),
            CustomTextBox(title: 'شماره دانشجویی'),
            CustomTextBox(title: 'سال ورودی'),
            CustomTextBox(title: 'حذف', width: 100,),
          ],
        ),
      ),
    );
  }
}

class StudentItem extends StatelessWidget {
  const StudentItem({super.key, required this.student, required this.index});

  final Student student;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String name = '${student.firstname} ${student.lastname}';
    final String studentId = student.studentID;
    final String entryYear = student.entryYear.toString();

    Color color = selectColor(index);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 1, 0, 0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          ///Todo: Make it scrollable so that it fits different screens
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextBox(title: name.toPersianDigit()),
            CustomTextBox(title: studentId.toPersianDigit()),
            CustomTextBox(title: entryYear.toPersianDigit()),
            SizedBox(
              width: 100,
              child: DeleteStudentButton(student: student,),
            ),
          ],
        ),
      ),
    );
  }
}



class AddEnrolmentButton extends StatelessWidget {
  const AddEnrolmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          context
              .read<CoursePageIndexProvider>()
              .changeSelectedIndex(newIndex: 2);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CustomColors.confirmButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
        ),
        child: Text(
          "افزودن دانشجو",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class DeleteStudentButton extends StatelessWidget {
  const DeleteStudentButton({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    // using a row to prevent hover area expansion to the size of hte sized box
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              context.read<EnrolmentProvider>().removeEnrolment(student);
            },
            icon: SvgPicture.asset(
              'assets/closeSquare.svg',
              semanticsLabel: 'delete student',
            )),
      ],
    );
  }
}

Color selectColor(int index) {
  if (index % 2 == 0) {
    return CustomColors.dashboardContainerColor;
  } else {
    return Color(0xffB8E4FF);
  }
}