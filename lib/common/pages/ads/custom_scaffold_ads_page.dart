import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:horoscopos/common/appbar/custom_drawer_appbar.dart';

import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';
import '../../appbar/custom_appbar.dart';
import '../../drawer/custom_drawer.dart';
import '../../floating_action_button/custom_floating_action_button.dart';
import '../../gradient/custom_gradient.dart';
import '../../padding/custom_padding.dart';

class CustomScaffoldAdsPage extends StatelessWidget {
  final Widget body;
  final Widget? ads;

  const CustomScaffoldAdsPage({
    required this.body,
    Key? key,
    this.ads,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomGradient(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CustomDrawerAppbar(
            iconData: null,
            title: titleApp,
          ),
          drawer: const Drawer(
            child: CustomDrawer(),
          ),
          body: Column(
            children: [
              Expanded(
                child: CustomPadding(
                  typePadding: TypePadding.horizontal,
                  child: body,
                ),
              ),
              if (ads != null) ads!
            ],
          ),
        ),
      ),
    );
  }
}
