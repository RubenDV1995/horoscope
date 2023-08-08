import '../../../domian/models/failure_model.dart';
import '../../../utils/enums/failures.dart';

class FailureService {
  FailureService();

  Future<List<FailuresModel>> getLocalFailure() async {
    List<FailuresModel> listFailures;
    try {
      Map<String, dynamic> valueMap = mapFailures;
      final data = Failure.fromJson(valueMap);
      listFailures = data.failures!;
    } catch (e) {
      listFailures = [];
    }
    return listFailures;
  }
}
