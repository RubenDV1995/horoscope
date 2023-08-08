import 'package:flutter/material.dart';
import 'package:horoscopos/common/pages/back_pages/custom_profile_back_page.dart';
import 'package:provider/provider.dart';

import '../../../domian/models/sings_model.dart';
import '../../../domian/repositories/horoscope_repository.dart';
import '../../failure/controller/failure_controller.dart';
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
  ///Repository
  late HoroscopeRepository _horoscopeRepository;

  ///Controller
  late HoroscopeController _horoscopeController;
  late FailureController _failureController;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _getHoroscope();
  }

  void _setRepositoryAndController() {
    _horoscopeRepository = Provider.of<HoroscopeRepository>(
      context,
      listen: false,
    );
    _horoscopeController = Provider.of<HoroscopeController>(
      context,
      listen: false,
    );
    _failureController = Provider.of<FailureController>(
      context,
      listen: false,
    );
  }

  Future<void> _getHoroscope() async {
    final resultHoroscope = await _horoscopeRepository.getHoroscope();
    //_singsController.onLoading(true);
    resultHoroscope.when(
      (failure) {
        print('Error: ${failure.title}');
        //_singsController.onError();
        //_failureController.onError(failure);
      },
      (horoscope) {
        print(horoscope.horoscope.toString());
        //_failureController.notError();
        //_singsController.setSings(sounds);
        //_getCurrentSound();
      },
    );
    //_singsController.onLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomProfileBackPage(
      title: widget.title,
      urlImageBackground: widget.urlImageBackground,
      urlAvatar: widget.urlAvatar,
      heroTag: widget.heroTag,
      body: const Text('Hola'),
    );
  }
}
