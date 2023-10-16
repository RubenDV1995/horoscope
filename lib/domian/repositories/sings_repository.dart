import '../../data/models/failure_model.dart';
import '../../data/models/sings_model.dart';
import '../../utils/either/either.dart';

abstract class SingsRepository{
  Future<Either<FailuresModel, List<Sing>>> getSings();

  Future<Either<FailuresModel, Sing>> setSing({required Sing sing});

  Future<Either<FailuresModel, Sing>> getSing();
}