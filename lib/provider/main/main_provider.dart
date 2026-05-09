
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{

  int currentIndex =0;

  changeIndex(int index){
      currentIndex = index;
      notifyListeners();   
  }

}