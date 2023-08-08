import '../../utils/either/either.dart';
import '../models/failure_model.dart';
import '../models/horoscope_model.dart';

abstract class HoroscopeRepository{
  Future<Either<FailuresModel, Horoscope>> getHoroscope();
}