import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class ChooseDateField extends StatelessWidget {
  const ChooseDateField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          controller: controller,
          onTap: () async {
            Jalali? picked = await showPersianDatePicker(
              context: context,
              initialDate: Jalali.now(),
              firstDate: Jalali(1385, 8),
              lastDate: Jalali(1450, 9),
            );
            controller.text = picked != null ? picked.weekDay.toString() : '';
            print(picked?.toDateTime());
          },
          decoration: InputDecoration(
            helperText: "helperText",
            hintText: "hintText",
            labelText: "labelText",
            prefixIcon: Icon(Icons.date_range),
          ),

        ),
      ),
    );
  }
}
