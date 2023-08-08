import 'package:flutter/material.dart';
import 'package:horoscopos/features/signs/page/sings_page.dart';

import '../features/home/page/home_page.dart';
import '../features/onboarding /page/onboarding_page.dart';
import '../features/settings/page/settings_page.dart';

part 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.home: (context) => const HomePage(),
    Routes.settings: (context) => const SettingsScreen(),
    Routes.onboarding: (context) => const OnboardingPage(),
    Routes.sings: (context) => const SingsPage(),
  };
}
