import 'package:horoscopos/data/models/failure_model.dart';

import '../../data/models/elements_model.dart';
import '../../data/models/sings_model.dart';
import '../../utils/either/either.dart';

abstract class ElementsRepository {
  Future<Either<FailuresModel, Element>> getElement({
    required Sing sing,
  });

  Future<Either<FailuresModel, List<Element>>> getElements();
}
