import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../../common/button/ corner_button/custom_ corner_button.dart';
import '../../../common/pages/back_pages/custom_back_page.dart';
import '../../../common/title/custom_title.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';
import '../../../utils/launch/launch.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _exit() {
    exit(0);
  }

  void _showTermsAndConditions() {
    launchURL(
      url:
          'https://rubendevelopper.blogspot.com/2023/07/terminos-y-condiciones-de-politica-y.html',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomBackPage(
        title: lblSettings,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: spacingXXS_4,
            ),
            CustomCornerButton(
              title: lblTitleTermsConditions,
              iconData: FluentIcons.reading_mode_mobile_20_regular,
              onTap: _showTermsAndConditions,
            ),
            const SizedBox(
              height: spacingL_28,
            ),
            CustomCornerButton(
              title: lblExit,
              iconData: FluentIcons.arrow_exit_20_regular,
              onTap: _exit,
            ),
          ],
        ),
      ),
    );
  }
}
