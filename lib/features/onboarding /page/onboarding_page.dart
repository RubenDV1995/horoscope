import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';

import '../../../common/bottom_sheet/custom_bottom_sheet.dart';
import '../../../common/pages/custom_defaul_page.dart';
import '../../../domian/repositories/onboarding_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/navigator/navigator.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/onboarding_page_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingRepository _onboardingRepository;
  late OnboardingController _onboardingController;
  late LiquidController liquidController;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _getOnboarding();
    liquidController = LiquidController();
  }

  void _setRepositoryAndController() {
    _onboardingRepository = Provider.of<OnboardingRepository>(
      context,
      listen: false,
    );
    _onboardingController = Provider.of<OnboardingController>(
      context,
      listen: false,
    );
  }

  void _getOnboarding() async {
    final result = await _onboardingRepository.getOnboarding();
    result.when(
      (_) => {},
      (onboarding) => {
        _onboardingController.setOnboarding(onboarding),
      },
    );
  }

  void _done() async {
    var resultOnboarding =
        await _onboardingRepository.setOnboardingStatus(status: true);
    resultOnboarding.when(
      (failure) => {
        showCustomBottomSheet(
          context,
          failure.title.toString(),
        ),
      },
      (status) => {
        goTo(
          routeName: Routes.home,
          context: context,
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomDefaultPage(
      body: Builder(
        builder: (context) {
          final currentOnboardingController = Provider.of<OnboardingController>(
            context,
          );
          if (currentOnboardingController.isLoadingOnboarding == true) {
            return const CircularProgressIndicator();
          }
          return LiquidSwipe(
            liquidController: liquidController,
            initialPage: 0,
            enableLoop: false,
            onPageChangeCallback: (index) {
              _onboardingController.setIndexOnboarding(index);
            },
            pages: List.generate(
              currentOnboardingController.onboarding.length,
              (index) {
                return OnboardingPageWidget(
                  onboarding: currentOnboardingController.onboarding[index],
                  index: index,
                  length: currentOnboardingController.onboarding.length,
                  liquidController: liquidController,
                  onTap: _done,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
