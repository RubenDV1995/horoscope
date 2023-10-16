import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domian/repositories/onboarding_repository.dart';
import '../../utils/either/either.dart';
import '../../utils/enums/failures.dart';
import '../models/failure_model.dart';
import '../models/onboarding_model.dart';
import '../services/local/onboarding_service.dart';
import 'failures_repository_impl.dart';

const String _keyOnboarding = 'keyOnboarding';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final FlutterSecureStorage _flutterSecureStorage;
  final FailureRepositoryImpl _failureRepositoryImpl;
  final OnboardingService _onboardingService;

  OnboardingRepositoryImpl({
    required FlutterSecureStorage flutterSecureStorage,
    required FailureRepositoryImpl failureRepositoryImpl,
    required OnboardingService onboardingService,
  })  : _flutterSecureStorage = flutterSecureStorage,
        _failureRepositoryImpl = failureRepositoryImpl,
        _onboardingService = onboardingService;

  @override
  Future<Either<FailuresModel, List<Onboarding>>> getOnboarding() {
    final onboarding = _onboardingService.getOnboardingConfig();
    return onboarding.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(
          failure.name,
        ),
      ),
      (onboarding) async => Either.right(
        onboarding,
      ),
    );
  }

  @override
  Future<Either<FailuresModel, bool>> setOnboardingStatus({
    required bool status,
  }) async {
    try {
      await _flutterSecureStorage.write(
        key: _keyOnboarding,
        value: status.toString(),
      );
      return Either.right(
        true,
      );
    } catch (e) {
      return Either.left(
        await _failureRepositoryImpl.setFailure(
          FailuresEnum.unknown.name,
        ),
      );
    }
  }

  @override
  Future<Either<FailuresModel, bool>> get getOnboardingStatus async {
    try {
      final bool soundString =
          await _flutterSecureStorage.containsKey(key: _keyOnboarding);
      if (soundString == true) {
        return Either.right(
          true,
        );
      } else {
        return Either.right(
          false,
        );
      }
    } catch (e) {
      return Either.left(
        await _failureRepositoryImpl.setFailure(
          FailuresEnum.unknown.name,
        ),
      );
    }
  }
}
