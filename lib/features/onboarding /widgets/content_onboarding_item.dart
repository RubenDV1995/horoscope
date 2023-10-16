import 'package:flutter/material.dart';

import '../../../common/subtitle/custom_subtitle.dart';
import '../../../common/title/custom_title.dart';
import '../../../constants/sizes.dart';
import '../../../data/models/onboarding_model.dart';

class ContentOnboardingItem extends StatelessWidget {
  final Onboarding onboarding;

  const ContentOnboardingItem({
    required this.onboarding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(
            title: onboarding.title.toString(),
            size: spacingL_28,
          ),
          const SizedBox(
            height: spacingXS_8,
          ),
          CustomSubtitle(
            subtitle: onboarding.subtitle.toString(),
            size: spacingM_16,
          ),
          Expanded(
            child: Image.asset(
              onboarding.img.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
