import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../common/button/custom_rounded_button.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';

class FooterOnboardingItem extends StatelessWidget {
  final int index;
  final int length;
  final void Function() onTap;
  final LiquidController liquidController;

  const FooterOnboardingItem({
    required this.index,
    required this.length,
    required this.onTap,
    required this.liquidController,
    Key? key,
  }) : super(key: key);

  void _next() {
    liquidController.animateToPage(page: (index + 1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: spacingXL_32,
        ),
        CustomRoundedButton(
          title: index == (length - 1) ? lblDone : lblNext,
          onPress: index == (length - 1) ? onTap : _next,
        ),
      ],
    );
  }
}
