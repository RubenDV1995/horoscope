import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier {

  late int _indexStep = 0;
  late String _appVersion;

  int get indexStep => _indexStep;
  String get appVersion => _appVersion;

  setIndex(int index){
    _indexStep = index;
    notifyListeners();
  }

  setAppVersion(String appVersion){
    _appVersion = appVersion;
    notifyListeners();
  }
}