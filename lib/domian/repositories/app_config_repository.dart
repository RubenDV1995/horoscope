import '../../data/models/app_config_model.dart';
import '../../data/models/failure_model.dart';
import '../../utils/either/either.dart';
import '../../utils/enums/app.dart';

abstract class AppConfigRepository{
  Future<Either<FailuresModel, List<App>>> getConfig();

  Future<Either<FailuresModel, App>> getAppVersion({required AppEnum platform});
}