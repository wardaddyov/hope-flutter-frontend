import 'package:flutter/material.dart';
import 'package:hope/features/student/models/student.dart';

class StudentItem extends StatelessWidget {
  StudentItem({super.key, required this.student, required this.index});

  final Student student;
  final int index; // Used for selecting the color of the item

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
