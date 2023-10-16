import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final double? size;

  const CustomIcon({
    required this.iconData,
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color ?? MainColor.primaryColor,
      size: size ?? spacingL_24,
    );
  }
}
