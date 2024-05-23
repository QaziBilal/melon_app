import 'package:flutter/material.dart';

class ChooseMachineController extends ChangeNotifier {
  int _selectedMachine = -1;

  int get selectedIndex => _selectedMachine;

  void updateSelectedIndex(int newIndex) {
    _selectedMachine = newIndex;
    notifyListeners();
  }
}
