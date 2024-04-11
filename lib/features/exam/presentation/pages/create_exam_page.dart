import 'package:flutter/material.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/choose_date_field.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class CreateExamPage extends StatelessWidget {
  const CreateExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              Jalali? picked = await showPersianDatePicker(
                context: context,
                initialDate: Jalali.now(),
                firstDate: Jalali(1385, 8),
                lastDate: Jalali(1450, 9),
              );

              print(picked?.toDateTime());
            },
            child: Text("Shceiser")),
        ChooseDateField()
      ],
    );
  }
}
