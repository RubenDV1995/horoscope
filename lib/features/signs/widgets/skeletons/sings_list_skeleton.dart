import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../constants/sizes.dart';

class SingsListSkeleton extends StatelessWidget {
  const SingsListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(spacingXS_8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 4 / 5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const SkeletonAvatar();
      },
    );
  }
}
