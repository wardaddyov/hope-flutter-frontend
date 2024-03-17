import 'package:flutter/material.dart';
import 'package:hope/core/widgets/logo.dart';
import 'package:hope/new_features/login/presentation/provider/jwt_provider.dart';
import 'package:hope/new_features/login/presentation/widgets/login_button.dart';
import 'package:hope/new_features/login/presentation/widgets/login_form.dart';
import 'package:hope/new_features/login/presentation/widgets/password_field.dart';
import 'package:hope/new_features/login/presentation/widgets/username_field.dart';
import 'package:hope/new_features/login/presentation/widgets/login_page_svgs.dart';
import 'package:hope/pages/loading_page.dart';
import 'package:hope/repository/login_repository.dart';
import 'package:provider/provider.dart';



class LoginPage extends StatelessWidget {

  Future<void> onTap(BuildContext context) async {
    var jwtToken = Provider.of<JwtProvider>(context).jwtToken;
    var failure = Provider.of<JwtProvider>(context).failure;

    /// If jwt available go to next page
    /// if failure true show error
    /// if failure null and jwt null show loding
    if (status){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoadingPage()),
      );
    }
    else {
      ///Todo: validate the fields before connecting to the database
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Center(child: Text('ورود نامعتبر', style: TextStyle(color: Colors.white, fontSize: 20),)),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        titlePadding: EdgeInsets.fromLTRB(40, 20, 40, 20),
      ));
    }
  }

  LoginPage({super.key});
  final usernameField = UsernameField();
  final passwordField = PasswordField();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 550),
                child:Logo()
            ),
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
                      LoginForm(usernameField: usernameField, passwordField: passwordField),
                      LoginButton(title: 'ورود', onTap: () => onTap(context))
                    ],
                  ),
                ),
                SizedBox(width: 200,),
                HomeScreenBoy(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



