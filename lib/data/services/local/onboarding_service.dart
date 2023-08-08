import '../../../domian/models/onboarding_model.dart';
import '../../../utils/either/either.dart';
import '../../../utils/enums/failures.dart';
import '../../datasources/onboarding/onboarding_datasource.dart';

class OnboardingService {
  Either<FailuresEnum, List<Onboarding>> getOnboardingConfig() {
    List<Onboarding> listOnboarding = [];
    try {
      final result = onboardingJson;
      if (result.isNotEmpty) {
        final data = OnboardingModel.fromJson(result);
        if (data.onboarding != null && data.onboarding!.isNotEmpty) {
          listOnboarding = data.onboarding!;
          return Either.right(
            listOnboarding,
          );
        } else {
          return Either.left(
            FailuresEnum.notConfigsFound,
          );
        }
      } else {
        return Either.left(
          FailuresEnum.network,
        );
      }
    } catch (e) {
      return Either.left(
        FailuresEnum.parseError,
      );
    }
  }
}
