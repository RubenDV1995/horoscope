import 'package:flutter/material.dart';
import 'package:horoscopos/common/icon/custom_icon.dart';
import 'package:horoscopos/constants/colors.dart';

import '../../../constants/sizes.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? color;
  final double? size;
  final IconData? iconData;

  const CustomOutlineButton({
    required this.title,
    Key? key,
    this.onTap,
    this.color,
    this.size,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color ?? MainColor.primaryColor,
              fontSize: size ?? spacingS_12,
            ),
          ),
          if (iconData != null)
            Row(
              children: [
                const SizedBox(
                  width: spacingXS_8,
                ),
                CustomIcon(
                  iconData: iconData!,
                  color: color ?? MainColor.primaryColor,
                  size: size,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
