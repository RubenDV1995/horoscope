import 'package:flutter/foundation.dart';

import '../../../domian/models/onboarding_model.dart';

class OnboardingController extends ChangeNotifier{
  late bool _isLoadingOnboarding = true;
  late int _indexOnboarding = 0;
  late List<Onboarding> _onboarding;

  bool get isLoadingOnboarding => _isLoadingOnboarding;
  int get indexOnboarding => _indexOnboarding;
  List<Onboarding> get onboarding => _onboarding;

  setOnboarding(List<Onboarding> onboarding){
    _onboarding = onboarding;
    _isLoadingOnboarding = false;
    notifyListeners();
  }

  setIndexOnboarding(int index){
    _indexOnboarding = index;
    notifyListeners();
  }

  onLoading(bool value){
    _isLoadingOnboarding = value;
    notifyListeners();
  }
}