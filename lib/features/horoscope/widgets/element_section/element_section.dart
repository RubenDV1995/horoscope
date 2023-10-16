import 'package:flutter/material.dart';
import 'package:horoscopos/common/title/custom_title.dart';
import 'package:horoscopos/constants/colors.dart';
import 'package:horoscopos/features/element/page/element_detail_page.dart';
import 'package:horoscopos/utils/navigator/navigator.dart';
import '../../../../common/button/outline/custom_outline_button.dart';
import '../../../../common/padding/custom_padding.dart';
import '../../../../constants/constants.dart';
import '../../../../data/models/elements_model.dart' as element_model;

import '../../../../common/subtitle/custom_subtitle.dart';
import '../../../../constants/sizes.dart';

class ElementSection extends StatelessWidget {
  final element_model.Element element;

  const ElementSection({
    required this.element,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      typePadding: TypePadding.all,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            spacingS_12,
          ),
        ),
        child: CustomPadding(
          typePadding: TypePadding.all,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTitle(
                    title: lblElement,
                    size: spacingL_24,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: spacingXS_8,
                  ),
                  CustomSubtitle(
                    subtitle: element.shortDescription,
                    size: spacingM_16,
                    maxLines: 5,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  const SizedBox(
                    height: spacingS_12,
                  ),
                ],
              ),
              CustomOutlineButton(
                title: lblMore,
                color: MainColor.primaryColor,
                size: spacingM_16,
                iconData: Icons.arrow_forward_ios_rounded,
                onTap: () {
                  goToPush(
                    page: ElementDetailPage(
                      element: element,
                    ),
                    context: context,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
