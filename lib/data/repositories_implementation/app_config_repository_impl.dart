
import '../../domian/models/app_config_model.dart';
import '../../domian/models/failure_model.dart';
import '../../domian/repositories/app_config_repository.dart';
import '../../utils/either/either.dart';
import '../../utils/enums/app.dart';
import '../services/firebase/remote_config_service.dart';
import 'failures_repository_impl.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  final RemoteConfigService _firebaseRemoteConfig;
  final FailureRepositoryImpl _failureRepositoryImpl;

  AppConfigRepositoryImpl({
    required RemoteConfigService firebaseRemoteConfig,
    required FailureRepositoryImpl failureRepositoryImpl,
  })  : _firebaseRemoteConfig = firebaseRemoteConfig,
        _failureRepositoryImpl = failureRepositoryImpl;

  @override
  Future<Either<FailuresModel, List<App>>> getConfig() {
    final config = _firebaseRemoteConfig.getEventAppConfigJson();
    return config.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(
          failure.name,
        ),
      ),
      (config) async => Either.right(
        config,
      ),
    );
  }

  @override
  Future<Either<FailuresModel, App>> getAppVersion({required AppEnum platform}) {
    final config = _firebaseRemoteConfig.getEventAppConfigJson();
    return config. when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(
          failure.name,
        ),
      ),
      (config) async {
        late App app;
        for (var element in config) {
          if(element.id == platform.name) {
            app = element;
          }
        }
        return Either.right(
          app,
        );
      },
    );
  }
}
