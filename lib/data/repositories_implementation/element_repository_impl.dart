import 'package:horoscopos/data/models/elements_model.dart';

import 'package:horoscopos/data/models/failure_model.dart';
import 'package:horoscopos/utils/either/either.dart';

import '../../domian/repositories/elements_repository.dart';
import '../models/sings_model.dart';
import '../services/firebase/remote_config_service.dart';
import 'failures_repository_impl.dart';

class ElementRepositoryImpl implements ElementsRepository {
  final RemoteConfigService _firebaseRemoteConfig;
  final FailureRepositoryImpl _failureRepositoryImpl;

  ElementRepositoryImpl({
    required RemoteConfigService firebaseRemoteConfig,
    required FailureRepositoryImpl failureRepositoryImpl,
  })  : _firebaseRemoteConfig = firebaseRemoteConfig,
        _failureRepositoryImpl = failureRepositoryImpl;

  @override
  Future<Either<FailuresModel, Element>> getElement({required Sing sing}) {
    final elements = _firebaseRemoteConfig.getEventElementsInfoJson();
    return elements.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(failure.name),
      ),
      (elements) async => Either.right(
        elements.firstWhere((element) => element.element == sing.category),
      ),
    );
  }

  @override
  Future<Either<FailuresModel, List<Element>>> getElements() {
    final elements = _firebaseRemoteConfig.getEventElementsInfoJson();
    return elements.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(failure.name),
      ),
      (elements) async => Either.right(
        elements,
      ),
    );
  }
}
