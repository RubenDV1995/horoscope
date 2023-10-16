import '../../../data/models/failure_model.dart';
import '../../../data/models/sings_model.dart';
import '../../../data/repositories_implementation/sings_repository_impl.dart';
import '../../../utils/either/either.dart';

class GetCurrentSing {
  final SingsRepositoryImpl _singsRepositoryImpl;

  GetCurrentSing(this._singsRepositoryImpl);

  Future<Either<FailuresModel, Sing>> execute() async {
    final resultSings = await _singsRepositoryImpl.getSing();
    return resultSings.when(
      (failure) {
        return Either.left(
          failure,
        );
      },
      (sing) {
        return Either.right(
          sing,
        );
      },
    );
  }
}
