import 'package:persian_number_utility/persian_number_utility.dart';

extension StringExtensions on String {

  bool isWhitespace() => trim().isEmpty;

  bool isValidDouble() => double.tryParse(this) != null;

  bool isValidInt() => int.tryParse(this) != null;

  bool isNumber() => !RegExp(r'^[0-9]+$').hasMatch(this.toEnglishDigit());

  bool isShort(int minAmountOfChars) => this.length < minAmountOfChars;

  bool isLong(int maxAmountOfChars) => this.length > maxAmountOfChars;
}