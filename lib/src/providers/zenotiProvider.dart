import 'package:flutter/cupertino.dart';

class ZenotiProvider with ChangeNotifier {
  late DateTime _selectedDate;
  double _top = 230;

  double get top => _top;

  set top(double value) {
    _top = value;
    notifyListeners();
  }

  double _panelsize = 0;

  double get panelsize => _panelsize;

  set panelsize(double value) {
    _panelsize = value;
    notifyListeners();
  }

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }
}
