import '../../data/models/failure_model.dart';
import '../../data/models/onboarding_model.dart';
import '../../utils/either/either.dart';

abstract class OnboardingRepository {
  Future<Either<FailuresModel, List<Onboarding>>> getOnboarding();

  Future<Either<FailuresModel, bool>> setOnboardingStatus({
    required bool status,
  });

  Future<Either<FailuresModel, bool>> get getOnboardingStatus;
}
