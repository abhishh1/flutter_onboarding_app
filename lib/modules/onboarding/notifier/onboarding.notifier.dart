import 'package:flutter/material.dart';

class OnboardingNotifier extends ChangeNotifier {
  int lineIndex = 0;

  void setLineIndex({required int index}) {
    lineIndex = index;
    notifyListeners();
  }
}
