import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../gradient/custom_gradient.dart';
import '../../icon/custom_icon.dart';
import '../../padding/custom_padding.dart';

class CustomBackPage extends StatelessWidget {
  final Widget body;
  final String? title;

  const CustomBackPage({
    required this.body,
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: title != null ? Text(title!) : const SizedBox.shrink(),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomIcon(
              iconData: Icons.arrow_back_ios_new_outlined,
              color: MainColor.primaryWhite,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: CustomPadding(
            typePadding: TypePadding.all,
            padding: spacingXS_8,
            child: body,
          ),
        ),
      ),
    );
  }
}
