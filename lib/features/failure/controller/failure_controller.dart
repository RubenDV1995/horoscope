import 'package:flutter/foundation.dart';

import '../../../data/models/failure_model.dart';

class FailureController extends ChangeNotifier {

  late bool _isError = false;
  late FailuresModel _error;

  bool get isError => _isError;
  FailuresModel get error => _error;

  onError(FailuresModel error){
    _error = error;
    _isError = true;
    notifyListeners();
  }

  notError(){
    _isError = false;
    notifyListeners();
  }
}