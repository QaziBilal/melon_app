import 'package:flutter/material.dart';

class ChooseCharacterController extends ChangeNotifier {
  int _selectedCharacter = -1;

  int get selectedIndex => _selectedCharacter;

  void updateSelectedIndex(int newIndex) {
    _selectedCharacter = newIndex;
    notifyListeners();
  }
}
