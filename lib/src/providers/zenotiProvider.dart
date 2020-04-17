
import 'package:flutter/cupertino.dart';

class ZenotiProvider with ChangeNotifier{

    DateTime _selectedDate;

    DateTime get selectedDate => _selectedDate;
    
    set selectedDate (DateTime value){
      _selectedDate = value;
      notifyListeners();
    }

}