import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CustomSecondaryTitle extends StatelessWidget {
  final String title;
  final double? size;

  const CustomSecondaryTitle({
    required this.title,
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: size != null
          ? Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: size,
                overflow: TextOverflow.fade,
                color: MainColor.primaryColor,
              )
          : Theme.of(context).textTheme.titleLarge?.copyWith(
                color: MainColor.primaryColor,
              ),
    );
  }
}
