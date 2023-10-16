import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../../constants/constants.dart';
import '../../../utils/either/either.dart';
import '../../../utils/enums/failures.dart';
import '../../../utils/prints_logs/prints_logs.dart';
import '../../models/app_config_model.dart';
import '../../models/elements_model.dart';
import '../../models/sings_model.dart';

Map<String, dynamic> logs = {};

class RemoteConfigService {
  final FirebaseRemoteConfig _firebaseRemoteConfig;
  final RemoteConfigSettings _remoteConfigSettings;

  RemoteConfigService({
    required FirebaseRemoteConfig firebaseRemoteConfig,
    required RemoteConfigSettings remoteConfigSettings,
  })  : _firebaseRemoteConfig = firebaseRemoteConfig,
        _remoteConfigSettings = remoteConfigSettings;

  Future<void> init() async {
    try {
      _firebaseRemoteConfig.ensureInitialized();
      await _firebaseRemoteConfig.setConfigSettings(_remoteConfigSettings);
      _firebaseRemoteConfig.fetchAndActivate();
    } on FirebaseException catch (e) {
      logs = {
        'firebaseError': '$e',
      };
      printLogs(logs, null);
    }
  }

  Either<FailuresEnum, List<App>> getEventAppConfigJson() {
    List<App> listConfig = [];
    try {
      final result = _firebaseRemoteConfig.getString(lblRemoteConfigAppConfig);
      if (result.isNotEmpty) {
        Map<String, dynamic> valueMap = json.decode(result);
        final data = AppConfig.fromJson(valueMap);
        if (data.appConfig != null && data.appConfig!.isNotEmpty) {
          listConfig = data.appConfig!;
          return Either.right(
            listConfig,
          );
        } else {
          return Either.left(
            FailuresEnum.notConfigsFound,
          );
        }
      } else {
        return Either.left(
          FailuresEnum.network,
        );
      }
    } catch (e) {
      return Either.left(
        FailuresEnum.parseError,
      );
    }
  }

  Either<FailuresEnum, List<Sing>> getEventSingsInfoJson() {
    List<Sing> listSings = [];
    try {
      final result = _firebaseRemoteConfig.getString(lblRemoteConfigSings);
      if (result.isNotEmpty) {
        Map<String, dynamic> valueMap = json.decode(result);
        final data = Sings.fromJson(valueMap);
        if (data.sing != null && data.sing!.isNotEmpty) {
          listSings = data.sing!;
          return Either.right(
            listSings,
          );
        } else {
          return Either.left(
            FailuresEnum.notConfigsFound,
          );
        }
      } else {
        return Either.left(
          FailuresEnum.network,
        );
      }
    } catch (e) {
      return Either.left(
        FailuresEnum.parseError,
      );
    }
  }

  Either<FailuresEnum, List<Element>> getEventElementsInfoJson() {
    List<Element> listElements = [];
    try {
      final result = _firebaseRemoteConfig.getString(lblRemoteConfigElements);
      if (result.isNotEmpty) {
        Map<String, dynamic> valueMap = json.decode(result);
        final data = Elements.fromJson(valueMap);
        if (data.element.isNotEmpty) {
          listElements = data.element;
          return Either.right(
            listElements,
          );
        } else {
          return Either.left(
            FailuresEnum.notConfigsFound,
          );
        }
      } else {
        return Either.left(
          FailuresEnum.network,
        );
      }
    } catch (e) {
      return Either.left(
        FailuresEnum.parseError,
      );
    }
  }
}
