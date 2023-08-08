import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../icon/custom_icon.dart';
import '../../padding/custom_padding.dart';
import '../../title/custom_title.dart';

class CustomCornerButton extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final void Function() onTap;

  const CustomCornerButton({
    required this.title,
    required this.onTap,
    Key? key,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(spacingM_16),
          bottomRight: Radius.circular(spacingM_16),
          bottomLeft: Radius.circular(spacingM_16),
        ),
        color: MainColor.primarySpaceCadet,
      ),
      child: CustomPadding(
        typePadding: TypePadding.vertical,
        child: ListTile(
          onTap: onTap,
          minVerticalPadding: spacingS_12,
          title: CustomTitle(
            title: title,
            size: spacingM_16,
          ),
          tileColor: MainColor.primarySpaceCadet,
          trailing: const CustomIcon(
            iconData: FluentIcons.ios_arrow_rtl_24_filled,
            color: MainColor.primaryWhite,
          ),
          leading: iconData != null
              ? Icon(iconData)
              : const SizedBox.shrink(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(spacingM_16),
              bottomRight: Radius.circular(spacingM_16),
              bottomLeft: Radius.circular(spacingM_16),
            ),
          ),
        ),
      ),
    );
  }
}
