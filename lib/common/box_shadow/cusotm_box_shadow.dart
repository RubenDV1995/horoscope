import 'package:flutter/material.dart';

import '../../constants/colors.dart';

BoxShadow customBoxShadow() {
  return BoxShadow(
    color: MainColor.primaryColor.withOpacity(0.5),
    spreadRadius: 4,
    blurRadius: 5,
    offset: const Offset(
      0,
      0,
    ), // changes position of shadow
  );
}
