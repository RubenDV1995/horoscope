
import '../../data/models/failure_model.dart';
import '../../data/models/horoscope_model.dart';
import '../../data/models/sings_model.dart';
import '../../utils/either/either.dart';

abstract class HoroscopeRepository {
  Future<Either<FailuresModel, Horoscope>> getHoroscope({
    required Sing sing,
    required String date,
  });
}
