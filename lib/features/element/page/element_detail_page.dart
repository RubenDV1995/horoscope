import 'package:horoscopos/common/list_view/custom_horizontal_list_view.dart';
import 'package:horoscopos/common/pages/back_pages/custom_profile_back_page.dart';
import 'package:horoscopos/common/title/custom_title.dart';
import 'package:horoscopos/constants/colors.dart';

import '../../../../data/models/elements_model.dart' as element_model;
import 'package:flutter/material.dart';

import '../../../common/chip/custom_chip.dart';
import '../../../common/padding/custom_padding.dart';
import '../../../common/subtitle/custom_subtitle.dart';
import '../../../constants/sizes.dart';

class ElementDetailPage extends StatelessWidget {
  final element_model.Element element;

  const ElementDetailPage({
    required this.element,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomProfileBackPage(
      title: element.title,
      urlImageBackground: element.urlImagePreview.toString(),
      urlAvatar: null,
      heroTag: '',
      singController: null,
      body: CustomPadding(
        typePadding: TypePadding.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: spacingXS_8,
            ),
            CustomHorizontalListView(
              itemCount: element.singsName.length,
              itemBuilder: (context, index) {
                return CustomChip(
                  label: element.singsName[index].name.toString(),
                  color: MainColor.primaryColor,
                );
              },
            ),
            const SizedBox(
              height: spacingM_20,
            ),
            CustomTitle(
              title: element.title,
            ),
            const SizedBox(
              height: spacingXS_8,
            ),
            CustomSubtitle(
              subtitle: element.description,
              size: spacingM_16,
              maxLines: 100,
              color: Colors.white.withOpacity(0.8),
            ),
          ],
        ),
      ),
    );
  }
}