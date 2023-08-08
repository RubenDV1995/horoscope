import 'package:flutter/material.dart';

import '../../../common/button/custom_rounded_button.dart';
import '../../../common/card/custom_card.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';
import '../../../domian/models/failure_model.dart';

class FailurePage extends StatelessWidget {
  final FailuresModel failure;
  final void Function()? onPress;

  const FailurePage({
    required this.failure,
    Key? key,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: spacingS_12,
        ),
        CustomCard(
          title: failure.title!,
          subtitle: failure.subtitle,
          urlImage: failure.urlImage,
        ),
        const SizedBox(
          height: spacingS_12,
        ),
        if (onPress != null)
          CustomRoundedButton(
            title: lblTryAgain,
            onPress: onPress!,
          ),
      ],
    );
  }
}
