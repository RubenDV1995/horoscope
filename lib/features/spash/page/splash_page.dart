import 'package:flutter/material.dart';
import 'package:horoscopos/features/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../common/bottom_sheet/custom_bottom_sheet.dart';
import '../../../common/gradient/custom_gradient.dart';
import '../../../common/title/custom_title.dart';
import '../../../common/toast/custom_toast.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/paths.dart';
import '../../../constants/sizes.dart';
import '../../../data/models/app_config_model.dart';
import '../../../domian/repositories/app_config_repository.dart';
import '../../../domian/repositories/onboarding_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/enums/app.dart';
import '../../../utils/info/app_info.dart';
import '../../../utils/launch/launch.dart';
import '../../../utils/navigator/navigator.dart';
import '../widgets/content_update_modal.dart';

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
  late HomeController _homeController;

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
    _homeController = Provider.of<HomeController>(
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
            _homeController.setAppVersion(
              app.appVersion ?? lblNotData,
            ),
            goTo(
              routeName: Routes.home,
              context: context,
            ),
          }
        else
          {
            _updateApp(
              context: context,
              app: app,
            ),
          }
      },
    );
  }

  void _updateApp({
    required BuildContext context,
    required App app,
  }) {
    late String currentChange = '';
    if (app.changes != null) {
      for (var element in app.changes!) {
        currentChange = '$currentChange ○ ${element.title!}\n';
      }
    }

    showCustomBottomSheet(
      context,
      lblUpdateApp,
      () {
        _launchUrl(
          url: app.urlStore!,
        );
      },
      lblUpdate,
      const ContentUpdateModal(),
      currentChange,
      app.date,
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
                size: spacingL_28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
