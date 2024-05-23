import 'package:flutter/material.dart';
import 'package:hope/features/exam/data/models/participant.dart';

class ParticipantItem extends StatelessWidget {
  const ParticipantItem({super.key, required this.participant});
  final Participant participant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 8, 30, 0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: Color(0xff95D7FF),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: SizedBox(
          width: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            ///Todo: Make it scrollable so that it fits different screens
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                child: Text(
                  '${participant.firstname} ${participant.lastname}',
                  style: TextStyle(color: Color(0xff0077C0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 100, maxHeight: 50),
                  child: Theme(
                    data: ThemeData(),
                    child: TextFormField(
                      onSaved: (value) {
                        //print(participant.score);
                        try{
                          participant.score = value != null ? double.parse(value) : null;
                        }
                        catch (e){
                          print(participant.score);
                          rethrow;
                        }
                      },
                      initialValue: participant.score == null ? "" : participant.score.toString(),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      maxLength: 6,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(color: Colors.white)

                        ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide:
                                  BorderSide(color: Colors.red)),
                          filled: true,
                          counterText: ''),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
