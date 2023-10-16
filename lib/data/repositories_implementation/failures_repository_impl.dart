import '../../domian/repositories/failures_repository.dart';
import '../models/failure_model.dart';
import '../services/local/failure_service.dart';

class FailureRepositoryImpl implements FailureRepository {
  final FailureService _failureService;

  FailureRepositoryImpl({
    required FailureService failureService,
  }) : _failureService = failureService;

  @override
  Future<FailuresModel> setFailure(String failure) async {
    List<FailuresModel> listFailure = await _failureService.getLocalFailure();
    if (listFailure.isNotEmpty) {
      for (var element in listFailure) {
        if (element.id == failure) {
          return element;
        }
      }
    }
    return listFailure.first;
  }
}
