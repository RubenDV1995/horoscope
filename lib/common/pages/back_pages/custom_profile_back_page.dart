import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:horoscopos/features/signs/controller/sings_controller.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../data/models/sings_model.dart';
import '../../icon/custom_icon.dart';
import '../../icon_buttom/custom_icon_button.dart';
import '../../image/cached/custom_cached_network_image.dart';
import '../../image_network/custom_image_network.dart';
import '../../padding/custom_padding.dart';

class CustomProfileBackPage extends StatelessWidget {
  final Widget body;
  final String heroTag;
  final String urlImageBackground;
  final String? urlAvatar;
  final String? title;
  final void Function()? onPressedFavorite;
  final Sing? sing;
  final SingsController? singController;

  const CustomProfileBackPage({
    required this.body,
    required this.urlImageBackground,
    required this.heroTag,
    Key? key,
    this.title,
    this.urlAvatar,
    this.onPressedFavorite,
    this.sing,
    this.singController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 250.0,
              actions: [
                if (urlAvatar != null)
                  CustomPadding(
                    typePadding: TypePadding.horizontal,
                    padding: spacingM_16,
                    child: CustomIconButton(
                      iconData: singController!.sing != null &&
                          singController!.sing!.sing == sing!.sing
                          ? Icons.favorite
                          : Icons.favorite_border_sharp,
                      color: MainColor.stateRed,
                      onPressed: onPressedFavorite,
                    ),
                  )
              ],
              leading: IconButton(
                icon: const CustomIcon(
                  iconData: Icons.arrow_back_ios_new_outlined,
                  color: MainColor.primaryWhite,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title:
                    urlAvatar != null ? Text(title!) : const SizedBox.shrink(),
                background: Background(
                  urlImageBackground: urlImageBackground,
                  content: urlAvatar != null
                      ? Hero(
                          tag: heroTag,
                          child: CustomCachedNetworkImage(
                            imageUrl: urlAvatar!,
                            width: 190,
                            height: 190,
                          ),
                        )
                      : const SizedBox.shrink(),
                  isBlur: urlAvatar != null ? true : false,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: body,
            )
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final String urlImageBackground;
  final Widget content;
  final bool isBlur;

  const Background({
    required this.urlImageBackground,
    required this.content,
    required this.isBlur,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: customCachedNetworkImageProvider(
            urlImageBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                if (isBlur)
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent.withOpacity(0.1),
                              MainColor.primarySpaceCadet,
                            ],
                          ),
                        ),
                        alignment: Alignment.bottomRight,
                        child: CustomPadding(
                          typePadding: TypePadding.all,
                          padding: spacingXXS_4,
                          child: content,
                        ),
                      ),
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
