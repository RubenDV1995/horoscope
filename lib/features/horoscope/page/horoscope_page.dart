import 'package:flutter/material.dart';
import 'package:horoscopos/common/pages/back_pages/custom_profile_back_page.dart';
import 'package:horoscopos/features/element/controller/element_controller.dart';
import 'package:horoscopos/features/horoscope/widgets/element_section/element_section.dart';
import 'package:horoscopos/features/horoscope/widgets/item/horoscope_item.dart';
import 'package:horoscopos/features/horoscope/widgets/skeletons/horoscope_skeleton.dart';
import 'package:horoscopos/features/signs/controller/sings_controller.dart';
import 'package:provider/provider.dart';

import '../../../common/scaffold_messenger/custom_scaffold_messenger.dart';
import '../../../constants/constants.dart';
import '../../../data/models/sings_model.dart';
import '../../failure/page/failure_page.dart';
import '../controller/horoscope_controller.dart';

class HoroscopePage extends StatefulWidget {
  final Sing sing;
  final String title;
  final String urlImageBackground;
  final String urlAvatar;
  final String heroTag;

  const HoroscopePage({
    required this.sing,
    required this.title,
    required this.urlImageBackground,
    required this.urlAvatar,
    required this.heroTag,
    Key? key,
  }) : super(key: key);

  @override
  State<HoroscopePage> createState() => _HoroscopePageState();
}

class _HoroscopePageState extends State<HoroscopePage> {
  ///Controller
  late HoroscopeController _horoscopeController;

  late ElementController _elementController;

  late SingsController _singsController;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _getHoroscope();
    _getElement();
  }

  void _setRepositoryAndController() {
    _horoscopeController = Provider.of<HoroscopeController>(
      context,
      listen: false,
    );
    _elementController = Provider.of<ElementController>(
      context,
      listen: false,
    );
    _singsController = Provider.of<SingsController>(
      context,
      listen: false,
    );
  }

  Future<void> _getHoroscope() async {
    Future.delayed(
      Duration.zero,
      () async {
        _horoscopeController.onLoading(true);
      },
    );
    await _horoscopeController.getHoroscope(
      sing: widget.sing,
      date: DateTime.now(),
    );
  }

  Future<void> _getElement() async {
    Future.delayed(
      Duration.zero,
      () async {
        _elementController.onLoading(true);
      },
    );
    await _elementController.getElement(
      sing: widget.sing,
    );
  }

  _setSing() async {
    var resultSetSing = await _singsController.setSing(
      sing: widget.sing,
    );

    resultSetSing.when(
      (failure) => {
        showCustomScaffoldMessenger(
          context: context,
          title: failure.title.toString(),
        )
      },
      (sing) => {
        showCustomScaffoldMessenger(
          context: context,
          title: '$lblSingSet ${sing.title.toString()}',
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final horoscopeController = Provider.of<HoroscopeController>(context);
      final elementController = Provider.of<ElementController>(context);
      final singsController = Provider.of<SingsController>(context);
      return CustomProfileBackPage(
        title: widget.title,
        urlImageBackground: widget.urlImageBackground,
        urlAvatar: widget.urlAvatar,
        heroTag: widget.heroTag,
        onPressedFavorite: _setSing,
        sing: widget.sing,
        singController: singsController,
        body: Column(
          children: [
            Builder(
              builder: (context) {
                if (horoscopeController.isLoading == true &&
                    elementController.isLoading == true) {
                  return const HoroscopeSkeleton();
                }
                if (horoscopeController.onErrorGetSings == true) {
                  return FailurePage(
                    failure: horoscopeController.failureModel,
                    onPress: _getHoroscope,
                  );
                }
                return Column(
                  children: [
                    HoroscopeItem(
                      horoscope: horoscopeController.horoscope!,
                    ),
                    if (elementController.onErrorGetElement != true)
                      ElementSection(
                        element: elementController.element!,
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
