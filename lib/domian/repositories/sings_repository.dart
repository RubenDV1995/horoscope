import '../../utils/either/either.dart';
import '../models/failure_model.dart';
import '../models/sings_model.dart';

abstract class SingsRepository{
  Future<Either<FailuresModel, List<Sing>>> getSings();

  Future<Either<FailuresModel, Sing>> setSing({required Sing sing});

  Future<Either<FailuresModel, Sing>> get getSing;
}