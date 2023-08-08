import 'dart:io' show Platform;

import 'package:package_info_plus/package_info_plus.dart';

import '../enums/app.dart';

Future<String> getAppInfo({
  required AppInfo appInfo,
}) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  late String currentInfo;

  switch (appInfo) {
    case AppInfo.appName:
      currentInfo = packageInfo.appName;
      break;
    case AppInfo.packageName:
      currentInfo = packageInfo.packageName;
      break;
    case AppInfo.version:
      currentInfo = packageInfo.version;
      break;
    case AppInfo.buildNumber:
      currentInfo = packageInfo.buildNumber;
      break;
    default:
      currentInfo = packageInfo.appName;
  }

  return currentInfo;
}

int formatAppVersion({required String appVersion}){
  int appVersionFormat = int.parse(
    appVersion.replaceAll('.', ''),
  );

  return appVersionFormat;
}

AppEnum getCurrentPlatform() {
  if (Platform.isAndroid) {
    return AppEnum.android;
  } else if (Platform.isIOS) {
    return AppEnum.ios;
  }
  return AppEnum.android;
}