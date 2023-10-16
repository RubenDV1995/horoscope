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
          padding != null ? padding! : spacingM_16,
        ),
        child: child,
      );
    }
    if (typePadding == TypePadding.horizontal) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding != null ? padding! : spacingM_16,
        ),
        child: child,
      );
    }
    if (typePadding == TypePadding.vertical) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: padding != null ? padding! : spacingM_16,
        ),
        child: child,
      );
    }
    return Padding(
      padding: EdgeInsets.only(
        left: typePadding == TypePadding.left ? spacingM_16 : 0,
        top: typePadding == TypePadding.top ? spacingM_16 : 0,
        bottom: typePadding == TypePadding.bottom ? spacingM_16 : 0,
        right: typePadding == TypePadding.right ? spacingM_16 : 0,
      ),
      child: child,
    );
  }
}
