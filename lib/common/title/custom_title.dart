import 'package:flutter/material.dart';
import 'package:horoscopos/constants/colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;

  const CustomTitle({
    required this.title,
    Key? key,
    this.size,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: size != null
          ? Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: size,
                overflow: TextOverflow.fade,
                color: color ?? MainColor.primaryWhite,
                fontWeight: fontWeight ?? FontWeight.normal,
              )
          : Theme.of(context).textTheme.titleLarge,
    );
  }
}
