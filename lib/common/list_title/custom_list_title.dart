import 'package:flutter/material.dart';
import 'package:horoscopos/common/padding/custom_padding.dart';
import 'package:horoscopos/constants/colors.dart';

import '../../constants/sizes.dart';
import '../../utils/navigator/navigator.dart';
import '../icon/custom_icon.dart';
import '../title/custom_title.dart';

class CustomListTitle extends StatelessWidget {
  final String title;
  final bool isFirst;
  final IconData? iconData;
  final Widget? page;
  final void Function()? onTap;

  const CustomListTitle({
    required this.title,
    required this.isFirst,
    Key? key,
    this.iconData,
    this.page,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      typePadding: TypePadding.horizontal,
      padding: spacingS_12,
      child: Container(
        decoration: isFirst == true
            ? BoxDecoration(
                color: MainColor.primaryColor.withOpacity(0.7),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    spacingXXL_56,
                  ),
                ),
              )
            : null,
        child: ListTile(
          title: Row(
            children: [
              if (iconData != null)
                Row(
                  children: [
                    CustomIcon(
                      iconData: iconData!,
                      color: MainColor.primaryWhite,
                    ),
                    const SizedBox(
                      width: spacingS_12,
                    ),
                  ],
                ),
              CustomTitle(
                title: title,
                size: spacingM_16,
              ),
            ],
          ),
          onTap: onTap ??
              () {
                Navigator.pop(context);
                goToPush(
                  page: page!,
                  context: context,
                );
              },
        ),
      ),
    );
  }
}
