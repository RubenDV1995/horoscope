import 'package:flutter/material.dart';
import 'package:horoscopos/common/padding/custom_padding.dart';
import 'package:horoscopos/common/pages/back_pages/custom_back_page.dart';
import 'package:horoscopos/features/element/widgets/item/element_item.dart';
import 'package:provider/provider.dart';

import '../../../common/list_view/custom_list_view.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';
import '../../failure/page/failure_page.dart';
import '../controller/element_controller.dart';

class ElementPage extends StatefulWidget {
  const ElementPage({Key? key}) : super(key: key);

  @override
  State<ElementPage> createState() => _ElementPageState();
}

class _ElementPageState extends State<ElementPage> {
  late ElementController _elementController;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _getElements();
  }

  void _setRepositoryAndController() {
    _elementController = Provider.of<ElementController>(
      context,
      listen: false,
    );
  }

  Future<void> _getElements() async {
    Future.delayed(
      Duration.zero,
      () async {
        _elementController.onLoading(true);
      },
    );
    await _elementController.getElements();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackPage(
      title: lblElements,
      body: CustomPadding(
        typePadding: TypePadding.all,
        padding: spacingS_12,
        child: Builder(
          builder: (context) {
            final elementController = Provider.of<ElementController>(context);
            if (elementController.isLoading == true) {
              //return const HoroscopeSkeleton();
            }
            if (elementController.onErrorGetElement == true) {
              return FailurePage(
                failure: elementController.failureModel,
                onPress: _getElements,
              );
            }
            return SingleChildScrollView(
              child: CustomListView(
                itemCount: elementController.elements?.length ?? 0,
                itemBuilder: (context, index) {
                  return ElementItem(
                    element: elementController.elements![index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
