import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/bottom_sheet/custom_bottom_sheet.dart';
import '../../../common/gradient/custom_gradient.dart';
import '../../../common/title/custom_title.dart';
import '../../../common/toast/custom_toast.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/paths.dart';
import '../../../constants/sizes.dart';
import '../../../domian/models/app_config_model.dart';
import '../../../domian/repositories/app_config_repository.dart';
import '../../../domian/repositories/onboarding_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/enums/app.dart';
import '../../../utils/info/app_info.dart';
import '../../../utils/launch/launch.dart';
import '../../../utils/navigator/navigator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late AppConfigRepository _appConfigRepository;
  late OnboardingRepository _onboardingRepository;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _getConfig();
  }

  void _setRepositoryAndController() {
    _appConfigRepository = Provider.of<AppConfigRepository>(
      context,
      listen: false,
    );
    _onboardingRepository = Provider.of<OnboardingRepository>(
      context,
      listen: false,
    );
  }

  void _getConfig() async {
    String appVersion = await getAppInfo(
      appInfo: AppInfo.version,
    );
    int appVersionLocal = formatAppVersion(
      appVersion: appVersion,
    );
    AppEnum currentPlatform = getCurrentPlatform();
    var config = await _appConfigRepository.getAppVersion(
      platform: currentPlatform,
    );
    var resultOnboarding = await _onboardingRepository.getOnboardingStatus;
    config.when(
      (failure) async => {
        resultOnboarding.when(
          (failure) => {
            showCustomBottomSheet(
              context,
              failure.title.toString(),
            )
          },
          (status) => {
            if (status == true)
              {
                goTo(
                  routeName: Routes.home,
                  context: context,
                ),
              }
            else
              {
                goTo(
                  routeName: Routes.onboarding,
                  context: context,
                ),
              }
          },
        ),
      },
      (app) => {
        if (formatAppVersion(appVersion: app.appVersion!) <= appVersionLocal)
          {
            goTo(
              routeName: Routes.home,
              context: context,
            ),
          }
        else
          {
            _updateApp(
              context: context,
              changes: app.changes,
              urlStore: app.urlStore,
            ),
          }
      },
    );
  }

  void _updateApp({
    required BuildContext context,
    required List<Changes>? changes,
    required String? urlStore,
  }) {
    late String currentChange = '';
    if (changes != null) {
      for (var element in changes) {
        currentChange = '$currentChange \n ○ ${element.title!}';
      }
    }

    showCustomBottomSheet(
      context,
      lblTitleUpdateApp,
      () {
        _launchUrl(
          url: urlStore!,
        );
      },
      lblUpdateApp,
      '$lblContentUpdateApp \n$currentChange',
    );
  }

  void _launchUrl({required String url}) async {
    var result = await launchURL(url: url);
    result.when(
      (failure) => {
        showToast(
          context: context,
          message: failure,
          typeToast: TypeToast.error,
        ),
      },
      (result) => {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: MainColor.primaryColor100,
        child: CustomGradient(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                width: 130,
                height: 130,
              ),
              const CustomTitle(
                title: titleApp,
                size: spacingXXL_40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
