import 'package:flutter/material.dart';

class DashboardContainerHeader extends StatelessWidget {
  DashboardContainerHeader({super.key, required this.title, required this.leftElement});

  String title;
  Widget leftElement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Right element is constant text
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 28, 7, 28),
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xff0077c0),
              fontSize: 18,
            ),
          ),
        ),

        /// Left element changes when we try to configure students
        leftElement
      ],
    );
  }
}
