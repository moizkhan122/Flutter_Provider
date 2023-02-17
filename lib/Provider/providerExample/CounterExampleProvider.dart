import 'package:flutter/foundation.dart';


class CounterExampleProvider with ChangeNotifier{//changedNotifier Work like SetState

int _count = 0;
int get count => _count;  //getter method

  void setCount(){
    _count++;
    notifyListeners();//its notify and incrment
  }

}