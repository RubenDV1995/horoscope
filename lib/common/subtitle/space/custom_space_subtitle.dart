import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../padding/custom_padding.dart';
import '../custom_subtitle.dart';

class CustomSpaceSubtitle extends StatelessWidget {
  final String title;

  const CustomSpaceSubtitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPadding(
          typePadding: TypePadding.all,
          padding: spacingXXS_4,
          child: CustomSubtitle(
            subtitle: title,
            size: spacingS_12,
            color: MainColor.primaryWhite,
          ),
        ),
        const SizedBox(
          height: spacingS_12,
        ),
      ],
    );
  }
}
