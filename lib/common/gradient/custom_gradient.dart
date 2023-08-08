import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomGradient extends StatelessWidget {
  final Widget child;

  const CustomGradient({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            MainColor.bgColor100,
            MainColor.primarySpaceCadet,
          ],
        ),
      ),
      child: child,
    );
  }
}
