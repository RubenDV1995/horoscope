import 'package:horoscopos/data/services/http/http.dart';
import 'package:horoscopos/utils/enums/failures.dart';

import '../../../domian/models/horoscope_model.dart';
import '../../../utils/either/either.dart';

class HoroscopeService {
  final Http _http;

  HoroscopeService(this._http);

  Future<Either<FailuresEnum, Horoscope>> getHoroscope() async {
    final result = await _http.request(
      '',
      userApiKey: false,
      method: HttpMethod.post,
      body: {
        "date": "2023-08-04",
        "lang": "es",
        "sign": "Libra",
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
