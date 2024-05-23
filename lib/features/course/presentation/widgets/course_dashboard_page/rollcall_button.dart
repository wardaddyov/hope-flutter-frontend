import 'package:flutter/material.dart';

class RollCallButton extends StatelessWidget {
  const RollCallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {

        },
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ))),
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff81E1FF),
                Color(0xff00B0FC),
              ],
              // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Container(
            constraints: const BoxConstraints(minWidth: 400.0, minHeight: 70.0),
            // min sizes for Material buttons
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.people, color: Colors.white,),
                SizedBox(width: 20,),
                Text('حضور و غیاب', style: TextStyle(color: Colors.white, fontSize: 18),),
              ],
            )
          ),
        ),
      ),
    );
  }
}
