import 'package:flutter/material.dart';
import 'package:horoscopos/common/padding/custom_padding.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../constants/sizes.dart';

class HoroscopeSkeleton extends StatelessWidget {
  const HoroscopeSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      typePadding: TypePadding.all,
      child: SkeletonParagraph(
        style: SkeletonParagraphStyle(
          lines: 6,
          spacing: spacingXS_8,
          lineStyle: SkeletonLineStyle(
            randomLength: true,
            height: spacingM_20,
            borderRadius: BorderRadius.circular(8),
            minLength: MediaQuery.of(context).size.width / 2,
            maxLength: MediaQuery.of(context).size.width / 1,
          ),
        ),
      ),
    );
  }
}
