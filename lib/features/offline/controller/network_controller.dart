import 'package:flutter/foundation.dart';

class NetworkController extends ChangeNotifier {

  late bool _hasInternet = true;

  bool get hastInternet => _hasInternet;

  setInternet(bool value){
    _hasInternet = value;
    notifyListeners();
  }
}