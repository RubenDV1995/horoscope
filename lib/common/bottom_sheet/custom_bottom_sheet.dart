import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../button/custom_rounded_button.dart';
import '../padding/custom_padding.dart';
import '../subtitle/custom_subtitle.dart';
import '../title/custom_title.dart';

void showCustomBottomSheet(
  BuildContext context,
  String title, [
  void Function()? onPressed,
  String? titleButton,
  String? content,
]) {
  Scaffold.of(context).showBottomSheet<void>(
    enableDrag: false,
    (BuildContext context) {
      return Container(
        height: 300,
        color: MainColor.secondaryCharcoal,
        child: SingleChildScrollView(
          child: CustomPadding(
            typePadding: TypePadding.all,
            padding: spacingM_20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CustomTitle(
                  title: title,
                ),
                if (content != null)
                  Column(
                    children: [
                      const SizedBox(
                        height: spacingXXS_4,
                      ),
                      CustomSubtitle(
                        subtitle: content,
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
        ),
      );
    },
  );
}
