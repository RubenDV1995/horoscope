import '../models/failure_model.dart';

abstract class FailureRepository {
  Future<FailuresModel> setFailure(String failure);
}
