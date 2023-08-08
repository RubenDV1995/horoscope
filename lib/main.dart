import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:horoscopos/data/repositories_implementation/horoscope_repository_impl.dart';
import 'package:horoscopos/data/repositories_implementation/sings_repository_impl.dart';
import 'package:horoscopos/data/services/http/http.dart';
import 'package:horoscopos/data/services/remote/horoscope_service.dart';
import 'package:horoscopos/domian/repositories/horoscope_repository.dart';
import 'package:horoscopos/domian/repositories/sings_repository.dart';
import 'package:horoscopos/features/horoscope/controller/horoscope_controller.dart';
import 'package:horoscopos/routes/app_routes.dart';
import 'package:horoscopos/theme/theme.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'data/repositories_implementation/app_config_repository_impl.dart';

import 'data/repositories_implementation/failures_repository_impl.dart';
import 'data/repositories_implementation/onboarding_repository_impl.dart';
import 'data/services/firebase/remote_config_service.dart';

import 'data/services/local/failure_service.dart';
import 'data/services/local/onboarding_service.dart';
import 'domian/repositories/app_config_repository.dart';
import 'domian/repositories/onboarding_repository.dart';
import 'features/failure/controller/failure_controller.dart';
import 'features/home/controller/home_controller.dart';
import 'features/offline/controller/network_controller.dart';
import 'features/onboarding /controller/onboarding_controller.dart';
import 'features/signs/controller/sings_controller.dart';
import 'features/spash/page/splash_page.dart';
import 'firebase_options.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firebaseRemoteConfigService = RemoteConfigService(
    firebaseRemoteConfig: FirebaseRemoteConfig.instance,
    remoteConfigSettings: RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 30),
      minimumFetchInterval: Duration.zero,
    ),
  );

  await firebaseRemoteConfigService.init();

  ///Ads
  //MobileAds.instance.initialize();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppConfigRepository>(
          create: (_) => AppConfigRepositoryImpl(
            firebaseRemoteConfig: firebaseRemoteConfigService,
            failureRepositoryImpl: FailureRepositoryImpl(
              failureService: FailureService(),
            ),
          ),
        ),
        Provider<OnboardingRepository>(
          create: (_) => OnboardingRepositoryImpl(
            flutterSecureStorage: const FlutterSecureStorage(),
            failureRepositoryImpl: FailureRepositoryImpl(
              failureService: FailureService(),
            ),
            onboardingService: OnboardingService(),
          ),
        ),
        Provider<SingsRepository>(
          create: (_) => SingsRepositoryImpl(
            flutterSecureStorage: const FlutterSecureStorage(),
            failureRepositoryImpl: FailureRepositoryImpl(
              failureService: FailureService(),
            ),
            firebaseRemoteConfig: firebaseRemoteConfigService,
          ),
        ),
        Provider<HoroscopeRepository>(
          create: (_) => HoroscopeRepositoryImpl(
            horoscopeService: HoroscopeService(
              Http(
                baseUrl: 'https://newastro.vercel.app/',
                apiKey: '',
                client: http.Client(),
              ),
            ),
            flutterSecureStorage: const FlutterSecureStorage(),
            failureRepositoryImpl: FailureRepositoryImpl(
              failureService: FailureService(),
            ),
          ),
        ),
      ],
      child: ChangeNotifierProvider<HomeController>(
        create: (_) => HomeController(),
        child: ChangeNotifierProvider<FailureController>(
          create: (_) => FailureController(),
          child: ChangeNotifierProvider<NetworkController>(
            create: (_) => NetworkController(),
            child: ChangeNotifierProvider<OnboardingController>(
              create: (_) => OnboardingController(),
              child: ChangeNotifierProvider<SingsController>(
                create: (_) => SingsController(),
                child: ChangeNotifierProvider<HoroscopeController>(
                  create: (_) => HoroscopeController(),
                  child: const MyApp(),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          title: titleApp,
          theme: mainTheme,
          routes: appRoutes,
          home: const SplashPage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
