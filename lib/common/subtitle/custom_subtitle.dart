import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CustomSubtitle extends StatelessWidget {
  final String subtitle;
  final double? size;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  final FontWeight? fontWeight;

  const CustomSubtitle({
    required this.subtitle,
    Key? key,
    this.size,
    this.maxLines,
    this.overflow,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      maxLines: maxLines ?? 6,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: size != null
          ? Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: size,
                color: color ?? MainColor.primaryWhite,
                height: 1.3,
                fontWeight: fontWeight ?? FontWeight.normal,
              )
          : Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: spacingS_12,
                color: color ?? MainColor.primaryWhite,
                height: 1.5,
                fontWeight: fontWeight ?? FontWeight.normal,
              ),
    );
  }
}
