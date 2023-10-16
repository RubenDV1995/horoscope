import 'package:flutter/material.dart';
import 'package:horoscopos/common/card/blur/custom_blur_card.dart';
import 'package:horoscopos/features/horoscope/page/horoscope_page.dart';
import 'package:horoscopos/features/signs/controller/sings_controller.dart';
import 'package:provider/provider.dart';

import '../../../../common/icon_buttom/custom_icon_button.dart';
import '../../../../common/image/cached/custom_cached_network_image.dart';
import '../../../../common/scaffold_messenger/custom_scaffold_messenger.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/sizes.dart';
import '../../../../data/models/sings_model.dart';
import '../../../../utils/navigator/navigator.dart';

class SingItem extends StatefulWidget {
  final Sing sing;

  const SingItem({
    required this.sing,
    Key? key,
  }) : super(key: key);

  @override
  State<SingItem> createState() => _SingItemState();
}

class _SingItemState extends State<SingItem> {
  _setSing() async {
    var resultSetSing = await Provider.of<SingsController>(
      context,
      listen: false,
    ).setSing(
      sing: widget.sing,
    );

    resultSetSing.when(
      (failure) => {
        showCustomScaffoldMessenger(
          context: context,
          title: failure.title.toString(),
        )
      },
      (sing) => {
        showCustomScaffoldMessenger(
          context: context,
          title: '$lblSingSet ${sing.title.toString()}',
        )
      },
    );
  }

  _goToDetail() {
    goToPush(
      context: context,
      page: HoroscopePage(
        sing: widget.sing,
        title: widget.sing.title!,
        urlImageBackground: widget.sing.urlImagePreview!,
        urlAvatar: widget.sing.urlImage!,
        heroTag: 'heroSingAvatar${widget.sing.id.toString()}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlurCard(
      urlImageBackground: widget.sing.urlImagePreview!,
      content: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    spacingM_16,
                  ),
                ),
                onTap: _goToDetail,
                child: ContentSingItem(
                  sing: widget.sing,
                ),
              ),
            ),
            Builder(
              builder: (context) {
                final singController = Provider.of<SingsController>(context);
                return Positioned(
                  right: spacingXS_8,
                  top: spacingXS_8,
                  child: CustomIconButton(
                    iconData: singController.sing != null &&
                            singController.sing!.title == widget.sing.title
                        ? Icons.favorite
                        : Icons.favorite_border_sharp,
                    color: MainColor.stateRed,
                    onPressed: _setSing,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContentSingItem extends StatelessWidget {
  final Sing sing;

  const ContentSingItem({
    required this.sing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'heroSingAvatar${sing.id.toString()}',
            child: CustomCachedNetworkImage(
              imageUrl: sing.urlImage!,
              width: 90,
              height: 90,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${sing.title}\n',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: spacingM_20,
                    overflow: TextOverflow.fade,
                  ),
              children: [
                TextSpan(
                  text: sing.date ?? lblNotData,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: spacingS_12,
                        color: MainColor.primaryWhite,
                        height: 1.3,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
