import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class CustomHorizontalListView extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  const CustomHorizontalListView({
    required this.itemCount,
    required this.itemBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: itemBuilder,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: spacingXXS_4,
          );
        },
      ),
    );
  }
}
