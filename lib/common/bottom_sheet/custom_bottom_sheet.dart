import 'package:flutter/material.dart';
import 'package:horoscopos/common/expasion_title/custom_expasion_title.dart';

import '../../constants/constants.dart';
import '../../constants/sizes.dart';
import '../button/custom_rounded_button.dart';
import '../padding/custom_padding.dart';
import '../title/custom_title.dart';

void showCustomBottomSheet(
  BuildContext context,
  String title, [
  void Function()? onPressed,
  String? titleButton,
  Widget? content,
  String? features,
  String? subtitle,
]) {
  Scaffold.of(context).showBottomSheet<void>(
    enableDrag: false,
    (BuildContext context) {
      return SingleChildScrollView(
        child: CustomPadding(
          typePadding: TypePadding.all,
          padding: spacingM_20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: spacingXS_8,
              ),
              CustomTitle(
                title: title,
              ),
              if (content != null)
                Column(
                  children: [
                    const SizedBox(
                      height: spacingS_12,
                    ),
                    content,
                    if (features != null)
                      CustomExpansionTitle(
                        title: lblNews,
                        subtitle: subtitle,
                        content: features,
                      ),
                  ],
                ),
              if (onPressed != null && titleButton != null)
                Column(
                  children: [
                    const SizedBox(
                      height: spacingS_12,
                    ),
                    CustomRoundedButton(
                      onPress: onPressed,
                      title: titleButton,
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    },
  );
}
