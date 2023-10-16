import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../common/padding/custom_padding.dart';
import '../../../constants/sizes.dart';
import '../../../data/models/onboarding_model.dart';
import '../../../utils/color/hex_color.dart';
import 'content_onboarding_item.dart';
import 'footer_onboarding_item.dart';
import 'header_onboarding_item.dart';

class OnboardingPageWidget extends StatelessWidget {
  final Onboarding onboarding;
  final LiquidController liquidController;
  final int index;
  final int length;
  final void Function() onTap;

  const OnboardingPageWidget({
    required this.onboarding,
    required this.liquidController,
    required this.index,
    required this.length,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: HexColor(
        onboarding.color.toString(),
      ),
      child: CustomPadding(
        typePadding: TypePadding.all,
        padding: spacingL_24,
        child: Column(
          children: [
            HeaderOnboardingItem(
              index: index,
              length: length,
              onTap: onTap,
            ),
            ContentOnboardingItem(
              onboarding: onboarding,
            ),
            FooterOnboardingItem(
              index: index,
              length: length,
              onTap: onTap,
              liquidController: liquidController,
            ),
          ],
        ),
      ),
    );
  }
}
