import 'package:flutter/material.dart';
import 'package:horoscopos/common/card/blur/custom_blur_card.dart';
import 'package:horoscopos/common/subtitle/custom_subtitle.dart';
import 'package:horoscopos/features/horoscope/page/horoscope_page.dart';

import '../../../../common/image/cached/custom_cached_network_image.dart';
import '../../../../common/title/custom_title.dart';
import '../../../../constants/sizes.dart';
import '../../../../domian/models/sings_model.dart';
import '../../../../utils/navigator/navigator.dart';

class SingItem extends StatelessWidget {
  final Sing sing;

  const SingItem({
    required this.sing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToPush(
          context: context,
          page: HoroscopePage(
            sing: sing,
            title: sing.title!,
            urlImageBackground: sing.urlImagePreview!,
            urlAvatar: sing.urlImage!,
            heroTag: 'heroSingAvatar${sing.id.toString()}',
          ),
        );
      },
      child: CustomBlurCard(
        urlImageBackground: sing.urlImagePreview!,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'heroSingAvatar${sing.id.toString()}',
              child: CustomCachedNetworkImage(
                imageUrl: sing.urlImage!,
                width: 90,
                height: 90,
              ),
            ),
            Column(
              children: [
                CustomTitle(
                  title: sing.title!,
                  size: spacingM_20,
                ),
                CustomSubtitle(
                  subtitle: sing.date!,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
