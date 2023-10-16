import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../icon/custom_icon.dart';
import '../padding/custom_padding.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  final Color? color;

  const CustomIconButton({
    required this.onPressed,
    required this.iconData,
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MainColor.primaryWhite.withOpacity(
          0.4,
        ),
        border: Border.all(
          color: color ?? MainColor.primaryColor,
        ),
      ),
      child: CustomPadding(
        typePadding: TypePadding.all,
        padding: spacingXXS_4,
        child: IconButton(
          padding: const EdgeInsets.all(0.0),
          constraints: const BoxConstraints(),
          icon: CustomIcon(
            iconData: iconData,
            color: color ?? MainColor.primaryColor,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
