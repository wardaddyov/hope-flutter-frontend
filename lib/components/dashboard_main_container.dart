import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hope/components/custom_text_box.dart';
import 'package:hope/components/list_item.dart';
import 'package:hope/pages/dashboard/student/student_dashboard.dart';
import 'package:hope/custom_colors.dart';
import 'package:hope/models/student.dart';

class DashboardMainContainer extends StatelessWidget {
  DashboardMainContainer({super.key, required this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: CustomColors.dashboardContainerColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
        child: child
      ),
    );
  }
}
