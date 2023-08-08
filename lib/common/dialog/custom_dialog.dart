import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../padding/custom_padding.dart';

void showCustomDialog({
  required BuildContext context,
  required Widget child,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (
      BuildContext buildContext,
      Animation animation,
      Animation secondaryAnimation,
    ) {
      return WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: MainColor.bgColor100.withOpacity(0.8),
            child: CustomPadding(
              typePadding: TypePadding.all,
              padding: 20,
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
