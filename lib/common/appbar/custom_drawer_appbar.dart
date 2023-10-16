import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../title/custom_title.dart';

class CustomDrawerAppbar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? iconData;
  final String title;

  const CustomDrawerAppbar({
    required this.iconData,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          if (iconData != null)
            Row(
              children: [
                Icon(
                  iconData,
                ),
                const SizedBox(
                  width: spacingXS_8,
                ),
              ],
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
  Size get preferredSize => const Size.fromHeight(50);
}
