import 'package:flutter/material.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:provider/provider.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        context.read<CoursePageIndexProvider>().changeSelectedIndex(newIndex: 3);
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