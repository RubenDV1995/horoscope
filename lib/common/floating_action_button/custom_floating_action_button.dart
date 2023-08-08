import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/sizes.dart';
import '../../features/home/controller/home_controller.dart';
import '../icon/custom_icon.dart';
import '../title/custom_title.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  onNextStep({
    required BuildContext context,
    required HomeController homeController,
  }) {
    int currentStep = homeController.indexStep;
    int newStep = currentStep += 1;
    homeController.setIndex(newStep);
    DefaultTabController.of(context).animateTo(newStep);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final homeController = Provider.of<HomeController>(context);
      if (homeController.indexStep == 4) {
        return const SizedBox.shrink();
      }
      return FloatingActionButton.extended(
        onPressed: () => onNextStep(
          context: context,
          homeController: homeController,
        ),
        label: Row(
          children: [
            Row(
              children: const [
                CustomTitle(
                  title: lblNext,
                  size: spacingM_16,
                ),
                SizedBox(
                  width: spacingXXS_4,
                ),
              ],
            ),
            const CustomIcon(
              iconData: FluentIcons.ios_arrow_rtl_24_filled,
              color: MainColor.primaryWhite,
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(spacingM_16),
            bottomRight: Radius.circular(spacingM_16),
            bottomLeft: Radius.circular(spacingM_16),
          ),
        ),
      );
    });
  }
}
