import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../features/settings/page/settings_page.dart';
import '../../utils/navigator/navigator.dart';
import '../icon/custom_icon.dart';
import '../title/custom_title.dart';
import 'custom_tabbar.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final IconData iconData;
  final String title;

  const CustomAppbar({
    required this.iconData,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Row(
          children: [
            SizedBox(
              height: spacingXL_32,
              width: spacingXL_32,
              child: RawMaterialButton(
                onPressed: () {
                  goToPush(
                    context: context,
                    page: const SettingsScreen(),
                  );
                },
                fillColor: MainColor.secondaryCharcoal,
                shape: const CircleBorder(),
                child: const CustomIcon(
                  iconData: FluentIcons.settings_16_regular,
                  color: MainColor.primaryWhite,
                ),
              ),
            ),
            const SizedBox(
              width: spacingM_16,
            ),
          ],
        ),
      ],
      bottom: const CustomTabBar(),
      title: Row(
        children: [
          Image.asset(
            'assets/images/png/logo-min.png',
            width: 25,
            height: 25,
          ),
          const SizedBox(
            width: spacingXS_8,
          ),
          CustomTitle(
            title: title,
            size: spacingM_20,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
