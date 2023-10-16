import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../padding/custom_padding.dart';
import '../title/custom_title.dart';

class CustomRoundedButton extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final void Function() onPress;

  const CustomRoundedButton({
    required this.title,
    required this.onPress,
    Key? key,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: MainColor.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(spacingM_16),
            topLeft: Radius.circular(spacingM_16),
            bottomRight: Radius.circular(spacingM_16),
            bottomLeft: Radius.circular(spacingM_16),
          ),
        ),
      ),
      child: CustomPadding(
        typePadding: TypePadding.all,
        padding: 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTitle(
              title: title,
            ),
            if (iconData != null)
              Icon(
                iconData,
                size: 16,
                color: MainColor.primaryWhite,
              ),
          ],
        ),
      ),
    );
  }
}
