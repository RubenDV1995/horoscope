import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../subtitle/custom_subtitle.dart';

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSubtitle(
      subtitle: label,
      size: spacingS_12,
      color: MainColor.primaryWhite.withOpacity(
        0.8,
      ),
    );
  }
}
