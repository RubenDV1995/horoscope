import 'package:flutter/material.dart';

import '../../../common/subtitle/custom_subtitle.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';

class HeaderOnboardingItem extends StatelessWidget {
  final int index;
  final int length;
  final void Function() onTap;

  const HeaderOnboardingItem({
    required this.index,
    required this.length,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: spacingXL_32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: spacingXS_8,
          ),
          if (index != (length - 1))
            InkWell(
              onTap: onTap,
              child: const CustomSubtitle(
                subtitle: lblSkip,
                size: spacingS_12,
              ),
            )
        ],
      ),
    );
  }
}
