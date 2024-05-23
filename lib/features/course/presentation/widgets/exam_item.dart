import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/exam/data/models/exam.dart';
import 'package:hope/features/exam/domain/get_participants_bloc/get_participants_bloc.dart';
import 'package:hope/features/exam/presentation/providers/exam_provider.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({super.key, required this.exam});
  final Exam exam;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 146,
        height: 184,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20))),

        child: Column(
          children: [
            Spacer(),
            lineDecoration(),
            Spacer(),
            titleRow(),
            Spacer(),
            typeRow(),
            Spacer(),
            dateRow(),
            Spacer(),
            SelectExamButton(exam: exam,),
            Spacer()

          ],
        ),
      ),
    );
  }

  Container lineDecoration() {
    return Container(
          width: 90,
          height: 8,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff0077C0)),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xff0077C0),
          ),
        );
  }

  Widget titleRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
            children: [
              SvgPicture.asset(
                width: 20,
                'assets/NotebookSquare.svg',
                semanticsLabel: 'title',
              ),
              SizedBox(width: 5,),
              Text(
                exam.name,
                style: TextStyle(
                  color: Colors.grey[800],
                ),
              )
            ],
          ),
    );
  }
  Widget typeRow() {
    final examTypes = {0: 'تمرین', 1: 'آزمون'};
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
            children: [
              SvgPicture.asset(
                width: 20,
                'assets/DocumentAdd.svg',
                semanticsLabel: 'title',
              ),
              SizedBox(width: 5,),
              Text(
                examTypes[exam.type]!,
                style: TextStyle(
                  color: Colors.grey[800],
                ),
              )
            ],
          ),
    );
  }
  String dateTextFormatter(Jalali jalali){
    var year = jalali.year.toString().toPersianDigit();
    var month = jalali.month.toString().toPersianDigit();
    var day = jalali.day.toString().toPersianDigit();
    return '$year/$day/$month';
  }
  Widget dateRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
            children: [
              SvgPicture.asset(
                width: 20,
                'assets/Calendar.svg',
                semanticsLabel: 'title',
              ),
              SizedBox(width: 5,),
              Text(
                dateTextFormatter(exam.date.toJalali()),
                style: TextStyle(
                  color: Colors.grey[800],
                ),
              )
            ],
          ),
    );
  }
}

class SelectExamButton extends StatelessWidget {
  const SelectExamButton({
    super.key, required this.exam,
  });
  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ElevatedButton(
        onPressed: () async {
          context.read<CoursePageIndexProvider>().changeSelectedIndex(newIndex: 4);
          ExamProvider.setExam(exam);
          context.read<GetParticipantsBloc>().add(LoadParticipants(exam: exam));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CustomColors.confirmButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
        ),
        child: Text(
          "مشاهده",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
