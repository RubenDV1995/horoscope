import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

enum TypePadding {
  all,
  horizontal,
  vertical,
  left,
  top,
  bottom,
  right,
}

class CustomPadding extends StatelessWidget {
  final Widget child;
  final TypePadding typePadding;
  final double? padding;

  const CustomPadding({
    required this.child,
    required this.typePadding,
    Key? key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (typePadding == TypePadding.all) {
      return Padding(
        padding: EdgeInsets.all(
          padding != null ? padding! : spacingXS_8,
        ),
        child: child,
      );
    }
    if (typePadding == TypePadding.horizontal) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding != null ? padding! : spacingXS_8,
        ),
        child: child,
      );
    }
    if (typePadding == TypePadding.vertical) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: padding != null ? padding! : spacingXS_8,
        ),
        child: child,
      );
    }
    return Padding(
      padding: EdgeInsets.only(
        left: typePadding == TypePadding.left ? spacingXS_8 : 0,
        top: typePadding == TypePadding.top ? spacingXS_8 : 0,
        bottom: typePadding == TypePadding.bottom ? spacingXS_8 : 0,
        right: typePadding == TypePadding.right ? spacingXS_8 : 0,
      ),
      child: child,
    );
  }
}
