import '../../utils/either/either.dart';
import '../../utils/enums/app.dart';
import '../models/app_config_model.dart';
import '../models/failure_model.dart';

abstract class AppConfigRepository{
  Future<Either<FailuresModel, List<App>>> getConfig();

  Future<Either<FailuresModel, App>> getAppVersion({required AppEnum platform});
}