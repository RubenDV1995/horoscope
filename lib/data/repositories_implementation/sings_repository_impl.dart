import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:horoscopos/domian/repositories/sings_repository.dart';
import 'package:horoscopos/utils/either/either.dart';

import '../../utils/enums/failures.dart';
import '../models/failure_model.dart';
import '../models/sings_model.dart';
import '../services/firebase/remote_config_service.dart';
import 'failures_repository_impl.dart';

const String _keySing = 'keySing';

class SingsRepositoryImpl implements SingsRepository {
  final RemoteConfigService _firebaseRemoteConfig;
  final FlutterSecureStorage _flutterSecureStorage;
  final FailureRepositoryImpl _failureRepositoryImpl;

  SingsRepositoryImpl({
    required RemoteConfigService firebaseRemoteConfig,
    required FlutterSecureStorage flutterSecureStorage,
    required FailureRepositoryImpl failureRepositoryImpl,
  })  : _firebaseRemoteConfig = firebaseRemoteConfig,
        _flutterSecureStorage = flutterSecureStorage,
        _failureRepositoryImpl = failureRepositoryImpl;

  @override
  Future<Either<FailuresModel, List<Sing>>> getSings() async {
    final sings = _firebaseRemoteConfig.getEventSingsInfoJson();
    return sings.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(failure.name),
      ),
      (sings) async => Either.right(
        sings,
      ),
    );
  }

  @override
  Future<Either<FailuresModel, Sing>> setSing({
    required Sing sing,
  }) async {
    try {
      String jsonSing = jsonEncode(sing);
      await _flutterSecureStorage.write(
        key: _keySing,
        value: jsonSing,
      );
      return Either.right(
        sing,
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
  Future<Either<FailuresModel, Sing>> getSing() async {
    late Sing sing;
    try {
      final singString = await _flutterSecureStorage.containsKey(key: _keySing);
      if (singString == true) {
        String? singValue = await _flutterSecureStorage.read(key: _keySing);
        Map<String, dynamic> jso = json.decode(singValue!);
        sing = Sing.fromJson(jso);
        return Either.right(
          sing,
        );
      } else {
        ///Load list sings an set first
        /*
        final sings = await getSings();
        sings.when(
          (failure) {
            return Either.left(
              _failureRepositoryImpl.setFailure(
                FailuresEnum.notModeFound.name,
              ),
            );
          },
          (sings) {
            ///setSings
            sing = sings.first;
            setSing(sing: sing);
          },
        );
        return Either.right(
          sing,
        );

         */
        return Either.left(
          await _failureRepositoryImpl.setFailure(
            FailuresEnum.unknown.name,
          ),
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
