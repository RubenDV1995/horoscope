import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../padding/custom_padding.dart';
import '../subtitle/custom_subtitle.dart';

class CustomBadge extends StatelessWidget {
  final String title;
  final Color? backgroundColor;

  const CustomBadge({
    required this.title,
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? MainColor.stateRed,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(
            spacingM_16,
          ),
        ),
      ),
      child: CustomPadding(
        typePadding: TypePadding.horizontal,
        child: CustomSubtitle(
          subtitle: title,
        ),
      ),
    );
  }
}
