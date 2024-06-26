import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';


class DashboardHeaderCounterText extends StatelessWidget {
  DashboardHeaderCounterText({super.key, required this.title, required this.count, required this.unit});
  String title;
  String count;
  String unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xff2BAEFF),
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${count.toPersianDigit()} $unit!',
                style: TextStyle(
                  color: Color(0xff0077C0),
                  fontSize: 14,
                ),
              )
            ],
          )),
    );
  }
}
