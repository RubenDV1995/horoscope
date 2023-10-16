import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../padding/custom_padding.dart';
import '../subtitle/custom_subtitle.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color? color;

  const CustomChip({
    required this.label,
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? MainColor.stateRed,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            spacingL_24,
          ),
        ),
      ),
      child: CustomPadding(
        typePadding: TypePadding.horizontal,
        padding: spacingXS_8,
        child: CustomSubtitle(
          subtitle: label,
          color: MainColor.textCharcoal1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
