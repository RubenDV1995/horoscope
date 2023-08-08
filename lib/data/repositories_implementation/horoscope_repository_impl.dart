import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:horoscopos/data/repositories_implementation/failures_repository_impl.dart';
import 'package:horoscopos/data/services/remote/horoscope_service.dart';
import 'package:horoscopos/domian/models/failure_model.dart';

import 'package:horoscopos/domian/models/horoscope_model.dart';

import 'package:horoscopos/utils/either/either.dart';

import '../../domian/repositories/horoscope_repository.dart';

class HoroscopeRepositoryImpl implements HoroscopeRepository {
  final HoroscopeService _horoscopeService;
  final FlutterSecureStorage _flutterSecureStorage;
  final FailureRepositoryImpl _failureRepositoryImpl;

  HoroscopeRepositoryImpl({
    required HoroscopeService horoscopeService,
    required FlutterSecureStorage flutterSecureStorage,
    required FailureRepositoryImpl failureRepositoryImpl,
  })  : _horoscopeService = horoscopeService,
        _flutterSecureStorage = flutterSecureStorage,
        _failureRepositoryImpl = failureRepositoryImpl;

  @override
  Future<Either<FailuresModel, Horoscope>> getHoroscope() async {
    final result = await _horoscopeService.getHoroscope();
    return result.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(failure.name),
      ),
      (result) async => Either.right(
        result,
      ),
    );
  }
}
