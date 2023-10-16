import 'package:flutter/material.dart';

import '../../../common/subtitle/custom_subtitle.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';

class ContentUpdateModal extends StatelessWidget {
  const ContentUpdateModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: spacingXS_8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icon/icon.png',
              height: spacingXXL_40,
              width: spacingXXL_40,
            ),
            const SizedBox(
              width: spacingXS_8,
            ),
            const Expanded(
              child: CustomSubtitle(
                subtitle: '$titleApp $lblContentUpdateApp',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
