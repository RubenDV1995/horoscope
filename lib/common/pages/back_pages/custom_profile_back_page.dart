import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../image/cached/custom_cached_network_image.dart';
import '../../image_network/custom_image_network.dart';
import '../../padding/custom_padding.dart';

class CustomProfileBackPage extends StatelessWidget {
  final Widget body;
  final String heroTag;
  final String urlImageBackground;
  final String urlAvatar;
  final String? title;

  const CustomProfileBackPage({
    required this.body,
    required this.urlImageBackground,
    required this.urlAvatar,
    required this.heroTag,
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(title!),
                background: Background(
                  urlImageBackground: urlImageBackground,
                  content: Hero(
                    tag: heroTag,
                    child: CustomCachedNetworkImage(
                      imageUrl: urlAvatar,
                      width: 190,
                      height: 190,
                    ),
                  ),
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

  const Background({
    required this.urlImageBackground,
    required this.content,
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
                            MainColor.primarySpaceCadet.withOpacity(0.75),
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
