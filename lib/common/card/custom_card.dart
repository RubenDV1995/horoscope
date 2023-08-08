import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../subtitle/custom_subtitle.dart';
import '../title/custom_title.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? urlImage;

  const CustomCard({
    required this.title,
    Key? key,
    this.subtitle,
    this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: spacingS_12,
        ),
        CustomTitle(title: title),
        if (subtitle != null)
          Column(
            children: [
              CustomSubtitle(subtitle: subtitle!),
              const SizedBox(
                height: spacingS_12,
              ),
            ],
          ),
        const SizedBox(
          height: spacingS_12,
        ),
        if (urlImage != null)
          Image.asset(
            urlImage!,
            width: 150,
          ),
        const SizedBox(
          height: spacingS_12,
        ),
      ],
    );
  }
}
