import 'package:flutter/material.dart';
import 'package:horoscopos/common/list_view/custom_horizontal_list_view.dart';
import 'package:horoscopos/common/padding/custom_padding.dart';
import 'package:horoscopos/common/subtitle/custom_subtitle.dart';
import 'package:horoscopos/common/title/custom_title.dart';
import 'package:horoscopos/constants/colors.dart';

import '../../../../common/image_network/custom_image_network.dart';
import '../../../../constants/sizes.dart';
import '../../../../data/models/elements_model.dart' as element_model;
import '../../../../utils/navigator/navigator.dart';
import '../../page/element_detail_page.dart';

class ElementItem extends StatelessWidget {
  final element_model.Element element;

  const ElementItem({
    required this.element,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        spacingS_12,
      ),
      onTap: () {
        goToPush(
          page: ElementDetailPage(
            element: element,
          ),
          context: context,
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            spacingS_12,
          ),
        ),
        child: SizedBox(
          height: 240,
          child: Column(
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: customCachedNetworkImageProvider(
                        element.urlImagePreview.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        spacingS_12,
                      ),
                      topRight: Radius.circular(
                        spacingS_12,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: CustomPadding(
                  typePadding: TypePadding.all,
                  padding: spacingXS_8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTitle(
                        title: element.title.toString(),
                      ),
                      CustomHorizontalListView(
                        itemCount: element.singsName.length,
                        itemBuilder: (context, index) {
                          return CustomSubtitle(
                            subtitle:
                                '${element.singsName[index].name.toString()},',
                            color: MainColor.primaryColor,
                            size: spacingS_12,
                          );
                        },
                      ),
                      Expanded(
                        child: CustomSubtitle(
                          subtitle: element.description.toString(),
                          maxLines: 2,
                          color: MainColor.secondaryCharcoal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
