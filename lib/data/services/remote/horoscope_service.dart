import 'package:horoscopos/data/services/http/http.dart';
import 'package:horoscopos/utils/enums/failures.dart';

import '../../../data/models/horoscope_model.dart';
import '../../../utils/either/either.dart';

class HoroscopeService {
  final Http _http;

  HoroscopeService(this._http);

  Future<Either<FailuresEnum, Horoscope>> getHoroscope({
    required String sing,
    required String date,
  }) async {
    final result = await _http.request(
      '',
      userApiKey: false,
      method: HttpMethod.post,
      body: {
        "date": date,
        "lang": "es",
        "sign": sing,
      },
      onSuccess: (responseBody) {
        final json = responseBody;
        final Map<String, dynamic> data = json;
        return Horoscope.fromJson(data);
      },
    );

    return result.when(
      (failure) async => Either.left(
        failure,
      ),
      (result) => Either.right(
        result,
      ),
    );
  }
}
