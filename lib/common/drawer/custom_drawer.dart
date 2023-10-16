import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:horoscopos/common/subtitle/custom_subtitle.dart';
import 'package:horoscopos/common/title/custom_title.dart';
import 'package:horoscopos/constants/colors.dart';
import 'package:horoscopos/constants/sizes.dart';
import 'package:horoscopos/features/element/page/element_page.dart';
import 'package:horoscopos/features/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../data/models/sings_model.dart';
import '../../features/signs/controller/sings_controller.dart';
import '../../utils/launch/launch.dart';
import '../image/cached/custom_cached_network_image.dart';
import '../image_network/custom_image_network.dart';
import '../list_title/custom_list_title.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  void _exit() {
    exit(0);
  }

  void _showTermsAndConditions() {
    launchURL(
      url:
          'https://rubendevelopper.blogspot.com/2023/09/terminos-y-condiciones-de-politica-y.html',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final HomeController homeController =
            Provider.of<HomeController>(context);
        final singController = Provider.of<SingsController>(context);
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              if (singController.sing != null)
                CustomDrawerHeader(
                  sing: singController.sing!,
                ),
              CustomListTitle(
                title: lblSings,
                isFirst: true,
                iconData: Icons.grid_view,
                onTap: () => Navigator.pop(context),
              ),
              const CustomListTitle(
                title: lblElements,
                isFirst: false,
                iconData: Icons.local_fire_department_outlined,
                page: ElementPage(),
              ),
              CustomListTitle(
                title: lblTitleTermsConditions,
                isFirst: false,
                iconData: Icons.find_in_page_outlined,
                onTap: _showTermsAndConditions,
              ),
              CustomListTitle(
                title: lblExit,
                isFirst: false,
                iconData: Icons.exit_to_app,
                onTap: _exit,
              ),
              const Divider(
                color: MainColor.secondaryCharcoal,
                endIndent: spacingXL_32,
                indent: spacingXL_32,
              ),
              Center(
                child: CustomSubtitle(
                  subtitle: 'Version ${homeController.appVersion}',
                  color: MainColor.secondaryCharcoal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomDrawerHeader extends StatelessWidget {
  final Sing sing;

  const CustomDrawerHeader({
    required this.sing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: customCachedNetworkImageProvider(
            sing.urlImagePreview!,
          ),
          fit: BoxFit.cover,
        ),
      ),
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
                      MainColor.primarySpaceCadet,
                    ],
                  ),
                ),
                alignment: Alignment.bottomRight,
                child: const SizedBox.shrink(),
              ),
            ),
          ),
          Positioned(
            bottom: spacingXS_8,
            right: spacingXS_8,
            child: Column(
              children: [
                CustomCachedNetworkImage(
                  imageUrl: sing.urlImage!,
                  width: spacingXXL_96,
                  height: spacingXXL_96,
                ),
                CustomTitle(
                  title: sing.title!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
