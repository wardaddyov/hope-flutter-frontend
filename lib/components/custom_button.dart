import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
    required this.title,
     required this.leadingIcon,
  });

  final String title;
  final IconData leadingIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},

        ///Todo: Fix hover animation
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
            constraints: const BoxConstraints(minWidth: 150.0, minHeight: 36.0),
            // min sizes for Material buttons
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(leadingIcon, color: Colors.white,),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                Icon(Icons.navigate_next, color: Colors.white,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedIcon extends StatelessWidget {
  const SelectedIcon({
    super.key,
    required this.title,
    required this.leadingIcon
  });
  final String title;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Ink(
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
        constraints: const BoxConstraints(minWidth: 150.0, minHeight: 36.0),
        // min sizes for Material buttons
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(leadingIcon, color: Colors.white,),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              Icon(Icons.navigate_next, color: Colors.transparent,)
            ],
          ),
        ),
      ),
    );
  }
}

class UnSelectedIcon extends StatelessWidget {
  const UnSelectedIcon({
    super.key,
    required this.title,
    required this.leadingIcon
  });
  final String title;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minWidth: 150.0, minHeight: 36.0),
        // min sizes for Material buttons
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(leadingIcon, color: Color(0xffB0B0B0),),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffB0B0B0)
                ),
              ),
              Icon(Icons.navigate_next, color: Color(0xffB0B0B0),)

            ],
          ),
        ),
    );
  }
}
