import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DescriptionInputWidget extends StatelessWidget {
  DescriptionInputWidget({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: 856,
      child: TextFormField(

        keyboardType: TextInputType.multiline,
        maxLines: null,
        maxLength: 200,
        controller: controller,
        decoration: InputDecoration(
          helperText: '',
          hintText: 'توضیحات دانشجو را در این قسمت بنویسید (اختیاری)',
          labelText: 'توضیحات',
          prefixIcon: Icon(Icons.description),
        ),
      ),
    );
  }
}
