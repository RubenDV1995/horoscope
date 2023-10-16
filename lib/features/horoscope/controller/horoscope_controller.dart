import 'package:flutter/foundation.dart';

import '../../../data/models/failure_model.dart';
import '../../../data/models/horoscope_model.dart';
import '../../../data/models/sings_model.dart';
import '../../../data/repositories_implementation/horoscope_repository_impl.dart';
import '../../../utils/either/either.dart';

class HoroscopeController extends ChangeNotifier {
  final HoroscopeRepositoryImpl horoscopeRepositoryImpl;

  HoroscopeController({
    required this.horoscopeRepositoryImpl,
  });

  late bool _isLoading = true;
  late bool _onErrorGetSings = false;
  Horoscope? _horoscope;
  late FailuresModel _failuresModel;

  bool get isLoading => _isLoading;

  bool get onErrorGetSings => _onErrorGetSings;

  Horoscope? get horoscope => _horoscope;

  FailuresModel get failureModel => _failuresModel;

  Future<Either<FailuresModel, Horoscope>> getHoroscope({
    required Sing sing,
    required DateTime date,
  }) async {
    final resultHoroscope = await horoscopeRepositoryImpl.getHoroscope(
      sing: sing,
      date: '${date.year}-${date.month}-${date.day}',
    );
    return resultHoroscope.when(
      (failure) {
        onLoading(false);
        onError(
          failuresModel: failure,
        );
        return Either.left(
          failure,
        );
      },
      (horoscope) {
        onLoading(false);
        setHoroscope(horoscope);
        return Either.right(
          horoscope,
        );
      },
    );
  }

  setHoroscope(Horoscope horoscope) {
    _onErrorGetSings = false;
    _horoscope = horoscope;
    notifyListeners();
  }

  onError({required FailuresModel failuresModel}) {
    _failuresModel = failuresModel;
    _onErrorGetSings = true;
    notifyListeners();
  }

  onLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
