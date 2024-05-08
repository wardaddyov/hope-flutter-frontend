import 'package:flutter/material.dart';
import 'package:hope/core/resources/string_extensions.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DateField extends StatelessWidget {
  const DateField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Jalali? picked;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          validator: (s) {
            if (s!.isWhitespace()) {
              return "این قسمت نمی‌تواند خالی باشد";
            }
          },
          onSaved: (value) {NewExamCache().date = picked?.toDateTime();},
          controller: controller,
          // to not allow the user to type any values
          readOnly: true,
          onTap: () async {
            picked = await showPersianDatePicker(
              context: context,
              initialDate: Jalali.now(),
              firstDate: Jalali(1385, 8),
              lastDate: Jalali(1450, 9),
            );
            controller.text = picked != null ? dateTextFormatter(picked!) : '';
            print(picked?.runtimeType);
          },
          decoration: InputDecoration(
            helperText: "",
            hintText: "تاریخ آزمون را انتخاب کنید",
            labelText: "تاریخ آزمون",
            prefixIcon: Icon(Icons.date_range),
          ),
        ),
      ),
    );
  }

  // used to format the text used for display
  String dateTextFormatter(Jalali jalali){

    var weekdays = {1: 'شنبه', 2: 'یک‌شنبه', 3: 'دوشنبه', 4: 'سه‌شنبه', 5: 'چهارشنبه', 6: 'پنج‌شنبه', 7: 'جمعه'};
    var weekday = weekdays[jalali.weekDay];

    var months = {
      1: 'فروردین',
      2: 'اردیبهشت',
      3: 'خرداد',
      4: 'تیر',
      5: 'مرداد',
      6: 'شهریور',
      7: 'مهر',
      8: 'آبان',
      9: 'آذر',
      10: 'دی',
      11: 'بهمن',
      12: 'اسفند'
    };
    var month = months[jalali.month];

    var day = '${jalali.day} ام';
    return '$weekday - $day - $month';
  }

}
