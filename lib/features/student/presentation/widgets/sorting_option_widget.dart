import 'package:flutter/material.dart';
import 'package:hope/features/student/presentation/widgets/sorting_option_dropdown.dart';

class SortingOptionWidget extends StatelessWidget {
  const SortingOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 28),
          child: Text(
            'نمایش بر اساس',
            style: TextStyle(color: Color(0xff4EBCFF)),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        SortingOptionDropdown()
      ],
    );
  }
}
