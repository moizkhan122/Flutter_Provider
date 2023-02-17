import 'package:flutter/foundation.dart';

  class FavouriteExampleProvider with ChangeNotifier{

    List<int> _selectedItem = [];
    List<int> get selectedItem => _selectedItem;

    void addItem(int val){
      selectedItem.add(val);
      notifyListeners();
    } 
    void removeItem(int val){
      selectedItem.remove(val);
      notifyListeners();
    } 
}