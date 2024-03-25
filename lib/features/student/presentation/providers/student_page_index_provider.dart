import 'package:flutter/material.dart';

class StudentPageIndexProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void changeSelectedIndex({required int newIndex}) async {
    selectedIndex = newIndex;
    notifyListeners();
  }
}
