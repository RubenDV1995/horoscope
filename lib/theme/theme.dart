import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

final mainTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF1D1F21),
  canvasColor: Colors.grey[800],
  shadowColor: ThemeData.dark().shadowColor,
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  switchTheme: SwitchThemeData(
    thumbColor:
    MaterialStateProperty.all(MainColor.primaryColor200),
    trackColor: MaterialStateProperty.all(Colors.grey[400]),
  ),
  colorScheme: const ColorScheme.dark(
    primary: MainColor.bgColor100,
    secondary: MainColor.primaryColor,
  ),
  dividerColor: Colors.orange,

  ///TEXT
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: spacingM_20,
      color: MainColor.primaryWhite,
      fontFamily: 'Montserrat',
    ),
    titleMedium: TextStyle(
      fontSize: spacingM_16,
      color: MainColor.primaryWhite,
      fontFamily: 'Montserrat',
    ),
    titleSmall: TextStyle(
      fontSize: spacingS_12,
      color: MainColor.primaryWhite,
      fontFamily: 'Montserrat',
    ),
    displayLarge: TextStyle(
      fontSize: spacingM_20,
      color: MainColor.primaryWhite,
      fontFamily: 'OpenSans',
    ),
    displayMedium: TextStyle(
      fontSize: spacingM_16,
      color: MainColor.primaryWhite,
      fontFamily: 'OpenSans',
    ),
    displaySmall: TextStyle(
      fontSize: spacingS_12,
      color: MainColor.primaryWhite,
      fontFamily: 'OpenSans',
    ),
    headlineLarge: TextStyle(
      fontSize: spacingM_20,
      color: MainColor.primaryWhite,
      fontFamily: 'Quicksand',
    ),
    headlineMedium: TextStyle(
      fontSize: spacingM_16,
      color: MainColor.primaryWhite,
      fontFamily: 'Quicksand',
    ),
    headlineSmall: TextStyle(
      fontSize: spacingS_12,
      color: MainColor.primaryWhite,
      fontFamily: 'Quicksand',
    ),
    bodyLarge: TextStyle(
      fontSize: spacingXXL_48,
      color: MainColor.primaryWhite,
      fontFamily: 'Quicksand',
    ),
    bodyMedium: TextStyle(
      fontSize: spacingXXL_40,
      color: MainColor.primaryWhite,
      fontFamily: 'Quicksand',
    ),
    bodySmall: TextStyle(
      fontSize: spacingXL_32,
      color: MainColor.primaryWhite,
      fontFamily: 'Quicksand',
    ),
  ),
);
