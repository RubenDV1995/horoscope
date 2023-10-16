import '../../../data/models/failure_model.dart';
import '../../../data/models/sings_model.dart';
import '../../../data/repositories_implementation/sings_repository_impl.dart';
import '../../../utils/either/either.dart';

class GetSing {
  final SingsRepositoryImpl _singsRepositoryImpl;

  GetSing(this._singsRepositoryImpl);

  Future<Either<FailuresModel, Sing>> execute({required Sing sing}) async {
    final resultSing = await _singsRepositoryImpl.setSing(
      sing: sing,
    );
    return resultSing.when(
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
