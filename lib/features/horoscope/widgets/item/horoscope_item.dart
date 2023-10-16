import 'package:flutter/material.dart';
import 'package:horoscopos/common/padding/custom_padding.dart';
import 'package:horoscopos/common/subtitle/custom_subtitle.dart';

import '../../../../common/title/custom_title.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/sizes.dart';
import '../../../../data/models/horoscope_model.dart';

class HoroscopeItem extends StatelessWidget {
  final Horoscope horoscope;

  const HoroscopeItem({
    required this.horoscope,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      typePadding: TypePadding.all,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: spacingXS_8,
          ),
          const CustomTitle(
            title: lblHoroscope,
            size: spacingL_24,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: spacingXS_8,
          ),
          CustomSubtitle(
            subtitle: horoscope.horoscope ?? lblNotData,
            size: spacingM_16,
            maxLines: 100,
            color: Colors.white.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
