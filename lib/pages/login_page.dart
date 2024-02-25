import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/custom_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 360,
              child: TextFormField(
                decoration: const InputDecoration(
                  helperText: '',
                  hintText: 'نام کاربری خود را وارد کنید',
                  labelText: 'نام کاربری',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  width: 1,
                  color: CustomColors.borderColor,
                  style: BorderStyle.solid,
                ),
              ),
              child: SvgPicture.asset(
                  'assets/loginboy.svg',
                semanticsLabel: 'student studying',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
