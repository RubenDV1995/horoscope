import '../../../data/models/failure_model.dart';
import '../../../data/models/sings_model.dart';
import '../../../data/repositories_implementation/sings_repository_impl.dart';
import '../../../utils/either/either.dart';

class GetSings {
  final SingsRepositoryImpl _singsRepositoryImpl;

  GetSings(this._singsRepositoryImpl);

  Future<Either<FailuresModel, List<Sing>>> execute() async {
    final resultSings = await _singsRepositoryImpl.getSings();
    return resultSings.when(
      (failure) {
        return Either.left(
          failure,
        );
      },
      (sings) {
        return Either.right(
          sings,
        );
      },
    );
  }
}
