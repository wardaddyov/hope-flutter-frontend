import 'package:flutter/material.dart';
import 'package:hope/core/widgets/custom_alert_dialog.dart';
import 'package:hope/core/widgets/logo.dart';
import 'package:hope/features/login/models/user.dart';
import 'package:hope/features/login/presentation/provider/jwt_provider.dart';
import 'package:hope/features/login/presentation/widgets/login_button.dart';
import 'package:hope/features/login/presentation/widgets/login_form.dart';
import 'package:hope/features/login/presentation/widgets/login_page_svgs.dart';
import 'package:hope/features/login/presentation/widgets/password_field.dart';
import 'package:hope/features/login/presentation/widgets/username_field.dart';
import 'package:hope/features/loading/loading_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final usernameField = UsernameField();
  final passwordField = PasswordField();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var jwtToken = Provider.of<JwtProvider>(context).jwtToken;
    var failure = Provider.of<JwtProvider>(context).failure;
    var loading = Provider.of<JwtProvider>(context).loading;
    if (jwtToken != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoadingPage()),
              ));
    } else if (failure == true && loading == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (_) => CustomAlertDialog(
                title: 'ورود نامعتبر',
              )));
    }

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 550),
                child: Logo()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 420,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeTitle(),
                      LoginForm(
                        usernameField: usernameField,
                        passwordField: passwordField,
                        formKey: _formKey,
                      ),
                      LoginButton(
                          title: 'ورود',
                          onTap: () => loading ? null : onTap(context))
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                ),
                HomeScreenBoy(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onTap(BuildContext context) async {
    var isFormValid = _formKey.currentState!.validate();

    if (isFormValid) {
      var user = User(
          username: usernameField.controller.text,
          password: passwordField.controller.text);
      context.read<JwtProvider>().getJwtToken(user);
    }
  }
}


