
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/features/login/presentation/provider/jwt_provider.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    super.key,
    required this.title, required this.onTap,
  });


  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          onTap();
        },
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(0),

            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )
            )
        ),
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff2BAEFF),
                Color(0xff0077C0),

              ],
              // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Container(
            constraints: const BoxConstraints(minWidth: 150.0, minHeight: 46.0),
            // min sizes for Material buttons
            alignment: Alignment.center,
            child: child(context),
          ),
        ),
      ),
    );
  }



  Widget child(BuildContext context) {

    var loading = Provider.of<JwtProvider>(context).loading;

    if (loading == true){
      return SizedBox(
        height: 20,
        width: 20,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1,

          ),
        ),
      );
    }

    return Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
              fontSize: 20,
            ),
          );
  }
}