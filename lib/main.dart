import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:horoscopos/data/repositories_implementation/horoscope_repository_impl.dart';
import 'package:horoscopos/data/repositories_implementation/sings_repository_impl.dart';
import 'package:horoscopos/data/services/http/http.dart';
import 'package:horoscopos/data/services/remote/horoscope_service.dart';
import 'package:horoscopos/domian/repositories/elements_repository.dart';
import 'package:horoscopos/domian/repositories/horoscope_repository.dart';
import 'package:horoscopos/domian/repositories/sings_repository.dart';
import 'package:horoscopos/domian/use_cases/sings/get_current_sing.dart';
import 'package:horoscopos/domian/use_cases/sings/get_sings.dart';
import 'package:horoscopos/features/element/controller/element_controller.dart';
import 'package:horoscopos/features/horoscope/controller/horoscope_controller.dart';
import 'package:horoscopos/routes/app_routes.dart';
import 'package:horoscopos/theme/theme.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'data/repositories_implementation/app_config_repository_impl.dart';

import 'data/repositories_implementation/element_repository_impl.dart';
import 'data/repositories_implementation/failures_repository_impl.dart';
import 'data/repositories_implementation/onboarding_repository_impl.dart';
import 'data/services/firebase/remote_config_service.dart';

import 'data/services/local/failure_service.dart';
import 'data/services/local/onboarding_service.dart';
import 'domian/repositories/app_config_repository.dart';
import 'domian/repositories/onboarding_repository.dart';
import 'domian/use_cases/sings/get_sing.dart';
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

  final FailureRepositoryImpl failureRepositoryImpl = FailureRepositoryImpl(
    failureService: FailureService(),
  );

  final HoroscopeRepositoryImpl horoscopeRepositoryImpl =
      HoroscopeRepositoryImpl(
    horoscopeService: HoroscopeService(
      Http(
        baseUrl: 'https://newastro.vercel.app/',
        apiKey: '',
        client: http.Client(),
      ),
    ),
    flutterSecureStorage: const FlutterSecureStorage(),
    failureRepositoryImpl: failureRepositoryImpl,
  );

  final AppConfigRepositoryImpl appConfigRepositoryImpl =
      AppConfigRepositoryImpl(
    firebaseRemoteConfig: firebaseRemoteConfigService,
    failureRepositoryImpl: failureRepositoryImpl,
  );

  final OnboardingRepository onboardingRepositoryImpl =
      OnboardingRepositoryImpl(
    flutterSecureStorage: const FlutterSecureStorage(),
    failureRepositoryImpl: failureRepositoryImpl,
    onboardingService: OnboardingService(),
  );

  final SingsRepositoryImpl singsRepositoryImpl = SingsRepositoryImpl(
    flutterSecureStorage: const FlutterSecureStorage(),
    failureRepositoryImpl: failureRepositoryImpl,
    firebaseRemoteConfig: firebaseRemoteConfigService,
  );

  final ElementRepositoryImpl elementRepositoryImpl = ElementRepositoryImpl(
    failureRepositoryImpl: failureRepositoryImpl,
    firebaseRemoteConfig: firebaseRemoteConfigService,
  );

  ///USE-CASES
  final GetSings getSingsUserCase = GetSings(
    singsRepositoryImpl,
  );
  final GetSing getSingUserCase = GetSing(
    singsRepositoryImpl,
  );
  final GetCurrentSing getCurrentSingUserCase = GetCurrentSing(
    singsRepositoryImpl,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<AppConfigRepository>(
          create: (_) => appConfigRepositoryImpl,
        ),
        Provider<OnboardingRepository>(
          create: (_) => onboardingRepositoryImpl,
        ),
        Provider<SingsRepository>(
          create: (_) => singsRepositoryImpl,
        ),
        Provider<HoroscopeRepository>(
          create: (_) => horoscopeRepositoryImpl,
        ),
        Provider<ElementsRepository>(
          create: (_) => elementRepositoryImpl,
        )
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
                create: (_) => SingsController(
                  getSingsUseCase: getSingsUserCase,
                  getSingUseCase: getSingUserCase,
                  getCurrentSingUseCase: getCurrentSingUserCase,
                ),
                child: ChangeNotifierProvider<HoroscopeController>(
                  create: (_) => HoroscopeController(
                    horoscopeRepositoryImpl: horoscopeRepositoryImpl,
                  ),
                  child: ChangeNotifierProvider<ElementController>(
                    create: (_) => ElementController(
                      elementRepositoryImpl: elementRepositoryImpl,
                    ),
                    child: const MyApp(),
                  ),
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: titleApp,
        theme: mainTheme,
        routes: appRoutes,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
