import 'package:flutter/material.dart';

import '../../../common/gradient/custom_gradient.dart';
import '../../../common/padding/custom_padding.dart';
import '../../../common/subtitle/custom_subtitle.dart';
import '../../../common/title/custom_title.dart';
import '../../../constants/constants.dart';
import '../../../constants/paths.dart';
import '../../../constants/sizes.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPadding(
            typePadding: TypePadding.all,
            padding: spacingL_24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  network,
                  width: 200,
                ),
                const SizedBox(
                  height: spacingM_16,
                ),
                const CustomTitle(
                  title: lblWithoutInternetTitle,
                ),
                const SizedBox(
                  height: spacingXXS_4,
                ),
                const CustomSubtitle(
                  subtitle: lblWithoutInternetSubtitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
