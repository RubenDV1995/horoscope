import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:horoscopos/features/signs/page/sings_page.dart';
import 'package:provider/provider.dart';

import '../../../common/pages/ads/custom_scaffold_ads_page.dart';
import '../../../common/pages/custom_defaul_page.dart';
import '../../../constants/constants.dart';
import '../../../data/services/remote/network_service.dart';
import '../../offline/controller/network_controller.dart';
import '../../offline/page/network_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NetworkService _networkService = NetworkService.instance;

  ///Controller
  late NetworkController _networkController;

  ///Ads
  final adUnitId = Platform.isAndroid ? adUnitIdAndroid : adUnitIdIos;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _checkNetwork();
  }

  void _setRepositoryAndController() {
    _networkController = Provider.of<NetworkController>(
      context,
      listen: false,
    );
  }

  void _checkNetwork() {
    _networkService.initialise();
    _networkService.myStream.listen(
      (source) {
        ConnectivityResult connectivityResult = source.keys.toList()[0];
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          _networkController.setInternet(true);
        } else {
          _networkController.setInternet(false);
        }
      },
    );
  }

  @override
  void dispose() {
    _networkService.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final networkController = Provider.of<NetworkController>(context);
        if (networkController.hastInternet == false) {
          return const NetworkPage();
        }
        return const CustomScaffoldAdsPage(
          body: SingsPage(),
        );
      },
    );
  }
}
