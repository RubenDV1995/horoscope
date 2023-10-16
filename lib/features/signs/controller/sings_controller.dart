import 'package:flutter/foundation.dart';

import '../../../data/models/failure_model.dart';
import '../../../data/models/sings_model.dart';
import '../../../domian/use_cases/sings/get_current_sing.dart';
import '../../../domian/use_cases/sings/get_sing.dart';
import '../../../domian/use_cases/sings/get_sings.dart';
import '../../../utils/either/either.dart';

class SingsController extends ChangeNotifier {
  final GetSings getSingsUseCase;
  final GetSing getSingUseCase;
  final GetCurrentSing getCurrentSingUseCase;

  SingsController({
    required this.getSingsUseCase,
    required this.getSingUseCase,
    required this.getCurrentSingUseCase,
  });

  late List<Sing> _sings;
  Sing? _sing;
  late FailuresModel _failuresModel;

  List<Sing> get sings => _sings;

  Sing? get sing => _sing;

  FailuresModel get failureModel => _failuresModel;

  Future<Either<FailuresModel, List<Sing>>> getSings() async {
    final resultSings = await getSingsUseCase.execute();
    return resultSings.when(
      (failure) {
        onError(
          failuresModel: failure,
        );
        return Either.left(
          failure,
        );
      },
      (sings) {
        setSings(sings: sings);
        getCurrentSing();
        return Either.right(
          sings,
        );
      },
    );
  }

  Future<Either<FailuresModel, Sing>> setSing({required Sing sing}) async {
    final resultSing = await getSingUseCase.execute(
      sing: sing,
    );
    return resultSing.when(
      (failure) {
        onError(
          failuresModel: failure,
        );
        return Either.left(
          failure,
        );
      },
      (sing) {
        setCurrentSing(sing: sing);
        return Either.right(
          sing,
        );
      },
    );
  }

  Future<Either<FailuresModel, Sing>> getCurrentSing() async {
    final resultSings = await getCurrentSingUseCase.execute();
    return resultSings.when(
      (failure) {
        return Either.left(
          failure,
        );
      },
      (sing) {
        setCurrentSing(sing: sing);
        return Either.right(
          sing,
        );
      },
    );
  }

  setSings({required List<Sing> sings}) {
    _sings = sings;
    notifyListeners();
  }

  setCurrentSing({required Sing sing}) {
    _sing = sing;
    notifyListeners();
  }

  onError({required FailuresModel failuresModel}) {
    _failuresModel = failuresModel;
    notifyListeners();
  }

  onErrorSetSing({required FailuresModel failuresModel}) {
    _failuresModel = failuresModel;
    notifyListeners();
  }
}
