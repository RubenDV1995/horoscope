import '../../utils/either/either.dart';
import '../models/failure_model.dart';
import '../models/onboarding_model.dart';

abstract class OnboardingRepository {
  Future<Either<FailuresModel, List<Onboarding>>> getOnboarding();

  Future<Either<FailuresModel, bool>> setOnboardingStatus({
    required bool status,
  });

  Future<Either<FailuresModel, bool>> get getOnboardingStatus;
}
