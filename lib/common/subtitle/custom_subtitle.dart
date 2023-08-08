import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CustomSubtitle extends StatelessWidget {
  final String subtitle;
  final double? size;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;

  const CustomSubtitle({
    required this.subtitle,
    Key? key,
    this.size,
    this.maxLines,
    this.overflow,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      maxLines: maxLines ?? 6,
      overflow: overflow ?? TextOverflow.fade,
      style: size != null
          ? Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: size,
                color: color ?? MainColor.primaryWhite,
                height: 1.3,
              )
          : Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: spacingS_12,
                color: color ?? MainColor.primaryWhite,
                height: 1.5,
              ),
    );
  }
}
