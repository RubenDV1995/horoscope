import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier {

  late int _indexStep = 0;

  int get indexStep => _indexStep;

  setIndex(int index){
    _indexStep = index;
    notifyListeners();
  }
}