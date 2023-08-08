import 'package:flutter/foundation.dart';

import '../../../domian/models/sings_model.dart';

class SingsController extends ChangeNotifier {
  late bool _isLoading = true;
  late bool _onErrorGetSings = false;
  late List<Sing> _sings;
  Sing? _sing;

  bool get isLoading => _isLoading;
  bool get onErrorGetSings => _onErrorGetSings;
  List<Sing> get sings => _sings;
  Sing? get sing => _sing;

  setSings(List<Sing> sings){
    _sings = sings;
    _isLoading = false;
    _onErrorGetSings = false;
    notifyListeners();
  }

  setSing(Sing sing){
    _sing = sing;
    _isLoading = false;
    _onErrorGetSings = false;
    notifyListeners();
  }

  onError(){
    _onErrorGetSings = true;
    _isLoading = false;
    notifyListeners();
  }

  onLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
}
