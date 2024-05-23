import 'package:flutter/material.dart';

class ChooseModController extends ChangeNotifier {
  int _selectedMod = -1;

  int get selectedIndex => _selectedMod;

  void updateSelectedIndex(int newIndex) {
    _selectedMod = newIndex;
    notifyListeners();
  }
}
