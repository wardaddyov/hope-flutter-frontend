import 'package:hope/core/resources/string_extensions.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class FieldValidator{
  final bool isRequired;
  final bool isNumber;
  final int minAmountOfChars;
  final int maxAmountOfChars;

  FieldValidator({this.isRequired = false, this.isNumber = false, this.minAmountOfChars = 0, this.maxAmountOfChars = 50});

  String? validate(String s){
    print('InBody');
    if (s!.isWhitespace() && isRequired) {
      print('notext');
      return "این قسمت نمی‌تواند خالی باشد";
    }
    if (isRequired &&
        isNumber &&
        !RegExp(r'^[0-9]+$').hasMatch(s.toEnglishDigit())) {
      return "در این قسمت تنها عدد مجاز است";
    }
    if (s.isLong(maxAmountOfChars)) {
      return 'تعداد کاراکتر وارد شده بیشتر از حد مجاز';
    }
    if (s.isShort(minAmountOfChars)) {
      return 'تعداد کاراکتر وارد شده کمتر از حد مجاز';
    }
    return null;
  }
}