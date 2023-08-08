import 'package:url_launcher/url_launcher.dart';

import '../../constants/constants.dart';
import '../either/either.dart';
import '../enums/failures.dart';

Future<Either<String, bool>> launchURL({required String url}) async {
  late String currentError = '';
  if (await canLaunchUrl(Uri.parse(url))) {
    bool result = await launchUrl(
      Uri.parse(url),
    );
    if (result == true) {
      return Either.right(true);
    } else {
      currentError =
          '$lblLaunchErrorTitle \n${FailuresEnum.urlLaunchError.name}';
      return Either.left(
        currentError,
      );
    }
  } else {
    currentError = '$lblLaunchErrorTitle \n${FailuresEnum.urlParseError.name}';
    return Either.left(
      currentError,
    );
  }
}
