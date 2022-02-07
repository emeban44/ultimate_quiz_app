import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameProvider extends ChangeNotifier {
  int oddOneOutPageIndex = 0;

  void incrementOddOneOutIndex() {
    oddOneOutPageIndex++;
    notifyListeners();
  }
}
