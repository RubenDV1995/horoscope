import 'package:flutter/material.dart';
import 'package:horoscopos/common/icon/custom_icon.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../subtitle/custom_subtitle.dart';
import '../title/custom_title.dart';

class CustomExpansionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? content;
  final void Function(bool)? onExpansionChanged;

  const CustomExpansionTitle({
    required this.title,
    required this.subtitle,
    Key? key,
    this.content,
    this.onExpansionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: const EdgeInsets.all(
        0,
      ),
      dense: true,
      horizontalTitleGap: 0.0,
      minLeadingWidth: 0,
      child: ExpansionTile(
        trailing: const CustomIcon(
          iconData: Icons.keyboard_arrow_down_outlined,
          color: MainColor.primaryWhite,
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            spacingXS_8,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            spacingXS_8,
          ),
        ),
        title: CustomTitle(
          title: title,
          size: spacingM_16,
        ),
        subtitle: subtitle != null
            ? CustomSubtitle(
                subtitle: subtitle!,
              )
            : const SizedBox.shrink(),
        onExpansionChanged: onExpansionChanged,
        children: <Widget>[
          if (content != null)
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.only(
                left: 0.0,
                right: 0.0,
                top: 0.0,
                bottom: 0.0,
              ),
              title: CustomSubtitle(
                subtitle: content!,
                color: MainColor.secondaryCharcoal,
              ),
            ),
        ],
      ),
    );
  }
}
